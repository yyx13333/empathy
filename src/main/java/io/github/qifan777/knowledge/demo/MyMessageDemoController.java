package io.github.qifan777.knowledge.demo;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.client.advisor.MessageChatMemoryAdvisor;
import org.springframework.ai.chat.client.advisor.QuestionAnswerAdvisor;
import org.springframework.ai.chat.memory.ChatMemory;
import org.springframework.ai.chat.memory.InMemoryChatMemory;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.model.ChatModel;
import org.springframework.ai.embedding.EmbeddingModel;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.http.MediaType;
import org.springframework.http.codec.ServerSentEvent;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

import static com.alibaba.nacos.common.utils.JacksonUtils.toJson;

@RequestMapping("/my/demo/message")
@RestController
@AllArgsConstructor
public class MyMessageDemoController {
    private final ChatModel chatModel;
    private final ObjectMapper objectMapper;
    private final EmbeddingModel embeddingModel;
    private final VectorStore vectorStore;

    //模拟数据库存储会话和消息
    private final ChatMemory chatMemory = new InMemoryChatMemory();


    /**
     * 非流式问答
     *
     * @param prompt 用户提问
     * @return org.springframework.ai.chat.model.ChatResponse
     */
    @GetMapping("chat")
    public String chat(@RequestParam String prompt){
        ChatClient chatClient = ChatClient.create(chatModel);
        return chatClient.prompt()
                //输入单条提示词
                .user(prompt)
                //call代表非流式问答，返回的结果可以是ChatResponse，也可以是Entity（转成java类型），也可以是字符串直接提取回答结果。
                .call()
                .content();
    }
    /**
     * 流式问答
     *
     * @param prompt 用户提问
     * @return org.springframework.ai.chat.model.ChatResponse
     */
    @GetMapping(value = "chat/stream",produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<String> chatStream(@RequestParam String prompt) {
        return ChatClient.create(chatModel).prompt()
                //输入多条消息，可以将历史消息记录传入
                .messages(new SystemMessage("你是一个Java智能助手，应用你的Java知识帮助用户解决问题或者编写程序"),new UserMessage(prompt))
                .stream()
                .content();

    }
    /**
     * 处理聊天记录流式查询请求
     * 该方法用于返回与特定会话相关的聊天历史记录，以Server-Sent Events (SSE) 的形式持续推送
     *
     * @param prompt 用户输入的提示信息，用于生成聊天历史的上下文
     * @param sessionId 会话ID，用于区分不同的聊天会话
     * @return 返回一个Flux流，包含聊天历史记录的字符串信息
     */
    @GetMapping(value = "chat/stream/history",produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<String> chatStreamHistory(@RequestParam String prompt,@RequestParam String sessionId) {
        var messageChatMemoryAdvisor = new MessageChatMemoryAdvisor(chatMemory, sessionId, 10);
        return ChatClient.create(chatModel).prompt()
                //输入多条消息，可以将历史消息记录传入
                .messages(new SystemMessage("你是一个Java智能助手，应用你的Java知识帮助用户解决问题或者编写程序"),new UserMessage(prompt))
                .advisors(messageChatMemoryAdvisor)
                .stream()
                .content();
    }
    /**
     * 提供文本嵌入向量的服务
     * 该方法接收一个文本字符串作为输入，返回其对应的嵌入向量
     * 嵌入向量是自然语言处理中的一种技术，它将文本数据转换为密集向量形式，以便于计算机理解和处理
     *
     * @param text 待转换的文本字符串
     * @return 文本的嵌入向量，表示该文本在多维空间中的位置
     */
    @GetMapping("embedding")
    public float[] embedding(@RequestParam String text){
        return embeddingModel.embed(text);

    }

    @GetMapping(value = "chat/stream/database",produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<String>> chatStreamWithDatabase(@RequestParam String prompt){
        // 1. 定义提示词模板，question_answer_context会被替换成向量数据库中查询到的文档。
        String promptWithContext = """
                下面是上下文信息
                ---------------------
                {question_answer_context}
                ---------------------
                给定的上下文和提供的历史信息，而不是事先的知识，回复用户的意见。如果答案不在上下文中，告诉用户你不能回答这个问题。
                """;
        return ChatClient.create(chatModel)
                .prompt()
                .user(prompt)
                .advisors(new QuestionAnswerAdvisor(vectorStore, SearchRequest.defaults(), promptWithContext))
                .stream()
                .content()
                .map(chatResponse -> ServerSentEvent.builder(chatResponse)
                        .event("message")
                        .build());
    }
    /**
     * 调用自定义函数回答用户的提问
     *
     * @param prompt       用户的提问
     * @param functionName 函数名称（bean的名称，类名小写）
     * @return SSE流式响应
     */
    @GetMapping(value = "chat/stream/function", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public Flux<ServerSentEvent<String>> chatStreamWithFunction(@RequestParam String prompt, @RequestParam String functionName) {
        return ChatClient.create(chatModel).prompt()
                .messages(new UserMessage(prompt))
                // spring ai会从已注册为bean的function中查找函数，将它添加到请求中。如果成功触发就会调用函数
                .functions(functionName)
                .stream()
                .chatResponse()
                .map(chatResponse -> ServerSentEvent.builder(toJson(chatResponse))
                        .event("message")
                        .build());
    }




}


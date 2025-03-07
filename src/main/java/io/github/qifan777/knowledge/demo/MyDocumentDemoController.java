package io.github.qifan777.knowledge.demo;

import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ai.document.Document;
import org.springframework.ai.reader.tika.TikaDocumentReader;
import org.springframework.ai.transformer.splitter.TokenTextSplitter;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RequestMapping("my/demo/document")
@RestController
@AllArgsConstructor
@Slf4j
public class MyDocumentDemoController {
    private final VectorStore vectorStore;

    @PostMapping("etl/reader/multipath")
    @SneakyThrows
    public String readFromMultipart(@RequestParam MultipartFile file){
        Resource resource = new InputStreamResource(file.getInputStream());
        TikaDocumentReader tikaDocumentReader = new TikaDocumentReader(resource);
        return tikaDocumentReader.get().get(0).getContent();
    }

    @PostMapping("etl/reader/local")
    public String readFromLocalFile(@RequestParam String path){
        Resource resource = new FileSystemResource(path);
        return new TikaDocumentReader(resource)
                .read()
                .get(0)
                .getContent();
    }

    @PostMapping("etl/reader/split")
    @SneakyThrows
    public List<String> split(@RequestParam MultipartFile file){
        Resource resource = new InputStreamResource(file.getInputStream());
        TikaDocumentReader tikaDocumentReader = new TikaDocumentReader(resource);
        List<Document> read = tikaDocumentReader.read();
        List<Document> split = new TokenTextSplitter().split(read);
        return split.stream().map(Document::getContent).toList();
    }

    /**
     * 嵌入文件
     *
     * @param file 待嵌入的文件
     * @return 是否成功
     */
    @SneakyThrows
    @PostMapping("embedding")
    public Boolean embedding(@RequestParam MultipartFile file) {
        // 从IO流中读取文件
        TikaDocumentReader tikaDocumentReader = new TikaDocumentReader(new InputStreamResource(file.getInputStream()));
        // 将文本内容划分成更小的块
        List<Document> splitDocuments = new TokenTextSplitter()
                .apply(tikaDocumentReader.read());
        // 存入向量数据库，这个过程会自动调用embeddingModel,将文本变成向量再存入。
        vectorStore.add(splitDocuments);
        return true;
    }

    /**
     * 查询向量数据库
     *
     * @param query 用户的提问
     * @return 匹配到的文档
     */

    @GetMapping("query")
    public List<Document> query(@RequestParam String query) {
        return vectorStore.similaritySearch(query);
    }
}

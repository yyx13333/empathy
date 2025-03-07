package io.github.qifan777.knowledge.demo;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyDescription;
import org.springframework.ai.reader.tika.TikaDocumentReader;
import org.springframework.context.annotation.Description;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Component;

import java.util.function.Function;

@Component
@Description("文档解析函数")
public class MyDocumentAnalyzerFunction implements Function<MyDocumentAnalyzerFunction.Request, String> {

    @Override
    public String apply(MyDocumentAnalyzerFunction.Request request) {
        FileSystemResource fileSystemResource = new FileSystemResource(request.path);
        TikaDocumentReader tikaDocumentReader = new TikaDocumentReader(fileSystemResource);
        return tikaDocumentReader.read().get(0).getContent();
    }

    public class Request {
        @JsonProperty(required = true)
        @JsonPropertyDescription("需要解析的文档路径")
        String path;
    }
    public record Response(String result){

    }

    //public record Request(@JsonProperty(required = true) @JsonPropertyDescription("需要解析的文档路径")String path){
}

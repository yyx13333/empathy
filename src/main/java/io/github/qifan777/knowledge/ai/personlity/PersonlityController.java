package io.github.qifan777.knowledge.ai.personlity;

import cn.dev33.satoken.stp.StpUtil;
import io.github.qifan777.knowledge.ai.personlity.dto.PersonlityInput;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Random;

@RequestMapping("/personlity")
@RestController
@AllArgsConstructor
public class PersonlityController {

    private final PersonlityRespository personlityRespository;

    @GetMapping("/chat")
    public List<Personlity> chatPersonlity(){
        return personlityRespository.findByUserId();
    }

    //注意:道德声明,因为人格特质识别模型可能会侵犯到使用者的隐私,
    //所以本接口仅提供随机数
    @PostMapping("/predict")
    public Personlity predict(){
        Random random = new Random();
        PersonlityInput personlityInput = new PersonlityInput();
        personlityInput.setUserId(StpUtil.getLoginIdAsString());
        personlityInput.setAgr(random.nextInt(2));
        personlityInput.setCon(random.nextInt(2));
        personlityInput.setExt(random.nextInt(2));
        personlityInput.setNeu(random.nextInt(2));
        personlityInput.setOpe(random.nextInt(2));

        Personlity personlity = personlityInput.toEntity();
        personlityRespository.save(personlityInput.toEntity());

        return personlity;
    }
}
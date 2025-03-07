package io.github.qifan777.knowledge.ai.personlity;

import io.github.qifan777.knowledge.infrastructure.jimmer.BaseEntity;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Null;
import org.babyfish.jimmer.sql.Entity;

@Entity
public interface Personlity extends BaseEntity {


    @Max(value = 1)
    int con();
    int ext();
    int ope();
    int neu();
    int agr();
    String userId();



}

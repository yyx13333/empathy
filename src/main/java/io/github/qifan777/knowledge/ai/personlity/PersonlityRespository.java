package io.github.qifan777.knowledge.ai.personlity;

import cn.dev33.satoken.stp.StpUtil;
import io.github.qifan777.knowledge.ai.personlity.dto.PersonlityInput;
import org.babyfish.jimmer.spring.repository.JRepository;

import java.util.List;


public interface PersonlityRespository extends JRepository<Personlity, String> {
    PersonlityTable t = PersonlityTable.$;
    PersonlityFetcher FETCHER = PersonlityFetcher.$.allScalarFields();

    default List<Personlity> findByUserId(){
        return  sql().createQuery(t)
                .where(t.creatorId().eq(StpUtil.getLoginIdAsString()))
                .select(t.fetch(FETCHER))
                .execute();
    }

}

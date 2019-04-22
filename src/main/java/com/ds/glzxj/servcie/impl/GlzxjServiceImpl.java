package com.ds.glzxj.servcie.impl;

import com.ds.glzxj.mapper.GlzxjMappper;
import com.ds.glzxj.pojo.Glzxj;
import com.ds.glzxj.servcie.GlzxjService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称: UserServiceImpl
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
@Service
public class GlzxjServiceImpl implements GlzxjService {
    @Autowired
    private GlzxjMappper glzxjMappper;

    @Override
    public Integer getGlzxjCount(Glzxj glzxj) {
        return glzxjMappper.getGlzxjCount(glzxj);
    }

    @Override
    public List<Glzxj> findAllGlzxj(Glzxj glzxj) {
        return glzxjMappper.findAllGlzxj(glzxj);
    }

    @Override
    public void delAllGlzxj(String ids) {
        String[] id = ids.split(",");
        glzxjMappper.delAllGlzxj(id);
    }

//    @Override
//    public int insertZhouJiHua(WeekPlan weekPlan) {
//        return weekPlanMappper.insertZhouJiHua(weekPlan);
//    }

}

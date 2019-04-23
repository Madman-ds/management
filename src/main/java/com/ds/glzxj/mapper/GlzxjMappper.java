package com.ds.glzxj.mapper;

import com.ds.glzxj.pojo.Glzxj;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface GlzxjMappper {
    Integer getGlzxjCount(Glzxj glzxj);

    List<Glzxj> findAllGlzxj(Glzxj glzxj);

    void delAllGlzxj(String[] id);

    int insertGlzxj(Glzxj glzxj);

}

package com.ds.attributes.service;

import com.ds.attributes.pojo.Attributes;

import java.util.List;

/**
 * @接口名称：AttributesService
 * @作者: 段大神经
 * @创建时间: 2018/9/26 22:52
 * @说明: 属性相关service
 */
public interface AttributesService {
    List findAttributes(Attributes attributes);

    void deleteAttributes(Long aLong);

    int insertAttributes(Attributes attributes);

    int updateAttributes(Attributes attributes);
}

package com.ds.attributes.service.impl;

import com.ds.attributes.mapper.AttributesMapper;
import com.ds.attributes.pojo.Attributes;
import com.ds.attributes.service.AttributesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称：AttributesServiceImpl
 * @作者: 段大神经
 * @创建时间: 2018/9/26 22:53
 * @说明:
 */
@Service
public class AttributesServiceImpl implements AttributesService {
    @Autowired
    private AttributesMapper attributesMapper;

    @Override
    public List findAttributes(Attributes attributes) {
        return attributesMapper.findAttributes(attributes);
    }

    @Override
    public void deleteAttributes(Long sx_id) {
        attributesMapper.deleteAttributes(sx_id);
    }

    @Override
    public int insertAttributes(Attributes attributes) {
        return attributesMapper.insertAttributes(attributes);
    }

    @Override
    public int updateAttributes(Attributes attributes) {
        return attributesMapper.updateAttributes(attributes);
    }
}

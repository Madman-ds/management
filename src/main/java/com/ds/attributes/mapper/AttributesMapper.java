package com.ds.attributes.mapper;

import com.ds.attributes.pojo.Attributes;

import java.util.List;

/**
 * @接口名称：AttributesMapper
 * @作者: 段大神经
 * @创建时间: 2018/9/26 22:51
 * @说明:
 */
public interface AttributesMapper {
    List findAttributes(Attributes attributes);

    void deleteAttributes(Long sx_id);

    int insertAttributes(Attributes attributes);

    int updateAttributes(Attributes attributes);

    void saveAttributes(Attributes attributes);

    List<Attributes> findAllAttributesSbId(Long sb_id);

}

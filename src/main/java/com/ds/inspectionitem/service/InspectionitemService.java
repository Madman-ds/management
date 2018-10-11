package com.ds.inspectionitem.service;

import com.ds.inspectionitem.pojo.UserEquipment;

import java.util.List;

/**
 * @接口名称：InspectionitemService
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:33
 * @说明:
 */
public interface InspectionitemService {
    List findAllInspectionitemBySbId(Long sb_id);

    void insertUserEquipment(UserEquipment userEquipment);
}

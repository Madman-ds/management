package com.ds.inspectionitem.service.impl;

import com.ds.inspectionitem.mapper.InspectionitemMapper;
import com.ds.inspectionitem.pojo.Inspectionitem;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.inspectionitem.service.InspectionitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称：InspectionitemServiceImpl
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:34
 * @说明:
 */
@Service
public class InspectionitemServiceImpl implements InspectionitemService {
    @Autowired
    private InspectionitemMapper inspectionitemMapper;

    @Override
    public List findAllInspectionitemBySbId(Long sb_id) {
        return inspectionitemMapper.findAllInspectionitemBySbId(sb_id);
    }

    @Override
    public void insertUserEquipment(UserEquipment userEquipment) {
        inspectionitemMapper.insertUserEquipment(userEquipment);
    }

    @Override
    public UserEquipment selectUserequipment(UserEquipment userEquipment) {
        return inspectionitemMapper.selectUserequipment(userEquipment);
    }

    @Override
    public void updUserEquipment(UserEquipment userEquipment) {
        inspectionitemMapper.updUserEquipment(userEquipment);
    }

    @Override
    public void addInspectionitem(Inspectionitem inspectionitem) {
        inspectionitemMapper.addInspectionitem(inspectionitem);
    }

    @Override
    public void updateInspectionitem(Inspectionitem inspectionitem) {
        inspectionitemMapper.updateInspectionitem(inspectionitem);
    }

    @Override
    public int delInspectionitem(String sb_id) {
        return inspectionitemMapper.delInspectionitem(sb_id);
    }

}

package com.ds.inspectionitem.service;

import com.ds.inspectionitem.pojo.Inspectionitem;
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
    /**
     * @作者: 段大神经
     * @功能描述: 根据条件查询某用户具有某个权限
     * @时间: 2018/10/16 22:32
     * @参数:  * @param
     * @返回值: java.lang.Integer
     **/
    UserEquipment selectUserequipment(UserEquipment userEquipment);
    /**
     * @作者: 段大神经
     * @功能描述: 根据id修改用户检查项关联权限
     * @时间: 2018/10/16 22:34
     * @参数:  * @param userEquipment
     * @返回值: void
     **/
    void updUserEquipment(UserEquipment userEquipment);

    /**
     * @作者: yuboyake
     * @功能描述: 设备检查项添加
     * @时间: 2018/10/17 17:04
     * @参数:  * @param inspectionitem
     * @返回值: void
     **/
    void addInspectionitem(Inspectionitem inspectionitem);

    void updateInspectionitem(Inspectionitem inspectionitem);

    int delInspectionitem(String sb_id);
}

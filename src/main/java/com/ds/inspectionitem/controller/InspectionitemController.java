package com.ds.inspectionitem.controller;

import com.ds.inspectionitem.pojo.Inspectionitem;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.inspectionitem.service.InspectionitemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @类名称：InspectionitemController
 * @作者: 段大神经
 * @创建时间: 2018/10/10 22:32
 * @说明: 检查项相关控制器
 */
@RestController
public class InspectionitemController {
    @Autowired
    private InspectionitemService inspectionitemService;
    /**
     * @作者: 段大神经
     * @功能描述: 根据设备id查询所有检查项
     * @时间: 2018/10/10 23:14
     * @参数:  * @param request
     * @返回值: java.util.List
     **/
    @PostMapping("findAllInspectionitemBySbId")
    public List findAllInspectionitemBySbId(HttpServletRequest request){
        Long sb_id = Long.valueOf(request.getParameter("sb_id"));
        return inspectionitemService.findAllInspectionitemBySbId(sb_id);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 新增赋权数据
     * @时间: 2018/10/10 23:23
     * @参数:  * @param userEquipment
     * @返回值: void
     **/
    @PostMapping("insertUserEquipment")
    public void insertUserEquipment(HttpServletRequest request){
        //用request获取区分前台传过来的数据是要添加读权限还是写权限
        //将获取的写权限赋值给对象新增
        //将读权限集合循环新增
        UserEquipment userEquipment = new UserEquipment();
        inspectionitemService.insertUserEquipment(userEquipment);
    }

    /**
     * @作者: yuboyake
     * @功能描述: 设备检查项添加
     * @时间: 2018/10/17 17:04
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("inspectionitem/addInspectionitem")
    public void addInspectionitem(HttpServletRequest request){
        String numArr  = request.getParameter("sx_name");
        String numArr2 = request.getParameter("sx_v");
        String numArr3 = request.getParameter("sb_id");
        String[] s = numArr.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        Inspectionitem inspectionitem = null;
        for (int i = 0; i < s.length; i++) {
            inspectionitem = new Inspectionitem();
            inspectionitem.setJcx_name(s[i].substring(1, s[i].length()-1));
            inspectionitem.setJcx_v(s2[i].substring(1, s2[i].length()-1));
            inspectionitem.setSb_id(Long.valueOf(numArr3));
            inspectionitemService.addInspectionitem(inspectionitem);
        }
    }
}

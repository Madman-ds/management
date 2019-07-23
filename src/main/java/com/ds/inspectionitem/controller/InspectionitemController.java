package com.ds.inspectionitem.controller;

import com.ds.inspectionitem.pojo.Inspectionitem;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.inspectionitem.service.InspectionitemService;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
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
        String numArr4 = request.getParameter("sx_id");
//        inspectionitemService.deleteInspectionitem(numArr3);
        if (numArr != ""){
            String[] s = numArr.substring(1).replaceAll("]","").split(",");
            String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
            String[] s3 = numArr4.substring(1).replaceAll("]","").split(",");
            Inspectionitem inspectionitem = null;
            for (int i = 0; i < s.length; i++) {
                inspectionitem = new Inspectionitem();
                String jcx_id = s3[i].substring(1, s3[i].length() - 1);
                if(jcx_id!=null &&  !"".equals(jcx_id)){
                    inspectionitem.setJcx_id(Long.valueOf(jcx_id));//检查项id
                    inspectionitem.setJcx_name(s[i].substring(1, s[i].length() - 1));//姓名
                    inspectionitem.setJcx_v(s2[i].substring(1, s2[i].length() - 1));//值
                    inspectionitem.setSb_id(Long.valueOf(numArr3));//关联设备id
                    inspectionitemService.updateInspectionitem(inspectionitem);
                }else {
                    inspectionitem.setJcx_name(s[i].substring(1, s[i].length() - 1));
                    inspectionitem.setJcx_v(s2[i].substring(1, s2[i].length() - 1));
                    inspectionitem.setSb_id(Long.valueOf(numArr3));
                    inspectionitemService.addInspectionitem(inspectionitem);
                }
            }
        }
    }
    /**
     * @作者: 段大神经
     * @功能描述: 用户赋检查项权限
     * @时间: 2018/10/18 21:07
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("toUserSetJcxQx")
    public void toUserSetJcxQx(HttpServletRequest request){
        String jcx = request.getParameter("jcx");
        String xqx = request.getParameter("xqx");
        String dqx = request.getParameter("dqx");
        String[] jcxArr = jcx.substring(1).replaceAll("]","").split(",");
        UserEquipment userEquipment = null;
        //写权限
        for (int i = 0 ; i<jcxArr.length; i++){
            userEquipment = new UserEquipment();
            userEquipment.setJcx_id(Long.valueOf(jcxArr[i]));
            userEquipment.setUser_id(Long.valueOf(xqx));
            UserEquipment userEquipment1 = inspectionitemService.selectUserequipment(userEquipment);
            if (userEquipment1 == null){
                userEquipment.setQx(1);
                userEquipment.setTop(1);
                inspectionitemService.insertUserEquipment(userEquipment);
            }else if (userEquipment1.getQx() == 0){
                userEquipment1.setQx(1);
                userEquipment.setTop(1);
                inspectionitemService.updUserEquipment(userEquipment1);
            }
        }
        if(dqx!=null && !"".equals(dqx)){
            String[] dqxArr = dqx.substring(1).replaceAll("]","").split(",");
            //读权限
            if (dqxArr != null && dqxArr.length > 0 && !"".equals(dqxArr[0])){
                for (int i = 0 ; i<jcxArr.length; i++){
                    userEquipment = new UserEquipment();
                    userEquipment.setJcx_id(Long.valueOf(jcxArr[i]));
                    for (int j = 0 ; j<dqxArr.length; j++){
                        userEquipment.setUser_id(Long.valueOf(dqxArr[j].substring(1,dqxArr[j].length()-1)));
                        UserEquipment userEquipment1 = inspectionitemService.selectUserequipment(userEquipment);
                        if (userEquipment1 == null){
                            userEquipment.setQx(0);
                            inspectionitemService.insertUserEquipment(userEquipment);
                        }else if(userEquipment1.getQx() == 1 && userEquipment1.getUser_id() != Long.parseLong(xqx)){
                            userEquipment1.setQx(0);
                            inspectionitemService.updUserEquipment(userEquipment1);
                        }
                    }
                }
            }
        }
    }


    @PostMapping(value="getJianChaXiang")
    public List<Inspectionitem> getJianChaXiang(String id){
        Long sb_id = Long.valueOf(id);
        List<Inspectionitem> list = inspectionitemService.findAllInspectionitemBySbId(sb_id);
        return list;
    }

    @PostMapping(value = "delInspectionitem")
    public int delInspectionitem(String sb_id){
        return inspectionitemService.delInspectionitem(sb_id);
    }

}

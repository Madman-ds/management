package com.ds.equipment.controller;

import com.ds.attributes.pojo.Attributes;
import com.ds.attributes.service.AttributesService;
import com.ds.equipment.pojo.Equipment;
import com.ds.equipment.pojo.EquipmentInspectionitem;
import com.ds.equipment.pojo.EquipmentRead;
import com.ds.equipment.service.EquipmentService;
import com.ds.serverlogin.pojo.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

/**
 * @类名称: EquipmentController
 * @作者: yuboyake
 * @创建时间: 2018/9/26 22:33
 * @说明:
 */
@RestController
@RequestMapping("equipment")
public class EquipmentController {

    //设备
    @Autowired
    private EquipmentService equipmentService;
    //属性
    @Autowired
    private AttributesService attributesService;

    /**
     * @作者: yuboyake
     * @功能描述: 设备分页查询
     * @时间: 2018/9/26 22:50
     * @参数:  * @param equipment
     * @返回值: java.util.HashMap<java.lang.String,java.lang.Object>
     **/
    @PostMapping(value = "getEquipmentList")
    public HashMap<String, Object> getEquipmentList(Equipment equipment){
        equipment.calculate();
        //获取总数据
        int count=equipmentService.getEquipmentCount();
        System.out.println(count);
        List<Equipment> list=equipmentService.getEquipmentList(equipment);
        System.out.println(list.toString());
        HashMap<String, Object> result=new HashMap<String, Object>();
        result.put("total", count);
        result.put("rows", list);
        return result;
    }

    /**
     * @作者: yuboyake
     * @功能描述: 批量删除
     * @时间: 2018/9/26 23:45
     * @参数:  * @param ids
     * @返回值: boolean
     **/
    @PostMapping(value="delEquipment")
    public boolean delEquipment(String ids){
        boolean isOK = equipmentService.delEquipment(ids);
        return isOK;
    }

    /**
     * @作者: 段大神经
     * @功能描述: 根据id查询设备
     * @时间: 2018/9/27 0:19
     * @参数:  * @param id
     * @返回值: java.lang.Object
     **/
    @PostMapping(value="getEquipmentById")
    public Object getEquipmentById(String id){
        Long sb_id = Long.valueOf(id);
        Equipment equipment = equipmentService.getEquipmentById(sb_id);
        return equipment;
    }


    /**
     * @作者: yuboyake
     * @功能描述: 添加
     * @时间: 2018/9/28 6:35
     * @参数:  * @param equipment
     * @返回值: boolean
     **/
    @PostMapping(value="addEquipment")
    public String addEquipment(Equipment equipment,HttpServletRequest request){
        equipmentService.addEquipment(equipment);
        String numArr  = request.getParameter("sx_name");
        String numArr2 = request.getParameter("sx_v");
        String[] s = numArr.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        if (s.length>0 && !"".equals(s[0])){
            Attributes attributes = null;
            for (int i = 0; i < s.length; i++) {
                attributes = new Attributes();
                attributes.setSx_name(s[i].substring(1, s[i].length()-1));
                attributes.setSx_v(s2[i].substring(1, s2[i].length()-1));
                attributes.setSb_id(Long.valueOf(equipment.getSb_id()));
                attributesService.saveAttributes(attributes);
            }
        }
        return "SUCCESS";
    }

    /**
     * @作者: yuboyake
     * @功能描述: 修改
     * @时间: 2018/9/28 6:35
     * @参数:  * @param equipment
     * @返回值: boolean
     **/
    @PostMapping(value="updateEquipment")
    public int updateEquipment(Equipment equipment){
        return equipmentService.updateEquipment(equipment);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 根据设备id查询设备详细信息  用于检查项赋权
     * @时间: 2018/10/20 13:21
     * @参数:  * @param
     * @返回值: com.ds.equipment.pojo.EquipmentInspectionitem
     **/
    @GetMapping("selectEquipmentInspectionitemBySbId")
    public EquipmentInspectionitem selectEquipmentInspectionitemBySbId(HttpServletRequest request){
        Long sbId = Long.valueOf(request.getParameter("sb_id"));
        return equipmentService.selectEquipmentInspectionitemBySbId(sbId);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 根据用户id查询用户拥有的写权限的设备及检查项信息
     * @时间: 2018/10/20 13:21
     * @参数:  * @param
     * @返回值: com.ds.equipment.pojo.EquipmentInspectionitem
     **/
    @GetMapping("findEquipmentInspectionitem")
    public List findEquipmentInspectionitem(HttpServletRequest request){
        Long userId = Long.valueOf(request.getParameter("userId"));
        return equipmentService.findEquipmentInspectionitem(userId);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 根据用户id查询用户拥有的写权限的设备及检查项信息
     * @时间: 2018/10/20 13:21
     * @参数:  * @param
     * @返回值: com.ds.equipment.pojo.EquipmentInspectionitem
     **/
    /*@GetMapping("findReadEquipmentInspectionitem")
    public List findReadEquipmentInspectionitem(HttpServletRequest request){
        Long userId = Long.valueOf(request.getParameter("userId"));
        return equipmentService.findReadEquipmentInspectionitem(userId);
    }*/
//    @GetMapping("findZjRead")
//    public List findZjRead(HttpSession session){
//        LoginUser user = (LoginUser) session.getAttribute("loginUser");
//        List y = equipmentService.findReadEquipmentInspectionitem(user.getUser_id());
//        return y;
//    }

    @GetMapping("findZjRead")
    public List findZjRead(HttpSession session){
        LoginUser user = (LoginUser) session.getAttribute("loginUser");
        EquipmentRead equipmentRead = new EquipmentRead();
        equipmentRead.setUser_id(user.getUser_id());
        List equipmentReadList = equipmentService.findEquipmentReadRepeat(equipmentRead);
        return equipmentReadList;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询危险点点检授权数据
     * @时间: 2019/5/1 1:11
     * @参数:  * @param equipmentRead
     * @返回值: java.util.List
     **/
    @GetMapping("showEquipmentReadList")
    public HashMap<String, Object> showEquipmentReadList(EquipmentRead equipmentRead){
        equipmentRead.calculate();
        //获取总数据
        int count=equipmentService.showEquipmentReadCount(equipmentRead);
        List list = equipmentService.showEquipmentReadList(equipmentRead);
        HashMap<String, Object> result=new HashMap<String, Object>();
        result.put("total", count);
        result.put("rows", list);
        return result;
    }
    @PostMapping("delEquipmentRead")
    public Boolean delEquipmentRead(String erid){
        Boolean flag = equipmentService.delEquipmentRead(erid);
        return flag;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 危险点点检读权限授权
     * @时间: 2019/5/1 16:31
     * @参数:  * @param juid
     * @param jcxid
     * @param sbid
     * @param sbname
     * @param sbnumber
     * @param jcxname
     * @param userid
     * @param username
     * @返回值: void
     **/
    @PostMapping("insertEquipmentRead")
    public void insertEquipmentRead(String juid,String jcxid,String sbid,String sbname,String sbnumber,String jcxname,String userid,String username){
        String[] juids = juid.split(",");
        String[] jcxids = jcxid.split(",");
        String[] sbids = sbid.split(",");
        String[] sbnames = sbname.split(",");
        String[] sbnumbers = sbnumber.split(",");
        String[] jcxnames = jcxname.split(",");
        String[] usernames = username.split(",");
        for (int i = 0; i < juids.length; i++){
            EquipmentRead equipmentRead = new EquipmentRead();
            equipmentRead.setJu_id(Long.valueOf(juids[i]));
            equipmentRead.setJcx_id(Long.valueOf(jcxids[i]));
            equipmentRead.setSb_id(Long.valueOf(sbids[i]));
            equipmentRead.setSb_name(sbnames[i]);
            equipmentRead.setSb_number(sbnumbers[i]);
            equipmentRead.setJcx_name(jcxnames[i]);
            equipmentRead.setUser_id(Long.valueOf(userid));
            equipmentRead.setUser_name(usernames[i]);
            List equipmentReadList = equipmentService.findEquipmentReadRepeat(equipmentRead);
            if(equipmentReadList.size()<= 0){
                equipmentService.insertEquipmentRead(equipmentRead);
            }
        }
    }
    @GetMapping("showHaveEquipmentReadList")
    public List showHaveEquipmentReadList(String user_id){
        EquipmentRead equipmentRead = new EquipmentRead();
        equipmentRead.setUser_id(Long.valueOf(user_id));
        List equipmentReadList = equipmentService.showHaveEquipmentReadList(equipmentRead);
        return equipmentReadList;
    }


}

package com.ds.attributes.controller;

import com.ds.attributes.pojo.Attributes;
import com.ds.attributes.service.AttributesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @类名称：AttributesController
 * @作者: 段大神经
 * @创建时间: 2018/9/26 22:48
 * @说明: 设备相关controller
 */
@RestController
public class AttributesController {
    @Autowired
    private AttributesService attributesService;
   /**
    * @作者: 段大神经
    * @功能描述: 条件或全部查询属性
    * @时间: 2018/9/27 22:07
    * @参数:  * @param attributes
    * @返回值: java.util.List
    **/
    @GetMapping("findAttributes")
    public List findAttributes(Attributes attributes){
        return attributesService.findAttributes(attributes);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 根据设备id删除属性（批量删除或单删）
     * @时间: 2018/9/26 23:28
     * @参数:  * @param request
     * @返回值: void
     **/
    @GetMapping("deleteAttributes")
    public void deleteAttributes(HttpServletRequest request){
        String str = request.getParameter("ids");
        String[] ids = str.split(",");
        for (int i = 0; i <= ids.length; i++){
            attributesService.deleteAttributes( Long.valueOf(ids[i]));
        }
    }
    /**
     * @作者: 段大神经
     * @功能描述:  添加属性
     * @时间: 2018/9/26 23:37
     * @参数:  * @param
     * @返回值: int
     **/
    @PostMapping("insertAttributes")
    public int insertAttributes(Attributes attributes){
        //获取返回的主键用于关联表存储
        System.out.print(attributes.getSx_id());
        return attributesService.insertAttributes(attributes);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 修改属性
     * @时间: 2018/9/26 23:44
     * @参数:  * @param attributes
     * @返回值: int
     **/
    @PostMapping("updateAttributes")
    public int updateAttributes(Attributes attributes){
        return attributesService.updateAttributes(attributes);
    }

    /**
     * @作者: yuboyake
     * @功能描述: 修改设备属性
     * @时间: 2018/10/18 10:48
     * @参数:  * @param request
     * @返回值: void
     **/
    @PostMapping("/equipment/updateAttr")
    public void updateAttr(HttpServletRequest request){
        String numArr  = request.getParameter("sx_name");
        String numArr2 = request.getParameter("sx_v");
        String numArr3 = request.getParameter("sb_id");
        String[] s = numArr.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        Long sb_id = Long.valueOf(numArr3);
        attributesService.deleteAttributes(sb_id);
        Attributes attributes = null;
        System.out.println(s.equals(""));
        for (int i = 0; i < s.length; i++) {
            attributes = new Attributes();
            attributes.setSx_name(s[i].substring(1, s[i].length()-1));
            attributes.setSx_v(s2[i].substring(1, s2[i].length()-1));
            attributes.setSb_id(Long.valueOf(numArr3));
            System.out.println(attributes);
            attributesService.insertAttributes(attributes);
        }
    }
}

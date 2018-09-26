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
     * @功能描述: 查询所有或者条件查询属性，当属性类为null时查询所有
     * @时间: 2018/9/26 23:03
     * @参数:  * @param
     * @返回值: java.util.List
     **/
    @GetMapping("findAttributes")
    public List findAttributes(){
        Attributes attributes = null;
        return attributesService.findAttributes(attributes);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 根据id删除属性（批量删除或单删）
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
}

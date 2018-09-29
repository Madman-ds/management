package com.ds.databackup.controller;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import com.ds.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:34
 * @说明: 数据备份控制类
 */
@RestController
public class DataBackupController {
    @Autowired
    private DataBackupService dataBackupService;
    /**
     * @作者: 段大神经
     * @功能描述: 条件查询数据备份
     * @时间: 2018/9/28 21:04
     * @参数:  * @param dataBackup
     * @返回值: java.util.Map<java.lang.String,java.lang.Object>
     **/
    @GetMapping("findDataBackup")
    public Map<String, Object> findDataBackup(HttpServletRequest req){
        String sb_name = req.getParameter("sb_name");
        String sb_number = req.getParameter("sb_number");
        String sb_xh = req.getParameter("sb_xh");
        String user_name = req.getParameter("user_name");
        String start_time = req.getParameter("start_time");
        String end_time = req.getParameter("end_time");
        String parameter4 = req.getParameter("offset");
        String parameter5 = req.getParameter("limit");
        int  offset =Integer.valueOf(parameter4);
        int  limit =Integer.valueOf(parameter5);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("sb_name", sb_name);
        map.put("sb_number", sb_number);
        map.put("sb_xh", sb_xh);
        map.put("user_name", user_name);
        map.put("start_time", DateUtil.stringToDate(start_time,"yyyy-MM-dd hh:mm:ss"));
        map.put("end_time", DateUtil.stringToDate(end_time,"yyyy-MM-dd hh:mm:ss"));
        map.put("offset", offset);
        map.put("limit", limit);
        int count = dataBackupService.getDataBackupCount(map);
        List<DataBackup> list = dataBackupService.findDataBackup(map);
        Map<String, Object> result=new HashMap<String, Object>();
        result.put("total", count);
        result.put("rows", list);
        return result;
    }
    /**
     * @作者: 段大神经
     * @功能描述: 添加数据备份记录
     * @时间: 2018/9/27 22:56
     * @参数:  * @param dataBackup
     * @返回值: int
     **/
    @PostMapping("insertDataBackup")
    public int insertDataBackup(DataBackup dataBackup){
        return dataBackupService.insertDataBackup(dataBackup);
    }
}

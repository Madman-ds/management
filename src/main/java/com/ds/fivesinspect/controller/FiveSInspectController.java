package com.ds.fivesinspect.controller;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.UserFiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @类名称：FiveSInspectController
 * @作者: 老西儿
 * @创建时间: 2019/4/17 21:53
 * @说明:
 */
@RestController
public class FiveSInspectController {
    @Autowired
    private FiveSInspectService fiveSInspectService;
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S数据
     * @时间: 2019/4/17 22:03
     * @参数:  * @param fiveSInspect
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findFiveSInspect")
    public Map<String,Object> findFiveSInspect(FiveSInspect fiveSInspect){
        Integer count = fiveSInspectService.findFiveSInspectCount();
        List<FiveSInspect> fiveSInspects = fiveSInspectService.findFiveSInspect(fiveSInspect);
        Map<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",fiveSInspects);
        return map;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 添加5S数据
     * @时间: 2019/4/18 17:05
     * @参数:  * @param fiveSInspect
     * @返回值: void
     **/
    @PostMapping("addFiveSInspect")
    public void addFiveSInspect(FiveSInspect fiveSInspect){
        fiveSInspectService.addFiveSInspect(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据id批量删除5S数据
     * @时间: 2019/4/18 17:31
     * @参数:  * @param ids
     * @返回值: java.lang.Boolean
     **/
    @PostMapping("delFiveSInspectAll")
    public Boolean delFiveSInspectAll(String ids){
        Boolean flag = fiveSInspectService.delFiveSInspectAll(ids);
        return flag;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S数据回显
     * @时间: 2019/4/18 18:11
     * @参数:  * @param fiveSInspect
     * @返回值: com.ds.fivesinspect.pojo.FiveSInspect
     **/

    @GetMapping("findFiveSInspectById")
    public FiveSInspect findFiveSInspectById(FiveSInspect fiveSInspect){
        FiveSInspect inspect = fiveSInspectService.findFiveSInspectById(fiveSInspect);
        return inspect;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S数据
     * @时间: 2019/4/19 17:49
     * @参数:  * @param fiveSInspec
     * @返回值: void
     **/
    @PostMapping("upFiveSInspect")
    public void upFiveSInspect(FiveSInspect fiveSInspec){
        fiveSInspectService.upFiveSInspect(fiveSInspec);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 5S添加写权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param ids
     * @param userId
     * @返回值: void
     **/
    @PostMapping("insertUserFiveSInspect")
    public void insertUserFiveSInspect(String ids, String userId, String fivess){
        String[] idss = ids.split(",");
        String[] fivesss = fivess.split(",");
        for (int i = 0;i < idss.length;i++){
            UserFiveSInspect userFiveSInspect = new UserFiveSInspect();
            userFiveSInspect.setF_id(Integer.valueOf(idss[i]));
            userFiveSInspect.setUser_id(Integer.valueOf(userId));
            userFiveSInspect.setIfextract("0");
            userFiveSInspect.setF_fives(fivesss[i]);
            fiveSInspectService.addUserFiveSInspect(userFiveSInspect);
        }
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户id查询5S权限
     * @时间: 2019/4/21 17:31
     * @参数:  * @param userId
     * @返回值: java.util.Map<java.lang.String,java.lang.Object>
     **/
    @GetMapping("showUserFiveSInspect")
    public List<UserFiveSInspect> showUserFiveSInspect(String userId){
        List<UserFiveSInspect> fiveSInspects = fiveSInspectService.showUserFiveSInspect(userId);
        return fiveSInspects;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S是否提取
     * @时间: 2019/4/22 11:01
     * @参数:  * @param userFiveSInspect
     * @返回值: com.ds.fivesinspect.pojo.UserFiveSInspect
     **/
    @PostMapping("upIfextract")
    public void upIfextract(UserFiveSInspect userFiveSInspect){
        fiveSInspectService.upIfextract(userFiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 删除指定用户的5S写权限
     * @时间: 2019/4/22 14:27
     * @参数:  * @param ufid
     * @返回值: java.lang.Boolean
     **/
    @PostMapping("delUserFiveSInspect")
    public Boolean delUserFiveSInspect(String ufid){
        Boolean flag = fiveSInspectService.delUserFiveSInspect(ufid);
        return flag;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S日志
     * @时间: 2019/4/22 22:37
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.Map<java.lang.String,java.lang.Object>
     **/
    @GetMapping("findFiveSInspectLog")
    public Map<String,Object> findFiveSInspectLog(FiveSInspect fiveSInspect){
        Integer count = fiveSInspectService.findFiveSInspectLogCount();
        List<FiveSInspect> fiveSInspects = fiveSInspectService.findFiveSInspectLog(fiveSInspect);
        Map<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",fiveSInspects);
        return map;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户id查询5S日志
     * @时间: 2019/4/22 22:25
     * @参数:  * @param userId
     * @返回值: java.util.List
     **/
    @GetMapping("showFiveSLogByUser")
    public List showFiveSLogByUser(String userId){
        List FiveSLoglist = fiveSInspectService.showFiveSLogByUser(userId);
        return FiveSLoglist;
    }
}

package com.ds.fivesinspect.controller;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.ReadFives;
import com.ds.fivesinspect.pojo.UserFiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
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
        fiveSInspect.calculate();
        Integer count = fiveSInspectService.findFiveSInspectCount();
        List<FiveSInspect> fiveSInspects = fiveSInspectService.findFiveSInspect(fiveSInspect);
        Map<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",fiveSInspects);
        return map;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 打卡页面查询5S点检数据
     * @时间: 2019/4/23 17:47
     * @参数:  * @param
     * @返回值: java.util.List
     **/
    @GetMapping("showfiveslogs")
    public List showfiveslogs(FiveSInspect fiveSInspect){
        List fiveslist = fiveSInspectService.findFiveSInspect(fiveSInspect);
        return fiveslist;
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
                userFiveSInspect.setF_id(Long.valueOf(idss[i]));
                userFiveSInspect.setUser_id(Long.valueOf(userId));
                userFiveSInspect.setIfextract("0");
                userFiveSInspect.setF_fives(fivesss[i]);
                List<UserFiveSInspect> userFiveSInspects = fiveSInspectService.findUserFiveSInspect(userFiveSInspect);
                if(userFiveSInspects.size() <= 0){
                    fiveSInspectService.addUserFiveSInspect(userFiveSInspect);
                }
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
    public List<UserFiveSInspect> showUserFiveSInspect(UserFiveSInspect userFiveSInspect){
        List<UserFiveSInspect> fiveSInspects = fiveSInspectService.findUserFiveSInspect(userFiveSInspect);
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
        fiveSInspect.calculate();
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
    public List showFiveSLogByUser(HttpSession httpSession){
        LoginUser loginUser = (LoginUser) httpSession.getAttribute("loginUser");
        List FiveSLoglist = fiveSInspectService.showFiveSLogByUser(loginUser.getUser_id().toString());
        return FiveSLoglist;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询读权限授权数据
     * @时间: 2019/4/27 16:29
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List
     **/
    @GetMapping("showFiveSReadList")
    public Map<String,Object> showFiveSReadList(FiveSInspect fiveSInspect){
        fiveSInspect.calculate();
        Integer count = fiveSInspectService.showFiveSReadListCount(fiveSInspect);
        List<FiveSInspect> fiveSReadList = fiveSInspectService.showFiveSReadList(fiveSInspect);
        Map<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",fiveSReadList);
        return map;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 添加读权限
     * @时间: 2019/4/27 19:09
     * @参数:  * @param ids
     * @param userid
     * @param ufid
     * @返回值: void
     **/
    @PostMapping("insertReadFive")
    public void insertReadFive(String ids, String userid,String fivess,String ufid,String user_name){
        String[] id = ids.split(",");
        String[] ufids = ufid.split(",");
        String[] fives = fivess.split(",");
        String[] username = user_name.split(",");
        for (int i = 0;i < id.length;i++){
            ReadFives readFives = new ReadFives();
            readFives.setF_id(Long.valueOf(id[i]));
            readFives.setUser_id(Long.valueOf(userid));
            readFives.setU_f_id(Long.valueOf(ufids[i]));
            readFives.setF_fives(fives[i]);
            readFives.setUser_name(username[i]);
            List<ReadFives> readFivess = fiveSInspectService.findReadFive(readFives);
            if(readFivess.size() <= 0){
                fiveSInspectService.insertReadFive(readFives);
            }
        }
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户查询的5S读权限
     * @时间: 2019/4/27 20:48
     * @参数:  * @param userId
     * @返回值: java.util.List
     **/
    @GetMapping("showHaveFiveSReadList")
    public List showHaveFiveSReadList(String user_id){
        List fiveSReadList = fiveSInspectService.showHaveFiveSReadList(user_id);
        return fiveSReadList;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 删除读取权限
     * @时间: 2019/4/27 22:05
     * @参数:  * @param rid
     * @返回值: java.lang.Boolean
     **/
    @PostMapping("delFiveSRead")
    public Boolean delFiveSRead(String rid){
        Boolean flag = fiveSInspectService.delFiveSRead(rid);
        return flag;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 个人查看5S读权限信息
     * @时间: 2019/4/28 23:19
     * @参数:  * @param httpSession
     * @返回值: java.util.List
     **/
    @GetMapping("ckFivesReadList")
    public Map<String,Object> ckFivesReadList(HttpSession httpSession,FiveSInspect fiveSInspect){
        fiveSInspect.calculate();
        LoginUser loginUser = (LoginUser)httpSession.getAttribute("loginUser");
        fiveSInspect.setF_userid(loginUser.getUser_id());
        Integer count = fiveSInspectService.ckFivesReadListCount(fiveSInspect);
        List fivesReadList = fiveSInspectService.ckFivesReadList(fiveSInspect);
        Map<String,Object> result = new HashMap<>();
        result.put("total",count);
        result.put("rows",fivesReadList);
        return result;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查看所有提取的5S数据
     * @时间: 2019/4/28 23:22
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.Map<java.lang.String,java.lang.Object>
     **/
    @GetMapping("findFiveSInspectLogqt")
    public Map<String,Object> findFiveSInspectLogqt(FiveSInspect fiveSInspect){
        Integer count = fiveSInspectService.findFiveSInspectLogqtCount();
        List<FiveSInspect> fiveSInspects = fiveSInspectService.findFiveSInspectLogqt(fiveSInspect);
        Map<String,Object> map = new HashMap<>();
        map.put("total",count);
        map.put("rows",fiveSInspects);
        return map;
    }
    /**
     * @作者: 老西儿
     * @功能描述: 5S日志添加
     * @时间: 2019/4/23 21:29
     * @参数:  * @param session
     * @param request
     * @返回值: int
     **/
    @PostMapping("addFiveSInspectLog")
    public int addFiveSInspectLog(HttpSession session, HttpServletRequest request){
        LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
        Long user_id = loginUser.getUser_id();
        String user_name = loginUser.getUser_name();
        FiveSInspect fiveSInspect = new FiveSInspect();
        fiveSInspect.setF_inspectuser(user_name);
        List<FiveSInspect> fiveSInspects = fiveSInspectService.findFiveSLogByUserName(fiveSInspect);
        if (fiveSInspects != null && fiveSInspects.size() > 0){
            fiveSInspect = fiveSInspects.get(0);
            if (DateUtil.isSameDay(fiveSInspect.getF_inspectdate(),new Date())){
                return 2;
            }
        }
        String numArr10 = request.getParameter("numArr1");
        String numArr11 = request.getParameter("numArr2");
        String numArr12 = request.getParameter("numArr3");
        String numArr13 = request.getParameter("numArr4");
        String[] s10 = numArr10.substring(1).replaceAll("]","").split(",");
        String[] s11 = numArr11.substring(1).replaceAll("]","").split(",");
        String[] s12 = numArr12.substring(1).replaceAll("]","").split(",");
        String[] s13 = numArr13.substring(1).replaceAll("]","").split(",");
        for (int i = 0; i < s10.length; i++){
            FiveSInspect fiveSInspect1 = new FiveSInspect();
            fiveSInspect1.setF_fives(s10[i].substring(1,s10[i].length()-1));
            fiveSInspect1.setF_clazzify(s11[i].substring(1,s11[i].length()-1));
            fiveSInspect1.setF_content(s12[i].substring(1,s12[i].length()-1));
            fiveSInspect1.setF_userid(user_id);
            fiveSInspect1.setF_inspectuser(user_name);
            fiveSInspect1.setF_ifmeet(s13[i].substring(1, s13[i].length()-1));
            fiveSInspectService.addFiveSInspectLog(fiveSInspect1);
        }
        return 1;
    }
}

package com.ds.serverlogin.service.impl;

import com.ds.serverlogin.mapper.SloginMapper;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.serverlogin.service.SloginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @类名称: SloginServiceImpl
 * @作者: yuboyake
 * @创建时间: 2018/9/24 15:10
 * @说明:
 */
@Service
public class SloginServiceImpl implements SloginService {
    @Autowired
    private SloginMapper sloginMapper;

    @Override
    public Map<String, Object> queryUser(LoginUser loginUser, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        if (loginUser.getUser_name() !=null || !"".equals(loginUser.getUser_name())){
            int userNameCount = sloginMapper.queryUserName(loginUser);
            if (userNameCount == 1){
                if (loginUser.getPassword() !=null || !"".equals(loginUser.getPassword())){
                     LoginUser user = sloginMapper.queryUser(loginUser);
                    if(user != null){
                        session.setAttribute("loginUser",user);
                        session.setAttribute("userName",user.getUser_name());
                        map.put("useFlag",100);//登陆成功
                    }else{
                        map.put("useFlag",104);//密码错误
                    }
                }else{
                    map.put("useFlag",104);//密码错误
                }
            }else if (userNameCount >1){
                map.put("useFlag",103);//库中用户名的所在重复
            }else if (userNameCount == 0){
                map.put("useFlag",102);//用户名不存在
            }
        }else {
            map.put("useFlag",101);//用户名为空
        }
        return map;
    }

    @Override
    public Map<String, Object> queryUserKh(LoginUser loginUser,HttpSession session) {
        Map<String, Object> map = new HashMap();
        LoginUser user = sloginMapper.queryUserByKh(loginUser);
        if (user != null){
            int count = sloginMapper.getKhCount(loginUser);
            if(count > 1){
                map.put("useFlag",101);//卡号重复
            }else {
                session.setAttribute("loginUser",user);
                session.setAttribute("userName",user.getUser_name());
                map.put("useFlag",100);
            }
        }else{
            map.put("useFlag",101);//卡号不存在
        }
        return map;
    }

}

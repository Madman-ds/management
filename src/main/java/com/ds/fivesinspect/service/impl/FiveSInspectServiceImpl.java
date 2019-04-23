package com.ds.fivesinspect.service.impl;

import com.ds.fivesinspect.mapper.FiveSInspectMapper;
import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.UserFiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称：FiveSInspectServiceImpl
 * @作者: 老西儿
 * @创建时间: 2019/4/17 21:54
 * @说明:
 */
@Service
public class FiveSInspectServiceImpl implements FiveSInspectService{
    @Autowired
    private FiveSInspectMapper fiveSInspectMapper;
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S总条数
     * @时间: 2019/4/17 22:03
     * @参数:  * @param
     * @返回值: java.lang.Integer
     **/
    @Override
    public Integer findFiveSInspectCount() {
        return fiveSInspectMapper.findFiveSInspectCount();
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S数据
     * @时间: 2019/4/17 22:04
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.FiveSInspect>
     **/
    @Override
    public List<FiveSInspect> findFiveSInspect(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSInspect(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 添加5S数据
     * @时间: 2019/4/18 17:07
     * @参数:  * @param fiveSInspect
     * @返回值: void
     **/
    @Override
    public void addFiveSInspect(FiveSInspect fiveSInspect) {
        fiveSInspectMapper.addFiveSInspect(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据id批量删除5S数据
     * @时间: 2019/4/18 17:31
     * @参数:  * @param ids
     * @返回值: java.lang.Boolean
     **/
    @Override
    public Boolean delFiveSInspectAll(String ids) {
        try {
            String[] id = ids.split(",");
            fiveSInspectMapper.delFiveSInspectAll(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S数据回显
     * @时间: 2019/4/18 18:10
     * @参数:  * @param fiveSInspect
     * @返回值: com.ds.fivesinspect.pojo.FiveSInspect
     **/
    @Override
    public FiveSInspect findFiveSInspectById(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSInspectById(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S数据
     * @时间: 2019/4/19 17:49
     * @参数:  * @param fiveSInspec
     * @返回值: void
     **/
    @Override
    public void upFiveSInspect(FiveSInspect fiveSInspec) {
        fiveSInspectMapper.upFiveSInspect(fiveSInspec);
    }
    /**
     * @作者: 老西儿
     * @功能描述:5S添加写权限
     * @时间: 2019/4/21 14:16
     * @参数:  * @param userFiveSInspect
     * @返回值: void
     **/
    @Override
    public void addUserFiveSInspect(UserFiveSInspect userFiveSInspect) {
        fiveSInspectMapper.addUserFiveSInspect(userFiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户id查询5S写的权限
     * @时间: 2019/4/21 17:31
     * @参数:  * @param userId
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.FiveSInspect>
     **/
    @Override
    public List<UserFiveSInspect> showUserFiveSInspect(String userId) {
        return fiveSInspectMapper.showUserFiveSInspect(userId);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S是否提取
     * @时间: 2019/4/22 11:08
     * @参数:  * @param userFiveSInspect
     * @返回值: com.ds.fivesinspect.pojo.UserFiveSInspect
     **/
    @Override
    public void upIfextract(UserFiveSInspect userFiveSInspect) {
        fiveSInspectMapper.upIfextract(userFiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 删除5S关联表数据
     * @时间: 2019/4/22 22:33
     * @参数:  * @param ufid
     * @返回值: java.lang.Boolean
     **/
    @Override
    public Boolean delUserFiveSInspect(String ufid) {
        try {
            String[] id = ufid.split(",");
            fiveSInspectMapper.delUserFiveSInspect(id);
            return true;
        }catch (Exception e){
            System.err.println(e);
            return false;
        }
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户查询5S数据
     * @时间: 2019/4/22 22:34
     * @参数:  * @param userId
     * @返回值: java.util.List
     **/
    @Override
    public List showFiveSLogByUser(String userId) {
        return fiveSInspectMapper.showFiveSLogByUser(userId);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S日志总条数
     * @时间: 2019/4/22 22:35
     * @参数:  * @param
     * @返回值: java.lang.Integer
     **/
    @Override
    public Integer findFiveSInspectLogCount() {
        return fiveSInspectMapper.findFiveSInspectLogCount();
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询5S日志
     * @时间: 2019/4/22 22:35
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.FiveSInspect>
     **/
    @Override
    public List<FiveSInspect> findFiveSInspectLog(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSInspectLog(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 修改5S日志信息
     * @时间: 2019/4/23 14:58
     * @参数:  * @param fiveSInspect
     * @返回值: void
     **/
    @Override
    public void upFiveSInspectLog(FiveSInspect fiveSInspect) {
        fiveSInspectMapper.upFiveSInspectLog(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 打卡页面查询5S点检数据
     * @时间: 2019/4/23 17:48
     * @参数:  * @param
     * @返回值: java.util.List
     **/
    @Override
    public List showfiveslog() {
        return fiveSInspectMapper.showfiveslog();
    }

    @Override
    public List<FiveSInspect> findFiveSLogByUserName(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSLogByUserName(fiveSInspect);
    }
}

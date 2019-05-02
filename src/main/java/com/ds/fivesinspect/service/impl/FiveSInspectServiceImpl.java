package com.ds.fivesinspect.service.impl;

import com.ds.fivesinspect.mapper.FiveSInspectMapper;
import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.ReadFives;
import com.ds.fivesinspect.pojo.UserFiveSInspect;
import com.ds.fivesinspect.service.FiveSInspectService;
import com.ds.serverlogin.pojo.LoginUser;
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
    public List<UserFiveSInspect> findUserFiveSInspect(UserFiveSInspect userFiveSInspect) {
        return fiveSInspectMapper.findUserFiveSInspect(userFiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 添加5S日志信息
     * @时间: 2019/4/23 14:58
     * @参数:  * @param fiveSInspect
     * @返回值: void
     **/
    @Override
    public void addFiveSInspectLog(FiveSInspect fiveSInspect1) {
        fiveSInspectMapper.addFiveSInspectLog(fiveSInspect1);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询读权限授权数据
     * @时间: 2019/4/27 16:31
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List
     **/
    @Override
    public List showFiveSReadList(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.showFiveSReadList(fiveSInspect);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询读权限授权信息是否存在
     * @时间: 2019/4/27 18:48
     * @参数:  * @param readFives
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.ReadFives>
     **/
    @Override
    public List<ReadFives> findReadFive(ReadFives readFives) {
        return fiveSInspectMapper.findReadFive(readFives);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 添加读权限
     * @时间: 2019/4/27 18:49
     * @参数:  * @param null
     * @返回值:
     **/
    @Override
    public void insertReadFive(ReadFives readFives) {
        fiveSInspectMapper.insertReadFive(readFives);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 根据用户id查询5S读权限
     * @时间: 2019/4/27 20:49
     * @参数:  * @param userId
     * @返回值: java.util.List
     **/
    @Override
    public List showHaveFiveSReadList(String userId) {
        return fiveSInspectMapper.showHaveFiveSReadList(userId);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 删除5S读权限
     * @时间: 2019/4/28 18:20
     * @参数:  * @param rid
     * @返回值: java.lang.Boolean
     **/
    @Override
    public Boolean delFiveSRead(String rid) {
        try {
            String[] id = rid.split(",");
            fiveSInspectMapper.delFiveSRead(id);
            return true;
        }catch(Exception e){
            return false;
        }
    }
    /**
     * @作者: 老西儿
     * @功能描述: 个人展示页面查看5S数据
     * @时间: 2019/4/28 18:21
     * @参数:  * @param loginUser
     * @返回值: java.util.List
     **/
    @Override
    public List ckFivesReadList(LoginUser loginUser) {
        return fiveSInspectMapper.ckFivesReadList(loginUser);
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询所有5S提取数据的总条数
     * @时间: 2019/4/28 23:24
     * @参数:  * @param
     * @返回值: java.lang.Integer
     **/
    @Override
    public Integer findFiveSInspectLogqtCount() {
        return fiveSInspectMapper.findFiveSInspectLogqtCount();
    }
    /**
     * @作者: 老西儿
     * @功能描述: 查询所有5S提取数据
     * @时间: 2019/4/28 23:25
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.FiveSInspect>
     **/
    @Override
    public List<FiveSInspect> findFiveSInspectLogqt(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSInspectLogqt(fiveSInspect);
    }

    @Override
    public Integer showFiveSReadListCount(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.showFiveSReadListCount(fiveSInspect);
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
     * @功能描述:5S日志修改,根据用户名查询
     * @时间: 2019/4/23 23:57
     * @参数:  * @param fiveSInspect
     * @返回值: java.util.List<com.ds.fivesinspect.pojo.FiveSInspect>
     **/
    @Override
    public List<FiveSInspect> findFiveSLogByUserName(FiveSInspect fiveSInspect) {
        return fiveSInspectMapper.findFiveSLogByUserName(fiveSInspect);
    }

}

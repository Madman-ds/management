package com.ds.user.servcie.impl;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.DataBackupParam;
import com.ds.glzxj.mapper.GlzxjMappper;
import com.ds.glzxj.pojo.Glzxj;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.mapper.UserMappper;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @类名称: UserServiceImpl
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMappper userMappper;
    @Autowired
    private GlzxjMappper glzxjMappper;

    @Override
    public Integer getUserCount(User user) {
        return userMappper.getUserCount(user);
    }

    @Override
    public List<User> findAllUser(User user) {
        return userMappper.findAllUser(user);
    }

    @Override
    public User selectUserByWhere(User user) {
        return userMappper.selectUserByWhere(user);
    }

    @Override
    public int insertUser(User user) {
        return userMappper.insertUser(user);
    }

    @Override
    public int updUser(User user) {
        return userMappper.updUser(user);
    }

    @Override
    public void delAllUser(String ids) {
        userMappper.delAllUser(ids);
    }

    @Override
    public Integer getDataTiQu(User user) {
        return userMappper.getDataTiQu(user);
    }

    @Override
    public List<DataBackup> findDataTiQu(User user) {
        return userMappper.findDataTiQu(user);
    }

    @Override
    public int updateT(DataBackupParam dataBackupParam) {
        return userMappper.updateT(dataBackupParam);
    }

    @Override
    public int updateTs(DataBackupParam dataBackupParam) {
        return userMappper.updateTs(dataBackupParam);
    }

    @Override
    public List<User> findAll(User user) {
        return userMappper.findAll(user);
    }

    @Override
    public List<User> findAllbyids(String ids) {
        String[] split = ids.split(",");
        return userMappper.findAllbyids(split);
    }

    @Override
    @Transactional
    public void huanyuanUser(String ids) {
        userMappper.huanyuanUser(ids);
        glzxjMappper.huanyuanGLZById(ids);
    }

    @Override
    public void tiquUser(String ids) {
        userMappper.tiquUser(ids);
    }

    @Override
    public User queryTopByUserName(String glz_name) {
        return userMappper.queryTopByUserName(glz_name);
    }

    @Override
    public List<User> fuXieQuanXian(String[] ids) {
        return userMappper.fuXieQuanXian(ids);
    }

    @Override
    public User queryById(String userId) {
        return userMappper.queryById(userId);
    }

    @Override
    public void insertUserGlzxjUser(User user) {
        userMappper.insertUserGlzxjUser(user);
    }

    @Override
    public List<String> queryYFQX() {
        return userMappper.queryYFQX();
    }

    @Override
    public Integer findAllUserGlzxjCount() {
        return userMappper.findAllUserGlzxjCount();
    }

    @Override
    public List<User> findAllUserGlzxj() {
        return userMappper.findAllUserGlzxj();
    }

    @Override
    public void delUserGlzxj(String id) {
        userMappper.delUserGlzxj(id);
    }

    @Override
    public User queryByuserId(String user_id) {
        return userMappper.queryByuserId(user_id);
    }

    @Override
    public void updateFQuserGlzxj(Glzxj glzxj) {
        userMappper.updateFQuserGlzxj(glzxj);
    }

    @Override
    public List<User> queryByids(String[] split) {
        return userMappper.queryByids(split);
    }

    @Override
    public List getNotCurrentUserList(LoginUser loginUser) {
        return userMappper.getNotCurrentUserList(loginUser);
    }


}

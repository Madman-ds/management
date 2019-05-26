package com.ds.user.servcie.impl;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.DataBackupParam;
import com.ds.glzxj.mapper.GlzxjMapper;
import com.ds.glzxj.pojo.Glzxj;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.Tpm;
import com.ds.user.mapper.UserMapper;
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
    private UserMapper userMapper;
    @Autowired
    private GlzxjMapper glzxjMapper;

    @Override
    public Integer getUserCount(User user) {
        return userMapper.getUserCount(user);
    }

    @Override
    public List<User> findAllUser(User user) {
        return userMapper.findAllUser(user);
    }

    @Override
    public User selectUserByWhere(User user) {
        return userMapper.selectUserByWhere(user);
    }

    @Override
    public int insertUser(User user) {
        return userMapper.insertUser(user);
    }

    @Override
    public int updUser(User user) {
        return userMapper.updUser(user);
    }

    @Override
    public void delAllUser(String ids) {
        userMapper.delAllUser(ids);
    }

    @Override
    public Integer getDataTiQu(User user) {
        return userMapper.getDataTiQu(user);
    }

    @Override
    public List<DataBackup> findDataTiQu(User user) {
        return userMapper.findDataTiQu(user);
    }

    @Override
    public int updateT(DataBackupParam dataBackupParam) {
        return userMapper.updateT(dataBackupParam);
    }

    @Override
    public int updateTs(DataBackupParam dataBackupParam) {
        return userMapper.updateTs(dataBackupParam);
    }

    @Override
    public List<User> findAll(User user) {
        return userMapper.findAll(user);
    }

    @Override
    public List<User> findAllbyids(String ids) {
        String[] split = ids.split(",");
        return userMapper.findAllbyids(split);
    }

    @Override
    @Transactional
    public void huanyuanUser(String ids) {
        userMapper.huanyuanUser(ids);
        glzxjMapper.huanyuanGLZById(ids);
    }

    @Override
    public void tiquUser(String ids) {
        userMapper.tiquUser(ids);
    }

    @Override
    public User queryTopByUserName(String glz_name) {
        return userMapper.queryTopByUserName(glz_name);
    }

    @Override
    public List<User> fuXieQuanXian(String[] ids) {
        return userMapper.fuXieQuanXian(ids);
    }

    @Override
    public User queryById(String userId) {
        return userMapper.queryById(userId);
    }

    @Override
    public void insertUserGlzxjUser(User user) {
        userMapper.insertUserGlzxjUser(user);
    }

    @Override
    public List<String> queryYFQX() {
        return userMapper.queryYFQX();
    }

    @Override
    public Integer findAllUserGlzxjCount() {
        return userMapper.findAllUserGlzxjCount();
    }

    @Override
    public List<User> findAllUserGlzxj(User user) {
        return userMapper.findAllUserGlzxj(user);
    }

    @Override
    public void delUserGlzxj(String id) {
        userMapper.delUserGlzxj(id);
    }

    @Override
    public User queryByuserId(String user_id) {
        return userMapper.queryByuserId(user_id);
    }

    @Override
    public void updateFQuserGlzxj(Glzxj glzxj) {
        userMapper.updateFQuserGlzxj(glzxj);
    }

    @Override
    public List<User> queryByids(String[] split) {
        return userMapper.queryByids(split);
    }

    @Override
    public List getNotCurrentUserList(LoginUser loginUser) {
        return userMapper.getNotCurrentUserList(loginUser);
    }


}

package com.ds.user.servcie.impl;

import com.ds.databackup.pojo.DataBackup;
import com.ds.user.mapper.UserMappper;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public int getUserCount(Map<String, Object> map) {
        return userMappper.getUserCount(map);
    }

    @Override
    public List<DataBackup> findAllUser(Map<String, Object> map) {
        return userMappper.findAllUser(map);
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
}

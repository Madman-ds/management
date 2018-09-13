package com.ds.service.impl;

import com.ds.mapper.UserMapper;
import com.ds.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List findUser() {
        return userMapper.findUser();
    }
}

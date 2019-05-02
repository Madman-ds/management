package com.ds.glzxj.servcie.impl;

import com.ds.glzxj.mapper.GlzxjMappper;
import com.ds.glzxj.pojo.Glzxj;
import com.ds.glzxj.servcie.GlzxjService;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称: UserServiceImpl
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
@Service
public class GlzxjServiceImpl implements GlzxjService {
    @Autowired
    private GlzxjMappper glzxjMappper;

    @Override
    public Integer getGlzxjCount(Glzxj glzxj) {
        return glzxjMappper.getGlzxjCount(glzxj);
    }

    @Override
    public List<Glzxj> findAllGlzxj(Glzxj glzxj) {
        return glzxjMappper.findAllGlzxj(glzxj);
    }

    @Override
    public void delAllGlzxj(String ids) {
        String[] id = ids.split(",");
        glzxjMappper.delAllGlzxj(id);
    }

    @Override
    public int insertGlzxj(Glzxj glzxj) {
        return glzxjMappper.insertGlzxj(glzxj);
    }

    @Override
    public void huanyuanGLZ(String ids) {
        glzxjMappper.huanyuanGLZ(ids);
    }

    @Override
    public void tiquGLZ(String ids) {
        glzxjMappper.tiquGLZ(ids);
    }

    @Override
    public void updateFQ(Glzxj glzxj) {
        glzxjMappper.updateFQ(glzxj);
    }

    @Override
    public Integer getGlzxjTiCount(Glzxj glzxj) {
        return  glzxjMappper.getGlzxjTiCount(glzxj);
    }

    @Override
    public List<Glzxj> findAllTiGlzxj(Glzxj glzxj) {
        return  glzxjMappper.findAllTiGlzxj(glzxj);
    }

    @Override
    public Integer queryZjReadCount(LoginUser user,String[] name) {
        String user_nane = user.getUser_name();
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        return  glzxjMappper.queryZjReadCount(user_nane,name.toString(),user_id,offset,limit);
    }

    @Override
    public List<Glzxj> queryZjRead(LoginUser user,String[] name) {
        String user_nane = user.getUser_name();
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        return  glzxjMappper.queryZjRead(user_nane,name.toString(),user_id,offset,limit);
    }

    @Override
    public User queryQxByUserId(LoginUser user) {
        return glzxjMappper.queryQxByUserId(user);
    }

}

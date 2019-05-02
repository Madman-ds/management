package com.ds.glzxj.servcie;

import com.ds.glzxj.pojo.Glzxj;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;

import java.util.List;

/**
 * @接口名称: UserService
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
public interface GlzxjService {

    Integer getGlzxjCount(Glzxj glzxj);

    List<Glzxj> findAllGlzxj(Glzxj glzxj);

    void delAllGlzxj(String ids);

    int insertGlzxj(Glzxj glzxj);

    void huanyuanGLZ(String ids);

    void tiquGLZ(String ids);

    void updateFQ(Glzxj glzxj);

    Integer getGlzxjTiCount(Glzxj glzxj);

    List<Glzxj> findAllTiGlzxj(Glzxj glzxj);

    Integer queryZjReadCount(LoginUser user,String[] name);

    List<Glzxj> queryZjRead(LoginUser user,String[] name);

    User queryQxByUserId(LoginUser user);
}

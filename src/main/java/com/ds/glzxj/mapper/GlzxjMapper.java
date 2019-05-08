package com.ds.glzxj.mapper;

import com.ds.glzxj.pojo.Glzxj;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface GlzxjMapper {

    Integer getGlzxjCount(Glzxj glzxj);

    List<Glzxj> findAllGlzxj(Glzxj glzxj);

    void delAllGlzxj(String[] id);

    int insertGlzxj(Glzxj glzxj);

    void huanyuanGLZ(String ids);

    void tiquGLZ(String ids);

    void updateFQ(Glzxj glzxj);

    Integer getGlzxjTiCount(Glzxj glzxj);

    List<Glzxj> findAllTiGlzxj(Glzxj glzxj);

    void huanyuanGLZById(String ids);

    List<Glzxj> queryZjRead(@Param("user_name") String user_name,@Param("user_id") String user_id,
                            @Param("offset") Integer offset,@Param("limit") Integer limit);

    Integer queryZjReadCount(@Param("user_name") String user_name,@Param("user_id") String user_id,
                             @Param("offset") Integer offset,@Param("limit") Integer limit);

    User queryQxByUserId(LoginUser user);
}

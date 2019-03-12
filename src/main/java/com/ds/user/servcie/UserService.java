package com.ds.user.servcie;

import com.ds.databackup.pojo.DataBackup;
import com.ds.user.pojo.User;

import java.util.List;

/**
 * @接口名称: UserService
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
public interface UserService {
    Integer getUserCount(User user);

    List<User> findAllUser(User user);

    User selectUserByWhere(User user);

    int insertUser(User user);

    int updUser(User user);

    void delAllUser(String ids);

    Integer getDataTiQu(User user);

    List<DataBackup> findDataTiQu(User user);

    int updateT(Integer id, Integer type);
}

package com.ds.user.servcie;

import com.ds.databackup.pojo.DataBackup;
import com.ds.user.pojo.User;

import java.util.List;
import java.util.Map;

/**
 * @接口名称: UserService
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
public interface UserService {
    int getUserCount(Map<String, Object> map);

    List<DataBackup> findAllUser(Map<String, Object> map);

    User selectUserByWhere(User user);

    int insertUser(User user);

    int updUser(User user);

    void delAllUser(String ids);
}

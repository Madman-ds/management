package com.ds.user.mapper;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.DataBackupParam;
import com.ds.user.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface UserMappper {
    Integer getUserCount(User user);

    List<User> findAllUser(User user);

    User selectUserByWhere(User user);

    int insertUser(User user);

    int updUser(User user);

    void delAllUser(String ids);

    Integer getDataTiQu(User user);

    List<DataBackup> findDataTiQu(User user);

    int updateT(DataBackupParam dataBackupParam);

    int updateTs(DataBackupParam dataBackupParam);

    List getNotCurrentUserList(LoginUser loginUser);

    List<User> findAll();

    List<User> findAllbyids(String[] ids);

    void huanyuanUser(String ids);

    void tiquUser(String ids);

    User queryTopByUserName(String glz_name);
}

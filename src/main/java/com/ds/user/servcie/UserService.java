package com.ds.user.servcie;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.pojo.DataBackupParam;
import com.ds.glzxj.pojo.Glzxj;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.Tpm;
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

    int updateT(DataBackupParam dataBackupParam);

    int updateTs(DataBackupParam dataBackupParam);

    List<User> findAll(User user);

    List<User> findAllbyids(String ids);

    void huanyuanUser(String ids);

    void tiquUser(String ids);

    User queryTopByUserName(String glz_name);

    List<User> fuXieQuanXian(String[] ids);

    User queryById(String userId);

    void insertUserGlzxjUser(User user);

    List<String> queryYFQX();

    Integer findAllUserGlzxjCount();

    List<User> findAllUserGlzxj();

    void delUserGlzxj(String id);

    User queryByuserId(String user_id);

    void updateFQuserGlzxj(Glzxj glzxj);

    List<User> queryByids(String[] split);

    List getNotCurrentUserList(LoginUser loginUser);
}

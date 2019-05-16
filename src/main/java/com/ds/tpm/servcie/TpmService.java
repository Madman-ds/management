package com.ds.tpm.servcie;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.ReadTpm;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.pojo.TpmUser;
import com.ds.user.pojo.User;

import java.util.List;

/**
 * @接口名称: UserService
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
public interface TpmService {

    Integer getTpmCount(Tpm Tpm);

    List<Tpm> findAllTpm(Tpm Tpm);

    void delAllTpm(String ids);

    int insertTpm(Tpm Tpm);

    void huanyuanTpmUser(String ids);

    void tiquTpmUser(String ids);

    void updateFQ(Tpm Tpm);

    Integer getTpmTiCount(Tpm Tpm);

    List<Tpm> findAllTiTpm(Tpm Tpm);

    Integer queryZjReadCount(LoginUser user);

    List<Tpm> queryZjRead(LoginUser user);

    User queryQxByUserId(LoginUser user);

    Tpm queryByid(Tpm tpm);

    int updTpm(Tpm tpm);

    List<TpmUser> findtpmUser(TpmUser tpmUser);

    void addtpmUser(TpmUser tpmUser);

    List<TpmUser> showTpmUser(TpmUser tpmUser);

    void delTpmUser(String ids);

    List<Tpm> tpm1200List(LoginUser users);

    List<Tpm> tpm650List(LoginUser users);

    TpmUser queryTpmUserIsTQ(TpmUser tpmUser);

    void insert1200Tpm(Tpm addTpm);

    List<Tpm> findTpmByTpmName(Tpm tpm);

    Integer getTpmLogCount(Tpm tpm);

    List<Tpm> findAllTpmLog(Tpm tpm);

    void updateFQTpmUser(Tpm tpm);

    Integer topTpmListCount(Tpm tpm);

    List<Tpm> topTpmList(Tpm tpm);

    Integer zjRead1200TpmCount(List<Tpm> tpm,ReadTpm readTpm);

    List<Tpm> zjRead1200Tpm(List<Tpm> tpm,ReadTpm readTpm);

    Integer findDkTpmListCount(Tpm tpm);

    List<Tpm> findDkTpmList(Tpm tpm);

    Integer findDuTpmCount(Tpm tpm);

    List<Tpm> findDuTpmList(Tpm tpm);

    List<ReadTpm> findReadTpm(ReadTpm readTpm);

    void addReadTpm(ReadTpm readTpm);

    List<Tpm> showReadtpm(ReadTpm readTpm);

    void delReadtpm(String ids);

    List<Tpm> findReadtpms(ReadTpm readTpm);

    Tpm queryRepeat(Tpm tpm);
}

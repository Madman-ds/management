package com.ds.tpm.mapper;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.ReadTpm;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.pojo.TpmUser;
import com.ds.user.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface TpmMapper {

    Integer getTpmCount(Tpm Tpm);

    List<Tpm> findAllTpm(Tpm Tpm);

    void delAllTpm(String[] id);

    int insertTpm(Tpm Tpm);

    void huanyuanTpmUser(String ids);

    void tiquTpmUser(String ids);

    Tpm queryByid(Tpm tpm);

    int updTpm(Tpm tpm);

    List<TpmUser> findtpmUser(TpmUser tpmUser);

    void addtpmUser(TpmUser tpmUser);

    List<TpmUser> showTpmUser(TpmUser tpmUser);

    void huanyuanTpm(String ids);

    void delTpmUser(String ids);

    List<Tpm> tpm1200List(LoginUser users);

    List<Tpm> tpm650List(LoginUser users);

    TpmUser queryTpmUserIsTQ(TpmUser tpmUser);

    List<Tpm> findTpmByTpmName(Tpm tpm);

    void insert1200Tpm(Tpm addTpm);

    Integer getTpmLogCount(Tpm tpm);

    List<Tpm> findAllTpmLog(Tpm tpm);

    void updateFQTpmUser(Tpm tpm);

    Integer topTpmListCount(Tpm tpm);

    List<Tpm> topTpmList(Tpm tpm);

    Integer zjRead1200TpmCount(Map map);

    List<Tpm> zjRead1200Tpm(Map map);

    Integer findDuTpmCount(Tpm tpm);

    List<Tpm> findDuTpmList(Tpm tpm);

    List<ReadTpm> findReadTpm(ReadTpm readTpm);

    void addReadTpm(ReadTpm readTpm);

    List<Tpm> showReadtpm(ReadTpm readTpm);

    void delReadtpm(String ids);

    List<Tpm> findReadtpms(ReadTpm readTpm);

    Tpm queryRepeat(Tpm tpm);
}

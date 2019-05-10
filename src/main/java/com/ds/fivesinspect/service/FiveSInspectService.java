package com.ds.fivesinspect.service;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.ReadFives;
import com.ds.fivesinspect.pojo.UserFiveSInspect;
import com.ds.serverlogin.pojo.LoginUser;

import java.util.List;

/**
 * @类名称：FiveSInspectService
 * @作者: 老西儿
 * @创建时间: 2019/4/17 21:53
 * @说明:
 */
public interface FiveSInspectService {
    Integer findFiveSInspectCount();

    List<FiveSInspect> findFiveSInspect(FiveSInspect fiveSInspect);

    void addFiveSInspect(FiveSInspect fiveSInspect);

    Boolean delFiveSInspectAll(String ids);

    FiveSInspect findFiveSInspectById(FiveSInspect fiveSInspect);

    void upFiveSInspect(FiveSInspect fiveSInspec);

    void addUserFiveSInspect(UserFiveSInspect userFiveSInspect);

    void upIfextract(UserFiveSInspect userFiveSInspect);

    Boolean delUserFiveSInspect(String ufid);

    List showFiveSLogByUser(String userId);

    Integer findFiveSInspectLogCount();

    List<FiveSInspect> findFiveSInspectLog(FiveSInspect fiveSInspect);

    List<FiveSInspect> findFiveSLogByUserName(FiveSInspect fiveSInspect);

    List<UserFiveSInspect> findUserFiveSInspect(UserFiveSInspect userFiveSInspect);

    void addFiveSInspectLog(FiveSInspect fiveSInspect1);

    List showFiveSReadList(FiveSInspect fiveSInspect);

    List<ReadFives> findReadFive(ReadFives readFives);

    void insertReadFive(ReadFives readFives);

    List showHaveFiveSReadList(String userId);

    Boolean delFiveSRead(String rid);

    Integer ckFivesReadListCount(FiveSInspect fiveSInspect);

    List ckFivesReadList(FiveSInspect fiveSInspect);

    Integer findFiveSInspectLogqtCount();

    List<FiveSInspect> findFiveSInspectLogqt(FiveSInspect fiveSInspect);

    Integer showFiveSReadListCount(FiveSInspect fiveSInspect);
}

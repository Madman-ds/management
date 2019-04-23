package com.ds.fivesinspect.mapper;

import com.ds.fivesinspect.pojo.FiveSInspect;
import com.ds.fivesinspect.pojo.UserFiveSInspect;

import java.util.List;

/**
 * @类名称：FiveSInspectMapper
 * @作者: 老西儿
 * @创建时间: 2019/4/17 21:53
 * @说明:
 */
public interface FiveSInspectMapper {
    Integer findFiveSInspectCount();

    List<FiveSInspect> findFiveSInspect(FiveSInspect fiveSInspect);

    void addFiveSInspect(FiveSInspect fiveSInspect);

    void delFiveSInspectAll(String[] id);

    FiveSInspect findFiveSInspectById(FiveSInspect fiveSInspect);

    void upFiveSInspect(FiveSInspect fiveSInspec);

    void addUserFiveSInspect(UserFiveSInspect userFiveSInspect);

    List<UserFiveSInspect> showUserFiveSInspect(String userId);

    void upIfextract(UserFiveSInspect userFiveSInspect);

    void delUserFiveSInspect(String[] id);

    List showFiveSLogByUser(String userId);

    Integer findFiveSInspectLogCount();

    List<FiveSInspect> findFiveSInspectLog(FiveSInspect fiveSInspect);

    void upFiveSInspectLog(FiveSInspect fiveSInspect);

    List showfiveslog();

    List<FiveSInspect> findFiveSLogByUserName(FiveSInspect fiveSInspect);
}

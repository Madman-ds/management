package com.ds.weekPlan.mapper;

import com.ds.weekPlan.pojo.WeekPlan;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface WeekPlanMappper {
    Integer getWeekPlanCount(WeekPlan weekPlan);

    List<WeekPlan> findAllWeekPlan(WeekPlan weekPlan);

    int insertZhouJiHua(WeekPlan weekPlan);

    void delAllWeekPlan(String[] id);

    WeekPlan toUpdWeekPlan(WeekPlan week);

    int updWeekPlan(WeekPlan weekPlan);
//    Integer getUserCount(User user);
//
//    List<User> findAllUser(User user);
//
//    User selectUserByWhere(User user);
//
//    int insertUser(User user);
//
//    int updUser(User user);
//
//    void delAllUser(String ids);
//
//    Integer getDataTiQu(User user);
//
//    List<DataBackup> findDataTiQu(User user);
//
//    int updateT(DataBackupParam dataBackupParam);
//
//    int updateTs(DataBackupParam dataBackupParam);
}

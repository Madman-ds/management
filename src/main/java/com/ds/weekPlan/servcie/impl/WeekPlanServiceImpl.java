package com.ds.weekPlan.servcie.impl;

import com.ds.user.mapper.UserMappper;
import com.ds.weekPlan.mapper.WeekPlanMappper;
import com.ds.weekPlan.pojo.WeekPlan;
import com.ds.weekPlan.servcie.WeekPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @类名称: UserServiceImpl
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
@Service
public class WeekPlanServiceImpl implements WeekPlanService {
    @Autowired
    private WeekPlanMappper weekPlanMappper;

    @Override
    public Integer getWeekPlanCount(WeekPlan weekPlan) {
        return weekPlanMappper.getWeekPlanCount(weekPlan);
    }

    @Override
    public List<WeekPlan> findAllWeekPlan(WeekPlan weekPlan) {
        return weekPlanMappper.findAllWeekPlan(weekPlan);
    }

    @Override
    public int insertZhouJiHua(WeekPlan weekPlan) {
        return weekPlanMappper.insertZhouJiHua(weekPlan);
    }

    @Override
    public void delAllWeekPlan(String ids) {
        String[] id = ids.split(",");
        weekPlanMappper.delAllWeekPlan(id);
    }

    @Override
    public WeekPlan toUpdWeekPlan(WeekPlan week) {
        return  weekPlanMappper.toUpdWeekPlan(week);
    }

    @Override
    public int updWeekPlan(WeekPlan weekPlan) {
        return  weekPlanMappper.updWeekPlan(weekPlan);
    }

//    @Override
//    public Integer getUserCount(User user) {
//        return userMappper.getUserCount(user);
//    }
//
//    @Override
//    public List<User> findAllUser(User user) {
//        return userMappper.findAllUser(user);
//    }
//
//    @Override
//    public User selectUserByWhere(User user) {
//        return userMappper.selectUserByWhere(user);
//    }
//
//    @Override
//    public int insertUser(User user) {
//        return userMappper.insertUser(user);
//    }
//
//    @Override
//    public int updUser(User user) {
//        return userMappper.updUser(user);
//    }
//
//    @Override
//    public void delAllUser(String ids) {
//        userMappper.delAllUser(ids);
//    }
//
//    @Override
//    public Integer getDataTiQu(User user) {
//        return userMappper.getDataTiQu(user);
//    }
//
//    @Override
//    public List<DataBackup> findDataTiQu(User user) {
//        return userMappper.findDataTiQu(user);
//    }
//
//    @Override
//    public int updateT(DataBackupParam dataBackupParam) {
//        return userMappper.updateT(dataBackupParam);
//    }
//
//    @Override
//    public int updateTs(DataBackupParam dataBackupParam) {
//        return userMappper.updateTs(dataBackupParam);
//    }
}

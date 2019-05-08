package com.ds.weekPlan.mapper;

import com.ds.weekPlan.pojo.WeekPlan;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface WeekPlanMapper {
    Integer getWeekPlanCount(WeekPlan weekPlan);

    List<WeekPlan> findAllWeekPlan(WeekPlan weekPlan);

    int insertZhouJiHua(WeekPlan weekPlan);

    void delAllWeekPlan(String[] id);

    WeekPlan toUpdWeekPlan(WeekPlan week);

    int updWeekPlan(WeekPlan weekPlan);
}

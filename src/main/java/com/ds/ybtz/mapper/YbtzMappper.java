package com.ds.ybtz.mapper;

import com.ds.ybtz.pojo.Ybtz;

import java.util.List;

/**
 * @接口名称: UserMappper
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:38
 * @说明:
 */
public interface YbtzMappper {
    Integer getYbtzCount(Ybtz glzxj);

    List<Ybtz> findAllYbtz(Ybtz glzxj);

    void delAllYbtz(String[] id);

    int insertYbtz(Ybtz glzxj);

    Ybtz toUpdYbtz(Ybtz week);

    int updYbtz(Ybtz ybtz);
}

package com.ds.ybtz.servcie;

import com.ds.ybtz.pojo.Ybtz;

import java.util.List;

/**
 * @接口名称: UserService
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
public interface YbtzService {

    Integer getYbtzCount(Ybtz glzxj);

    void delAllYbtz(String ids);

    List<Ybtz> findAllYbtz(Ybtz ybtz);

    int insertYbtz(Ybtz ybtz);

    Ybtz toUpdYbtz(Ybtz week);

    int updYbtz(Ybtz ybtz);
}

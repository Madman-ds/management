package com.ds.ybtz.servcie.impl;

import com.ds.ybtz.mapper.YbtzMappper;
import com.ds.ybtz.pojo.Ybtz;
import com.ds.ybtz.servcie.YbtzService;
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
public class YbtzServiceImpl implements YbtzService {
    @Autowired
    private YbtzMappper ybtzMappper;

    @Override
    public Integer getYbtzCount(Ybtz glzxj) {
        return ybtzMappper.getYbtzCount(glzxj);
    }

    @Override
    public List<Ybtz> findAllYbtz(Ybtz glzxj) {
        return ybtzMappper.findAllYbtz(glzxj);
    }

    @Override
    public void delAllYbtz(String ids) {
        String[] id = ids.split(",");
        ybtzMappper.delAllYbtz(id);
    }

    @Override
    public int insertYbtz(Ybtz ybtz) {
        return ybtzMappper.insertYbtz(ybtz);
    }

    @Override
    public Ybtz toUpdYbtz(Ybtz week) {
        return ybtzMappper.toUpdYbtz(week);
    }

    @Override
    public int updYbtz(Ybtz ybtz) {
        return ybtzMappper.updYbtz(ybtz);
    }

}

package com.ds.tpm.servcie.impl;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.mapper.TpmMapper;
import com.ds.tpm.pojo.ReadTpm;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.pojo.TpmUser;
import com.ds.tpm.servcie.TpmService;
import com.ds.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @类名称: UserServiceImpl
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 14:37
 * @说明:
 */
@Service
public class TpmServiceImpl implements TpmService {
    @Autowired
    private TpmMapper TpmMapper;

    @Override
    public Integer getTpmCount(Tpm Tpm) {
        return TpmMapper.getTpmCount(Tpm);
    }

    @Override
    public List<Tpm> findAllTpm(Tpm Tpm) {
        return TpmMapper.findAllTpm(Tpm);
    }

    @Override
    public void delAllTpm(String ids) {
        String[] id = ids.split(",");
        TpmMapper.delAllTpm(id);
    }

    @Override
    public int insertTpm(Tpm Tpm) {
        return TpmMapper.insertTpm(Tpm);
    }

    @Override
    @Transactional
    public void huanyuanTpmUser(String ids) {
        TpmMapper.huanyuanTpmUser(ids);
        TpmMapper.huanyuanTpm(ids);
    }

    @Override
    public void tiquTpmUser(String ids) {
        TpmMapper.tiquTpmUser(ids);
    }

    @Override
    public void updateFQ(Tpm Tpm) {
        TpmMapper.updateFQ(Tpm);
    }

    @Override
    public Integer getTpmTiCount(Tpm Tpm) {
        return  TpmMapper.getTpmTiCount(Tpm);
    }

    @Override
    public List<Tpm> findAllTiTpm(Tpm Tpm) {
        return  TpmMapper.findAllTiTpm(Tpm);
    }

    @Override
    public Integer queryZjReadCount(LoginUser user) {
        String user_nane = user.getUser_name();
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        return  TpmMapper.queryZjReadCount(user_nane,user_id,offset,limit);
    }

    @Override
    public List<Tpm> queryZjRead(LoginUser user) {
        String user_nane = user.getUser_name();
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        return  TpmMapper.queryZjRead(user_nane,user_id,offset,limit);
    }

    @Override
    public User queryQxByUserId(LoginUser user) {
        return TpmMapper.queryQxByUserId(user);
    }

    @Override
    public Tpm queryByid(Tpm tpm) {
        return TpmMapper.queryByid(tpm);
    }

    @Override
    public int updTpm(Tpm tpm) {
        return TpmMapper.updTpm(tpm);
    }

    @Override
    public List<TpmUser> findtpmUser(TpmUser tpmUser) {
        return TpmMapper.findtpmUser(tpmUser);
    }

    @Override
    public void addtpmUser(TpmUser tpmUser) {
        TpmMapper.addtpmUser(tpmUser);
    }

    @Override
    public List<TpmUser> showTpmUser(TpmUser tpmUser) {
        return TpmMapper.showTpmUser(tpmUser);
    }

    @Override
    public void delTpmUser(String ids) {
        TpmMapper.delTpmUser(ids);
    }

    @Override
    public List<Tpm> tpm1200List(LoginUser users) {
        return TpmMapper.tpm1200List(users);
    }
    @Override
    public List<Tpm> tpm650List(LoginUser users) {
        return TpmMapper.tpm650List(users);
    }

    @Override
    public TpmUser queryTpmUserIsTQ(TpmUser tpmUser) {
        return TpmMapper.queryTpmUserIsTQ(tpmUser);
    }

    @Override
    public List<Tpm> findTpmByTpmName(Tpm tpm) {
        return TpmMapper.findTpmByTpmName(tpm);
    }

    @Override
    public Integer getTpmLogCount(Tpm tpm) {
        return TpmMapper.getTpmLogCount(tpm);
    }

    @Override
    public List<Tpm> findAllTpmLog(Tpm tpm) {
        return TpmMapper.findAllTpmLog(tpm);
    }

    @Override
    public void insert1200Tpm(Tpm addTpm) {
        TpmMapper.insert1200Tpm(addTpm);
    }

    @Override
    public void updateFQTpmUser(Tpm tpm) {
        TpmMapper.updateFQTpmUser(tpm);
    }

    @Override
    public Integer topTpmListCount(Tpm tpm) {
        return TpmMapper.topTpmListCount(tpm);
    }

    @Override
    public List<Tpm> topTpmList(Tpm tpm) {
        return TpmMapper.topTpmList(tpm);
    }

    @Override
    public Integer zjRead1200TpmCount(LoginUser user) {
        String user_nane = user.getUser_name();
        //user_id + "_" 区分like
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        Tpm t = TpmMapper.queryByTpm1200(user_id);
        t.setOffset(offset);
        t.setLimit(limit);
        return TpmMapper.zjRead1200TpmCount(t);
    }

    @Override
    public List<Tpm> zjRead1200Tpm(LoginUser user) {
        String user_nane = user.getUser_name();
        //user_id + "_" 区分like
        String user_id = user.getUser_kh();
        Integer offset = user.getOffset();
        Integer limit = user.getLimit();
        Tpm t = TpmMapper.queryByTpm1200(user_id);
        t.setOffset(offset);
        t.setLimit(limit);
        return TpmMapper.zjRead1200Tpm(t);
    }

    @Override
    public Integer findDkTpmListCount(Tpm tpm) {
        return TpmMapper.findDkTpmListCount(tpm);
    }

    @Override
    public List<Tpm> findDkTpmList(Tpm tpm) {
        return TpmMapper.findDkTpmList(tpm);
    }

    @Override
    public Integer findDuTpmCount(Tpm tpm) {
        return TpmMapper.findDuTpmCount(tpm);
    }

    @Override
    public List<Tpm> findDuTpmList(Tpm tpm) {
        return TpmMapper.findDuTpmList(tpm);
    }

    @Override
    public List<ReadTpm> findReadTpm(ReadTpm readTpm) {
        return TpmMapper.findReadTpm(readTpm);
    }

    @Override
    public void addReadTpm(ReadTpm readTpm) {
        TpmMapper.addReadTpm(readTpm);
    }

    @Override
    public List<ReadTpm> showReadtpm(ReadTpm readTpm) {
        return TpmMapper.showReadtpm(readTpm);
    }

    @Override
    public void delReadtpm(String ids) {
        TpmMapper.delReadtpm(ids);
    }


}

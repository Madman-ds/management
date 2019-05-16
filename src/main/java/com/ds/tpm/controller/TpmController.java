package com.ds.tpm.controller;

import com.ds.serverlogin.pojo.LoginUser;
import com.ds.tpm.pojo.ReadTpm;
import com.ds.tpm.pojo.Tpm;
import com.ds.tpm.pojo.TpmUser;
import com.ds.tpm.servcie.TpmService;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import com.ds.util.DateUtil;
import com.ds.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * TpmController
 * @时间: 2018/9/29 16:02
 * @author: 段大神经,YuBoYaKe
 * @version: 2.0
 **/
@RestController
public class TpmController {
    @Autowired
    private TpmService TpmService;
    @Autowired
    private UserService userService;
    /**
     * TPM
     * <p>M——查询tpm基础数据<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("findTpmList")
    public PageUtil findTpm(Tpm tpm){
        Integer count = TpmService.getTpmCount(tpm);
        List<Tpm> list = TpmService.findAllTpm(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * TPM
     * <p>添加TPM<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: int
     * @version: 2.0
     */
    @PostMapping("insertTpm")
    public int insertTpm(Tpm tpm){
        Tpm repeat = TpmService.queryRepeat(tpm);
        if(repeat!=null){
            return 2;
        }
        return TpmService.insertTpm(tpm);
    }

    /**
     * TPM
     * <p>修改TPM<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: int
     * @version: 2.0
     */
    @PostMapping("updTpm")
    public int updTpm(Tpm tpm){
        Tpm repeat = TpmService.queryRepeat(tpm);
        if(repeat!=null){
            return 2;
        }
        return TpmService.updTpm(tpm);
    }

    /**
     * TPM
     * <p>删除TPM<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         ids
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("delAllTpm")
    public void delAllTpm(HttpServletRequest request){
        String ids = request.getParameter("ids");
        TpmService.delAllTpm(ids);
    }

    /**
     * TPM
     * <p>tpm添加写权限<br>
     * @时间: 2018/9/29 16:02
     * @param ids
     * @param userId
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("insertTpmUser")
    public void insertTpmUser(String ids, String userId){
        String[] idss = ids.split(",");
        for (int i = 0;i < idss.length;i++){
            TpmUser tpmUser = new TpmUser();
            tpmUser.setTpm_id(Long.valueOf(idss[i]));
            tpmUser.setUser_id(Long.valueOf(userId));
            tpmUser.setTq("2");
            List<TpmUser> tpmUsers = TpmService.findtpmUser(tpmUser);
            if(tpmUsers.size() <= 0){
                TpmService.addtpmUser(tpmUser);
            }
        }
    }

    /**
     * TPM
     * <p>tpm添加读权限<br>
     * @时间: 2018/9/29 16:02
     * @param ids
     * @param userId
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("insertReadtpm")
    public void insertReadtpm(String ids, String userId){
        String[] idss = ids.split(",");
        for (int i = 0;i < idss.length;i++){
            ReadTpm readTpm = new ReadTpm();
            readTpm.setTpm_user_id(Long.valueOf(idss[i]));
            readTpm.setUser_id(Long.valueOf(userId));
            List<ReadTpm> tpmUsers = TpmService.findReadTpm(readTpm);
            if(tpmUsers.size() <= 0){
                TpmService.addReadTpm(readTpm);
            }
        }
    }

    /**
     * TPM
     * <p>根据用户id查询TPM读权限<br>
     * @时间: 2018/9/29 16:02
     * @param readTpm
     * @author: YuBoYaKe
     * @return: List<Tpm>
     * @version: 2.0
     */
    @GetMapping("findReadtpms")
    public List<Tpm> showReadsstpm(ReadTpm readTpm){
        List<Tpm> tpms = TpmService.findReadtpms(readTpm);
        return tpms;
    }

    /**
     * TPM
     * <p>根据用户id查询TPM写权限<br>
     * @时间: 2018/9/29 16:02
     * @param tpmUser
     * @author: YuBoYaKe
     * @return: List<TpmUser>
     * @version: 2.0
     */
    @GetMapping("showTpmUser")
    public List<TpmUser> showTpmUser(TpmUser tpmUser){
        List<TpmUser> tpmUsers = TpmService.showTpmUser(tpmUser);
        return tpmUsers;
    }


    /**
     * TPM
     * <p>还原<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("huanyuanTpmUser")
    public void huanyuanGLZ(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.huanyuanTpmUser(ids);
    }

    /**
     * TPM
     * <p>提取<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("tiquTpmUser")
    public void tiquTpmUser(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.tiquTpmUser(ids);
    }

    /**
     * TPM
     * <p>删除对TPM数据的写权限<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("delTpmUser")
    public void delTpmUser(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.delTpmUser(ids);
    }

    /**
     * TPM
     * <p>删除对TPM数据的读权限<br>
     * @时间: 2018/9/29 16:02
     * @param request
     *         id
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("delReadtpm")
    public void delReadtpm(HttpServletRequest request){
        String ids = request.getParameter("id");
        TpmService.delReadtpm(ids);
    }

    /**
     * TPM
     * <p>1200TPM打卡数据<br>
     * @时间: 2018/9/29 16:02
     * @param session
     * @author: YuBoYaKe
     * @return: List<Tpm>
     * @version: 2.0
     */
    @GetMapping("tpm1200List")
    public List<Tpm> tpm1200List(HttpSession session){
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        List<Tpm> tpm = TpmService.tpm1200List(users);
        return tpm;
    }

    /**
     * TPM
     * <p>650TPM打卡数据<br>
     * @时间: 2018/9/29 16:02
     * @param session
     * @author: YuBoYaKe
     * @return: List<Tpm>
     * @version: 2.0
     */
    @GetMapping("tpm650List")
    public List<Tpm> tpm650List(HttpSession session){
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        List<Tpm> tpm = TpmService.tpm650List(users);
        return tpm;
    }

    /**
     * TPM
     * <p>1200TPM打卡<br>
     * @时间: 2018/9/29 16:02
     * @param session
     * @author: YuBoYaKe
     * @return: int
     * @version: 2.0
     */
    @PostMapping("insert1200Tpm")
    public int insert1200Tpm(HttpSession session, HttpServletRequest request){
        LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
        String type = request.getParameter("tpm");
        Tpm tpm = new Tpm();
        tpm.setTpm_name(loginUser.getUser_name());
        tpm.setTpm_whbh(type);
        List<Tpm> list = TpmService.findTpmByTpmName(tpm);
        if (list != null && list.size() > 0){
            tpm = list.get(0);
            if (DateUtil.isSameDay(tpm.getDate_time(),new Date())){
                return 2;
            }
        }
        String numArr1 = request.getParameter("numArr1");
        String numArr2 = request.getParameter("numArr2");
        String numArr3 = request.getParameter("numArr3");
        String numArr4 = request.getParameter("numArr4");
        String numArr5 = request.getParameter("numArr5");
        String numArr6 = request.getParameter("numArr6");
        String numArr7 = request.getParameter("numArr7");
        String numArr8 = request.getParameter("numArr8");
        String[] s1 = numArr1.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        String[] s3 = numArr3.substring(1).replaceAll("]","").split(",");
        String[] s4 = numArr4.substring(1).replaceAll("]","").split(",");
        String[] s5 = numArr5.substring(1).replaceAll("]","").split(",");
        String[] s6 = numArr6.substring(1).replaceAll("]","").split(",");
        String[] s7 = numArr7.substring(1).replaceAll("]","").split(",");
        String[] s8 = numArr8.substring(1).replaceAll("]","").split(",");
        Tpm addTpm = null;
        for (int i = 0; i < s1.length; i++){
            addTpm = new Tpm();
            addTpm.setName(s8[i].substring(1, s1[i].length()-1));
            addTpm.setTpm_xh(s1[i].substring(1, s1[i].length()-1));
            addTpm.setTpm_bh(s2[i].substring(1, s2[i].length()-1));
            addTpm.setTpm_whbh(s3[i].substring(1, s3[i].length()-1));
            addTpm.setTpm_djxm(s4[i].substring(1, s4[i].length()-1));
            addTpm.setTpm_yq(s5[i].substring(1, s5[i].length()-1));
            addTpm.setTpm_is(s6[i].substring(1, s6[i].length()-1));
            addTpm.setTpm_name(loginUser.getUser_name());
            TpmUser tpmUser = new TpmUser();
            //根据tpm id 和 用户id锁定是否提取项
            tpmUser.setTpm_id(Long.valueOf(s7[i].substring(1, s7[i].length()-1)));
            tpmUser.setUser_id(loginUser.getUser_id());
            TpmUser tpms = TpmService.queryTpmUserIsTQ(tpmUser);
            if (tpms != null && tpms.getTq() != null){
                addTpm.setTpm_tq(tpms.getTq());
            }else{
                addTpm.setTpm_tq("2");
            }
            TpmService.insert1200Tpm(addTpm);
        }
        return 1;
    }

    /**
     * TPM
     * <p> M——读权限管理<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("findDuTpmList")
    public PageUtil findDuTpmList(Tpm tpm){
        Integer count = TpmService.findDuTpmCount(tpm);
        List<Tpm> list = TpmService.findDuTpmList(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * TPM
     * <p> M——查询日志<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("findTpmLogList")
    public PageUtil findTpmLogList(Tpm tpm){
        Integer count = TpmService.getTpmLogCount(tpm);
        List<Tpm> list = TpmService.findAllTpmLog(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * TPM
     * <p> TOP——查询TPM提取<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("topTpmList")
    public PageUtil topTpmList(Tpm tpm){
        Integer count = TpmService.topTpmListCount(tpm);
        List<Tpm> list = TpmService.topTpmList(tpm);
        PageUtil page = new PageUtil();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * TPM
     * <p> 用户赋查看权限给用户<br>
     * @时间: 2018/9/29 16:02
     * @param tpm
     * @author: YuBoYaKe
     * @return: void
     * @version: 2.0
     */
    @PostMapping("updateFQTpmUser")
    public void updateFQTpmUser(Tpm tpm){
        if(tpm.getQx()!=null && !"".equals(tpm.getQx())){
            String[] split = tpm.getQx().split(",");
            String ids = "";
            for (int i = 0; i < split.length; i++) {
                ids += ","+split[i]+"_";
            }
            tpm.setQx(ids.substring(1));
            TpmService.updateFQTpmUser(tpm);
        }else{
            TpmService.updateFQTpmUser(tpm);
        }
    }

    /**
     * TPM
     * <p> i——1200TPM——>个人查看<br>
     * @时间: 2018/9/29 16:02
     * @param readTpm
     * @param session
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("zjRead1200Tpm")
    public PageUtil zjRead1200Tpm(ReadTpm readTpm,HttpSession session){
        PageUtil page = new PageUtil();
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        readTpm.setUser_id(users.getUser_id());
        readTpm.setUser_name(users.getUser_name());
        readTpm.setTpm_whbh("1200TPM");
        //查看用户有多少写权限
        List<Tpm> tpm = TpmService.showReadtpm(readTpm);
        Integer count = TpmService.zjRead1200TpmCount(tpm,readTpm);
        List<Tpm> list = TpmService.zjRead1200Tpm(tpm,readTpm);
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

    /**
     * TPM
     * <p> i——650TPM——>个人查看<br>
     * @时间: 2018/9/29 16:02
     * @param readTpm
     * @param session
     * @author: YuBoYaKe
     * @return: com.ds.util.PageUtil
     * @version: 2.0
     */
    @GetMapping("zjRead650Tpm")
    public PageUtil zjRead650Tpm(ReadTpm readTpm,HttpSession session){
        PageUtil page = new PageUtil();
        LoginUser users = (LoginUser)session.getAttribute("loginUser");
        readTpm.setUser_id(users.getUser_id());
        readTpm.setUser_name(users.getUser_name());
        readTpm.setTpm_whbh("650TPM");
        //查看用户有多少写权限
        List<Tpm> tpm = TpmService.showReadtpm(readTpm);
        Integer count = TpmService.zjRead1200TpmCount(tpm,readTpm);
        List<Tpm> list = TpmService.zjRead1200Tpm(tpm,readTpm);
        page.setTotal(count);
        page.setRows(list);
        return page;
    }

}

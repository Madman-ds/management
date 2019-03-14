package com.ds.databackup.controller;

import com.ds.databackup.pojo.DataBackup;
import com.ds.databackup.service.DataBackupService;
import com.ds.inspectionitem.pojo.UserEquipment;
import com.ds.serverlogin.pojo.LoginUser;
import com.ds.user.pojo.User;
import com.ds.user.servcie.UserService;
import com.ds.util.ExcelDataBackup;
import com.ds.util.DateUtil;
import com.ds.util.ExportExcelUtil;
import com.ds.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import static com.ds.util.ExportExcelUtil.EXCEl_FILE_2007;

/**
 * @类名称：DataBackup
 * @作者: 段大神经
 * @创建时间: 2018/9/27 21:34
 * @说明: 数据备份控制类
 */
@RestController
public class DataBackupController {
    @Autowired
    private DataBackupService dataBackupService;

    @Autowired
    private UserService userService;
    /**
     * @作者: 段大神经
     * @功能描述: 提取或取消数据
     * @时间: 2018/12/1 14:16
     * @参数:  * @param top
     * @返回值: int
     **/
    @RequestMapping("updateTop")
    public int updateTop(DataBackup dataBackup){
        return dataBackupService.updateTop(dataBackup);
    }
    /**
     * @作者: 段大神经
     * @功能描述: 条件查询数据备份
     * @时间: 2018/9/28 21:04
     * @参数:  * @param dataBackup
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findDataBackup")
    public PageUtil findDataBackup(DataBackup dataBackup){
        Integer count = dataBackupService.getDataBackupCount(dataBackup);
        List<DataBackup> list = dataBackupService.findDataBackup(dataBackup);
        PageUtil page = new PageUtil();
        page.setRows(list);
        page.setTotal(count);
        return page;
    }
    /**
     * @作者: 段大神经
     * @功能描述: 查询抽取项
     * @时间: 2018/12/1 14:13
     * @参数:  * @param dataBackup
     * @返回值: com.ds.util.PageUtil
     **/
    @GetMapping("findDataBackupTop")
    public PageUtil findDataBackupTop(DataBackup dataBackup){
        dataBackup.setTop("1");
        Integer count = dataBackupService.getDataBackupCount(dataBackup);
        List<DataBackup> list = dataBackupService.findDataBackup(dataBackup);
        PageUtil page = new PageUtil();
        page.setRows(list);
        page.setTotal(count);
        return page;
    }
    /**
     * @作者: 段大神经
     * @功能描述: 添加数据备份记录
     * @时间: 2018/9/27 22:56
     * @参数:  * @param dataBackup
     * @返回值: int
     **/
    @PostMapping("insertDataBackup")
    public int insertDataBackup(HttpSession session, HttpServletRequest request){
        LoginUser loginUser = (LoginUser)session.getAttribute("loginUser");
        String user_name = loginUser.getUser_name();
        DataBackup dataBackup = new DataBackup();
        dataBackup.setUser_name(user_name);
        List<DataBackup> list = dataBackupService.findDataBackup(dataBackup);
        if (list != null && list.size() > 0){
            dataBackup = list.get(0);
            if (DateUtil.isSameDay(dataBackup.getQr_time(),new Date())){
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
        String numArr9 = request.getParameter("numArr9");
        String[] s1 = numArr1.substring(1).replaceAll("]","").split(",");
        String[] s2 = numArr2.substring(1).replaceAll("]","").split(",");
        String[] s3 = numArr3.substring(1).replaceAll("]","").split(",");
        String[] s4 = numArr4.substring(1).replaceAll("]","").split(",");
        String[] s5 = numArr5.substring(1).replaceAll("]","").split(",");
        String[] s6 = numArr6.substring(1).replaceAll("]","").split(",");
        String[] s7 = numArr7.substring(1).replaceAll("]","").split(",");
        String[] s8 = numArr8.substring(1).replaceAll("]","").split(",");
        String[] s9 = numArr9.substring(1).replaceAll("]","").split(",");
        DataBackup dataBackup1 = null;
        for (int i = 0; i < s1.length; i++){
            dataBackup1 = new DataBackup();
            dataBackup1.setSb_name(s1[i].substring(1, s1[i].length()-1));
            dataBackup1.setSb_number(s2[i].substring(1, s2[i].length()-1));
            dataBackup1.setSb_xh(s3[i].substring(1, s3[i].length()-1));
            dataBackup1.setJcx_name(s4[i].substring(1, s4[i].length()-1));
            dataBackup1.setJc_yq(s5[i].substring(1, s5[i].length()-1));
            System.err.println(s6[i].substring(1, s6[i].length()-1));
            dataBackup1.setJc_jg(Integer.valueOf(s6[i].substring(1, s6[i].length()-1)));
            dataBackup1.setUser_name(s7[i].substring(1, s7[i].length()-1));
            dataBackup1.setBz_nr(s8[i].substring(1, s8[i].length()-1));
            Long jcx_id = Long.valueOf(s9[i].substring(1, s9[i].length()-1));
            dataBackup1.setJcx_id(jcx_id);
            Long user_id = loginUser.getUser_id();
            UserEquipment userEquipment = dataBackupService.queryByUserequipment(jcx_id,user_id);
            if(userEquipment.getQx() == 1 && userEquipment.getTop()==2){
                dataBackup1.setTop("1");
            }else{
                dataBackup1.setTop("0");
            }
            dataBackupService.insertDataBackup(dataBackup1);
        }
        return 1;
    }

    /**
     * @作者: yuboyake
     * @功能描述: 导出设备信息
     * @时间: 2018/10/10 22:47
     * @参数:  * @param dataBackup
     * @param response
     * @返回值: void
     **/
    @GetMapping("ExportDataBackup")
    public void ExportDataBackup(DataBackup dataBackup,HttpServletResponse response) throws IOException {
        List<ExcelDataBackup> list = dataBackupService.findDataBackupExcel(dataBackup);
        for (ExcelDataBackup d : list){
            if ("1".equals(d.getJc_jg())){
                d.setJc_jg("异常");
            }else {
                d.setJc_jg("正常");
            }
        }
        if(list != null){
            ExportExcelUtil<ExcelDataBackup> export = new ExportExcelUtil<ExcelDataBackup>();
            String[] title = {"名称","编号","属性","检查项","检查要求","确认结果","确认人","确认时间","备注"};
            String fileName = DateUtil.dateToString(new Date(),"yyyyMMddHHmmss") +"shebei";
            export.exportExcel(fileName,"用户",title,list,response,EXCEl_FILE_2007);
        }
    }

    @GetMapping("findDataTiQu")
    public PageUtil findDataTiQu(User user){
        Integer count = userService.getDataTiQu(user);
        List<DataBackup> list = userService.findDataTiQu(user);
        PageUtil page = new PageUtil();
        page.setRows(list);
        page.setTotal(count);
        return page;
    }

    @GetMapping("updateT")
    @Transactional
    public int updateT(@RequestParam("id") Integer id,@RequestParam("type") Integer type){
        return userService.updateT(id,type);
    }

    @GetMapping("updateTs")
    @Transactional
    public int updateTs(@RequestParam("id") Integer id,@RequestParam("type") Integer type,@RequestParam("jcx_id") Integer jcx_id){
        int i = 0;
        if(type==1){
            userService.updateT(id,type);
            i = userService.updateTs(0, jcx_id);
        }else if (type==2){
            i = userService.updateT(id, type);
        }
        return i;
    }
}

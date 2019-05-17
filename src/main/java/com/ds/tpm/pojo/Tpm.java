package com.ds.tpm.pojo;

import com.ds.util.PageUtil;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @类名称: User
 * @作者: 段聪祺
 * @创建时间: 2018/9/29 15:08
 * @说明:
 */
@Data
public class Tpm extends PageUtil {
    /**
     * 主键
     */
    private Long id;

    /**
     * TPM名称
     */
    private String name;

    /**
     * 型号
     */
    private String tpm_xh;

    /**
     * 编号
     */
    private String tpm_bh;
    /**
     * 维护编号 1200TPM 650TPM
     */
    private String tpm_whbh;

    /**
     * 点检人
     */
    private String tpm_name;
    /**
     * 点检项目
     */
    private String tpm_djxm;
    /**
     * 数据/要求
     */
    private String tpm_yq;

    /**
     *  时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date_time;
    /**
     * 是否正常 1正常 2异常
     */
    private String tpm_is;

    /**
     * 提取项 1提取 2还原
     */
    private String tpm_tq;

    /**
     * 备注
     */
    private String remarks;

}

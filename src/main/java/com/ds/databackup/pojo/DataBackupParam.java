package com.ds.databackup.pojo;

import lombok.Data;

/**
 * @类名称：DataBackupParam
 * @作者: 段大神经
 * @创建时间: 2019/3/16 12:47
 * @说明:
 */
@Data
public class DataBackupParam {
    private Long id;
    private Integer type;
    private Long jcx_id;
    private String user_name;
}

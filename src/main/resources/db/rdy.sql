/*
 Navicat Premium Data Transfer

 Source Server         : rdy
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : rdy

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 16/05/2019 16:32:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for glzxj_user
-- ----------------------------
DROP TABLE IF EXISTS `glzxj_user`;
CREATE TABLE `glzxj_user`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '写权限用户',
  `tq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提取 1已提取 2未提取',
  `qx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户赋权',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理者巡检写权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_attributes
-- ----------------------------
DROP TABLE IF EXISTS `t_attributes`;
CREATE TABLE `t_attributes`  (
  `sx_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `sx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `sx_v` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `sb_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  PRIMARY KEY (`sx_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment`  (
  `sb_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sb_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `sb_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `sb_xh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  PRIMARY KEY (`sb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_fivesinspect
-- ----------------------------
DROP TABLE IF EXISTS `t_fivesinspect`;
CREATE TABLE `t_fivesinspect`  (
  `f_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `f_fives` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '5s',
  `f_clazzify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类',
  `f_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `f_userid` bigint(50) NULL DEFAULT NULL COMMENT '用户id',
  `f_inspectuser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查人',
  `f_inspectdate` datetime(0) NULL DEFAULT NULL COMMENT '检查时间',
  `f_ifmeet` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否满意',
  PRIMARY KEY (`f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_glzxj
-- ----------------------------
DROP TABLE IF EXISTS `t_glzxj`;
CREATE TABLE `t_glzxj`  (
  `glz_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `glz_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '巡检人（打卡人）',
  `glz_data` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `glz_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题数',
  `glz_tq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理者提取',
  PRIMARY KEY (`glz_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理者巡检表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_inspectionitem
-- ----------------------------
DROP TABLE IF EXISTS `t_inspectionitem`;
CREATE TABLE `t_inspectionitem`  (
  `jcx_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '检查项主键',
  `jcx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查项名称',
  `jcx_v` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查项值',
  `sb_id` bigint(20) NULL DEFAULT NULL COMMENT '设备id',
  PRIMARY KEY (`jcx_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_inspectionrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_inspectionrecord`;
CREATE TABLE `t_inspectionrecord`  (
  `xj_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '巡检id',
  `sb_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `sb_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `sb_xh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `jcx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查项',
  `jc_yq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查要求',
  `jc_jg` int(1) NULL DEFAULT NULL COMMENT '检查结果：1异常；0正常',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '确认人姓名',
  `top` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '提取项',
  `qr_time` datetime(0) NULL DEFAULT NULL COMMENT '确认时间',
  `bz_nr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注内容',
  `jcx_id` bigint(50) NULL DEFAULT NULL COMMENT '检查项id',
  PRIMARY KEY (`xj_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_readequipment
-- ----------------------------
DROP TABLE IF EXISTS `t_readequipment`;
CREATE TABLE `t_readequipment`  (
  `e_r_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '危险点读权限id',
  `ju_id` bigint(50) NOT NULL COMMENT '检查项用户关联id',
  `jcx_id` bigint(50) NOT NULL COMMENT '检查项id',
  `sb_id` bigint(50) NOT NULL COMMENT '设备id',
  `jcx_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检查项',
  `sb_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名',
  `sb_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备编号',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_id` bigint(50) NOT NULL COMMENT '当前登录人id(不与用户名对应)',
  PRIMARY KEY (`e_r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_readfive
-- ----------------------------
DROP TABLE IF EXISTS `t_readfive`;
CREATE TABLE `t_readfive`  (
  `r_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(50) NOT NULL COMMENT '用户id',
  `f_id` bigint(50) NOT NULL COMMENT '5S关联id',
  `u_f_id` bigint(50) NOT NULL COMMENT '5S写权限关联表id',
  `f_fives` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '5S',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检查人',
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_readtpm
-- ----------------------------
DROP TABLE IF EXISTS `t_readtpm`;
CREATE TABLE `t_readtpm`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(50) NULL DEFAULT NULL COMMENT '用户id',
  `tpm_user_id` bigint(50) NULL DEFAULT NULL COMMENT 'tpm写权限关联表id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'TPM读权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tpm
-- ----------------------------
DROP TABLE IF EXISTS `t_tpm`;
CREATE TABLE `t_tpm`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tpm名称',
  `tpm_xh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '型号',
  `tpm_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `tpm_whbh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护编号 1200TPM 650TPM',
  `tpm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点检人',
  `tpm_djxm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点检项目',
  `tpm_yq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据/要求',
  `date_time` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `tpm_is` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否正常 1正常 2异常 ',
  `tpm_tq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提取项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'TPM点检表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_kh` bigint(50) NULL DEFAULT NULL COMMENT '用户卡号',
  `is_management` int(1) NULL DEFAULT NULL COMMENT '是否为管理员1：是；0否',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_userequipment
-- ----------------------------
DROP TABLE IF EXISTS `t_userequipment`;
CREATE TABLE `t_userequipment`  (
  `ju_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '检查项用户关联主键',
  `jcx_id` bigint(50) NULL DEFAULT NULL COMMENT '检查项id',
  `user_id` bigint(50) NULL DEFAULT NULL COMMENT '用户id',
  `qx` int(1) NULL DEFAULT NULL COMMENT '权限：1写；0读',
  `top` int(1) NULL DEFAULT 1 COMMENT '1还原 2提取',
  PRIMARY KEY (`ju_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_userfivesinspect
-- ----------------------------
DROP TABLE IF EXISTS `t_userfivesinspect`;
CREATE TABLE `t_userfivesinspect`  (
  `u_f_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `f_id` bigint(50) NOT NULL COMMENT '5Sid',
  `user_id` bigint(50) NOT NULL COMMENT '用户id',
  `ifextract` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否提取',
  `f_fives` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '5S',
  PRIMARY KEY (`u_f_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_weekplan
-- ----------------------------
DROP TABLE IF EXISTS `t_weekplan`;
CREATE TABLE `t_weekplan`  (
  `z_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '周计划id',
  `z_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `z_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `z_one` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周一',
  `z_two` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周二',
  `z_three` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周三',
  `z_four` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周四',
  `z_five` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周五',
  `z_six` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周六',
  `z_sunday` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周日',
  `z_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `z_startdate` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  `z_enddate` datetime(0) NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`z_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '周计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_ybtz
-- ----------------------------
DROP TABLE IF EXISTS `t_ybtz`;
CREATE TABLE `t_ybtz`  (
  `ybtz_id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ybtz_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `ybtz_bh` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `ybtz_mpa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压力/mpa',
  `ybtz_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `ybtz_wz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '位置',
  `ybtz_date` datetime(0) NULL DEFAULT NULL COMMENT '下次校验时间',
  `ybtz_remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ybtz_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '仪表台账表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tpm_user
-- ----------------------------
DROP TABLE IF EXISTS `tpm_user`;
CREATE TABLE `tpm_user`  (
  `id` bigint(50) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tpm_id` bigint(50) NULL DEFAULT NULL COMMENT 'tpm主键',
  `user_id` bigint(50) NULL DEFAULT NULL COMMENT '用户id',
  `tq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否提取',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tpm写权限表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : BD
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : ruoyi

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 24/11/2021 16:26:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0 0 2 * * ? ', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.project.monitor.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200094C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707400037379737372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016C6B4C9DD878707400007070707400013174000C3020302032202A202A203F2074000CE8AEBEE5A487E8BF87E69C9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000374000965717569705461736B74000A72794E6F506172616D7374000074000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-HA3RS3J1637742248196', 1637742288400, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1637742250000, -1, 5, 'PAUSED', 'CRON', 1637742249000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1637742260000, -1, 5, 'PAUSED', 'CRON', 1637742251000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1637776800000, -1, 5, 'PAUSED', 'CRON', 1637742252000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2018-03-16 11:33:00', 'admin', '2021-08-31 15:06:09', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '技术监测室', 0, '龚剑', '15888888888', 'gongjian@lims.com', '0', '0', 'sys', '2019-08-01 18:00:00', 'sys', '2019-08-01 18:00:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '部门一', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-05-29 13:40:40', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 101, '0,100,101', '子部门1', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-05-29 13:40:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '停用状态');
INSERT INTO `sys_dict_data` VALUES (27, 1, '操作手册', '1', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (28, 2, '检定文件', '2', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (29, 10, '其他', '10', 'lims_equipBook_category', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (30, 1, '耗材规格一', '1', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (31, 2, '耗材规格二', '2', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (32, 3, '耗材规格三', '3', 'lims_consum_specification', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (33, 1, '在库', '1', 'lims_equip_state', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (34, 2, '借出', '2', 'lims_equip_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (35, 3, '维修', '3', 'lims_equip_state', '', 'info', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (36, 5, '占用', '5', 'lims_equip_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (37, 4, '检定', '4', 'lims_equip_state', '', 'success', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (38, 1, '合格', '1', 'lims_equip_tech_state', '', 'default', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (39, 2, '故障', '2', 'lims_equip_tech_state', '', 'danger', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (40, 3, '报废', '3', 'lims_equip_tech_state', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (41, 4, '过期', '4', 'lims_equip_tech_state', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (42, 1, '包', '1', 'lims_consum_unit', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (43, 2, '支', '2', 'lims_consum_unit', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (44, 1, '有效', '1', 'lims_sample_status', '', 'primary', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (45, 2, '过期', '2', 'lims_sample_status', '', 'warning', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (46, 3, '其他', '3', 'lims_sample_status', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (48, 1, '单位自购', '1', 'lims_equip_source', '', 'default', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (49, 2, '上级配发', '2', 'lims_equip_source', '', 'default', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (50, 1, '是', '1', 'lims_asset_judge', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (51, 2, '否', '0', 'lims_asset_judge', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (52, 1, '维修内容1', '1', 'lims_content_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (53, 2, '维修内容2', '2', 'lims_content_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (54, 1, '正常', '0', 'lims_template_status', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (55, 2, '关闭', '1', 'lims_template_status', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (57, 1, '综合报告', '1', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (58, 2, '振声报告', '2', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (59, 3, '油液报告', '3', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (60, 4, '无损报告', '4', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (61, 5, '电气报告', '5', 'lims_template_type', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (62, 1, '仅一次', '1', 'lims_msg_frequence', '', '', 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (63, 2, '每周', '2', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (64, 3, '每月', '3', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (65, 4, '每年', '4', 'lims_msg_frequence', '', '', 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', '');
INSERT INTO `sys_dict_data` VALUES (66, 1, '留存', '1', 'lims_report_kind', NULL, NULL, 'N', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (67, 2, '报签', '2', 'lims_report_kind', NULL, NULL, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (68, 1, '结论术语1', '1', 'lims_report_verdict', NULL, NULL, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);
INSERT INTO `sys_dict_data` VALUES (69, 2, '结论术语2', '2', 'lims_report_verdict', NULL, NULL, 'Y', '0', 'sys', '2019-08-07 16:54:24', 'sys', '2019-08-07 16:54:24', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (10, '设备分类', 'lims_equipBook_category', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '搜索设备分类');
INSERT INTO `sys_dict_type` VALUES (11, '耗材规格', 'lims_consum_specification', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '耗材规格');
INSERT INTO `sys_dict_type` VALUES (12, '设备状态', 'lims_equip_state', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '在库、借出、维修、检定');
INSERT INTO `sys_dict_type` VALUES (13, '设备技术状态', 'lims_equip_tech_state', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '合格、故障、报废、过期');
INSERT INTO `sys_dict_type` VALUES (14, '设备来源', 'lims_equip_source', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '上级配发、单位自购');
INSERT INTO `sys_dict_type` VALUES (15, '耗材计量单位', 'lims_consum_unit', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '包、支');
INSERT INTO `sys_dict_type` VALUES (16, '样品状态', 'lims_sample_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '有效、过期');
INSERT INTO `sys_dict_type` VALUES (17, '固定资产判断', 'lims_asset_judge', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '是否为固定资产');
INSERT INTO `sys_dict_type` VALUES (18, '维修内容', 'lims_content_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '维修内容');
INSERT INTO `sys_dict_type` VALUES (19, '模板状态', 'lims_template_status', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '模板状态');
INSERT INTO `sys_dict_type` VALUES (20, '模板类型', 'lims_template_type', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '模板类型');
INSERT INTO `sys_dict_type` VALUES (21, '消息频率', 'lims_msg_frequence', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '消息频率');
INSERT INTO `sys_dict_type` VALUES (22, '报告-留存/报签', 'lims_report_kind', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', '报告-留存/报签');
INSERT INTO `sys_dict_type` VALUES (23, '报告结论术语', 'lims_report_verdict', '0', 'sys', '2019-08-07 16:56:50', 'sys', '2019-08-07 16:56:50', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');
INSERT INTO `sys_job` VALUES (3, 'equipTask', '设备过期', 'ryNoParams', '', '0 0 2 * * ? ', '3', '1', '1', 'sys', '2019-08-07 16:57:59', 'sys', '2019-08-07 16:57:59', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-08-09 14:51:20');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-08-14 13:51:30');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-10-17 18:20:59');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-10-17 18:24:12');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-10-17 18:24:12');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-10-21 12:39:08');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-19 13:09:34');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-25 13:52:13');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-26 11:15:00');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-26 12:42:25');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-26 16:23:37');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 11:17:38');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 12:28:49');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2019-12-27 13:17:35');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 13:18:16');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:19:41');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:24:16');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:29:44');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:41:21');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:55:05');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 15:57:22');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 16:10:12');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 16:23:41');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 16:25:27');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-27 17:34:51');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-30 14:02:29');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2019-12-30 16:38:12');
INSERT INTO `sys_logininfor` VALUES (28, 'sa', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-09 11:00:58');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:01:00');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-09 11:01:10');
INSERT INTO `sys_logininfor` VALUES (31, 'sa', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:01:17');
INSERT INTO `sys_logininfor` VALUES (32, 'sa', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-09 11:01:22');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:01:23');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:35:29');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:36:21');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 11:37:10');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 13:44:20');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 13:50:38');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 13:56:48');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 14:17:52');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-09 14:33:58');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-13 12:54:09');
INSERT INTO `sys_logininfor` VALUES (43, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-13 13:55:54');
INSERT INTO `sys_logininfor` VALUES (44, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-13 13:59:10');
INSERT INTO `sys_logininfor` VALUES (45, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-13 14:00:38');
INSERT INTO `sys_logininfor` VALUES (46, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-15 15:56:24');
INSERT INTO `sys_logininfor` VALUES (47, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-15 16:01:07');
INSERT INTO `sys_logininfor` VALUES (48, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 11:47:11');
INSERT INTO `sys_logininfor` VALUES (49, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 13:35:02');
INSERT INTO `sys_logininfor` VALUES (50, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:38:45');
INSERT INTO `sys_logininfor` VALUES (51, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:38:59');
INSERT INTO `sys_logininfor` VALUES (52, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:40:52');
INSERT INTO `sys_logininfor` VALUES (53, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:41:06');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:42:41');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:42:54');
INSERT INTO `sys_logininfor` VALUES (56, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:44:45');
INSERT INTO `sys_logininfor` VALUES (57, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:44:58');
INSERT INTO `sys_logininfor` VALUES (58, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:46:37');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:46:54');
INSERT INTO `sys_logininfor` VALUES (60, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:47:59');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:48:11');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '退出成功', '2020-01-16 14:49:15');
INSERT INTO `sys_logininfor` VALUES (63, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 14:49:43');
INSERT INTO `sys_logininfor` VALUES (64, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 15:33:05');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 17:21:11');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 17:40:10');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 18:34:25');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-16 18:37:40');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 10:57:05');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 14:42:25');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:18:38');
INSERT INTO `sys_logininfor` VALUES (72, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:25:38');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:26:56');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:28:37');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:34:52');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 15:36:48');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 16:17:43');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-17 16:54:00');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-01-19 13:41:10');
INSERT INTO `sys_logininfor` VALUES (80, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-03-19 20:00:01');
INSERT INTO `sys_logininfor` VALUES (81, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-15 16:36:54');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 16:02:55');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 16:03:50');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 16:47:19');
INSERT INTO `sys_logininfor` VALUES (85, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 16:55:37');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 17:12:42');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 17:23:22');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 17:31:30');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-04-16 17:33:00');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 19:10:14');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 19:47:19');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:01:32');
INSERT INTO `sys_logininfor` VALUES (93, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:07:29');
INSERT INTO `sys_logininfor` VALUES (94, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:12:25');
INSERT INTO `sys_logininfor` VALUES (95, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:17:09');
INSERT INTO `sys_logininfor` VALUES (96, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:26:38');
INSERT INTO `sys_logininfor` VALUES (97, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:32:33');
INSERT INTO `sys_logininfor` VALUES (98, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-01 20:40:06');
INSERT INTO `sys_logininfor` VALUES (99, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 09:55:38');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:24:45');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:28:49');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:34:37');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:36:59');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:40:01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:43:46');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:45:00');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:49:11');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 10:53:47');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 11:45:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 11:48:10');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 11:51:04');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:01:37');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:05:42');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:20:00');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:29:27');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:30:41');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:36:22');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:54:48');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 15:59:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 16:41:09');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 17:00:26');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 17:09:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 17:23:59');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-03 17:26:18');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 18:53:49');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 19:03:34');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:02:28');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:19:18');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:20:06');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:24:44');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:30:16');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:38:05');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 21:43:33');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 22:34:32');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-06 22:42:59');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 17:31:13');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 18:15:21');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:11:30');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:22:51');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:25:02');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:29:12');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:30:23');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:39:47');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:41:10');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:44:22');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 19:56:35');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-07 20:14:30');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-19 19:41:14');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-27 17:39:09');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-27 19:29:30');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-27 20:11:39');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-27 20:14:30');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 20:24:50');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 20:55:54');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 21:34:27');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 21:36:05');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 21:37:47');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 22:12:22');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 22:45:12');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 22:49:29');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 22:51:05');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-28 22:56:23');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 08:37:05');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 10:07:11');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 10:33:36');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 10:51:50');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 11:00:23');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 11:03:41');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 11:22:34');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 12:23:59');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 12:38:20');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 13:02:06');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 13:11:58');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 13:14:37');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-05-29 13:20:07');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-06-10 13:07:14');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 15:24:12');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 15:54:15');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 16:03:16');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 16:54:17');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 16:58:13');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 17:10:59');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 17:59:03');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:04:26');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:07:44');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:12:06');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:17:34');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:45:06');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 7', '0', '登录成功', '2020-07-06 18:48:57');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-06 21:17:44');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-06 21:34:05');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-06 22:04:38');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-27 23:42:58');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-27 23:49:16');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-07-31 16:36:10');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-04 21:23:18');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-07 22:57:58');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-12 10:40:13');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-12 10:45:48');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 21:35:01');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-16 13:52:23');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-29 11:07:38');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 20:36:28');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:34:23');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:35:51');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:39:46');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:44:14');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:47:10');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:53:48');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 21:56:11');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:00:06');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:14:08');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:18:39');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:23:10');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:25:44');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:27:52');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:30:48');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:38:35');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:40:05');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:46:26');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-20 22:48:38');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-10-22 20:02:31');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 13:44:58');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 15:48:12');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 17:47:32');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 20:01:28');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 20:08:32');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-03 20:12:34');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 20:29:36');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-13 22:06:55');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 21:37:42');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 22:11:44');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 22:24:48');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 22:31:37');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 22:36:16');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 22:59:41');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-20 23:37:39');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-21 00:14:02');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-21 10:39:14');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-21 15:07:34');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-19 21:18:30');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-20 16:04:58');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 09:11:28');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 09:47:16');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 10:20:14');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 10:29:57');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 10:35:15');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 10:50:10');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 11:39:44');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 11:46:16');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 11:56:30');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:03:18');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 12:57:47');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-23 14:34:01');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 14:45:29');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 14:49:03');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 14:51:45');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 16:21:27');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 16:51:41');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-24 20:34:24');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 08:49:40');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 10:01:13');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 11:04:11');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 11:13:17');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 11:17:56');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 12:13:32');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 14:24:08');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 14:57:11');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-25 16:29:15');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-25 16:33:28');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 14:16:01');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 14:58:29');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-26 16:12:57');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 10:05:38');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 10:55:31');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 11:46:01');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 13:30:01');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 13:34:48');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 13:50:09');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:18:26');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 14:22:38');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:22:41');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-27 15:47:58');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 10:04:13');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 11:26:41');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 11:50:22');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 12:09:37');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 12:11:20');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 13:47:36');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 14:03:48');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 14:15:33');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 14:34:30');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 14:43:09');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 15:00:23');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 15:24:11');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 15:27:07');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-28 15:51:22');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-28 16:09:12');
INSERT INTO `sys_logininfor` VALUES (299, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 16:09:21');
INSERT INTO `sys_logininfor` VALUES (300, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-28 16:28:49');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-28 16:38:22');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-28 16:39:17');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 09:04:05');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 09:30:33');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 10:18:50');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 11:06:36');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-08-31 11:08:36');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 11:49:48');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:38:57');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:42:16');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 14:52:00');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-08-31 15:14:21');
INSERT INTO `sys_logininfor` VALUES (313, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 10:30:43');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 10:35:56');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 10:43:28');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 11:38:58');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 13:56:53');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 15:57:55');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-01 21:26:09');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 10:46:50');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-02 10:53:07');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 17:02:41');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 17:09:20');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 17:19:15');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-03 17:31:52');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-06 10:16:08');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-06 11:18:20');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-14 10:02:29');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-14 10:29:19');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-14 10:58:48');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-15 09:42:49');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-16 09:18:49');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-16 10:15:45');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 09:49:16');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 09:25:01');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 10:46:42');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 17:32:53');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-14 18:56:32');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 09:15:06');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 11:04:19');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 11:06:35');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 11:20:02');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 11:28:30');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-15 13:32:56');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 08:54:59');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 10:05:50');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 10:28:40');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 11:19:11');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 11:31:16');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-18 15:14:08');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 09:01:49');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-20 09:32:59');
INSERT INTO `sys_logininfor` VALUES (353, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 10:35:33');
INSERT INTO `sys_logininfor` VALUES (354, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-25 10:39:49');
INSERT INTO `sys_logininfor` VALUES (355, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-26 20:46:33');
INSERT INTO `sys_logininfor` VALUES (356, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 12:05:03');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 17:09:07');
INSERT INTO `sys_logininfor` VALUES (358, 'user', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-02 09:14:05');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-15 15:40:40');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 10:59:58');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 11:28:26');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 11:34:36');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 16:44:25');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 17:45:38');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-11-16 17:46:16');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 17:51:13');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 18:02:33');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 18:05:50');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-16 18:07:55');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 09:02:02');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 09:17:58');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 09:21:19');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 09:25:14');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 10:44:12');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 11:49:28');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 13:38:47');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 13:48:38');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 13:50:44');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:00:23');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:01:39');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:09:20');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:22:05');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:28:02');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:38:38');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 14:39:44');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 16:32:32');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:18:02');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:28:23');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:35:04');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:37:12');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:41:41');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-17 17:44:54');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-18 09:24:33');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 11:53:16');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-23 13:50:48');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-24 15:08:42');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-24 16:16:54');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-11-24 16:24:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2137 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, '#', 'menuItem', 'M', '0', '', 'fa fa-gear', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, '#', 'menuItem', 'M', '0', '', 'fa fa-video-camera', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, '#', 'menuItem', 'M', '0', '', 'fa fa-bars', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 3, '/system/user', 'menuItem', 'C', '0', 'system:user:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:16:46', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 4, '/system/role', 'menuItem', 'C', '0', 'system:role:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:20', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 6, '/system/menu', 'menuItem', 'C', '0', 'system:menu:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:50', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 2, '/system/dept', 'menuItem', 'C', '0', 'system:dept:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:15:23', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 7, '/system/dict', 'menuItem', 'C', '0', 'system:dict:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:23:59', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 8, '/system/config', 'menuItem', 'C', '0', 'system:config:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-26 11:24:07', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '制度公告', 1, 1, '/system/notice', 'menuItem', 'C', '0', 'system:notice:view', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-19 13:49:01', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1054, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1055, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1056, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (1057, '生成代码', 114, 2, '#', '', 'F', '0', 'tool:gen:code', '#', 'sys', '2019-08-07 16:59:17', 'sys', '2019-08-07 16:59:17', '');
INSERT INTO `sys_menu` VALUES (2005, '工作台', 0, 1, '#', 'menuItem', 'M', '0', '', 'fa fa-bank', 'sys', '2019-08-07 16:59:17', 'admin', '2019-12-27 16:41:29', '');
INSERT INTO `sys_menu` VALUES (2008, '预测优化', 2005, 4, '/html/lims_echart', 'menuItem', 'C', '0', '', '#', 'sys', '2019-08-07 16:59:17', 'admin', '2020-01-14 16:37:06', '');
INSERT INTO `sys_menu` VALUES (2105, '数据管理（旧）', 2005, 6, '/lims/recordData', 'menuItem', 'C', '1', 'lims:recordData:view', '#', 'admin', '2019-12-19 13:48:13', 'admin', '2021-11-16 16:54:30', '');
INSERT INTO `sys_menu` VALUES (2106, '工艺可视', 2005, 3, '/html/lims_gy2', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:49:43', 'admin', '2020-05-27 17:42:03', '');
INSERT INTO `sys_menu` VALUES (2108, '模型配置', 2005, 5, '/html/lims_trains', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:50:42', 'admin', '2020-03-19 21:38:17', '');
INSERT INTO `sys_menu` VALUES (2109, '数据报告', 2005, 7, '/html/lims_report1', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-19 13:51:26', 'admin', '2020-05-28 20:25:27', '');
INSERT INTO `sys_menu` VALUES (2110, '数据3D', 2005, 2, '/html/lims_data3dview', 'menuItem', 'C', '0', '', '#', 'admin', '2019-12-27 12:57:21', 'admin', '2020-01-09 11:38:47', '');
INSERT INTO `sys_menu` VALUES (2112, '数据查询', 2105, 1, '#', '', 'F', '0', 'lims:recordData:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2113, '数据新增', 2105, 2, '#', '', 'F', '0', 'lims:recordData:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2114, '数据修改', 2105, 3, '#', '', 'F', '0', 'lims:recordData:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2115, '数据删除', 2105, 4, '#', '', 'F', '0', 'lims:recordData:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2116, '数据导入', 2105, 5, '#', 'menuItem', 'F', '0', 'lims:recordData:import', '#', 'admin', '2019-12-27 15:55:39', 'admin', '2019-12-27 15:56:05', '');
INSERT INTO `sys_menu` VALUES (2117, '数据可视', 2005, 1, '/html/lims_dataview', 'menuItem', 'C', '0', '', '#', 'admin', '2020-03-19 20:18:27', 'admin', '2020-03-19 20:18:51', '');
INSERT INTO `sys_menu` VALUES (2118, '生产看板', 2005, 1, '/lims/produce', 'menuItem', 'C', '1', 'lims:produce:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-05-29 11:24:49', 'ssssd菜单');
INSERT INTO `sys_menu` VALUES (2119, '生产看板查询', 2118, 1, '#', '', 'F', '0', 'lims:produce:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2120, '生产看板新增', 2118, 2, '#', '', 'F', '0', 'lims:produce:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2121, '生产看板修改', 2118, 3, '#', '', 'F', '0', 'lims:produce:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2122, '生产看板删除', 2118, 4, '#', '', 'F', '0', 'lims:produce:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2123, '数据管理（二）', 2005, 8, '/lims/newworkModelData', 'menuItem', 'C', '1', 'lims:newworkModelData:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2021-11-16 16:55:00', '神经网络模型数据菜单');
INSERT INTO `sys_menu` VALUES (2124, '数据查询', 2123, 1, '#', '', 'F', '0', 'lims:newworkModelData:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2125, '数据新增', 2123, 2, '#', '', 'F', '0', 'lims:newworkModelData:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2126, '数据修改', 2123, 3, '#', '', 'F', '0', 'lims:newworkModelData:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2127, '数据删除', 2123, 4, '#', '', 'F', '0', 'lims:newworkModelData:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2129, '预测管理', 2005, 9, '/html/lims_echart1', 'menuItem', 'C', '0', NULL, '#', 'admin', '2021-10-13 10:04:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '数据管理', 2005, 6, '/lims/dataRecord', 'menuItem', 'C', '0', 'lims:dataRecord:view', '#', 'admin', '2021-11-16 16:54:16', 'admin', '2021-11-16 16:55:07', '');
INSERT INTO `sys_menu` VALUES (2132, '列表', 2131, 1, '#', 'menuItem', 'F', '0', 'lims:dataRecord:list', '#', 'admin', '2021-11-16 16:55:36', 'admin', '2021-11-16 16:55:51', '');
INSERT INTO `sys_menu` VALUES (2133, '新增', 2131, 2, '#', 'menuItem', 'F', '0', 'lims:dataRecord:add', '#', 'admin', '2021-11-16 16:56:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '修改', 2131, 3, '#', 'menuItem', 'F', '0', 'lims:dataRecord:edit', '#', 'admin', '2021-11-16 16:56:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '删除', 2131, 4, '#', 'menuItem', 'F', '0', 'lims:dataRecord:remove', '#', 'admin', '2021-11-16 16:56:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '导入', 2131, 5, '#', 'menuItem', 'F', '0', 'lims:dataRecord:import', '#', 'admin', '2021-11-16 16:57:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_msg_alarm
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_alarm`;
CREATE TABLE `sys_msg_alarm`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '消息内容',
  `frequence` int(1) DEFAULT NULL COMMENT '消息频率',
  `alarm_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提醒时间',
  `next_time` date DEFAULT NULL COMMENT '下次提醒日期',
  `status` int(1) DEFAULT NULL COMMENT '启用状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人员',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新人员',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '样品清单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `file_id` int(20) DEFAULT NULL COMMENT '附件',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"货柜管理\"],\"url\":[\"/html/lims_echart1\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-08-14 13:54:43');
INSERT INTO `sys_oper_log` VALUES (2, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-08-14 13:55:31');
INSERT INTO `sys_oper_log` VALUES (3, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2011', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-08-14 13:55:36');
INSERT INTO `sys_oper_log` VALUES (4, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,107,1035,1036,1037,1038,103,1016,1017,1018,1019,2008,2038,2039,2040,2041,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-10-17 19:15:49');
INSERT INTO `sys_oper_log` VALUES (5, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:48:13');
INSERT INTO `sys_oper_log` VALUES (6, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"实验室管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:48:45');
INSERT INTO `sys_oper_log` VALUES (7, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"107\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"制度公告\"],\"url\":[\"/system/notice\"],\"target\":[\"menuItem\"],\"perms\":[\"system:notice:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:49:01');
INSERT INTO `sys_oper_log` VALUES (8, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据可视化\"],\"url\":[\"https://www.echartsjs.com/examples/zh/editor.html?c=multiple-y-axis\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:49:43');
INSERT INTO `sys_oper_log` VALUES (9, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"预测模型配置\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:50:12');
INSERT INTO `sys_oper_log` VALUES (10, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2107', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-19 13:50:33');
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"预测模型配置\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:50:42');
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"预测模型配置\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:50:54');
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"报表演示\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"34\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:51:01');
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"报告生成管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:51:26');
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"报表演示\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:container:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-19 13:51:49');
INSERT INTO `sys_oper_log` VALUES (16, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2105,2008,2038,2039,2040,2041,2108,2109,1,100,1000,1001,1002,1003,1004,1005,1006,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-12-19 13:52:17');
INSERT INTO `sys_oper_log` VALUES (17, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"103\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"部门管理\"],\"url\":[\"/system/dept\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dept:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:15:23');
INSERT INTO `sys_oper_log` VALUES (18, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"100\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:16:46');
INSERT INTO `sys_oper_log` VALUES (19, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2038', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:19:11');
INSERT INTO `sys_oper_log` VALUES (20, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2105,2108,2109,1,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-12-26 11:19:57');
INSERT INTO `sys_oper_log` VALUES (21, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2038', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:20:01');
INSERT INTO `sys_oper_log` VALUES (22, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2039', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:20:07');
INSERT INTO `sys_oper_log` VALUES (23, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2108', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:20:11');
INSERT INTO `sys_oper_log` VALUES (24, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2040', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:20:15');
INSERT INTO `sys_oper_log` VALUES (25, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2041', '127.0.0.1', '内网IP', '{}', 0, NULL, '2019-12-26 11:20:20');
INSERT INTO `sys_oper_log` VALUES (26, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"报表演示\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:21:55');
INSERT INTO `sys_oper_log` VALUES (27, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2105,2008,2108,2109,1,107,1035,1036,1037,1038,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,102,1012,1013,1014,1015,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-12-26 11:22:36');
INSERT INTO `sys_oper_log` VALUES (28, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"24\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:23:06');
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"101\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:23:20');
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"102\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"菜单管理\"],\"url\":[\"/system/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:menu:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:23:33');
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"102\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"菜单管理\"],\"url\":[\"/system/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:menu:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:23:50');
INSERT INTO `sys_oper_log` VALUES (32, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"105\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"字典管理\"],\"url\":[\"/system/dict\"],\"target\":[\"menuItem\"],\"perms\":[\"system:dict:view\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:23:59');
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"106\"],\"parentId\":[\"1\"],\"menuType\":[\"C\"],\"menuName\":[\"参数设置\"],\"url\":[\"/system/config\"],\"target\":[\"menuItem\"],\"perms\":[\"system:config:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 11:24:07');
INSERT INTO `sys_oper_log` VALUES (34, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据展示\"],\"url\":[\"https://www.echartsjs.com/examples/zh/editor.html?c=multiple-y-axis\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:02:57');
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"预测报表\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:03:12');
INSERT INTO `sys_oper_log` VALUES (36, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:03:43');
INSERT INTO `sys_oper_log` VALUES (37, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型报表\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:03:53');
INSERT INTO `sys_oper_log` VALUES (38, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"报告生成\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:04:46');
INSERT INTO `sys_oper_log` VALUES (39, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"能力报告\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:06:39');
INSERT INTO `sys_oper_log` VALUES (40, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据展示\"],\"url\":[\"/html/lims_dataview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-26 14:38:59');
INSERT INTO `sys_oper_log` VALUES (41, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"能力报告\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:56:15');
INSERT INTO `sys_oper_log` VALUES (42, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:56:27');
INSERT INTO `sys_oper_log` VALUES (43, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型报表\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:56:36');
INSERT INTO `sys_oper_log` VALUES (44, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"34\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:56:43');
INSERT INTO `sys_oper_log` VALUES (45, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据3D\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:57:21');
INSERT INTO `sys_oper_log` VALUES (46, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2110\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据3D\"],\"url\":[\"/html/lims_data3dview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 12:57:34');
INSERT INTO `sys_oper_log` VALUES (47, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2008,2108,2109,2105,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-12-27 12:57:45');
INSERT INTO `sys_oper_log` VALUES (48, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_config\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 13:30:57');
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 14:18:51');
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"能力报告\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 14:21:32');
INSERT INTO `sys_oper_log` VALUES (51, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3\"]}', 0, NULL, '2019-12-27 15:11:07');
INSERT INTO `sys_oper_log` VALUES (52, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112\"]}', 0, NULL, '2019-12-27 15:13:41');
INSERT INTO `sys_oper_log` VALUES (53, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2105,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2019-12-27 15:19:51');
INSERT INTO `sys_oper_log` VALUES (54, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()', 1, 'admin', '技术监测室', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_record_data\"]}', 0, NULL, '2019-12-27 15:21:38');
INSERT INTO `sys_oper_log` VALUES (55, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 15:29:02');
INSERT INTO `sys_oper_log` VALUES (56, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 15:29:25');
INSERT INTO `sys_oper_log` VALUES (57, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2105,2112,2113,2114,2115,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2019-12-27 15:30:39');
INSERT INTO `sys_oper_log` VALUES (58, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2105\"],\"menuType\":[\"F\"],\"menuName\":[\"数据导入\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 15:55:39');
INSERT INTO `sys_oper_log` VALUES (59, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2116\"],\"parentId\":[\"2105\"],\"menuType\":[\"F\"],\"menuName\":[\"数据导入\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:import\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 15:56:05');
INSERT INTO `sys_oper_log` VALUES (60, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2106,2110,2105,2112,2113,2114,2115,2116,2008,2108,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2019-12-27 15:56:14');
INSERT INTO `sys_oper_log` VALUES (61, '仪器导入', 6, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', 1, 'admin', '技术监测室', '/lims/recordData/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 27 条数据格式不正确，错误如下：<br/>1、Days(Mon Jul 01 00:00:00 CST 20193) 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_record_data    ( days,    machine,    extruding_dryness,    centrifuge_speed,    screw_frequency,    water_temperature,    water_addition,    mixing_frequency,    liquid_beauty,    solid_content,    create_by,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value<br/>2、Days(Mon Jul 01 00:00:00 CST 20192) 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_record_data    ( days,    machine,    extruding_dryness,    centrifuge_speed,    screw_frequency,    water_temperature,    water_addition,    mixing_frequency,    liquid_beauty,    solid_content,    create_by,    create_time )           values ( ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value<br/>3、Days(Mon Jul 01 00:00:00 CST 20191) 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.lims.recordData.mapper.RecordDataMapper.insertRecordData-Inline\r\n### The', '2019-12-27 16:16:29');
INSERT INTO `sys_oper_log` VALUES (62, '仪器导入', 6, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', 1, 'admin', '技术监测室', '/lims/recordData/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 0, NULL, '2019-12-27 16:16:57');
INSERT INTO `sys_oper_log` VALUES (63, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"工作台\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"]}', 0, NULL, '2019-12-27 16:41:29');
INSERT INTO `sys_oper_log` VALUES (64, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据展示\"],\"url\":[\"/html/system_main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-08 17:08:59');
INSERT INTO `sys_oper_log` VALUES (65, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"工艺可视\"],\"url\":[\"/html/main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-08 17:09:45');
INSERT INTO `sys_oper_log` VALUES (66, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"工艺可视\"],\"url\":[\"/html/main\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:38:38');
INSERT INTO `sys_oper_log` VALUES (67, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2110\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据3D\"],\"url\":[\"/html/lims_data3dview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:38:47');
INSERT INTO `sys_oper_log` VALUES (68, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型报表\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:39:03');
INSERT INTO `sys_oper_log` VALUES (69, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型报表\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:39:11');
INSERT INTO `sys_oper_log` VALUES (70, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:39:20');
INSERT INTO `sys_oper_log` VALUES (71, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"能力报告\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:39:57');
INSERT INTO `sys_oper_log` VALUES (72, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_config\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-09 11:40:04');
INSERT INTO `sys_oper_log` VALUES (73, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2029', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-01-13 15:20:46');
INSERT INTO `sys_oper_log` VALUES (74, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '技术监测室', '/tool/gen/genCode/t_record_data', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-01-13 18:58:06');
INSERT INTO `sys_oper_log` VALUES (75, '工序数据', 2, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.editSave()', 1, 'admin', '技术监测室', '/lims/recordData/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"days\":[\"Tue Jul 09 00:00:00 CST 2019\"],\"machine\":[\"1\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"6360\"],\"water1Temperature\":[\"82.0\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"35.0\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"25\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"123\"],\"extruding1Dryness\":[\"32.98\"],\"extruding2Dryness\":[\"\"],\"liquidOutput\":[\"\"],\"mixingFrequency\":[\"187\"],\"liquidBeauty\":[\"7.0\"],\"solidContent\":[\"8.25\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-14 13:03:36');
INSERT INTO `sys_oper_log` VALUES (76, '工序数据', 2, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.editSave()', 1, 'admin', '技术监测室', '/lims/recordData/edit', '127.0.0.1', '内网IP', '{\"id\":[\"26\"],\"days\":[\"Tue Jul 09 00:00:00 CST 2019\"],\"machine\":[\"1\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"6360\"],\"water1Temperature\":[\"82.0\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"35.0\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"25\"],\"screw2Frequency\":[\"1\"],\"screw3Frequency\":[\"1\"],\"screw4Frequency\":[\"1\"],\"screw5Frequency\":[\"1\"],\"screw6Frequency\":[\"123\"],\"extruding1Dryness\":[\"32.98\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"187\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"7.0\"],\"solid1Content\":[\"8.25\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-14 14:37:16');
INSERT INTO `sys_oper_log` VALUES (77, '仪器导入', 6, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.importData()', 1, 'admin', '技术监测室', '/lims/recordData/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 0, NULL, '2020-01-14 16:05:07');
INSERT INTO `sys_oper_log` VALUES (78, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"预测优化\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-14 16:37:06');
INSERT INTO `sys_oper_log` VALUES (79, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据报告\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-14 17:11:02');
INSERT INTO `sys_oper_log` VALUES (80, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"工艺可视\"],\"url\":[\"/html/gy\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-14 17:38:09');
INSERT INTO `sys_oper_log` VALUES (81, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"工艺可视\"],\"url\":[\"/html/lims_gy\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-14 17:39:27');
INSERT INTO `sys_oper_log` VALUES (82, '工序数据', 1, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', 1, 'admin', '技术监测室', '/lims/recordData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2020-01-16\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-16 17:43:06');
INSERT INTO `sys_oper_log` VALUES (83, '工序数据', 1, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', 1, 'admin', '技术监测室', '/lims/recordData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2020-01-22\"],\"machine\":[\"q\"],\"feedingTime\":[\"1111\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-16 17:44:16');
INSERT INTO `sys_oper_log` VALUES (84, '工序数据', 1, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', 1, 'admin', '技术监测室', '/lims/recordData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2020-01-23\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-16 17:48:18');
INSERT INTO `sys_oper_log` VALUES (85, '工序数据', 1, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.addSave()', 1, 'admin', '技术监测室', '/lims/recordData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2020-01-29\"],\"machine\":[\"\"],\"feedingTime\":[\"\"],\"waterAddition\":[\"\"],\"water1Temperature\":[\"\"],\"water2Temperature\":[\"\"],\"extractTime\":[\"\"],\"centrifuge1Speed\":[\"\"],\"centrifuge2Speed\":[\"\"],\"centrifuge3Speed\":[\"\"],\"centrifuge4Speed\":[\"\"],\"centrifuge1Current\":[\"\"],\"centrifuge2Current\":[\"\"],\"centrifuge3Current\":[\"\"],\"centrifuge4Current\":[\"\"],\"extrusionTime\":[\"\"],\"slagDischargeTime\":[\"\"],\"screw1Frequency\":[\"\"],\"screw2Frequency\":[\"\"],\"screw3Frequency\":[\"\"],\"screw4Frequency\":[\"\"],\"screw5Frequency\":[\"\"],\"screw6Frequency\":[\"\"],\"extruding1Dryness\":[\"\"],\"extruding2Dryness\":[\"\"],\"mixingFrequency\":[\"\"],\"liquid1Output\":[\"\"],\"liquid1Beauty\":[\"\"],\"solid1Content\":[\"\"],\"liquid2Output\":[\"\"],\"liquid2Beauty\":[\"\"],\"solid2Content\":[\"\"],\"remark\":[\"\"]}', 0, NULL, '2020-01-16 17:49:06');
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-17 11:49:22');
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_train\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-17 15:20:31');
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_trains\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-01-17 15:28:52');
INSERT INTO `sys_oper_log` VALUES (89, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据可视\"],\"url\":[\"/html/lims_echart\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 20:18:27');
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2117\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据可视\"],\"url\":[\"/html/lims_dataview\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 20:18:51');
INSERT INTO `sys_oper_log` VALUES (91, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2020-03-19 20:19:17');
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2106\"],\"menuType\":[\"C\"],\"menuName\":[\"gongyi1\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 21:09:21');
INSERT INTO `sys_oper_log` VALUES (93, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,2118,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2020-03-19 21:13:21');
INSERT INTO `sys_oper_log` VALUES (94, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2118', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-03-19 21:37:41');
INSERT INTO `sys_oper_log` VALUES (95, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2110,2106,2008,2105,2112,2113,2114,2115,2116,2109,2108,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2020-03-19 21:37:50');
INSERT INTO `sys_oper_log` VALUES (96, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2118', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-03-19 21:37:57');
INSERT INTO `sys_oper_log` VALUES (97, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2108\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"模型配置\"],\"url\":[\"/html/lims_trains\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 21:38:17');
INSERT INTO `sys_oper_log` VALUES (98, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据报告\"],\"url\":[\"/html/lims_report\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 21:38:27');
INSERT INTO `sys_oper_log` VALUES (99, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-03-19 21:38:38');
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2106\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"工艺可视\"],\"url\":[\"/html/lims_gy2\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-05-27 17:42:04');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2109\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据报告\"],\"url\":[\"/html/lims_report1\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"7\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2020-05-28 20:25:27');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '技术监测室', '/tool/gen/genCode/t_produce', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-05-28 22:06:00');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '技术监测室', '/tool/gen/genCode/t_produce', '127.0.0.1', '内网IP', '{}', 0, NULL, '2020-05-28 22:06:01');
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2020-05-28 22:19:06');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2118\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"生产看板\"],\"url\":[\"/lims/produce\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:produce:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', 0, NULL, '2020-05-29 11:24:49');
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'admin', '技术监测室', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"部门一\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2020-05-29 13:40:40');
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 1, 'com.ruoyi.project.system.dept.controller.DeptController.addSave()', 1, 'admin', '技术监测室', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"101\"],\"deptName\":[\"子部门1\"],\"orderNum\":[\"1\"],\"leader\":[\"\"],\"phone\":[\"\"],\"status\":[\"0\"]}', 0, NULL, '2020-05-29 13:40:52');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '技术监测室', '/tool/gen/genCode/t_newwork_model_data', '127.0.0.1', '内网IP', '{}', 0, NULL, '2021-08-23 10:00:04');
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '技术监测室', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', 0, NULL, '2021-08-23 10:27:46');
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,2123,2124,2125,2126,2127,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2021-08-23 10:28:04');
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '技术监测室', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"4\"],\"deptIds\":[\"\"]}', 0, NULL, '2021-08-23 10:28:13');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.project.tool.gen.controller.GenController.genCode()', 1, 'admin', '技术监测室', '/tool/gen/genCode/t_newwork_model_data', '127.0.0.1', '内网IP', '{}', 0, NULL, '2021-08-23 11:41:39');
INSERT INTO `sys_oper_log` VALUES (113, '神经网络模型数据', 1, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2021-08-27  02:08\"],\"water\":[\"1\"],\"electric\":[\"1\"],\"gas\":[\"1\"],\"yield\":[\"1\"],\"speed\":[\"1\"],\"temperature\":[\"1\"],\"humidity\":[\"1\"],\"oven\":[\"1\"],\"hotair\":[\"1\"],\"low\":[\"1\"],\"hight\":[\"1\"],\"centrifuge\":[\"1\"]}', 0, NULL, '2021-08-23 14:16:03');
INSERT INTO `sys_oper_log` VALUES (114, '神经网络模型数据', 3, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.remove()', 1, 'admin', '技术监测室', '/lims/newworkModelData/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', 0, NULL, '2021-08-23 14:16:43');
INSERT INTO `sys_oper_log` VALUES (115, '神经网络模型数据', 1, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2021-08-23  02:08\"],\"water\":[\"1\"],\"electric\":[\"1\"],\"gas\":[\"1\"],\"yield\":[\"1\"],\"speed\":[\"1\"],\"temperature\":[\"1\"],\"humidity\":[\"1\"],\"oven\":[\"1\"],\"hotair\":[\"1\"],\"low\":[\"1\"],\"hight\":[\"1\"],\"centrifuge\":[\"1\"]}', 0, NULL, '2021-08-23 14:31:26');
INSERT INTO `sys_oper_log` VALUES (116, '神经网络模型数据', 1, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.addSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/add', '127.0.0.1', '内网IP', '{\"days\":[\"2021-08-24  02:08\"],\"water\":[\"2\"],\"electric\":[\"2\"],\"gas\":[\"2\"],\"yield\":[\"2\"],\"speed\":[\"2\"],\"temperature\":[\"2\"],\"humidity\":[\"2\"],\"oven\":[\"2\"],\"hotair\":[\"2\"],\"low\":[\"2\"],\"hight\":[\"2\"],\"centrifuge\":[\"2\"]}', 0, NULL, '2021-08-23 14:34:33');
INSERT INTO `sys_oper_log` VALUES (117, '工序数据', 3, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.remove()', 1, 'admin', '技术监测室', '/lims/recordData/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"41\"]}', 0, NULL, '2021-08-23 14:38:24');
INSERT INTO `sys_oper_log` VALUES (118, '工序数据', 3, 'com.ruoyi.project.lims.recordData.controller.RecordDataController.remove()', 1, 'admin', '技术监测室', '/lims/recordData/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"40\"]}', 0, NULL, '2021-08-23 14:39:41');
INSERT INTO `sys_oper_log` VALUES (119, '神经网络模型数据', 2, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"days\":[\"Fri Jan 15 00:00:00 CST 2021\"],\"water\":[\"11161\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.0\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', 0, NULL, '2021-08-23 14:59:58');
INSERT INTO `sys_oper_log` VALUES (120, '神经网络模型数据', 2, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"days\":[\"Fri Jan 15 00:00:00 CST 2021\"],\"water\":[\"11162\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.0\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', 0, NULL, '2021-08-23 15:00:09');
INSERT INTO `sys_oper_log` VALUES (121, '神经网络模型数据', 2, 'com.ruoyi.project.lims.newworkModelData.controller.NewworkModelDataController.editSave()', 1, 'admin', '技术监测室', '/lims/newworkModelData/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"days\":[\"2021-01-15 12:01\"],\"water\":[\"11162\"],\"electric\":[\"14937\"],\"gas\":[\"5615\"],\"yield\":[\"0.0\"],\"speed\":[\"0\"],\"temperature\":[\"10\"],\"humidity\":[\"48\"],\"oven\":[\"3453.0\"],\"hotair\":[\"1352.00\"],\"low\":[\"2256.0\"],\"hight\":[\"2532.0\"],\"centrifuge\":[\"35.0\"]}', 0, NULL, '2021-08-23 15:28:41');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 1, 'com.ruoyi.project.system.role.controller.RoleController.addSave()', 1, 'admin', '技术监测室', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"操作人员\"],\"roleKey\":[\"operate\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2123,2124,2125,2126,2127,1,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', 0, NULL, '2021-08-28 16:00:39');
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.authDataScopeSave()', 1, 'admin', '技术监测室', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', 0, NULL, '2021-08-28 16:00:57');
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 1, 'com.ruoyi.project.system.user.controller.UserController.addSave()', 1, 'admin', '技术监测室', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"manager\"],\"deptName\":[\"部门一\"],\"phonenumber\":[\"1387100000\"],\"sex\":[\"0\"],\"loginName\":[\"user\"],\"password\":[\"user123\"],\"role\":[\"4\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"\"]}', 0, NULL, '2021-08-28 16:03:43');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 2, 'com.ruoyi.project.system.user.controller.UserController.editSave()', 1, 'admin', '技术监测室', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"101\"],\"userName\":[\"user\"],\"dept.deptName\":[\"部门一\"],\"phonenumber\":[\"1387100000\"],\"sex\":[\"0\"],\"loginName\":[\"user\"],\"role\":[\"4\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"\"]}', 0, NULL, '2021-08-28 16:04:14');
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 2, 'com.ruoyi.project.system.config.controller.ConfigController.editSave()', 1, 'admin', '技术监测室', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-green\"],\"configType\":[\"Y\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', 0, NULL, '2021-08-31 15:06:09');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"预测管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-10-13 10:02:40');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2128', '127.0.0.1', '内网IP', '{}', 0, NULL, '2021-10-13 10:03:07');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"预测管理\"],\"url\":[\"/html/lims_echart1\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"9\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-10-13 10:04:45');
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,2123,2124,2125,2126,2127,2129,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,114,1056,1057\"]}', 0, NULL, '2021-10-13 10:10:03');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"操作人员\"],\"roleKey\":[\"operate\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2005,2123,2124,2125,2126,2127,2129,1,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,108,500,1039,1040,1041,1042,501,1043,1044,1045\"]}', 0, NULL, '2021-10-15 09:17:01');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2109,2123,2124,2125,2126,2127,2129,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057\"]}', 0, NULL, '2021-10-15 13:59:17');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', 0, NULL, '2021-11-16 16:51:47');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/dataRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:52:57');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 3, 'com.ruoyi.project.system.menu.controller.MenuController.remove()', 1, 'admin', '技术监测室', '/system/menu/remove/2130', '127.0.0.1', '内网IP', '{}', 0, NULL, '2021-11-16 16:53:48');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理新\"],\"url\":[\"/lims/dataRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:view\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:54:16');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2105\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理（旧）\"],\"url\":[\"/lims/recordData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:recordData:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', 0, NULL, '2021-11-16 16:54:30');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2123\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理（二）\"],\"url\":[\"/lims/newworkModelData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:newworkModelData:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:54:54');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2123\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理（二）\"],\"url\":[\"/lims/newworkModelData\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:newworkModelData:view\"],\"orderNum\":[\"8\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', 0, NULL, '2021-11-16 16:55:00');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2131\"],\"parentId\":[\"2005\"],\"menuType\":[\"C\"],\"menuName\":[\"数据管理\"],\"url\":[\"/lims/dataRecord\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:view\"],\"orderNum\":[\"6\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:55:07');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:add\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:55:36');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 2, 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', 1, 'admin', '技术监测室', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2132\"],\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"列表\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:55:51');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"新增\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:56:21');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"修改\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:56:35');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:56:52');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 1, 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', 1, 'admin', '技术监测室', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2131\"],\"menuType\":[\"F\"],\"menuName\":[\"导入\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"lims:dataRecord:import\"],\"orderNum\":[\"5\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', 0, NULL, '2021-11-16 16:57:11');
INSERT INTO `sys_oper_log` VALUES (147, '角色管理', 2, 'com.ruoyi.project.system.role.controller.RoleController.editSave()', 1, 'admin', '技术监测室', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"系统管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"系统管理员\"],\"menuIds\":[\"2005,2117,2118,2119,2120,2121,2122,2110,2106,2008,2108,2105,2112,2113,2114,2115,2116,2131,2132,2133,2134,2135,2136,2109,2123,2124,2125,2126,2127,2129,1,107,1035,1036,1037,1038,103,1016,1017,1018,1019,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,104,1020,1021,1022,1023,1024,102,1012,1013,1014,1015,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,108,500,1039,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,1055,111,112,3,113,114,1056,1057\"]}', 0, NULL, '2021-11-16 17:46:13');
INSERT INTO `sys_oper_log` VALUES (148, '数据管理', 1, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.addSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/add', '127.0.0.1', '内网IP', '{\"zDate\":[\"2021-11-17\"],\"zTime\":[\"12:11\"],\"zRation\":[\"1\"],\"zWater\":[\"2\"],\"zWd\":[\"3\"],\"zViscosity\":[\"4\"],\"zDegrees\":[\"5\"],\"zLevel\":[\"6\"],\"zSpeed\":[\"7\"],\"zDrive\":[\"8\"],\"zOperation\":[\"9\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 09:16:07');
INSERT INTO `sys_oper_log` VALUES (149, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:36');
INSERT INTO `sys_oper_log` VALUES (150, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:41');
INSERT INTO `sys_oper_log` VALUES (151, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:45');
INSERT INTO `sys_oper_log` VALUES (152, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:48');
INSERT INTO `sys_oper_log` VALUES (153, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:55');
INSERT INTO `sys_oper_log` VALUES (154, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:28:58');
INSERT INTO `sys_oper_log` VALUES (155, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:29:05');
INSERT INTO `sys_oper_log` VALUES (156, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.9\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:29:19');
INSERT INTO `sys_oper_log` VALUES (157, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.9\"],\"zBeating\":[\"101\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:29:23');
INSERT INTO `sys_oper_log` VALUES (158, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.9\"],\"zBeating\":[\"101\"],\"zWeight\":[\"111\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:29:26');
INSERT INTO `sys_oper_log` VALUES (159, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.9\"],\"zBeating\":[\"101\"],\"zWeight\":[\"111\"],\"zCoating\":[\"12.1\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:29:29');
INSERT INTO `sys_oper_log` VALUES (160, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"86\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.2\"],\"zWd\":[\"3.3\"],\"zViscosity\":[\"4.4\"],\"zDegrees\":[\"5.5\"],\"zLevel\":[\"6.6\"],\"zSpeed\":[\"7.7\"],\"zDrive\":[\"8.8\"],\"zOperation\":[\"9.9\"],\"zBeating\":[\"101\"],\"zWeight\":[\"111\"],\"zCoating\":[\"12.1\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 10:30:34');
INSERT INTO `sys_oper_log` VALUES (161, '数据管理', 3, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.remove()', 1, 'admin', '技术监测室', '/lims/dataRecord/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"86\"]}', 0, NULL, '2021-11-17 10:39:17');
INSERT INTO `sys_oper_log` VALUES (162, '数据管理', 1, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.addSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/add', '127.0.0.1', '内网IP', '{\"zDate\":[\"2021-11-17\"],\"zTime\":[\"10:11\"],\"zRation\":[\"1\"],\"zWater\":[\"2\"],\"zWd\":[\"3\"],\"zViscosity\":[\"4\"],\"zDegrees\":[\"5\"],\"zLevel\":[\"6\"],\"zSpeed\":[\"7\"],\"zDrive\":[\"8\"],\"zOperation\":[\"9\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12\"],\"remark\":[\"13\"]}', 0, NULL, '2021-11-17 10:40:10');
INSERT INTO `sys_oper_log` VALUES (163, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"87\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"10:11:56\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"13\"]}', 0, NULL, '2021-11-17 11:50:06');
INSERT INTO `sys_oper_log` VALUES (164, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"87\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"11:11:14\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"13\"]}', 0, NULL, '2021-11-17 11:51:28');
INSERT INTO `sys_oper_log` VALUES (165, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"87\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"11:55\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"13\"]}', 0, NULL, '2021-11-17 11:57:49');
INSERT INTO `sys_oper_log` VALUES (166, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"87\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"11:55\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"13\"]}', 0, NULL, '2021-11-17 11:58:25');
INSERT INTO `sys_oper_log` VALUES (167, '数据管理', 1, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.addSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/add', '127.0.0.1', '内网IP', '{\"zDate\":[\"2021-11-17\"],\"zTime\":[\"13:20\"],\"zRation\":[\"1\"],\"zWater\":[\"2\"],\"zWd\":[\"3\"],\"zViscosity\":[\"4\"],\"zDegrees\":[\"5\"],\"zLevel\":[\"6\"],\"zSpeed\":[\"7\"],\"zDrive\":[\"8\"],\"zOperation\":[\"9\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:41:49');
INSERT INTO `sys_oper_log` VALUES (168, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"13:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:42:46');
INSERT INTO `sys_oper_log` VALUES (169, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"12:20\",\"12:20\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:45:14');
INSERT INTO `sys_oper_log` VALUES (170, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"12:20\",\"12:20\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:46:55');
INSERT INTO `sys_oper_log` VALUES (171, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"08:20\",\"08:20\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:48:54');
INSERT INTO `sys_oper_log` VALUES (172, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"04:40\",\"04:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 13:49:20');
INSERT INTO `sys_oper_log` VALUES (173, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"13:40\",\"13:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'13:40,13:40\' for column \'zTime\' at row 1\r\n### The error may involve com.ruoyi.project.lims.dataRecord.mapper.DataRecordMapper.updateDataRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_tubu_data          SET zDate = ?,             zTime = ?,             zRation = ?,             zWater = ?,             zWd = ?,             zViscosity = ?,             zDegrees = ?,             zLevel = ?,             zSpeed = ?,             zDrive = ?,             zOperation = ?,             zBeating = ?,             zWeight = ?,             zCoating = ?,             create_by = ?,                          remark = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'13:40,13:40\' for column \'zTime\' at row 1\n; Data truncation: Incorrect time value: \'13:40,13:40\' for column \'zTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'13:40,13:40\' for column \'zTime\' at row 1', '2021-11-17 13:51:24');
INSERT INTO `sys_oper_log` VALUES (174, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"08:40\",\"08:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'08:40,08:40\' for column \'zTime\' at row 1\r\n### The error may involve com.ruoyi.project.lims.dataRecord.mapper.DataRecordMapper.updateDataRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_tubu_data          SET zDate = ?,             zTime = ?,             zRation = ?,             zWater = ?,             zWd = ?,             zViscosity = ?,             zDegrees = ?,             zLevel = ?,             zSpeed = ?,             zDrive = ?,             zOperation = ?,             zBeating = ?,             zWeight = ?,             zCoating = ?,             create_by = ?,                          remark = ?          where id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'08:40,08:40\' for column \'zTime\' at row 1\n; Data truncation: Incorrect time value: \'08:40,08:40\' for column \'zTime\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Incorrect time value: \'08:40,08:40\' for column \'zTime\' at row 1', '2021-11-17 13:52:18');
INSERT INTO `sys_oper_log` VALUES (175, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"15:35\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:17:27');
INSERT INTO `sys_oper_log` VALUES (176, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"14:18\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:17:58');
INSERT INTO `sys_oper_log` VALUES (177, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"14:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:19:02');
INSERT INTO `sys_oper_log` VALUES (178, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTime\":[\"09:45\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:22:39');
INSERT INTO `sys_oper_log` VALUES (179, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"08:40\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:23:11');
INSERT INTO `sys_oper_log` VALUES (180, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"17:26\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:23:36');
INSERT INTO `sys_oper_log` VALUES (181, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"14:31\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 1, 'java.util.Date cannot be cast to java.sql.Time', '2021-11-17 14:28:23');
INSERT INTO `sys_oper_log` VALUES (182, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"14:43\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:40:08');
INSERT INTO `sys_oper_log` VALUES (183, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"23:51\"],\"zRation\":[\"1.0\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 14:41:47');
INSERT INTO `sys_oper_log` VALUES (184, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:34:20');
INSERT INTO `sys_oper_log` VALUES (185, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:35:01');
INSERT INTO `sys_oper_log` VALUES (186, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:36:00');
INSERT INTO `sys_oper_log` VALUES (187, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:38:28');
INSERT INTO `sys_oper_log` VALUES (188, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:38:54');
INSERT INTO `sys_oper_log` VALUES (189, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 16:46:05');
INSERT INTO `sys_oper_log` VALUES (190, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:03:45');
INSERT INTO `sys_oper_log` VALUES (191, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:09:38');
INSERT INTO `sys_oper_log` VALUES (192, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:11:46');
INSERT INTO `sys_oper_log` VALUES (193, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:12:28');
INSERT INTO `sys_oper_log` VALUES (194, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:13:34');
INSERT INTO `sys_oper_log` VALUES (195, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 1, '很抱歉，成功0 条记录,  导入失败共 1 条数据格式不正确，错误如下：<br/>1、Days(nullnull) 导入失败：数据日期必填', '2021-11-17 17:16:00');
INSERT INTO `sys_oper_log` VALUES (196, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"11:51\"],\"zRation\":[\"1.1\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 17:18:15');
INSERT INTO `sys_oper_log` VALUES (197, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 0, NULL, '2021-11-17 17:18:25');
INSERT INTO `sys_oper_log` VALUES (198, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"89\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"22:43\"],\"zRation\":[\"11.0\"],\"zWater\":[\"22.0\"],\"zWd\":[\"33.0\"],\"zViscosity\":[\"44.0\"],\"zDegrees\":[\"55.0\"],\"zLevel\":[\"66.0\"],\"zSpeed\":[\"77.0\"],\"zDrive\":[\"88.0\"],\"zOperation\":[\"99.0\"],\"zBeating\":[\"1010\"],\"zWeight\":[\"1111\"],\"zCoating\":[\"1212.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-17 17:18:53');
INSERT INTO `sys_oper_log` VALUES (199, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"88\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"11:51\"],\"zRation\":[\"1.10\"],\"zWater\":[\"2.0\"],\"zWd\":[\"3.0\"],\"zViscosity\":[\"4.0\"],\"zDegrees\":[\"5.0\"],\"zLevel\":[\"6.0\"],\"zSpeed\":[\"7.0\"],\"zDrive\":[\"8.0\"],\"zOperation\":[\"9.0\"],\"zBeating\":[\"10\"],\"zWeight\":[\"11\"],\"zCoating\":[\"12.0\"],\"remark\":[\"\"]}', 0, NULL, '2021-11-18 09:24:47');
INSERT INTO `sys_oper_log` VALUES (200, '数据管理', 3, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.remove()', 1, 'admin', '技术监测室', '/lims/dataRecord/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"88\"]}', 0, NULL, '2021-11-18 09:24:56');
INSERT INTO `sys_oper_log` VALUES (201, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"89\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"10:43\"],\"zRation\":[\"11.0\"],\"zWater\":[\"22.0\"],\"zWd\":[\"33.0\"],\"zViscosity\":[\"44.0\"],\"zDegrees\":[\"55.0\"],\"zLevel\":[\"66.0\"],\"zSpeed\":[\"77.0\"],\"zDrive\":[\"88.0\"],\"zOperation\":[\"99.0\"],\"zBeating\":[\"1010\"],\"zWeight\":[\"1111\"],\"zCoating\":[\"1212.0\"],\"remark\":[\"12\"]}', 0, NULL, '2021-11-18 09:25:09');
INSERT INTO `sys_oper_log` VALUES (202, '数据管理', 2, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.editSave()', 1, 'admin', '技术监测室', '/lims/dataRecord/edit', '127.0.0.1', '内网IP', '{\"id\":[\"89\"],\"zDate\":[\"2021-11-17\"],\"zTimeH\":[\"10:43\"],\"zRation\":[\"11.0\"],\"zWater\":[\"22.0\"],\"zWd\":[\"33.0\"],\"zViscosity\":[\"44.0\"],\"zDegrees\":[\"55.0\"],\"zLevel\":[\"66.0\"],\"zSpeed\":[\"77.0\"],\"zDrive\":[\"88.0\"],\"zOperation\":[\"99.0\"],\"zBeating\":[\"1010\"],\"zWeight\":[\"11111\"],\"zCoating\":[\"1212.0\"],\"remark\":[\"12\"]}', 0, NULL, '2021-11-18 09:25:15');
INSERT INTO `sys_oper_log` VALUES (203, '数据管理', 6, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.importData()', 1, 'admin', '技术监测室', '/lims/dataRecord/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":[\"false\"]}', 0, NULL, '2021-11-24 16:21:03');
INSERT INTO `sys_oper_log` VALUES (204, '数据管理', 3, 'com.ruoyi.project.lims.dataRecord.controller.DataRecordController.remove()', 1, 'admin', '技术监测室', '/lims/dataRecord/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"90\"]}', 0, NULL, '2021-11-24 16:21:12');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'me', '工程师', 1, '0', 'sys', '2019-08-07 18:56:50', 'sys', '2019-08-07 18:56:50', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'admin', 1, '1', '0', '0', 'sys', '2019-08-07 18:57:56', 'admin', '2021-11-16 17:46:12', '系统管理员');
INSERT INTO `sys_role` VALUES (2, '实验室管理员', 'manager', 2, '4', '0', '0', 'sys', '2019-08-07 18:57:56', 'sys', '2019-08-07 18:57:56', '实验室管理员');
INSERT INTO `sys_role` VALUES (3, '普通用户', 'cuser', 3, '4', '0', '0', 'sys', '2019-08-07 18:57:56', 'sys', '2019-08-07 18:57:56', '普通用户');
INSERT INTO `sys_role` VALUES (4, '操作人员', 'operate', 2, '1', '0', '0', 'admin', '2021-08-28 16:00:38', 'admin', '2021-10-15 09:17:01', '');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 100);
INSERT INTO `sys_role_menu` VALUES (1, 101);
INSERT INTO `sys_role_menu` VALUES (1, 102);
INSERT INTO `sys_role_menu` VALUES (1, 103);
INSERT INTO `sys_role_menu` VALUES (1, 104);
INSERT INTO `sys_role_menu` VALUES (1, 105);
INSERT INTO `sys_role_menu` VALUES (1, 106);
INSERT INTO `sys_role_menu` VALUES (1, 107);
INSERT INTO `sys_role_menu` VALUES (1, 108);
INSERT INTO `sys_role_menu` VALUES (1, 109);
INSERT INTO `sys_role_menu` VALUES (1, 110);
INSERT INTO `sys_role_menu` VALUES (1, 111);
INSERT INTO `sys_role_menu` VALUES (1, 112);
INSERT INTO `sys_role_menu` VALUES (1, 113);
INSERT INTO `sys_role_menu` VALUES (1, 114);
INSERT INTO `sys_role_menu` VALUES (1, 500);
INSERT INTO `sys_role_menu` VALUES (1, 501);
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1001);
INSERT INTO `sys_role_menu` VALUES (1, 1002);
INSERT INTO `sys_role_menu` VALUES (1, 1003);
INSERT INTO `sys_role_menu` VALUES (1, 1004);
INSERT INTO `sys_role_menu` VALUES (1, 1005);
INSERT INTO `sys_role_menu` VALUES (1, 1006);
INSERT INTO `sys_role_menu` VALUES (1, 1007);
INSERT INTO `sys_role_menu` VALUES (1, 1008);
INSERT INTO `sys_role_menu` VALUES (1, 1009);
INSERT INTO `sys_role_menu` VALUES (1, 1010);
INSERT INTO `sys_role_menu` VALUES (1, 1011);
INSERT INTO `sys_role_menu` VALUES (1, 1012);
INSERT INTO `sys_role_menu` VALUES (1, 1013);
INSERT INTO `sys_role_menu` VALUES (1, 1014);
INSERT INTO `sys_role_menu` VALUES (1, 1015);
INSERT INTO `sys_role_menu` VALUES (1, 1016);
INSERT INTO `sys_role_menu` VALUES (1, 1017);
INSERT INTO `sys_role_menu` VALUES (1, 1018);
INSERT INTO `sys_role_menu` VALUES (1, 1019);
INSERT INTO `sys_role_menu` VALUES (1, 1020);
INSERT INTO `sys_role_menu` VALUES (1, 1021);
INSERT INTO `sys_role_menu` VALUES (1, 1022);
INSERT INTO `sys_role_menu` VALUES (1, 1023);
INSERT INTO `sys_role_menu` VALUES (1, 1024);
INSERT INTO `sys_role_menu` VALUES (1, 1025);
INSERT INTO `sys_role_menu` VALUES (1, 1026);
INSERT INTO `sys_role_menu` VALUES (1, 1027);
INSERT INTO `sys_role_menu` VALUES (1, 1028);
INSERT INTO `sys_role_menu` VALUES (1, 1029);
INSERT INTO `sys_role_menu` VALUES (1, 1030);
INSERT INTO `sys_role_menu` VALUES (1, 1031);
INSERT INTO `sys_role_menu` VALUES (1, 1032);
INSERT INTO `sys_role_menu` VALUES (1, 1033);
INSERT INTO `sys_role_menu` VALUES (1, 1034);
INSERT INTO `sys_role_menu` VALUES (1, 1035);
INSERT INTO `sys_role_menu` VALUES (1, 1036);
INSERT INTO `sys_role_menu` VALUES (1, 1037);
INSERT INTO `sys_role_menu` VALUES (1, 1038);
INSERT INTO `sys_role_menu` VALUES (1, 1039);
INSERT INTO `sys_role_menu` VALUES (1, 1040);
INSERT INTO `sys_role_menu` VALUES (1, 1041);
INSERT INTO `sys_role_menu` VALUES (1, 1042);
INSERT INTO `sys_role_menu` VALUES (1, 1043);
INSERT INTO `sys_role_menu` VALUES (1, 1044);
INSERT INTO `sys_role_menu` VALUES (1, 1045);
INSERT INTO `sys_role_menu` VALUES (1, 1046);
INSERT INTO `sys_role_menu` VALUES (1, 1047);
INSERT INTO `sys_role_menu` VALUES (1, 1048);
INSERT INTO `sys_role_menu` VALUES (1, 1049);
INSERT INTO `sys_role_menu` VALUES (1, 1050);
INSERT INTO `sys_role_menu` VALUES (1, 1051);
INSERT INTO `sys_role_menu` VALUES (1, 1052);
INSERT INTO `sys_role_menu` VALUES (1, 1053);
INSERT INTO `sys_role_menu` VALUES (1, 1054);
INSERT INTO `sys_role_menu` VALUES (1, 1055);
INSERT INTO `sys_role_menu` VALUES (1, 1056);
INSERT INTO `sys_role_menu` VALUES (1, 1057);
INSERT INTO `sys_role_menu` VALUES (1, 2005);
INSERT INTO `sys_role_menu` VALUES (1, 2008);
INSERT INTO `sys_role_menu` VALUES (1, 2105);
INSERT INTO `sys_role_menu` VALUES (1, 2106);
INSERT INTO `sys_role_menu` VALUES (1, 2108);
INSERT INTO `sys_role_menu` VALUES (1, 2109);
INSERT INTO `sys_role_menu` VALUES (1, 2110);
INSERT INTO `sys_role_menu` VALUES (1, 2112);
INSERT INTO `sys_role_menu` VALUES (1, 2113);
INSERT INTO `sys_role_menu` VALUES (1, 2114);
INSERT INTO `sys_role_menu` VALUES (1, 2115);
INSERT INTO `sys_role_menu` VALUES (1, 2116);
INSERT INTO `sys_role_menu` VALUES (1, 2117);
INSERT INTO `sys_role_menu` VALUES (1, 2118);
INSERT INTO `sys_role_menu` VALUES (1, 2119);
INSERT INTO `sys_role_menu` VALUES (1, 2120);
INSERT INTO `sys_role_menu` VALUES (1, 2121);
INSERT INTO `sys_role_menu` VALUES (1, 2122);
INSERT INTO `sys_role_menu` VALUES (1, 2123);
INSERT INTO `sys_role_menu` VALUES (1, 2124);
INSERT INTO `sys_role_menu` VALUES (1, 2125);
INSERT INTO `sys_role_menu` VALUES (1, 2126);
INSERT INTO `sys_role_menu` VALUES (1, 2127);
INSERT INTO `sys_role_menu` VALUES (1, 2129);
INSERT INTO `sys_role_menu` VALUES (1, 2131);
INSERT INTO `sys_role_menu` VALUES (1, 2132);
INSERT INTO `sys_role_menu` VALUES (1, 2133);
INSERT INTO `sys_role_menu` VALUES (1, 2134);
INSERT INTO `sys_role_menu` VALUES (1, 2135);
INSERT INTO `sys_role_menu` VALUES (1, 2136);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 100);
INSERT INTO `sys_role_menu` VALUES (4, 101);
INSERT INTO `sys_role_menu` VALUES (4, 102);
INSERT INTO `sys_role_menu` VALUES (4, 103);
INSERT INTO `sys_role_menu` VALUES (4, 104);
INSERT INTO `sys_role_menu` VALUES (4, 108);
INSERT INTO `sys_role_menu` VALUES (4, 500);
INSERT INTO `sys_role_menu` VALUES (4, 501);
INSERT INTO `sys_role_menu` VALUES (4, 1000);
INSERT INTO `sys_role_menu` VALUES (4, 1001);
INSERT INTO `sys_role_menu` VALUES (4, 1002);
INSERT INTO `sys_role_menu` VALUES (4, 1003);
INSERT INTO `sys_role_menu` VALUES (4, 1004);
INSERT INTO `sys_role_menu` VALUES (4, 1005);
INSERT INTO `sys_role_menu` VALUES (4, 1006);
INSERT INTO `sys_role_menu` VALUES (4, 1007);
INSERT INTO `sys_role_menu` VALUES (4, 1008);
INSERT INTO `sys_role_menu` VALUES (4, 1009);
INSERT INTO `sys_role_menu` VALUES (4, 1010);
INSERT INTO `sys_role_menu` VALUES (4, 1011);
INSERT INTO `sys_role_menu` VALUES (4, 1012);
INSERT INTO `sys_role_menu` VALUES (4, 1013);
INSERT INTO `sys_role_menu` VALUES (4, 1014);
INSERT INTO `sys_role_menu` VALUES (4, 1015);
INSERT INTO `sys_role_menu` VALUES (4, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 1017);
INSERT INTO `sys_role_menu` VALUES (4, 1018);
INSERT INTO `sys_role_menu` VALUES (4, 1019);
INSERT INTO `sys_role_menu` VALUES (4, 1020);
INSERT INTO `sys_role_menu` VALUES (4, 1021);
INSERT INTO `sys_role_menu` VALUES (4, 1022);
INSERT INTO `sys_role_menu` VALUES (4, 1023);
INSERT INTO `sys_role_menu` VALUES (4, 1024);
INSERT INTO `sys_role_menu` VALUES (4, 1039);
INSERT INTO `sys_role_menu` VALUES (4, 1040);
INSERT INTO `sys_role_menu` VALUES (4, 1041);
INSERT INTO `sys_role_menu` VALUES (4, 1042);
INSERT INTO `sys_role_menu` VALUES (4, 1043);
INSERT INTO `sys_role_menu` VALUES (4, 1044);
INSERT INTO `sys_role_menu` VALUES (4, 1045);
INSERT INTO `sys_role_menu` VALUES (4, 2005);
INSERT INTO `sys_role_menu` VALUES (4, 2123);
INSERT INTO `sys_role_menu` VALUES (4, 2124);
INSERT INTO `sys_role_menu` VALUES (4, 2125);
INSERT INTO `sys_role_menu` VALUES (4, 2126);
INSERT INTO `sys_role_menu` VALUES (4, 2127);
INSERT INTO `sys_role_menu` VALUES (4, 2129);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'sa', '若依', '00', 'sa@lims.com', 'sa', '1', '', '8215ad24cb965ad02b75822dc22f3f52', 'da294d', '0', '0', '127.0.0.1', '2020-01-09 11:01:17', 'sys', '2019-08-07 19:00:08', 'sys', '2020-01-09 11:01:17', '超级管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'admin', '若依', '00', 'admin@lims.com', 'admin', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2021-11-24 16:24:36', 'sys', '2019-08-07 19:00:08', 'sys', '2021-11-24 16:24:37', '超级管理员');
INSERT INTO `sys_user` VALUES (3, 101, 'user', 'user', '00', 'user@lims.com', '1387100000', '0', '', '9a0e984960b9a71a7ede7ad6ac43aa0c', 'f015c0', '0', '0', '127.0.0.1', '2021-11-02 09:14:05', 'admin', '2021-08-28 16:03:43', 'admin', '2021-11-02 09:14:05', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('053f8650-03a9-465f-9a5f-fd7289c2011e', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-03 17:29:17', '2021-11-24 16:08:40', 1800000);
INSERT INTO `sys_user_online` VALUES ('07274de9-e8fd-4439-8d50-23d3afba7263', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-11-16 11:05:33', '2021-11-24 16:08:40', 1800000);
INSERT INTO `sys_user_online` VALUES ('09cd9ea8-2e76-4d3e-b0eb-4a677b98c960', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-11-15 15:40:24', '2021-11-24 16:08:40', 1800000);
INSERT INTO `sys_user_online` VALUES ('15aea820-dbaf-4c37-aa4c-b5acedf8098d', 'user', '部门一', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-10-28 12:04:41', '2021-11-24 16:08:40', 1800000);
INSERT INTO `sys_user_online` VALUES ('1adeb74d-42f7-4a5e-b329-d6d1da5c84e4', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-02 10:53:03', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('1c806146-75b8-483e-b25e-31b0aa8ab9d5', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 20:12:30', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('1e818826-ec0b-4b66-8def-c55739434ed1', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 17:47:28', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('1f6bae3e-75b5-4d67-8f4b-ca1be9168e95', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-10-28 17:08:57', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('26ed6382-8463-4fee-80f7-f44ae160ed40', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-13 22:06:53', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('2c04e3b3-54bb-4af8-b793-07e60a025544', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-24 20:34:20', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('335ff592-41b1-46ab-98a8-682efa793aa4', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-21 15:07:33', '2021-11-24 16:08:41', 1800000);
INSERT INTO `sys_user_online` VALUES ('34d836ca-319e-404b-90c8-d7a8dff1e21a', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-31 14:42:13', '2021-11-24 16:08:42', 1800000);
INSERT INTO `sys_user_online` VALUES ('4280f61c-e23c-41a2-aef4-5e39b09cbbe9', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-19 21:18:27', '2021-11-24 16:08:42', 1800000);
INSERT INTO `sys_user_online` VALUES ('4dea73c6-1675-4629-a706-d88422fd0d0a', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-03 20:08:29', '2021-11-24 16:08:42', 1800000);
INSERT INTO `sys_user_online` VALUES ('5e5c656d-9d11-4f08-90eb-1660113a949d', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-01 15:57:51', '2021-11-24 16:08:42', 1800000);
INSERT INTO `sys_user_online` VALUES ('6da93072-5a69-4a95-be34-614fa64dc279', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:36:12', '2021-11-24 16:08:42', 1800000);
INSERT INTO `sys_user_online` VALUES ('7de13465-d1ee-494b-91e5-3124823c624c', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-10-20 09:32:55', '2021-11-24 16:08:43', 1800000);
INSERT INTO `sys_user_online` VALUES ('96a38cdf-818b-4861-816c-54208a6641aa', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-14 10:58:44', '2021-11-24 16:08:43', 1800000);
INSERT INTO `sys_user_online` VALUES ('977ac00f-2727-4505-a8f8-550615464e19', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-11-17 17:44:53', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('a0e7c911-d4f2-4ea3-8018-bb8cc580ebd6', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:31:33', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('addc7e45-0e3a-47cf-b6b6-2f50e11c915d', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 22:24:45', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('b1ab60ec-1515-4c6c-a97e-54d3d5ce8eb8', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-10-15 13:32:10', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('b276e00a-92b6-4ce1-bc64-a35e785fc68f', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-31 15:14:03', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('bfb2698f-ea04-4df1-9b54-b6dd950a8e8d', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-03 17:19:11', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('ca67bc34-ee27-4d73-a001-3687ed1d094b', 'user', '部门一', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-11-02 09:14:00', '2021-11-24 16:08:44', 1800000);
INSERT INTO `sys_user_online` VALUES ('d5123b6a-f127-4dc0-8ee2-4429266cb4ca', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-03 17:31:49', '2021-11-24 16:08:45', 1800000);
INSERT INTO `sys_user_online` VALUES ('d87c4a26-4cfe-4e02-8ba0-3b8d313def69', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-11-24 16:24:33', '2021-11-24 16:24:38', 1800000);
INSERT INTO `sys_user_online` VALUES ('d9193aea-3d64-4465-a9c6-3e37d7946530', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-01 21:26:02', '2021-11-24 16:08:45', 1800000);
INSERT INTO `sys_user_online` VALUES ('dab810c2-c7f5-43f9-b6f9-22196550ed4e', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-08-28 14:15:30', '2021-11-24 16:08:45', 1800000);
INSERT INTO `sys_user_online` VALUES ('e25f4a84-f86e-49fa-82b1-3a6d02f27750', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', 'on_line', '2021-09-03 17:09:16', '2021-11-24 16:08:45', 1800000);
INSERT INTO `sys_user_online` VALUES ('efa3a3a3-c3f8-4bf8-b4d6-026efcc6f634', 'admin', '技术监测室', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', 'on_line', '2020-11-20 21:37:37', '2021-11-24 16:08:45', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 1);
INSERT INTO `sys_user_role` VALUES (3, 4);

-- ----------------------------
-- Table structure for t_newwork_model_data
-- ----------------------------
DROP TABLE IF EXISTS `t_newwork_model_data`;
CREATE TABLE `t_newwork_model_data`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `days` datetime(0) DEFAULT NULL COMMENT '数据日期',
  `water` int(10) DEFAULT NULL COMMENT '水',
  `electric` int(10) DEFAULT NULL COMMENT '电',
  `gas` int(10) DEFAULT NULL COMMENT '气',
  `yield` double(10, 2) DEFAULT NULL COMMENT '产量',
  `speed` int(10) DEFAULT NULL COMMENT '车速',
  `temperature` int(10) DEFAULT NULL COMMENT '温度',
  `humidity` int(10) DEFAULT NULL COMMENT '湿度',
  `oven` double(20, 11) DEFAULT NULL COMMENT '烘箱',
  `hotair` double(20, 11) DEFAULT NULL COMMENT '热风汽罩',
  `low` double(20, 11) DEFAULT NULL COMMENT '低浓磨',
  `hight` double(20, 11) DEFAULT NULL COMMENT '高浓磨',
  `centrifuge` double(20, 11) DEFAULT NULL COMMENT '离心机',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 346 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '神经网络模型数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_newwork_model_data
-- ----------------------------
INSERT INTO `t_newwork_model_data` VALUES (216, '2021-01-15 00:00:00', 1116, 14937, 5615, 0.00, 0, 10, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (217, '2021-01-16 00:00:00', 561, 20880, 6242, 0.00, 0, 8, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (218, '2021-01-17 00:00:00', 1108, 26324, 10515, 4.50, 50, 8, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (219, '2021-01-18 00:00:00', 1231, 30997, 12453, 13.14, 75, 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (220, '2021-01-19 00:00:00', 1290, 26618, 10499, 10.08, 75, 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (221, '2021-01-20 00:00:00', 1400, 36798, 16089, 25.02, 82, 10, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (222, '2021-01-21 00:00:00', 1314, 38392, 17998, 22.68, 87, 11, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (223, '2021-01-22 00:00:00', 1365, 37418, 16277, 24.30, 88, 12, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (224, '2021-01-23 00:00:00', 1301, 31108, 12162, 15.12, 76, 12, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (225, '2021-01-24 00:00:00', 1268, 38242, 18685, 28.62, 97, 13, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (226, '2021-01-25 00:00:00', 1368, 38813, 18622, 23.76, 94, 13, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (227, '2021-01-26 00:00:00', 1310, 37163, 18517, 21.24, 99, 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (228, '2021-01-27 00:00:00', 1318, 36977, 18938, 26.46, 98, 14, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (229, '2021-01-28 00:00:00', 1324, 26424, 13023, 14.94, 97, 15, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (230, '2021-01-29 00:00:00', 1327, 30860, 17441, 27.36, 89, 11, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (231, '2021-01-30 00:00:00', 1353, 22981, 10990, 7.74, 32, 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (232, '2021-01-31 00:00:00', 1339, 30254, 17946, 26.82, 102, 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (233, '2021-02-01 00:00:00', 1343, 33993, 19145, 32.40, 103, 12, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (234, '2021-02-02 00:00:00', 1336, 32539, 19084, 28.08, 104, 13, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (235, '2021-02-03 00:00:00', 1329, 32276, 19421, 30.42, 101, 11, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (236, '2021-02-04 00:00:00', 1276, 33318, 18113, 29.16, 102, 10, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (237, '2021-02-05 00:00:00', 1258, 29833, 18562, 26.82, 103, 10, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (238, '2021-02-23 00:00:00', 1395, 24047, 15049, 8.82, 52, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (239, '2021-02-24 00:00:00', 1347, 30045, 18737, 24.66, 88, 11, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (240, '2021-02-25 00:00:00', 1453, 31899, 20313, 27.18, 104, 11, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (241, '2021-02-26 00:00:00', 1243, 32929, 20814, 29.70, 102, 12, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (242, '2021-02-27 00:00:00', 1416, 32192, 19759, 29.34, 103, 13, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (243, '2021-02-28 00:00:00', 1354, 32464, 21725, 29.52, 103, 11, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (244, '2021-03-01 00:00:00', 1353, 31912, 20053, 27.90, 105, 12, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (245, '2021-03-02 00:00:00', 1414, 32307, 20275, 29.88, 107, 13, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (246, '2021-03-03 00:00:00', 1416, 32052, 21703, 30.42, 108, 11, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (247, '2021-03-04 00:00:00', 1263, 26492, 15490, 20.70, 106, 10, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (248, '2021-03-05 00:00:00', 1396, 32223, 20692, 32.40, 107, 9, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (249, '2021-03-06 00:00:00', 1396, 32822, 20390, 32.04, 107, 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (250, '2021-03-07 00:00:00', 1268, 31672, 20483, 29.16, 109, 9, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (251, '2021-03-08 00:00:00', 1379, 28284, 19371, 21.96, 107, 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (252, '2021-03-09 00:00:00', 1438, 32923, 21885, 32.04, 107, 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (253, '2021-03-10 00:00:00', 1423, 30969, 20932, 31.50, 107, 7, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (254, '2021-03-11 00:00:00', 1335, 32400, 21676, 31.14, 107, 7, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (255, '2021-03-12 00:00:00', 1404, 31270, 19693, 27.72, 103, 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (256, '2021-03-13 00:00:00', 1299, 32531, 22027, 30.60, 102, 7, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (257, '2021-03-14 00:00:00', 1375, 33148, 21364, 32.04, 105, 6, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (258, '2021-03-15 00:00:00', 1352, 32212, 21438, 31.32, 107, 6, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (259, '2021-03-16 00:00:00', 1331, 32364, 19379, 30.06, 107, 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (260, '2021-03-26 00:00:00', 1343, 9356, 4041, 0.00, 58, 14, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (261, '2021-03-27 00:00:00', 1669, 23503, 13323, 6.12, 95, 11, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (262, '2021-03-28 00:00:00', 1630, 32246, 17985, 27.72, 102, 11, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (263, '2021-03-29 00:00:00', 1624, 30785, 17426, 28.08, 96, 11, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (264, '2021-03-30 00:00:00', 1647, 32235, 19599, 32.76, 107, 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (265, '2021-03-31 00:00:00', 1507, 32508, 19553, 33.84, 107, 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (266, '2021-04-01 00:00:00', 1637, 26539, 14143, 18.54, 105, 12, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (267, '2021-04-02 00:00:00', 1631, 32412, 19979, 33.12, 106, 13, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (268, '2021-04-03 00:00:00', 1576, 32709, 18691, 31.86, 107, 11, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (269, '2021-04-04 00:00:00', 1565, 32839, 19187, 31.50, 107, 10, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (270, '2021-04-05 00:00:00', 1552, 32588, 19173, 31.32, 108, 9, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (271, '2021-04-06 00:00:00', 1627, 33562, 18993, 30.24, 109, 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (272, '2021-04-07 00:00:00', 1501, 18395, 10223, 10.62, 61, 9, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (273, '2021-04-08 00:00:00', 1632, 32101, 18321, 26.64, 101, 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (274, '2021-04-09 00:00:00', 1598, 31341, 18988, 29.52, 105, 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (275, '2021-04-10 00:00:00', 1638, 32597, 17873, 30.96, 104, 7, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (276, '2021-04-11 00:00:00', 1555, 32380, 19644, 30.96, 108, 7, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (277, '2021-04-12 00:00:00', 1629, 33401, 18188, 27.18, 108, 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (278, '2021-04-13 00:00:00', 1629, 32538, 17589, 31.14, 107, 7, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (279, '2021-04-14 00:00:00', 1587, 32197, 18705, 31.32, 107, 6, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (280, '2021-04-15 00:00:00', 1634, 29964, 17321, 27.00, 105, 6, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (281, '2021-04-16 00:00:00', 1613, 32111, 18121, 30.06, 105, 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (282, '2021-04-17 00:00:00', 1639, 30724, 18299, 31.14, 107, 8, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (283, '2021-04-18 00:00:00', 1582, 32221, 18263, 28.62, 108, 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (284, '2021-04-19 00:00:00', 1670, 31485, 18560, 32.04, 109, 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (285, '2021-04-20 00:00:00', 1521, 29456, 16592, 23.40, 108, 10, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (286, '2021-04-21 00:00:00', 1631, 30775, 17873, 29.34, 107, 12, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (287, '2021-04-22 00:00:00', 1588, 31948, 18650, 30.06, 107, 14, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (288, '2021-04-23 00:00:00', 1604, 31366, 17466, 31.14, 109, 16, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (289, '2021-04-24 00:00:00', 1572, 28667, 16492, 25.38, 109, 18, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (290, '2021-04-25 00:00:00', 1559, 31622, 18794, 34.02, 110, 15, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (291, '2021-04-26 00:00:00', 1579, 31718, 18484, 30.78, 108, 14, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (292, '2021-04-27 00:00:00', 1597, 32119, 18064, 31.50, 108, 11, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (293, '2021-04-28 00:00:00', 1631, 32400, 17266, 31.50, 108, 11, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (294, '2021-04-29 00:00:00', 1576, 28733, 15461, 27.18, 110, 11, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (295, '2021-05-05 00:00:00', 659, 9732, 5760, 8.10, 90, 18, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (296, '2021-05-06 00:00:00', 1798, 31442, 18821, 29.16, 101, 17, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (297, '2021-05-07 00:00:00', 1726, 32526, 18328, 30.24, 107, 18, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (298, '2021-05-08 00:00:00', 1816, 33785, 18123, 30.96, 110, 18, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (299, '2021-05-09 00:00:00', 1771, 32870, 18184, 30.06, 109, 17, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (300, '2021-05-10 00:00:00', 1737, 32557, 19066, 28.08, 108, 16, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (301, '2021-05-11 00:00:00', 1709, 25239, 14252, 16.20, 101, 16, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (302, '2021-05-12 00:00:00', 1824, 31614, 19549, 33.66, 105, 14, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (303, '2021-05-13 00:00:00', 1540, 32839, 18086, 29.70, 103, 16, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (304, '2021-05-14 00:00:00', 1696, 32376, 17108, 30.24, 102, 15, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (305, '2021-05-15 00:00:00', 1765, 32967, 18260, 30.06, 105, 15, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (306, '2021-05-16 00:00:00', 1765, 31474, 17351, 30.78, 105, 17, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (307, '2021-05-17 00:00:00', 1742, 32147, 18644, 30.24, 108, 17, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (308, '2021-05-18 00:00:00', 1682, 32992, 17981, 30.60, 108, 18, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (309, '2021-05-19 00:00:00', 1766, 26609, 14018, 22.14, 108, 17, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (310, '2021-05-20 00:00:00', 1815, 31804, 18130, 29.88, 110, 19, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (311, '2021-05-21 00:00:00', 1779, 32751, 17431, 33.30, 109, 21, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (312, '2021-05-22 00:00:00', 1704, 33197, 18353, 32.58, 111, 23, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (313, '2021-05-23 00:00:00', 1732, 33292, 19100, 32.40, 110, 25, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (314, '2021-05-24 00:00:00', 1713, 33262, 18430, 31.68, 111, 27, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (315, '2021-05-25 00:00:00', 1789, 31836, 18321, 31.50, 110, 24, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (316, '2021-05-26 00:00:00', 1729, 34084, 19259, 32.04, 110, 23, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (317, '2021-05-27 00:00:00', 1763, 33859, 18795, 31.68, 110, 20, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (318, '2021-05-28 00:00:00', 1761, 33102, 18197, 31.86, 110, 20, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (319, '2021-05-29 00:00:00', 1704, 33466, 18205, 32.04, 110, 20, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (320, '2021-05-30 00:00:00', 1791, 33716, 17780, 32.22, 110, 18, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (321, '2021-05-31 00:00:00', 1680, 32949, 17569, 31.32, 110, 17, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (322, '2021-06-01 00:00:00', 1784, 21454, 10634, 10.08, 101, 27, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (323, '2021-06-02 00:00:00', 1727, 32306, 16982, 28.08, 99, 26, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (324, '2021-06-03 00:00:00', 1748, 32709, 17532, 30.60, 103, 27, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (325, '2021-06-04 00:00:00', 1742, 31709, 18051, 32.58, 108, 27, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (326, '2021-06-05 00:00:00', 1759, 33366, 17444, 30.78, 107, 27, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (327, '2021-06-06 00:00:00', 1783, 33889, 17355, 34.20, 108, 27, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (328, '2021-06-07 00:00:00', 1747, 34184, 17785, 32.04, 110, 27, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (329, '2021-06-08 00:00:00', 1819, 33623, 16970, 32.40, 107, 29, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (330, '2021-06-09 00:00:00', 1762, 34466, 16812, 31.32, 110, 27, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (331, '2021-06-10 00:00:00', 2372, 44053, 22434, 40.68, 110, 25, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (332, '2021-06-11 00:00:00', 1736, 34772, 17388, 32.76, 110, 27, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (333, '2021-06-12 00:00:00', 1710, 34160, 17118, 30.78, 109, 28, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (334, '2021-06-13 00:00:00', 1738, 34202, 17536, 33.66, 110, 25, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (335, '2021-06-14 00:00:00', 1679, 27600, 12342, 19.44, 110, 25, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (336, '2021-06-15 00:00:00', 1729, 33288, 17110, 29.70, 107, 29, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (337, '2021-06-16 00:00:00', 1796, 34262, 17203, 32.04, 109, 29, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (338, '2021-06-17 00:00:00', 1786, 33229, 17618, 31.14, 108, 25, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (339, '2021-06-18 00:00:00', 1680, 33798, 17803, 31.32, 109, 24, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (340, '2021-06-19 00:00:00', 1797, 32978, 18134, 32.58, 109, 27, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (341, '2021-06-20 00:00:00', 1748, 32941, 16800, 29.16, 108, 22, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (342, '2021-06-21 00:00:00', 1780, 32363, 17782, 31.14, 108, 23, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (343, '2021-06-22 00:00:00', 1794, 33316, 17874, 31.86, 109, 25, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (344, '2021-06-23 00:00:00', 1775, 34115, 18471, 32.04, 109, 29, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_newwork_model_data` VALUES (345, '2021-06-24 00:00:00', 1224, 23967, 12032, 21.78, 110, 30, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_produce
-- ----------------------------
DROP TABLE IF EXISTS `t_produce`;
CREATE TABLE `t_produce`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `times` datetime(0) DEFAULT NULL COMMENT '时间',
  `banci` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '班次',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '产品名称',
  `plan` int(10) DEFAULT NULL COMMENT '计划产量',
  `actual` float(10, 2) DEFAULT NULL COMMENT '实际产量',
  `batchno` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '批次',
  `output` int(10) DEFAULT NULL COMMENT '出液量',
  `solid` float(10, 2) DEFAULT NULL COMMENT '固含量',
  `beauty` float(10, 2) DEFAULT NULL COMMENT '波美',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ssssd' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_produce
-- ----------------------------
INSERT INTO `t_produce` VALUES (29, '2020-05-28 13:10:00', '甲', '991', 30, 6.09, '5', 505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (30, '2020-05-28 13:20:00', '甲', '991', 30, 6.30, '5', 1005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (31, '2020-05-28 13:30:00', '甲', '991', 30, 6.51, '5', 1505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (32, '2020-05-28 13:40:00', '甲', '991', 30, 6.72, '5', 2005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (33, '2020-05-28 13:50:00', '甲', '991', 30, 6.93, '5', 2505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (34, '2020-05-28 14:00:00', '甲', '991', 30, 7.14, '5', 3005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (35, '2020-05-28 14:10:00', '甲', '991', 30, 7.35, '5', 3505, 8.31, 6.50, NULL, NULL);
INSERT INTO `t_produce` VALUES (36, '2020-05-28 14:20:00', '甲', '991', 30, 7.56, '6', 505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (37, '2020-05-28 14:30:00', '甲', '991', 30, 7.77, '6', 1005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (38, '2020-05-28 14:40:00', '甲', '991', 30, 7.98, '6', 1505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (39, '2020-05-28 14:50:00', '甲', '991', 30, 8.19, '6', 2005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (40, '2020-05-28 15:00:00', '甲', '991', 30, 8.40, '6', 2505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (41, '2020-05-28 15:10:00', '甲', '991', 30, 8.61, '6', 3005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (42, '2020-05-28 15:20:00', '甲', '991', 30, 8.82, '6', 3505, 8.31, 6.50, NULL, NULL);
INSERT INTO `t_produce` VALUES (43, '2020-05-28 15:30:00', '甲', '991', 30, 9.03, '7', 505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (44, '2020-05-28 15:40:00', '甲', '991', 30, 9.24, '7', 1005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (45, '2020-05-28 15:50:00', '甲', '991', 30, 9.45, '7', 1505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (46, '2020-05-28 16:00:00', '甲', '991', 30, 9.66, '7', 2005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (47, '2020-05-28 16:10:00', '甲', '991', 30, 9.87, '7', 2505, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (48, '2020-05-28 16:20:00', '甲', '991', 30, 10.08, '7', 3005, NULL, NULL, NULL, NULL);
INSERT INTO `t_produce` VALUES (49, '2020-05-28 16:30:00', '甲', '991', 30, 10.29, '7', 3505, 8.31, 6.50, NULL, NULL);
INSERT INTO `t_produce` VALUES (50, '2020-05-28 16:40:00', '甲', '991', 30, 10.50, '8', 505, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_record_data
-- ----------------------------
DROP TABLE IF EXISTS `t_record_data`;
CREATE TABLE `t_record_data`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `days` datetime(0) DEFAULT NULL COMMENT '数据日期',
  `machine` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '离心机编号',
  `feeding_time` int(10) DEFAULT NULL COMMENT '投料时间',
  `water_addition` int(10) DEFAULT NULL COMMENT '加水量',
  `water1_temperature` int(10) DEFAULT NULL COMMENT '萃/提取水温',
  `water2_temperature` int(10) DEFAULT NULL COMMENT '萃/提取水温',
  `extract_time` int(10) DEFAULT NULL COMMENT '提取时间',
  `centrifuge1_speed` double(10, 2) DEFAULT NULL COMMENT '离心机1#转速/频率',
  `centrifuge2_speed` double(10, 2) DEFAULT NULL COMMENT '离心机2#转速/频率',
  `centrifuge3_speed` double(10, 2) DEFAULT NULL COMMENT '离心机3#转速/频率',
  `centrifuge4_speed` double(10, 2) DEFAULT NULL COMMENT '离心机4#转速/频率',
  `centrifuge1_current` double(10, 2) DEFAULT NULL COMMENT '离心机1#电流',
  `centrifuge2_current` double(10, 2) DEFAULT NULL COMMENT '离心机2#电流',
  `centrifuge3_current` double(10, 0) DEFAULT NULL COMMENT '离心机3#电流',
  `centrifuge4_current` double(10, 2) DEFAULT NULL COMMENT '离心机4#电流',
  `extrusion_time` int(10) DEFAULT NULL COMMENT '挤浆时间',
  `slag_discharge_time` int(10) DEFAULT NULL COMMENT '排渣时间',
  `screw1_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵1#频率',
  `screw2_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵2#频率',
  `screw3_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵3#频率',
  `screw4_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵4#频率',
  `screw5_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵5#频率',
  `screw6_frequency` int(10) DEFAULT NULL COMMENT '螺杆泵6#频率',
  `extruding1_dryness` double(10, 2) DEFAULT NULL COMMENT '挤浆干度',
  `extruding2_dryness` double(10, 2) DEFAULT NULL COMMENT '挤浆干度',
  `mixing_frequency` int(10) DEFAULT NULL COMMENT '搅拌频率',
  `liquid1_output` double(10, 2) DEFAULT NULL COMMENT '头步液出液量',
  `liquid1_beauty` double(10, 2) DEFAULT NULL COMMENT '提取液波美',
  `solid1_content` double(10, 2) DEFAULT NULL COMMENT '固含量',
  `liquid2_output` int(10) DEFAULT NULL,
  `liquid2_beauty` double(10, 2) DEFAULT NULL,
  `solid2_content` double(10, 2) DEFAULT NULL,
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '132423' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_record_data
-- ----------------------------
INSERT INTO `t_record_data` VALUES (1, '2019-07-01 00:00:00', '3', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.17, NULL, 187, 3650.00, 6.00, 5.36, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (2, '2019-07-01 00:00:00', '2', NULL, 6360, 80, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, 32.14, NULL, 187, 3650.00, 7.00, 8.32, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (3, '2019-07-01 00:00:00', '1', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, 31.66, NULL, 187, 3650.00, 6.50, 7.18, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (4, '2019-07-02 00:00:00', '3', NULL, 6360, 71, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 25.35, NULL, 187, 3650.00, 6.00, 5.17, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (5, '2019-07-02 00:00:00', '1', NULL, 6360, 71, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 29.29, NULL, 187, 3650.00, 5.50, 5.66, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (6, '2019-07-02 00:00:00', '2', NULL, 6360, 65, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, 28.75, NULL, 187, 3650.00, 4.50, 4.78, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (7, '2019-07-03 00:00:00', '1', NULL, 6360, 72, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.10, NULL, 187, 3650.00, 5.50, 5.81, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (8, '2019-07-03 00:00:00', '3', NULL, 6360, 65, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 29.18, NULL, 187, 3650.00, 5.50, 6.21, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (9, '2019-07-03 00:00:00', '2', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 31.67, NULL, 187, 3650.00, 6.50, 7.23, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (10, '2019-07-04 00:00:00', '3', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.50, NULL, 187, 3650.00, 6.00, 6.31, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (11, '2019-07-04 00:00:00', '2', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.29, NULL, 187, 3650.00, 6.00, 6.16, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (12, '2019-07-04 00:00:00', '1', NULL, 6360, 74, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.11, NULL, 187, 3650.00, 5.50, 5.98, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (13, '2019-07-05 00:00:00', '3', NULL, 6360, 70, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 29.80, NULL, 187, 3650.00, 5.50, 5.65, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (14, '2019-07-05 00:00:00', '2', NULL, 6360, 77, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, 31.09, NULL, 187, 3650.00, 6.00, 6.67, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (15, '2019-07-05 00:00:00', '1', NULL, 6360, 68, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, 29.14, NULL, 187, 3650.00, 5.50, 5.88, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (16, '2019-07-06 00:00:00', '3', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.58, NULL, 187, 3650.00, 6.00, 6.75, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (17, '2019-07-06 00:00:00', '2', NULL, 6360, 73, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 187, 3650.00, 5.50, 5.89, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (18, '2019-07-06 00:00:00', '1', NULL, 6360, 73, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 187, 3650.00, 5.50, 5.76, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (19, '2019-07-07 00:00:00', '1', NULL, 6360, 73, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 29.96, NULL, 187, 3650.00, 5.50, 5.52, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (20, '2019-07-07 00:00:00', '3', NULL, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.54, NULL, 187, 3650.00, 6.00, 6.21, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (21, '2020-05-27 17:10:00', '默认', 9, 6360, 74, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.18, NULL, 187, 3650.00, 6.00, 6.08, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (22, '2020-05-27 18:20:00', '默认', 8, 6360, 65, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, 28.76, NULL, 187, 3650.00, 4.50, 4.59, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (23, '2020-05-27 19:30:00', '默认', 9, 6360, 80, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, 32.54, NULL, 187, 3650.00, 7.00, 7.35, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (24, '2020-05-27 20:40:00', '默认', 9, 6360, 77, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, 31.22, NULL, 187, 3650.00, 6.50, 7.17, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (25, '2020-05-27 21:50:00', '默认', 8, 6360, 75, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, 30.87, NULL, 187, 3650.00, 6.00, 6.29, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (26, '2020-05-27 23:00:00', '默认', 6, 6360, 82, NULL, NULL, 35.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, 1, 1, 1, 1, 123, 32.98, NULL, 187, 3650.00, 7.00, 8.25, NULL, NULL, NULL, 'admin', '2019-12-27 16:16:57', '', 0);
INSERT INTO `t_record_data` VALUES (27, '2020-05-28 00:10:00', '默认', 9, 0, 80, 77, 80, 35.00, NULL, 35.00, 38.00, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, 29.78, NULL, 187, 3650.00, 6.70, 7.90, NULL, NULL, 6.50, 'admin', '2019-12-27 16:16:57', NULL, 0);
INSERT INTO `t_record_data` VALUES (28, '2020-05-28 01:20:00', '默认', 7, 500, 70, 72, 60, NULL, 35.34, NULL, 37.60, NULL, 35.00, NULL, 38.00, 53, 51, NULL, 50, NULL, NULL, 35, NULL, 31.22, 31.97, 187, 3525.00, 7.00, 7.80, 2200, 6.40, 6.40, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (29, '2020-05-28 02:30:00', '默认', 9, 1000, 73, 80, 90, NULL, NULL, 35.00, 38.00, NULL, NULL, 35, 38.00, 41, 46, NULL, NULL, 50, NULL, NULL, 30, 28.81, 32.10, 187, 3625.00, 7.00, 8.10, 2200, 6.50, 6.50, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (30, '2020-05-28 03:40:00', '默认', 9, 1500, 85, 85, 90, 35.00, NULL, NULL, 38.00, 35.00, NULL, NULL, 38.00, 42, 41, 40, NULL, NULL, 40, NULL, NULL, 32.31, 32.76, 187, 3602.00, 7.00, 7.90, 2200, 6.40, 6.60, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (31, '2020-05-28 04:50:00', '默认', 8, 2000, 90, 91, 49, NULL, 35.00, NULL, 38.00, NULL, 35.00, NULL, 38.00, 48, 49, NULL, 50, NULL, NULL, 35, NULL, 30.75, 30.86, 187, 3511.00, 6.50, 8.20, 2200, 6.60, 6.40, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (32, '2020-05-28 06:00:00', '默认', 9, 2500, 90, 90, 66, NULL, NULL, 35.00, 38.00, NULL, NULL, 35, 38.00, 50, 42, NULL, NULL, 50, NULL, NULL, 30, 26.96, 27.92, 187, 3596.00, 6.50, 7.90, 2200, 6.40, 6.50, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (33, '2020-05-28 07:10:00', '默认', 9, 3000, 88, 92, 55, 35.00, NULL, NULL, 38.00, 35.00, NULL, NULL, 38.00, 41, 42, 40, NULL, NULL, 40, NULL, NULL, 31.01, 31.01, 187, 3563.00, 7.00, 7.50, 2200, 6.30, 6.60, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (34, '2020-05-28 08:20:00', '默认', 8, 3500, 89, 90, 40, NULL, 35.00, NULL, 38.00, NULL, 35.00, NULL, 38.00, 45, 47, NULL, 50, NULL, NULL, 35, NULL, 32.47, 32.11, 187, 3527.00, 6.30, 7.70, 2200, 6.50, 6.70, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (35, '2020-05-28 09:30:00', '默认', 6, 4000, 85, 72, 60, NULL, 35.34, NULL, 37.60, NULL, 35.00, NULL, 38.00, 53, 51, NULL, 50, NULL, NULL, 35, NULL, 31.22, 31.97, 187, 3525.00, 7.20, 8.00, 2200, 6.40, 3.30, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (36, '2020-05-28 10:40:00', '默认', 9, 4500, 86, 80, 99, NULL, NULL, 35.00, 38.00, NULL, NULL, 35, 38.00, 41, 46, NULL, NULL, 50, NULL, NULL, 30, 28.81, 32.10, 187, 3625.00, 7.00, 8.20, 2200, 6.30, 3.40, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (37, '2020-05-28 11:50:00', '默认', 7, 5000, 85, 85, 90, 35.00, NULL, NULL, 38.00, 35.00, NULL, NULL, 38.00, 42, 41, 40, NULL, NULL, 40, NULL, NULL, 32.31, 32.76, 187, 3602.00, 7.00, 8.00, 2200, 6.50, 3.30, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (38, '2020-05-28 13:00:00', '默认', 9, 5500, 90, 91, 60, NULL, 35.00, NULL, 38.00, NULL, 35.00, NULL, 38.00, 48, 49, NULL, 50, NULL, NULL, 35, NULL, 30.75, 30.86, 187, 3511.00, 7.00, 7.80, 2200, 6.40, 3.40, 'admin', '2020-01-14 16:05:06', NULL, 0);
INSERT INTO `t_record_data` VALUES (39, '2020-05-28 14:10:00', '默认', 9, 6000, 90, 90, 66, NULL, NULL, 35.00, 38.00, NULL, NULL, 35, 38.00, 55, 42, NULL, NULL, 50, NULL, NULL, 30, 30.96, 30.92, 187, 3596.00, 6.50, 7.95, 2200, 6.60, 3.50, 'admin', '2020-01-14 16:05:06', NULL, 0);

-- ----------------------------
-- Table structure for t_tubu_data
-- ----------------------------
DROP TABLE IF EXISTS `t_tubu_data`;
CREATE TABLE `t_tubu_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zDate` date DEFAULT NULL COMMENT '日期',
  `zTime` time(0) DEFAULT NULL COMMENT '时间',
  `zRation` double DEFAULT NULL COMMENT '基片定量',
  `zWater` double DEFAULT NULL COMMENT '水分均值',
  `zWd` double DEFAULT NULL COMMENT '涂布液温度',
  `zViscosity` double DEFAULT NULL COMMENT '涂布液粘度',
  `zDegrees` double DEFAULT NULL COMMENT '波美度',
  `zLevel` double DEFAULT NULL COMMENT '涂布槽液位',
  `zSpeed` double DEFAULT NULL COMMENT '车速',
  `zDrive` double DEFAULT NULL COMMENT '传动侧',
  `zOperation` double DEFAULT NULL COMMENT '操作侧',
  `zBeating` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '打浆度',
  `zWeight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '湿重',
  `zCoating` double DEFAULT NULL COMMENT '涂布率',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tubu_data
-- ----------------------------
INSERT INTO `t_tubu_data` VALUES (1, '2021-05-08', '18:30:00', 63.7375, 18.1125, 49, 11, 26, 3, 110, 0.16, 0.15, NULL, NULL, 35.925, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (2, '2021-05-08', '20:00:00', 64.0125, 17.0125, 50, 11, 26, 3, 112.4, 0.16, 0.15, NULL, NULL, 35.3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (3, '2021-05-08', '21:20:00', 66.125, 21.275731, 49, 11, 26, 3, 112.3, 0.16, 0.15, NULL, NULL, 34.735422, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (4, '2021-05-10', '01:00:00', 63.35, 21.05, 49, 12, 25.5, 2, 106.4, 0.15, 0.15, NULL, NULL, 34.8, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (5, '2021-05-10', '03:20:00', 63.5875, 19.625, 48, 12, 25.5, 2, 110, 0.15, 0.15, NULL, NULL, 34.725, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (6, '2021-05-10', '04:50:00', 63.2125, 19.175, 48, 12, 26.5, 3, 110, 0.15, 0.15, NULL, NULL, 36.425, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (7, '2021-05-11', '01:00:00', 62.7875, 17.7, 46, 16, 26.5, 3, 108, 0.15, 0.15, NULL, NULL, 36.025, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (8, '2021-05-11', '03:30:00', 62.4125, 20.6375, 47, 15, 26.5, 3, 108, 0.15, 0.15, NULL, NULL, 35.9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (9, '2021-05-11', '05:00:00', 63.5375, 22.1875, 49, 16, 26.5, 3, 110, 0.15, 0.15, NULL, NULL, 36.025, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (10, '2021-05-13', '09:00:00', 64.9875, 22.075, 62, 8, 25, 2, 106, 0.15, 0.15, NULL, NULL, 34.3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (11, '2021-05-13', '11:30:00', 66.5, 20.75, 62, 8, 25, 2, 106, 0.15, 0.15, NULL, NULL, 33.1875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (12, '2021-05-13', '13:30:00', 63.4, 21.875, 60, 9, 26.5, 3, 106, 0.15, 0.15, NULL, NULL, 35.7375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (13, '2021-05-14', '09:30:00', 63.4, 17.2875, 47, 12, 25.5, 3, 102, 0.15, 0.15, NULL, NULL, 36.2875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (14, '2021-05-14', '11:30:00', 63.2875, 21.2375, 48, 12, 25.5, 3, 105, 0.15, 0.15, NULL, NULL, 34.825, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (15, '2021-05-14', '15:00:00', 63.825, 17.025, 48, 12, 25.5, 3, 103, 0.15, 0.15, NULL, NULL, 34.975, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (16, '2021-05-15', '17:00:00', 64.025, 22.6625, 52, 14, 26.5, 3, 106, 0.14, 0.14, NULL, NULL, 36.825, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (17, '2021-05-15', '19:30:00', 63.6375, 21.5, 50, 14, 26.5, 2, 102, 0.15, 0.15, NULL, NULL, 34.625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (18, '2021-05-15', '21:40:00', 63.6375, 18.425, 50, 13, 25.5, 2, 108, 0.15, 0.15, NULL, NULL, 34.5875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (19, '2021-05-15', '23:00:00', 62.65, 17.9875, 50, 13, 26.5, 3, 106, 0.15, 0.15, NULL, NULL, 36.1625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (20, '2021-05-16', '17:30:00', 63.1875, 16.8625, 45, 11, 26, 2, 105, 0.15, 0.15, NULL, NULL, 36.4625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (21, '2021-05-16', '20:00:00', 63.575, 22.9125, 45, 12, 26, 3, 104, 0.15, 0.15, NULL, NULL, 36.375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (22, '2021-05-16', '22:00:00', 66.4, 17.575, 45, 12, 26, 3, 105, 0.15, 0.15, NULL, NULL, 35.1625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (23, '2021-05-16', '23:30:00', 66.8625, 20.15, 45, 13, 26.5, 3, 107, 0.14, 0.14, NULL, NULL, 35.65, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (24, '2021-05-18', '01:00:00', 63.325, 17.5875, 46, 11, 24, 3, 108, 0.15, 0.15, NULL, NULL, 35.2625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (25, '2021-05-18', '03:20:00', 63.375, 17.55, 46, 11, 24, 3, 108, 0.15, 0.15, NULL, NULL, 35.275, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (26, '2021-05-18', '05:45:00', 63.55, 19.325, 43, 10, 26, 3, 109, 0.15, 0.15, NULL, NULL, 36.4625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (27, '2021-05-18', '07:00:00', 64.2375, 20.4, 43, 10, 26, 3, 109, 0.15, 0.15, NULL, NULL, 35.4625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (28, '2021-05-19', '00:50:00', 62.6125, 21.9625, 42, 11, 26, 3.5, 107, 0.14, 0.14, NULL, NULL, 37.3625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (29, '2021-05-19', '04:00:00', 63.875, 24.1625, 42, 11, 26, 3, 108, 0.15, 0.15, NULL, NULL, 36.35, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (30, '2021-05-19', '05:20:00', 63.6875, 18.2, 42, 11, 25, 3, 109, 0.15, 0.15, NULL, NULL, 36.175, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (31, '2021-05-21', '09:00:00', 62.8625, 20.9375, 43, 9, 26, 3, 106, 0.15, 0.15, '33', '4.1', 37.525, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (32, '2021-05-21', '10:00:00', 64, 22.5375, 43, 9, 26, 2.5, 105, 0.15, 0.15, '33', '4.25', 36.1625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (33, '2021-05-21', '12:00:00', 62.65, 23.2875, 44, 10, 26, 2.5, 107, 0.15, 0.15, '36', '3.87', 35.3875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (34, '2021-05-21', '13:30:00', 63.5875, 21.05, 44, 10, 26, 2.5, 106, 0.15, 0.15, '36', '3.79', 34.875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (35, '2021-05-21', '15:30:00', 63.3875, 23.375, 44, 10, 26, 3, 106, 0.15, 0.15, '39', '3.71', 36.1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (36, '2021-05-22', '09:00:00', 62.975, 14.55, 45, 9, 25, 2, 111, 0.15, 0.15, '32', '3.9', 35.15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (37, '2021-05-22', '10:00:00', 64.5375, 16.6, 45, 9, 25, 2, 112, 0.15, 0.15, '32', '3.82', 34.6125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (38, '2021-05-22', '12:30:00', 63.7375, 14.725, 45, 9, 25, 2, 112, 0.15, 0.15, '37', '4.05', 34.0875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (39, '2021-05-23', '16:50:00', 61.55, 18.7375, 45, 12, 24.5, 3, 110, 0.15, 0.15, '30', '4.67', 37.6875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (40, '2021-05-23', '19:00:00', 63.6, 19.5875, 45, 12, 24.5, 3, 111, 0.15, 0.15, '35', '4.12', 36.025, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (41, '2021-05-23', '21:00:00', 61.325, 18.5625, 43, 13, 26, 3, 112, 0.15, 0.15, '31', '4.39', 38.4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (42, '2021-05-23', '22:30:00', 64.6875, 20.175, 43, 13, 26, 3, 112, 0.15, 0.15, '32.5', '4.22', 35.15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (43, '2021-05-23', '23:30:00', 63.825, 19.5, 43, 13, 26, 3, 112, 0.15, 0.15, '31', '4.54', 36.1125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (44, '2021-05-24', '17:00:00', 62.9875, 19.6625, 47, 12, 26, 2, 110, 0.17, 0.17, '26', '4.5', 33.8375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (45, '2021-05-24', '19:00:00', 64.2125, 17.875, 46, 12, 26, 2, 111, 0.17, 0.17, '27', '4.42', 34.2375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (46, '2021-05-24', '21:30:00', 63.7125, 20.2, 46, 12, 26, 3, 111, 0.15, 0.15, '28', '4.37', 35.8375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (47, '2021-05-24', '23:00:00', 64.55, 21.8375, 46, 12, 26, 3, 111, 0.15, 0.15, '29', '4.17', 35.35, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (48, '2021-05-26', '01:15:00', 62.2375, 18.2125, 47, 11, 27, 3, 110, 0.15, 0.15, '28', '4.5', 37.7625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (49, '2021-05-26', '03:10:00', 64.05, 19.1375, 47, 11, 27, 3, 110, 0.15, 0.15, '29', '4.31', 35.825, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (50, '2021-05-26', '05:40:00', 65.175, 19.3, 47, 11, 27, 3, 109, 0.15, 0.15, '34', '4.25', 34.875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (51, '2021-05-27', '01:10:00', 63.7125, 20.8875, 45, 8, 24, 3, 110, 0.15, 0.15, '27', '4.48', 37.2375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (52, '2021-05-27', '03:00:00', 61.775, 21.2, 45, 10, 24.5, 3, 112, 0.15, 0.15, '33', '4.06', 35.575, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (53, '2021-05-27', '05:00:00', 63.0625, 21.875, 45, 9, 24, 3, 110, 0.15, 0.15, '35', '3.86', 34.5375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (54, '2021-05-29', '09:20:00', 64.025, 19.8375, 47, 9, 25.5, 3, 110, 0.15, 0.15, '27', '4.4', 36.825, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (55, '2021-05-29', '11:40:00', 63.6625, 16.825, 47, 9, 25.5, 3, 110, 0.15, 0.15, '31', '4.2', 35.3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (56, '2021-05-29', '13:00:00', 63.6125, 21.5375, 47, 10, 26, 3, 112, 0.15, 0.15, '32', '4.08', 34.8875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (57, '2021-05-29', '15:50:00', 64.025, 20.525, NULL, NULL, NULL, 3, 111, 0.14, 0.14, '32', '4.16', 35.975, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (58, '2021-05-30', '09:00:00', 64.2, 20.8625, 48, 14, 25, 3, 112, 0.15, 0.15, '28', '4.3', 35.375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (59, '2021-05-30', '12:00:00', 62.9375, 17.8375, 48, 14, 25, 3, 112, 0.15, 0.15, '33', '3.85', 34.5875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (60, '2021-05-30', '15:00:00', 63.9, 21.1, 46, 12, 26.5, 3, 112, 0.15, 0.15, '32', '3.98', 36.1625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (61, '2021-05-30', '15:50:00', 64.1, 19.7875, 46, 12, 26, 3, 110, 0.15, 0.15, '30', '4.5', 35.8875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (62, '2021-05-31', '17:40:00', 63.9125, 21.575, 48, 12, 26, NULL, NULL, NULL, NULL, '28', '4.72', 36.6125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (63, '2021-05-31', '20:30:00', 63.9625, 19.025, 48, 11, 26, 3, 108, 0.15, 0.15, '29', '4.6', 36.15, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (64, '2021-05-31', '21:30:00', 63.65, 18.4, 48, 11, 26, 3, 110, 0.15, 0.15, '31', '4.38', 35.6625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (65, '2021-05-31', '23:00:00', 63.8375, 25.0625, 48, 11, 26, 3, 110, 0.15, 0.15, '27', '4.9', 36.8125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (66, '2021-06-01', '22:00:00', 62.55, 15.875, 45, 15, 26, 2, 95, 0.15, 0.15, '31', '3.3', 34.675, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (67, '2021-06-03', '01:30:00', 64.05, 20.8, 47, 13, 26.5, 3, 100, 0.15, 0.15, '26', '4.7', 37.325, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (68, '2021-06-03', '03:20:00', 64.0625, 20.35, 47, 13, 26.5, 3, 100, 0.15, 0.15, '30', '4.2', 36, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (69, '2021-06-03', '05:10:00', 64.0375, 22.9125, 45, 12, 26.5, 3, 100, 0.15, 0.15, NULL, NULL, 35.725, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (70, '2021-06-04', '01:00:00', 64.2125, 18.675, 40, 12, 26, 3, 105, 0.15, 0.15, '27', '4.68', 36.3125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (71, '2021-06-04', '03:20:00', 63.4875, 20.3125, 42, 12, 26.5, 3, 105, 0.15, 0.15, '27', '4.59', 36.575, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (72, '2021-06-04', '05:20:00', 63.9, 16.0625, 41, 12, 26, 3, 105, 0.15, 0.15, '28', '4.7', 36.475, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (73, '2021-06-04', '07:00:00', 65.1125, 24.425, 45, 10, 26.5, NULL, NULL, NULL, NULL, '28', '4.78', 34.875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (74, '2021-06-06', '09:10:00', 63.8375, 15.2875, 46, 10, 27, 2, 106, 0.15, 0.15, '26', '5.12', 37.125, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (75, '2021-06-06', '12:25:00', 64.425, 15.2875, 46, 10, 25, 3, 106, 0.15, 0.15, '33', '4.22', 34.5375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (76, '2021-06-06', '14:00:00', 64.0625, 16.1625, 46, 10, 26, 3, 106, 0.15, 0.15, '27', '4.65', 35.6375, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (77, '2021-06-06', '15:10:00', 67.275, 14.9125, 46, 10, 26, 3, 106, 0.15, 0.15, '28', '4.78', 34.475, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (78, '2021-06-07', '09:00:00', 67.775, 17.775, 40, 10, 26, 3, 110, 0.15, 0.15, '27', '4.82', 33.9875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (79, '2021-06-07', '12:00:00', 64.725, 16.9375, 40, 10, 26, 3, 110, 0.14, 0.14, '28', '4.75', 36.525, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (80, '2021-06-07', '14:00:00', 67.1375, 14.65, 40, 10, 26, 3, 110, 0.14, 0.14, '28', '4.69', 35.7875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (81, '2021-06-07', '16:00:00', 66.95, 16.1375, 40, 10, 27, 3, 110, 0.14, 0.14, '28', '4.61', 36.4875, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (82, '2021-06-08', '19:00:00', 62.9, 18.175, 45, 13, 25, 3, 110, 0.15, 0.15, '33', '4.28', 35.425, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (83, '2021-06-08', '21:00:00', 62.4125, 15.8, 45, 13, 25, 3, 110, 0.15, 0.15, '33', '4.2', 34.6625, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_tubu_data` VALUES (84, '2021-06-08', '22:10:00', 65.2375, 17.8625, 48, 11, 26, 3, 110, 0.15, 0.15, '31', '4.49', 35.1375, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `TB_CLASS_INFOCLASSINFO`
-- ----------------------------
DROP TABLE IF EXISTS `TB_CLASS_INFOCLASSINFO`;
CREATE TABLE `TB_CLASS_INFOCLASSINFO` (
`CLASSINFO_ID` varchar(100) NOT NULL,
    `KINDERGARTEN_ID` varchar(255) DEFAULT NULL COMMENT '园区名称',
    `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '班级名称',
    `QUANTITY` int(11) NOT NULL COMMENT '班级人数',
    `MAIN_TEACHER_ID` varchar(255) DEFAULT NULL COMMENT '班主任老师',
    `DIETITIAN_ID` varchar(255) DEFAULT NULL COMMENT '营养师',
    `CLASS_TYPE` varchar(255) DEFAULT NULL COMMENT '班级类型',
    `STATUS` varchar(255) DEFAULT NULL COMMENT '班级状态',
    `CLASS_BEGIN_TIME` varchar(255) DEFAULT NULL COMMENT '开班时间',
    `GROWTH_STAGE_BEGIN` varchar(255) DEFAULT NULL COMMENT '成长阶段开始时间',
    `GROWTH_STAGE_END` varchar(255) DEFAULT NULL COMMENT '成长阶段结束',
    `STATUS_CHANGE_TIME` varchar(255) DEFAULT NULL COMMENT '状态改变日期',
    `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '班级简介',
    `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (`CLASSINFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_pickrecord`
-- ----------------------------
DROP TABLE IF EXISTS `tb_pickrecord`;
CREATE TABLE `tb_pickrecord` (
 		`PICKRECORD_ID` varchar(100) NOT NULL,
		`NAME` varchar(255) DEFAULT NULL COMMENT '学生姓名',
		`PICK_DATETIME` varchar(255) DEFAULT NULL COMMENT '接送时间',
		`PICK_PEOPLE_ID` varchar(255) DEFAULT NULL COMMENT '接送人ID',
		`PICK_PEOPLE_NAME` varchar(255) DEFAULT NULL COMMENT '接送人名称',
		`IS_ENTRUST` varchar(255) DEFAULT NULL COMMENT '是否代接',
		`ENTRUST_CARD` varchar(255) DEFAULT NULL COMMENT '代理人身份证号',
		`ENTRUST_NAME` varchar(255) DEFAULT NULL COMMENT '代理人姓名',
		`ENTRUST_PHOTO` varchar(255) DEFAULT NULL COMMENT '代理人照片',
		`ENTRUST_CARD_PHOTO` varchar(255) DEFAULT NULL COMMENT '代理人身份证照片',
		`ENTRUST_INFO` varchar(255) DEFAULT NULL COMMENT '委托详情',
		`TYPE` varchar(255) DEFAULT NULL COMMENT '0:送 1:接',
		`STATUS` varchar(255) DEFAULT NULL COMMENT '数据状态',
  		PRIMARY KEY (`PICKRECORD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_parent_infoparent`
-- ----------------------------
DROP TABLE IF EXISTS `tb_parent_infoparent`;
CREATE TABLE `tb_parent_infoparent` (
`PARENT_ID` varchar(100) NOT NULL,
    `NAME` varchar(255) DEFAULT NULL COMMENT '家长姓名',
    `STUDENT_ID` varchar(255) DEFAULT NULL COMMENT '被监护人',
    `RELATION` varchar(255) DEFAULT NULL COMMENT '亲属关系',
    `BLOOD_TYPE` varchar(255) DEFAULT NULL COMMENT '血型',
    `GENDER` varchar(255) DEFAULT NULL COMMENT '性别',
    `ID_CARD_NUM` varchar(255) DEFAULT NULL COMMENT '身份证',
    `TELEPHONE` varchar(255) DEFAULT NULL COMMENT '联系电话',
    `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

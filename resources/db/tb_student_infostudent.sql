SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_student_infostudent`
-- ----------------------------
DROP TABLE IF EXISTS `tb_student_infostudent`;
CREATE TABLE `tb_student_infostudent` (
`STUDENT_ID` varchar(100) NOT NULL,
    `STUDENT_NO` varchar(255) DEFAULT NULL COMMENT '学生学号',
    `NAME` varchar(255) DEFAULT NULL COMMENT '学生名称',
    `BIRTHDAY` varchar(255) DEFAULT NULL COMMENT '出生日期',
    `GENDER` varchar(255) DEFAULT NULL COMMENT '性别',
    `BLOOD_TYPE` varchar(255) DEFAULT NULL COMMENT '血型',
    `ID_CARD_NUMBER` varchar(255) DEFAULT NULL COMMENT '身份证',
    `ADDRESS` varchar(255) DEFAULT NULL COMMENT '家庭住址',
    `KINDERGARTEN_ID` varchar(255) DEFAULT NULL COMMENT '园区名称',
    `CLASS_ID` varchar(255) DEFAULT NULL COMMENT '班级名称',
    `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (`STUDENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

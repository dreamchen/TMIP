/*
Navicat MySQL Data Transfer

Source Server         : mySqlserver
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : numysql

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2015-07-30 22:59:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_org
-- ----------------------------
DROP TABLE IF EXISTS `tb_org`;
CREATE TABLE `tb_org` (
  `ORG_ID` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL COMMENT '园区名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '组织机构代码',
  `P_ID` varchar(255) DEFAULT NULL COMMENT '上级机构代码',
  `CLASS` int(11) DEFAULT NULL COMMENT '级别',
  `ORDERS` int(11) DEFAULT NULL COMMENT '顺序',
  `CREATEDATE` varchar(255) DEFAULT NULL COMMENT '成立时间',
  `PERSONNUM` int(11) DEFAULT NULL COMMENT '人数规模',
  `LEADER` varchar(255) DEFAULT NULL COMMENT '园长',
  `ADDRESS` varchar(255) DEFAULT NULL COMMENT '地址',
  `PHONE` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `URL` varchar(255) DEFAULT NULL COMMENT '官方网址',
  `INTRO` varchar(255) DEFAULT NULL COMMENT '简介',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '其他备注',
  `DEFAULTONE` varchar(255) DEFAULT NULL COMMENT '预留字段一',
  `DEFAULTTWO` varchar(255) DEFAULT NULL COMMENT '预留字段二',
  `DEFAULTTHREE` varchar(255) DEFAULT NULL COMMENT '预留字段三',
  `PCODE` varchar(255) DEFAULT NULL COMMENT '上级机构代码',
  PRIMARY KEY (`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_org
-- ----------------------------
INSERT INTO `tb_org` VALUES ('08fbc8ac71e94dd6a4d0f98d3adcbdfc', '天恩研究院', 'TE', '0', '1', '1', '2015-07-26', '100', '测试园长', '北京市西城区复兴门', '', '', '', '', '', null, null, null, 'TE');
INSERT INTO `tb_org` VALUES ('2947c877dcbc47cd832f0a42a24ecf90', '好朋友幼儿园', 'HPY', '0', '1', '2', '2015-07-26', '50', '测试园长2', '北京市', '12191211', '', '', '', '', null, null, null, 'HPY');
INSERT INTO `tb_org` VALUES ('a2621e1d60af4923b6fa647f9a5c091b', '运营部', 'YYB', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', '2', '1', '2015-07-26', '20', '测试', '北京市西城区复兴门', '', '', '', '', '', null, null, null, 'TE_YYB');
INSERT INTO `tb_org` VALUES ('a3bdb576096c4b76b236f2fb78727a31', '实施部', 'SSB', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '3', '2015-07-26', '20', '测试园长3', '北京', '', '', '', '', '', null, null, null, 'TE_SSB');
INSERT INTO `tb_org` VALUES ('ce12c48fa7434777ad8325d6e2650091', '技术部', 'JSB', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '2', '2015-07-28', '20', '测试园长', '北京', '', '', '', '', '', null, null, null, 'TE_JSB');
INSERT INTO `tb_org` VALUES ('f308337449bc40699f55a1a402331bb7', '运营一部', 'YYYB', 'a2621e1d60af4923b6fa647f9a5c091b', null, '1', '2015-07-12', '12', '测试园长2', '北京', '89291241', '', '', '', '', null, null, null, 'YYB_YYYB');

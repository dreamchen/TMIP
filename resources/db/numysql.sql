/*
Navicat MySQL Data Transfer

Source Server         : mySqlserver
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : numysql

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2015-08-07 17:14:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_andorra
-- ----------------------------
DROP TABLE IF EXISTS `sys_andorra`;
CREATE TABLE `sys_andorra` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '广告ID',
  `title` varchar(200) DEFAULT NULL COMMENT '广告标题',
  `content` varchar(200) DEFAULT NULL COMMENT '广告内容',
  `type` char(2) DEFAULT NULL COMMENT '广告类型  0为默认文字广告，1为图片广告',
  `adurl` varchar(200) DEFAULT NULL COMMENT '广告图片地址',
  `publisher` varchar(50) DEFAULT NULL COMMENT '广告发布人',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `uptime` datetime DEFAULT NULL COMMENT '修改时间',
  `starttime` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `status` char(2) DEFAULT '0' COMMENT '状态  0为默认未启用，1为启用',
  `tourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_andorra
-- ----------------------------
INSERT INTO `sys_andorra` VALUES ('2', 'dddd', '<p>dddd</p>', '1', '286787ecf43449518b92fb3f04361cab.jpg', 'ssss', '2015-04-19 02:58:21', '2015-04-19 02:58:21', '2015-04-01', '2015-03-31', '1', 'dddd');
INSERT INTO `sys_andorra` VALUES ('3', '3223', '<p>2323</p>', '0', '7c8b113096cc4c3dbc52e6ae1cfaa6b7.jpg', '2323', '2015-07-21 13:55:34', '2015-07-21 13:55:34', '2015-07-01', '2015-07-09', '0', '23');
INSERT INTO `sys_andorra` VALUES ('4', '555', '<p>555</p>', '0', 'a443404010f54b74bae79cb6a1579b48.jpg', '555', '2015-07-21 13:56:07', '2015-07-21 13:57:24', '2015-07-01', '2015-07-04', '0', '555');
INSERT INTO `sys_andorra` VALUES ('5', '34', '<p>34<br/></p>', '0', '', '34', '2015-07-22 23:17:58', '2015-07-22 23:17:58', '2015-07-01', '2015-07-03', '0', '343');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('04762c0b28b643939455c7800c2e2412', 'dsfsd', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'w', '', '55896f5ce3c0494fa6850775a4e29ff6', '', '', '1', '', '18766666666', '', '', '', '0', '001', '18766666666@qq.com');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('0b4db8b3afd143f4bb35b1fd459dd69a', '管理员', 'GLY', '1', '54adf5e5110e4a14a4b39fe96025e56d', '2', 'GW_GLY');
INSERT INTO `sys_dictionaries` VALUES ('0cc3e51ad37a4da0a1f40517d0645cc6', 'b型', 'b', '2', '0e661c6e22c9411b8813c71b1ac3a10f', '2', 'xx_b');
INSERT INTO `sys_dictionaries` VALUES ('0e661c6e22c9411b8813c71b1ac3a10f', '血型', 'xx', '1', '0', '1', 'xx');
INSERT INTO `sys_dictionaries` VALUES ('212a6765fddc4430941469e1ec8c8e6c', '人事部', '001', '1', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_001');
INSERT INTO `sys_dictionaries` VALUES ('3cec73a7cc8a4cb79e3f6ccc7fc8858c', '行政部', '002', '2', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_002 ');
INSERT INTO `sys_dictionaries` VALUES ('48724375640341deb5ef01ac51a89c34', '北京', 'dq001', '1', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_dq001');
INSERT INTO `sys_dictionaries` VALUES ('54adf5e5110e4a14a4b39fe96025e56d', '岗位', 'GW', '1', '0', '1', 'GW');
INSERT INTO `sys_dictionaries` VALUES ('5a1547632cca449db378fbb9a042b336', '研发部', '004', '4', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_004');
INSERT INTO `sys_dictionaries` VALUES ('5ac39ddbb0ad4da4a957c2a2a19074ce', 'A型', 'a', '1', '0e661c6e22c9411b8813c71b1ac3a10f', '2', 'xx_a');
INSERT INTO `sys_dictionaries` VALUES ('5e606c0bcc5847819e77519de1039ea6', '1212', '121212', '12', 'bc4effee89a24cc4bb5ffbe329a2b4f5', '2', '1001_121212');
INSERT INTO `sys_dictionaries` VALUES ('6e301571307648f3b161bd6330b39d41', '性别', 'xb', '1', '0', '1', 'xb');
INSERT INTO `sys_dictionaries` VALUES ('7165f8defb8b4077bd9fd5e68a53b4e4', '教育', 'JY', '2', 'fe4d5027ae174551990ef46bf5e0351f', '2', 'JGLX_JY');
INSERT INTO `sys_dictionaries` VALUES ('7f9cd74e60a140b0aea5095faa95cda3', '财务部', '003', '3', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_003');
INSERT INTO `sys_dictionaries` VALUES ('94620a44df7f4a66ade74a78046811d7', '女', 'f', '2', '6e301571307648f3b161bd6330b39d41', '2', 'xb_f');
INSERT INTO `sys_dictionaries` VALUES ('9c43ff8f72b243b295fc6f123b4dddcb', '2', '2', '2', '212a6765fddc4430941469e1ec8c8e6c', '3', '001_2');
INSERT INTO `sys_dictionaries` VALUES ('b1021430262444fab543b0bf030405ad', '32', '32', '32', 'bc4effee89a24cc4bb5ffbe329a2b4f5', '2', '1001_32');
INSERT INTO `sys_dictionaries` VALUES ('b861bd1c3aba4934acdb5054dd0d0c6e', '科技不', 'kj', '7', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_kj');
INSERT INTO `sys_dictionaries` VALUES ('bc4effee89a24cc4bb5ffbe329a2b4f5', '1001', '1001', '3', '0', '1', '1001');
INSERT INTO `sys_dictionaries` VALUES ('bf53e5d52c044e599c2cef3471de59be', '行政', 'XZ', '1', 'fe4d5027ae174551990ef46bf5e0351f', '2', 'JGLX_XZ');
INSERT INTO `sys_dictionaries` VALUES ('c067fdaf51a141aeaa56ed26b70de863', '部门', 'BM', '1', '0', '1', 'BM');
INSERT INTO `sys_dictionaries` VALUES ('c7dfcde2022b4a3ea04cbda73f8ab2db', '1', '1', '1', '212a6765fddc4430941469e1ec8c8e6c', '3', '001_1');
INSERT INTO `sys_dictionaries` VALUES ('cd2fe13e5b7949b0b39094dae42a9e38', '数学老师', 'SXLS', '2', '54adf5e5110e4a14a4b39fe96025e56d', '2', 'GW_SXLS');
INSERT INTO `sys_dictionaries` VALUES ('cdba0b5ef20e4fc0a5231fa3e9ae246a', '地区dsfs ', 'DQ', '2', '0', '1', 'DQ');
INSERT INTO `sys_dictionaries` VALUES ('d55be5d50175479c915cddda0363ba98', '男', 'm', '1', '6e301571307648f3b161bd6330b39d41', '2', 'xb_m');
INSERT INTO `sys_dictionaries` VALUES ('d82a9b9f83dc4e2abba1493b2a941da6', '英语老师', 'YYLS', '1', '54adf5e5110e4a14a4b39fe96025e56d', '2', 'GW_YYLS');
INSERT INTO `sys_dictionaries` VALUES ('db83014c6375462190dfe180ed426b65', '园长', 'YZ', '3', '54adf5e5110e4a14a4b39fe96025e56d', '2', 'GW_YZ');
INSERT INTO `sys_dictionaries` VALUES ('f184bff5081d452489271a1bd57599ed', '上海', 'SH', '2', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_SH');
INSERT INTO `sys_dictionaries` VALUES ('f30bf95e216d4ebb8169ff0c86330b8f', '客服部', '006', '6', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_006');
INSERT INTO `sys_dictionaries` VALUES ('fb9d5637654d41c8aa0afb8611abaa8a', '10011', '10011', '1', 'bc4effee89a24cc4bb5ffbe329a2b4f5', '2', '1001_10011');
INSERT INTO `sys_dictionaries` VALUES ('fe4d5027ae174551990ef46bf5e0351f', '机构类型', 'JGLX', '5', '0', '1', 'JGLX');

-- ----------------------------
-- Table structure for sys_featured
-- ----------------------------
DROP TABLE IF EXISTS `sys_featured`;
CREATE TABLE `sys_featured` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '特别推荐ID',
  `title` varchar(200) DEFAULT NULL COMMENT '特别推荐标题',
  `content` varchar(300) DEFAULT NULL COMMENT '特别推荐内容',
  `url` varchar(300) DEFAULT NULL COMMENT '特别推荐连接地址',
  `heat` char(2) DEFAULT '0' COMMENT '热度  按1 2 3 4 5级',
  `stars` char(2) DEFAULT '0' COMMENT '星级  按1 2 3 4 5级',
  `sequence` int(10) DEFAULT '0' COMMENT '排序',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `uptime` datetime DEFAULT NULL COMMENT '修改时间',
  `status` char(2) DEFAULT '0' COMMENT '状态 0为未启用，1为启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_featured
-- ----------------------------
INSERT INTO `sys_featured` VALUES ('1', 'ssss', '<p>ssss</p>', 'ssss', '1', '1', '22323', '2015-04-19 02:59:11', '2015-07-21 13:44:45', '1');

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('62ed077ca1c64ef992dffa6707a15e80', '4', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('a69cd28c85b14a4caa495eafd5bfeefd', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b2ceca5ce31147e3b7082cb778188213', 'fc558ba8d47b4739a6debc7974da9f9f', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b86ec116fd804d7e9d8b6a8b895c70ca', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e442481ea4c4488386be0fa3a7755892', '4', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('fc558ba8d47b4739a6debc7974da9f9f', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_link
-- ----------------------------
DROP TABLE IF EXISTS `sys_link`;
CREATE TABLE `sys_link` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '友情链接ID',
  `stiename` varchar(100) DEFAULT NULL COMMENT '友情链接网站名称',
  `sitecontent` varchar(200) DEFAULT NULL COMMENT '友情链接网站内容',
  `type` char(2) DEFAULT '0' COMMENT '类型  0为文字连接，1为图片连接',
  `stieurl` varchar(200) DEFAULT NULL COMMENT '图片连接地址',
  `addtime` varchar(50) DEFAULT NULL COMMENT '添加时间',
  `uptime` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `status` char(2) DEFAULT '0' COMMENT '状态  0为未启用，1为启用',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `tourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_link
-- ----------------------------
INSERT INTO `sys_link` VALUES ('1', 'sdfsd2222', '<p>sdfsd222</p>', '1', 'acf1784d058149d3a1b6349f5c89d208.png', '2014-12-02 13:49:59', '2014-12-02 13:53:55', '0', '3', 'sdf222');
INSERT INTO `sys_link` VALUES ('2', 'sdfs', '<p>sdfsdf</p>', '0', '438994ecc7fe42539db7daa2b9b0a9d0.png', '2015-04-19 03:00:49', '2015-04-19 03:00:49', '0', '2', 'sdfsdf');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-desktop', '1');
INSERT INTO `sys_menu` VALUES ('2', '组织管理', 'role.do', '1', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('4', '会员管理', 'happuser/listUsers.do', '1', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('6', '信息管理', '#', '0', '2', 'icon-list', '2');
INSERT INTO `sys_menu` VALUES ('7', '图片管理', 'pictures/list.do', '6', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'icon-th', '1');
INSERT INTO `sys_menu` VALUES ('10', '接口测试', 'tool/interfaceTest.do', '9', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('11', '发送邮件', 'tool/goSendEmail.do', '9', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('12', '置二维码', 'tool/goTwoDimensionCode.do', '9', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('13', '多级别树', 'tool/ztree.do', '9', '5', null, '1');
INSERT INTO `sys_menu` VALUES ('14', '地图工具', 'tool/map.do', '9', '6', null, '1');
INSERT INTO `sys_menu` VALUES ('15', '广告管理', 'andorra/list.do', '6', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('16', '特别推荐', 'featured/list.do', '6', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('17', '线路管理', 'line/list.do', '6', '4', null, '2');
INSERT INTO `sys_menu` VALUES ('18', '友情链接', 'org/list.do', '6', '6', null, '2');
INSERT INTO `sys_menu` VALUES ('19', '新闻管理', 'news/list.do', '6', '7', null, '2');
INSERT INTO `sys_menu` VALUES ('20', '公告管理', 'notice/list.do', '6', '8', null, '2');
INSERT INTO `sys_menu` VALUES ('21', '园区组织管理', 'user/userTree.do?DEPTID=0', '1', '6', null, '1');
INSERT INTO `sys_menu` VALUES ('22', '园区信息', 'org.do?P_ID=0', '6', '6', null, '2');
INSERT INTO `sys_menu` VALUES ('23', '幼儿园1', '#', '0', '5', null, '1');
INSERT INTO `sys_menu` VALUES ('24', '管理员', '#', '23', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('25', '管理员2', '#', '23', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '学生管理', 'student/studentTree.do', '1', '7', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '家长管理', 'parent/list.do', '1', '8', null, '1');
INSERT INTO `sys_menu` VALUES ('28', '班级管理', 'classinfo/classinfoTree.do', '1', '9', null, '1');

-- ----------------------------
-- Table structure for sys_news
-- ----------------------------
DROP TABLE IF EXISTS `sys_news`;
CREATE TABLE `sys_news` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
  `title` varchar(150) DEFAULT NULL COMMENT '新闻标题',
  `content` text COMMENT '新闻内容',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布人',
  `addtime` varchar(50) DEFAULT NULL COMMENT '发布时间',
  `uptime` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `pip` varchar(50) DEFAULT NULL COMMENT '发布IP',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `sequence` int(10) DEFAULT '0' COMMENT '排序',
  `recommand` char(2) DEFAULT '0' COMMENT '推荐  0默认未推荐，1推荐',
  `status` char(2) DEFAULT '0' COMMENT '状态  0默认未发布，1发布',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_news
-- ----------------------------
INSERT INTO `sys_news` VALUES ('2', '新闻标题2', '<p>新闻内容2</p>', '张三2', '2014-12-01 20:59:33', '2015-02-08 23:51:26', '127.0.0.1', '0', '2', '1', '1');
INSERT INTO `sys_news` VALUES ('3', '世界大事件', '<p>wwww</p>', 'fdgf', '2014-12-02 01:07:41', '2015-04-19 03:02:29', '127.0.0.1', '0', '0', '0', '1');
INSERT INTO `sys_news` VALUES ('5', '新闻三十分', '<p>4565656</p>', '456465', '2014-12-15 11:38:59', '2015-04-19 03:01:58', '127.0.0.1', '0', '4564', '0', '1');
INSERT INTO `sys_news` VALUES ('6', '国家主席', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>', 'ddddd', '2014-12-24 10:55:34', '2015-04-19 03:02:40', '127.0.0.1', '0', '0', '0', '1');
INSERT INTO `sys_news` VALUES ('7', '足球新闻部', '<p>sdfs</p>', 'sdf', '2015-04-19 03:01:06', '2015-04-19 03:02:13', '127.0.0.1', '0', '3', '0', '0');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` varchar(500) NOT NULL COMMENT '公告内容',
  `publisher` varchar(50) NOT NULL COMMENT '公告发布人',
  `addtime` datetime NOT NULL COMMENT '公告发布时间',
  `uptime` datetime NOT NULL COMMENT '修改时间',
  `status` char(2) NOT NULL DEFAULT '0' COMMENT '状态  0默认未启用，1启用',
  `sequence` int(10) DEFAULT '0' COMMENT '公告排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('2', 'ww1', 'www2', 'www3', '2014-12-01 21:39:13', '2014-12-01 21:39:20', '1', '1');
INSERT INTO `sys_notice` VALUES ('3', 'sdf', '<p>sdfs</p>', 'dfsd', '2015-04-19 03:01:15', '2015-04-19 03:01:15', '0', '44');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '478150646', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '478150646', '1', '471859446', '471859254', '471859254', '476053622', '2');
INSERT INTO `sys_role` VALUES ('4', '用户组', '98550', '0', '0', '0', '0', '0', null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '', '7', '0', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6');
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null);
INSERT INTO `sys_role` VALUES ('62ed077ca1c64ef992dffa6707a15e80', '教师', '5865718', '4', '192', '4194368', '0', '5767232', '62ed077ca1c64ef992dffa6707a15e80');
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null);
INSERT INTO `sys_role` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '管理员B', '478150646', '1', '246', '0', '0', '4194368', '7dfd8d1f7b6245d283217b7e63eec9b2');
INSERT INTO `sys_role` VALUES ('a69cd28c85b14a4caa495eafd5bfeefd', '保安', '98550', '4', '0', '0', '0', '0', 'a69cd28c85b14a4caa495eafd5bfeefd');
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '478150646', '1', '54', '54', '0', '4194550', 'ac66961adaa2426da4470c72ffeec117');
INSERT INTO `sys_role` VALUES ('b2ceca5ce31147e3b7082cb778188213', '112', '', 'fc558ba8d47b4739a6debc7974da9f9f', '2097206', '2097206', '0', '0', 'b2ceca5ce31147e3b7082cb778188213');
INSERT INTO `sys_role` VALUES ('b86ec116fd804d7e9d8b6a8b895c70ca', '营养师', '98550', '4', '0', '0', '0', '0', 'b86ec116fd804d7e9d8b6a8b895c70ca');
INSERT INTO `sys_role` VALUES ('e442481ea4c4488386be0fa3a7755892', '园长', '98550', '4', '0', '0', '0', '0', 'e442481ea4c4488386be0fa3a7755892');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3');
INSERT INTO `sys_role` VALUES ('fc558ba8d47b4739a6debc7974da9f9f', '111', '', '0', '0', '0', '0', '0', 'fc558ba8d47b4739a6debc7974da9f9f');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL COMMENT '职位ID',
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `NICKNAME` varchar(255) DEFAULT NULL COMMENT '昵称',
  `GENDER` varchar(255) DEFAULT NULL COMMENT '性别',
  `QQ` varchar(255) DEFAULT NULL,
  `WECHAT` varchar(255) DEFAULT NULL COMMENT '微信',
  `WORKTIME` varchar(255) DEFAULT NULL COMMENT '工作时间',
  `ISSECURITY` varchar(255) DEFAULT NULL COMMENT '是否安保',
  `REMARK` varchar(255) DEFAULT NULL,
  `ISDELETE` varchar(255) DEFAULT NULL COMMENT '是否删除',
  `JOBS` varchar(255) DEFAULT NULL COMMENT '岗位',
  `OFFICPHONE` varchar(255) DEFAULT NULL,
  `DEPT` varchar(255) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('089d664844f8441499955b3701696fc0', 'fushide', '67bc304642856b709dfeb907b92cc7e10e0b02f2', '富师德', '', '2', '', '', '0', '18629359', 'default', 'asd2adf@qq.com', null, '18766666666', 'fushide', '0', '', '', null, null, null, null, 'cd2fe13e5b7949b0b39094dae42a9e38', '54542322', '37ddc84973194fa4b51fe2f5a055b185');
INSERT INTO `sys_user` VALUES ('0b3f2ab1896b47c097a81d322697446a', 'zhangsan', '5ee5d458d02fde6170b9c3ebfe06af85dacd131d', '张三', '', '2', '2015-01-02 12:04:51', '127.0.0.1', '0', '小张', 'default', 'wwwwq@qq.com', null, '18788888888', 'zhangsan', '0', '', '', null, null, null, null, '0b4db8b3afd143f4bb35b1fd459dd69a', '65564444', null);
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2015-08-07 17:07:39', '0:0:0:0:0:0:0:1', '0', '最高统治者', 'default', 'admin@main.com', '001', '18788888888', null, null, null, null, null, null, null, null, null, null, '486b28501e044560873032781c009651');
INSERT INTO `sys_user` VALUES ('8cd980bbc76f4886bcc19b7793202c06', '测试', '8f1ac23615d8687d3caa6ddcd8a017423b330150', '测试', '', '62ed077ca1c64ef992dffa6707a15e80', '', '', '0', '', 'default', '1@1.com', null, '13141111212', '测试', '0', '898912', '121212', null, null, null, null, 'cd2fe13e5b7949b0b39094dae42a9e38', '31212111', 'b4aaa8003fbc4ae483763484c833b655');
INSERT INTO `sys_user` VALUES ('b825f152368549069be79e1d34184afa', 'san', '47c4a8dc64ac2f0bb46bbd8813b037c9718f9349', '三', '', '62ed077ca1c64ef992dffa6707a15e80', '2015-08-04 21:25:31', '0:0:0:0:0:0:0:1', '0', 'sdfsdgf', 'default', 'sdfsdf@qq.com', null, '13121231212', 'san', '0', '', '', null, null, null, null, 'cd2fe13e5b7949b0b39094dae42a9e38', '43112121', '37ddc84973194fa4b51fe2f5a055b185');
INSERT INTO `sys_user` VALUES ('be025a79502e433e820fac37ddb1cfc2', 'zhangsan570256', '42f7554cb9c00e11ef16543a2c86ade815b79faa', '张三', '', 'a69cd28c85b14a4caa495eafd5bfeefd', '', '', '0', '小张', 'default', 'zhangsan2@163.com', null, '13141121111', 'zhangsan570256', '0', '', '', null, null, null, null, 'd82a9b9f83dc4e2abba1493b2a941da6', '23131212', null);
INSERT INTO `sys_user` VALUES ('f77729adafca4680979fa0aa25e4ed9e', '41212', 'd8943b2daa78067e8d652e61e24104b18e4c6dd2', '2121', '', '62ed077ca1c64ef992dffa6707a15e80', '', '', '0', '12', 'default', '12@1.com', null, '13111111111', '41212', '0', '13121111211', '23123211', null, null, null, null, 'cd2fe13e5b7949b0b39094dae42a9e38', '121212121', 'b4aaa8003fbc4ae483763484c833b655');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('62ed077ca1c64ef992dffa6707a15e80', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('a69cd28c85b14a4caa495eafd5bfeefd', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b2ceca5ce31147e3b7082cb778188213', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b86ec116fd804d7e9d8b6a8b895c70ca', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e442481ea4c4488386be0fa3a7755892', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('fc558ba8d47b4739a6debc7974da9f9f', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `USER_ID` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('089d664844f8441499955b3701696fc0', '1');
INSERT INTO `sys_user_role` VALUES ('089d664844f8441499955b3701696fc0', 'e442481ea4c4488386be0fa3a7755892');
INSERT INTO `sys_user_role` VALUES (null, null);

-- ----------------------------
-- Table structure for tb_class_infoclassinfo
-- ----------------------------
DROP TABLE IF EXISTS `tb_class_infoclassinfo`;
CREATE TABLE `tb_class_infoclassinfo` (
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

-- ----------------------------
-- Records of tb_class_infoclassinfo
-- ----------------------------
INSERT INTO `tb_class_infoclassinfo` VALUES ('d0c640e154854561901ab999a02f1e67', '3ffa50334b5f42078c4b9c6ab1de6ed3', '阳光班1', '8944', 'rich', 'rich', '大班', '正常', '2015-08-06', '2015-08-08', '2015-08-29', '2015-08-31', '这是个测试版', '这是个测试版');
INSERT INTO `tb_class_infoclassinfo` VALUES ('d0c640e154854561901ab999a02f1e6e', '3ffa50334b5f42078c4b9c6ab1de6ed3', '大班舞蹈班', '36', '张三', '李四', '舞蹈班', '正常', '2015-08-06', '2015-08-08', '2015-08-29', '2015-08-31', '这是个测试版', '这是个测试版');

-- ----------------------------
-- Table structure for tb_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_line`;
CREATE TABLE `tb_line` (
  `LINE_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '名称',
  `LINE_URL` varchar(255) DEFAULT NULL COMMENT '链接',
  `LINE_ROAD` varchar(255) DEFAULT NULL COMMENT '线路',
  `TYPE` varchar(255) DEFAULT NULL COMMENT '类型',
  `LINE_ORDER` int(10) DEFAULT NULL COMMENT '排序',
  `PARENT_ID` varchar(255) DEFAULT NULL COMMENT '父类ID',
  PRIMARY KEY (`LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_line
-- ----------------------------
INSERT INTO `tb_line` VALUES ('079c63d4fdcd479b9a84e2af9745e430', '华泰', 'http://www.baidu.com', '联通', '大类', '1', '0');
INSERT INTO `tb_line` VALUES ('36fc89101f2b4792985f92bc35d1cbba', '问问', 'http://www.1b23.com', '一号线', '小类', '1', '079c63d4fdcd479b9a84e2af9745e430');
INSERT INTO `tb_line` VALUES ('4bd68dbe76e44d1d8f9a5a012712793e', '线路1号', 'http://www.163.com', '铁通', '小类', '1', 'b79ebcb13f2042ffb6132f004c8ff46c');
INSERT INTO `tb_line` VALUES ('6c15bc3c06c64b2392085e72c88bbba5', '线路2号', 'http://www.qq.com', '网通', '小类', '2', 'b79ebcb13f2042ffb6132f004c8ff46c');

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
INSERT INTO `tb_org` VALUES ('08fbc8ac71e94dd6a4d0f98d3adcbdfc', '天恩研究院', 'TE', '0', null, '1', '2015-07-26', '100', '测试园长', '北京市西城区复兴门', '', '', '', '', '', '7165f8defb8b4077bd9fd5e68a53b4e4', null, null, 'TE');
INSERT INTO `tb_org` VALUES ('37ddc84973194fa4b51fe2f5a055b185', '技术部', 'TEEFYJSB', '46a8e2f5fa9e4e33b47ab4f2668120c3', null, '1', '2015-08-03', '30', '天恩二分院园长', '北京', '', '', '', '', '', 'bf53e5d52c044e599c2cef3471de59be', null, null, 'TEEFY_TEEFYJSB');
INSERT INTO `tb_org` VALUES ('3ffa50334b5f42078c4b9c6ab1de6ed3', '天恩一分院', 'TEYFY', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '3', '2015-08-03', '40', '天恩一分院园长', '北京', '', '', '', '', '', '7165f8defb8b4077bd9fd5e68a53b4e4', null, null, 'TE_TEYFY');
INSERT INTO `tb_org` VALUES ('46a8e2f5fa9e4e33b47ab4f2668120c3', '天恩二分院', 'TEEFY', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '4', '2015-08-03', '50', '天恩二分院园长', '北京', '', '', '', '', '', '7165f8defb8b4077bd9fd5e68a53b4e4', null, null, 'TE_TEEFY');
INSERT INTO `tb_org` VALUES ('486b28501e044560873032781c009651', '运营部', 'TNYYB', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '1', '2015-08-03', '100', '天恩运营部园长', '北京', '', '', '', '', '', 'bf53e5d52c044e599c2cef3471de59be', null, null, 'TE_TNYYB');
INSERT INTO `tb_org` VALUES ('7f5d1b25eb784eb0b14034467a7457a9', '技术部', 'TEJSB', '08fbc8ac71e94dd6a4d0f98d3adcbdfc', null, '2', '2015-08-03', '50', '天恩技术部园长', '北京', '', '', '', '', '', 'bf53e5d52c044e599c2cef3471de59be', null, null, 'TE_TEJSB');
INSERT INTO `tb_org` VALUES ('8f7b7977b57b4a8bbbb786a4bb367eea', '技术一部', 'TEJSYB', '7f5d1b25eb784eb0b14034467a7457a9', '3', '1', '2015-08-04', '20', '天恩技术部技术一部园长', '北京', '', '', '', '', '', null, null, null, 'TEJSB_TEJSYB');
INSERT INTO `tb_org` VALUES ('b4aaa8003fbc4ae483763484c833b655', '运营部', 'TEYFYYYB', '3ffa50334b5f42078c4b9c6ab1de6ed3', null, '1', '2015-08-03', '20', '天恩一分院运营部园长', '', '', '', '', '', '', 'bf53e5d52c044e599c2cef3471de59be', null, null, 'TEYFY_TEYFYYYB');

-- ----------------------------
-- Table structure for tb_parent_infoparent
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

-- ----------------------------
-- Records of tb_parent_infoparent
-- ----------------------------
INSERT INTO `tb_parent_infoparent` VALUES ('6c92cac383844219aeff860035192b52', 'zhangsande baba', '3213437af76c4e75986982a29c1e57ed', 'baba', '5ac39ddbb0ad4da4a957c2a2a19074ce', '94620a44df7f4a66ade74a78046811d7', '432432', '432423', '432432');
INSERT INTO `tb_parent_infoparent` VALUES ('c7b44ce2e2064d0abda1bfce51e1c904', 'zhangsande mama', '3213437af76c4e75986982a29c1e57ed', 'mama', '8a9ebe8fdf7f48ed8ec381789651b76e', '0ba755959d9e404e9d0f4e4df9b8ac32', '21212', '21212', '21212');
INSERT INTO `tb_parent_infoparent` VALUES ('ea95017227334c1eaa8a17b6ea6b9650', '张三', '35e01f2c89ec411e881d195e4408450f', '爸爸', '265248b9f1704abebec51cd394ef7667', '0ba755959d9e404e9d0f4e4df9b8ac32', '7897', '7897', '78979');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('2063276258a04b168cb77e8b56e085cd', '图片', '9257f49ebd344433918f00e027bd1447.jpg', '20150417/9257f49ebd344433918f00e027bd1447.jpg', '2015-04-17 03:12:48', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('2a5b4f70002643e09fe368bcc572ac9f', '图片', 'd6da4ab0537645a18aac087976d01a0b.png', '20150417/d6da4ab0537645a18aac087976d01a0b.png', '2015-04-17 03:12:48', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('88b69a1e2dc94c96a6c6cd878b51e5d7', '图片', '60ff037042ce4aa084edce40a46266d9.jpg', '20150417/60ff037042ce4aa084edce40a46266d9.jpg', '2015-04-17 03:16:13', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('e389e5ba151c460a9e9297bbed44ca40', '图片', '53852111c52949d38de175b2c0c6ad3b.jpg', '20150803/53852111c52949d38de175b2c0c6ad3b.jpg', '2015-08-03 16:47:38', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for tb_student_infostudent
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

-- ----------------------------
-- Records of tb_student_infostudent
-- ----------------------------
INSERT INTO `tb_student_infostudent` VALUES ('3213437af76c4e75986982a29c1e57ed', '222222222222', '1111', '2015-08-05', '94620a44df7f4a66ade74a78046811d7', '5ac39ddbb0ad4da4a957c2a2a19074ce', '31231231', '321312', '3213123', '321312', '321321321');
INSERT INTO `tb_student_infostudent` VALUES ('35e01f2c89ec411e881d195e4408450f', '9999', '9999', '2015-08-05', '9426fdcbc88a4c59b224fdea85ea12cd', '265248b9f1704abebec51cd394ef7667', '9999', '9999', '9999', '9999', '9999');
INSERT INTO `tb_student_infostudent` VALUES ('4ff481ef261d488b991b11cc48508369', '1', '1', '2015-07-28', '94620a44df7f4a66ade74a78046811d7', '0cc3e51ad37a4da0a1f40517d0645cc6', '1', '1', '1', '1', '1');
INSERT INTO `tb_student_infostudent` VALUES ('554538907c9c452e888685e0d32b2451', '200150010150', 'zhangsan', '2015-08-01', '0ba755959d9e404e9d0f4e4df9b8ac32', '1a4e15dafa2d46ae92c5933d2525dfe5', '111111111111111111', '北京市', '房山区', '小班', '无');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL,
  `upd` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Function structure for get_count
-- ----------------------------
DROP FUNCTION IF EXISTS `get_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_count`(p_id varchar(100)) RETURNS tinyint(4)
BEGIN
		DECLARE p_count INT(11);
		SELECT COUNT('LINE_ID') into p_count from tb_line where PARENT_ID = p_id;
    RETURN p_count;
 END
;;
DELIMITER ;

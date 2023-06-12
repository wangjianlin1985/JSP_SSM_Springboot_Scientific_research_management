/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : keyan_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-12-27 02:15:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `managerUserName` varchar(20) NOT NULL COMMENT 'managerUserName',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `sex` varchar(4) NOT NULL COMMENT '性别',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  PRIMARY KEY  (`managerUserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('gl001', '123', '王超', '男', '13959342344');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `title` varchar(80) NOT NULL COMMENT '标题',
  `content` varchar(5000) NOT NULL COMMENT '公告内容',
  `publishDate` varchar(20) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '科研管理系统正式上线', '<p>同志们，你们以后可以发布你们自己的科研项目到这里，也可以提交你们自己的论文，我们的管理员会给你专业的意见哈！</p>', '2017-12-23 22:54:14');

-- ----------------------------
-- Table structure for `t_project`
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `projectId` int(11) NOT NULL auto_increment COMMENT '项目id',
  `projectTypeObj` int(11) NOT NULL COMMENT '项目类型',
  `projectName` varchar(20) NOT NULL COMMENT '项目名称',
  `projectPhoto` varchar(60) NOT NULL COMMENT '项目主图',
  `mainPerson` varchar(20) NOT NULL COMMENT '负责人',
  `comeFrom` varchar(20) default NULL COMMENT '项目来源',
  `kydh` varchar(20) NOT NULL COMMENT '科研代号',
  `startDate` varchar(20) default NULL COMMENT '开始日期',
  `endDate` varchar(20) NOT NULL COMMENT '结束日期',
  `kyMoney` float NOT NULL COMMENT '科研资金',
  `projectDesc` varchar(5000) NOT NULL COMMENT '项目介绍',
  `userObj` varchar(30) NOT NULL COMMENT '提交用户',
  `shzt` varchar(20) NOT NULL COMMENT '审核状态',
  `shr` varchar(20) default NULL COMMENT '审核人',
  `shsj` varchar(20) default NULL COMMENT '审核时间',
  PRIMARY KEY  (`projectId`),
  KEY `projectTypeObj` (`projectTypeObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_project_ibfk_1` FOREIGN KEY (`projectTypeObj`) REFERENCES `t_projecttype` (`projectTypeId`),
  CONSTRAINT `t_project_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES ('1', '1', '基于SSM电子商城购物网站设计', 'upload/1a150408-e461-4c1b-8ddd-63e39dea4d05.jpg', '钟明明', '生活实践', '001', '2017-12-01', '2017-12-09', '5000', '<p>需要开发一个万人在线商城网站</p>', 'user1', '审核通过', 'gl001', '2017-12-27 01:43:15');
INSERT INTO `t_project` VALUES ('2', '2', '中国唐代风俗研究', 'upload/f14cb1c6-ce6b-4467-818b-1db07bed66c7.jpg', '王华雪', '中国历史', '0234', '2017-12-01', '2017-12-12', '20000', '<p>研究中国最繁荣的唐代历史文明！</p>', 'user1', '待审核', '--', '--');

-- ----------------------------
-- Table structure for `t_projecttype`
-- ----------------------------
DROP TABLE IF EXISTS `t_projecttype`;
CREATE TABLE `t_projecttype` (
  `projectTypeId` int(11) NOT NULL auto_increment COMMENT '项目性质id',
  `projectTypeName` varchar(20) NOT NULL COMMENT '项目性质名称',
  PRIMARY KEY  (`projectTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projecttype
-- ----------------------------
INSERT INTO `t_projecttype` VALUES ('1', '自然科学');
INSERT INTO `t_projecttype` VALUES ('2', '历史文学');

-- ----------------------------
-- Table structure for `t_thesis`
-- ----------------------------
DROP TABLE IF EXISTS `t_thesis`;
CREATE TABLE `t_thesis` (
  `thesisId` int(11) NOT NULL auto_increment COMMENT '论文id',
  `xkml` varchar(20) NOT NULL COMMENT '学科门类',
  `name` varchar(20) NOT NULL COMMENT '论文名称',
  `lwfm` varchar(60) NOT NULL COMMENT '论文封面图',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `teacher` varchar(20) NOT NULL COMMENT '指导老师',
  `publishDate` varchar(20) default NULL COMMENT '发布日期',
  `thesisDesc` varchar(5000) NOT NULL COMMENT '论文介绍',
  `thesisFile` varchar(60) NOT NULL COMMENT '论文文件',
  `xgyj` varchar(500) default NULL COMMENT '修改意见',
  `userObj` varchar(30) NOT NULL COMMENT '提交用户',
  PRIMARY KEY  (`thesisId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_thesis_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_thesis
-- ----------------------------
INSERT INTO `t_thesis` VALUES ('1', '计算机科学', 'JSP企业人事工资管理', 'upload/440534fd-1e9b-4959-9d18-f6b6d045d41f.jpg', '王忠明', '李明霞', '2017-12-06', '<p>开发一款jsp人事工资管理系统，管理企业员工和工资信息！</p>', 'upload/ce3af0fd-932e-4ebc-ab6d-2d929915cec3.doc', '写得不错', 'user1');
INSERT INTO `t_thesis` VALUES ('2', 'aaaa', 'bbbb', 'upload/NoImage.jpg', 'cccc', 'dddd', '2017-12-07', '<p>eeeeee</p>', '', '待批阅', 'user1');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(30) NOT NULL COMMENT 'user_name',
  `password` varchar(30) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '出生日期',
  `userPhoto` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `address` varchar(80) default NULL COMMENT '家庭地址',
  `regTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2017-12-07', 'upload/30b5b9fd-6407-4a78-90f4-5ebe37866e5b.jpg', '13589834234', 'syl@163.com', '四川成都红星路', '2017-12-23 22:28:06');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李明芬', '女', '2017-12-08', 'upload/3a8a5573-225e-4ec8-8ca4-f3d2e7366cc0.jpg', '13598399834', 'limingfen@126.com', '广东深圳', '2017-12-27 02:11:46');

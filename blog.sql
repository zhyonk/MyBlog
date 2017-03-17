/*
Navicat MySQL Data Transfer

Source Server         : My
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2017-03-17 11:06:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(255) NOT NULL DEFAULT '',
  `img_src` varchar(255) NOT NULL COMMENT '图片存放路径',
  `title` varchar(255) NOT NULL COMMENT '文章标题',
  `outline` varchar(255) NOT NULL COMMENT '文章摘要',
  `content` varchar(255) NOT NULL COMMENT '文章内容',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', 'admin', 'blog/images/13.jpg', '测试一下', '整卸载MSSQL，使用前务必先备份好数据，因使用该工具而导致的网站或系统数据丢失与本工具无关！\r\n2、推荐使用组件卸载方式，也可以使用Windows的控制面板正常卸载，如果正常卸载不干净，可以用本工具做强制删除！\r\n3、在非正常卸', '整卸载MSSQL，使用前务必先备份好数据，因使用该工具而导致的网站或系统数据丢失与本工具无关！\r\n2、推荐使用组件卸载方式，也可以使用Windows的控制面板正常卸载，如果正常卸载不干净，可以用本工具做强制删除！\r\n3、在非正常卸载无法使用的情况下亦可直接使用强制删除模式！直至本卸载列表为空！\r\nXP/7/8等桌面系', '2015-12-08 01:56:08');
INSERT INTO `article` VALUES ('2', 'admin', 'blog/images/10.jpg', '文章2', '整卸载MSSQL，使用前务必先备份好数据，因使用该工具而导致的网站或系统数据丢失与本工具无关！\r\n2、推荐使用组件卸载方式，也可以使用Windows的控制面板正常卸载，如果正常卸载不干净，可以用本工具做强制删除！\r\n3、在非正常卸', 'dfefwefwefwe', '2015-12-08 01:56:18');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_src` varchar(255) NOT NULL,
  `big_title` varchar(255) NOT NULL,
  `small_title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES ('1', 'images/banner1.jpg', '写这个有点点意思', '慢慢写好了把博客倒在这里', '#');
INSERT INTO `carousel` VALUES ('2', 'images/banner2.jpg', '你以为你长得挺好看的就没事了么', '不你错了 他还是想找个更好看的', '#');
INSERT INTO `carousel` VALUES ('3', 'images/banner1.jpg', '今天给大家讲一个悲伤的故事', '相信大家听完之后都会有所领悟', '#');

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionname` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'add', '1');
INSERT INTO `t_permission` VALUES ('2', 'del', '1');
INSERT INTO `t_permission` VALUES ('3', 'update', '1');
INSERT INTO `t_permission` VALUES ('4', 'query', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL,
  `rolename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin');
INSERT INTO `t_role` VALUES ('2', 'normal');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhyonk', '331520');
INSERT INTO `t_user` VALUES ('2', 'zyk', '123456');
INSERT INTO `t_user` VALUES ('3', 'why', '1993120');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1');
INSERT INTO `t_user_role` VALUES ('3', '2');
INSERT INTO `t_user_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for visitor_log
-- ----------------------------
DROP TABLE IF EXISTS `visitor_log`;
CREATE TABLE `visitor_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访客日志主键',
  `ip` varchar(255) NOT NULL COMMENT '访客IP地址',
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `borwser_Type` varchar(255) DEFAULT NULL COMMENT '浏览器类型',
  `platformType` varchar(255) DEFAULT NULL COMMENT '平台版本',
  `link` varchar(255) DEFAULT NULL COMMENT '访问链接',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor_log
-- ----------------------------
INSERT INTO `visitor_log` VALUES ('149', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 16:05:59', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('150', '192.168.3.188', null, null, '2017-03-15 16:06:09', 'other', 'iPhone', 'http://192.168.3.188:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('151', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 16:15:02', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('152', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 16:17:49', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('153', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 16:27:08', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('154', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 19:03:41', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('155', '192.168.1.6', null, null, '2017-03-15 19:36:04', 'other', 'iPhone', 'http://192.168.1.4:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('156', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 19:41:13', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('157', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 19:53:35', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('158', '0:0:0:0:0:0:0:1', null, null, '2017-03-15 20:48:07', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('159', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:17:49', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('160', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:18:48', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('161', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:19:01', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('162', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:21:33', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('163', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:21:34', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('164', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 10:44:04', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('165', '0:0:0:0:0:0:0:1', null, null, '2017-03-16 14:10:47', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');
INSERT INTO `visitor_log` VALUES ('167', '0:0:0:0:0:0:0:1', '中国', '局域网', '2017-03-17 10:59:38', 'Chrome', 'Windows', 'http://localhost:8080/MyBlog/index');

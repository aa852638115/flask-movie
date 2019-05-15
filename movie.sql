/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-05-15 10:10:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(256) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_admin_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('2019-04-30 18:20:23', '1', 'admin', 'pbkdf2:sha256:50000$aDGs0TJl$75e411536d6bc2fb9d2953497a8573439e1771b83e7a2a5bbe0663bf648c3eaf', '0', '1');
INSERT INTO `admin` VALUES ('2019-05-02 20:01:08', '2', 'test', 'pbkdf2:sha256:50000$Cfq5HNhx$dd57b5623a478e73a5fd777d5043eca20765bd5feb4f7cd1e54f0ba3e35292d8', '1', '4');
INSERT INTO `admin` VALUES ('2019-05-02 20:02:08', '3', '张三', 'pbkdf2:sha256:50000$zLz2Ey0j$dd97793584dac4a6f915fd3a1e47125a6fa8778f7ca63417d7356193af4d37f0', '1', '4');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('2019-05-13 14:28:30', '21', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-13 16:08:25', '22', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-15 09:42:26', '23', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-04-02 09:35:44', '10', '1', '192.168.100.29');
INSERT INTO `adminlog` VALUES ('2019-05-10 13:41:23', '11', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:00:09', '12', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:01:36', '13', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:04:51', '14', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:06:22', '15', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:08:45', '16', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:14:12', '17', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-10 14:15:56', '18', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-12 18:59:31', '19', '1', '127.0.0.1');
INSERT INTO `adminlog` VALUES ('2019-05-12 19:06:38', '20', '1', '127.0.0.1');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('2019-05-02 14:16:18', '1', '添加标签', '/tag/add');
INSERT INTO `auth` VALUES ('2019-05-02 14:17:32', '2', '编辑标签', '/auth/edit/<int:id>');
INSERT INTO `auth` VALUES ('2019-05-02 14:18:25', '3', '标签列表', '/tag/list/<int:page>');
INSERT INTO `auth` VALUES ('2019-05-02 14:18:34', '4', '删除标签', '/tag/edit/<int:id>');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  KEY `ix_comment_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2019-05-13 15:35:27', '25', '<p>非常好看</p>', '1', '9');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `info` text,
  `logo` varchar(150) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` int(11) DEFAULT NULL,
  `commentnum` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(150) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('2019-05-10 14:46:35', '9', 'fate', 'uploads/video/20190510/20190510144549b950b0de18a04881b5d8469c88d50ed3.mp4', '暂无介绍', 'uploads/image/20190510/2019051014463599f0bd784459486fa4d6d669c3c00397.jpg', '5', '11', '1', '1', '日本', '2019-05-01', '112');

-- ----------------------------
-- Table structure for movie_col
-- ----------------------------
DROP TABLE IF EXISTS `movie_col`;
CREATE TABLE `movie_col` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  KEY `ix_movie_col_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of movie_col
-- ----------------------------
INSERT INTO `movie_col` VALUES ('2019-05-13 16:01:23', '26', '1', '9');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('2019-05-13 16:08:44', '73', '1', '127.0.0.1', '添加预告:test1');
INSERT INTO `oplog` VALUES ('2019-05-13 16:08:55', '74', '1', '127.0.0.1', '添加预告:test2');
INSERT INTO `oplog` VALUES ('2019-05-13 16:09:13', '75', '1', '127.0.0.1', '添加预告:test8');
INSERT INTO `oplog` VALUES ('2019-05-13 16:09:25', '76', '1', '127.0.0.1', '添加预告:test66');
INSERT INTO `oplog` VALUES ('2019-05-13 16:10:24', '77', '1', '127.0.0.1', '添加预告:test77');
INSERT INTO `oplog` VALUES ('2019-04-02 09:35:56', '57', '1', '192.168.100.29', '修改密码:admin,id:1');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:33', '58', '1', '127.0.0.1', '添加预告:111');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:41', '59', '1', '127.0.0.1', '删除预告:乐侃有声节目第二期,id:6');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:42', '60', '1', '127.0.0.1', '删除预告:周杰伦粉丝版MV,id:5');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:43', '61', '1', '127.0.0.1', '删除预告:乐见大牌：”荣“耀之声，”维“我独尊,id:7');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:44', '62', '1', '127.0.0.1', '删除预告:王力宏四年心血结晶,id:8');
INSERT INTO `oplog` VALUES ('2019-05-10 13:51:45', '63', '1', '127.0.0.1', '删除预告:MV精选：《武媚》女神团美艳大比拼,id:9');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:10', '64', '1', '127.0.0.1', '删除电影:这是喜剧,id:8');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:12', '65', '1', '127.0.0.1', '删除电影:鬼吹灯2,id:7');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:13', '66', '1', '127.0.0.1', '删除电影:鬼吹灯1,id:6');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:14', '67', '1', '127.0.0.1', '删除电影:鬼吹灯,id:5');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:14', '68', '1', '127.0.0.1', '删除电影:笔仙,id:4');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:15', '69', '1', '127.0.0.1', '删除电影:不错~,id:3');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:15', '70', '1', '127.0.0.1', '删除电影:变形金,id:2');
INSERT INTO `oplog` VALUES ('2019-05-10 14:43:16', '71', '1', '127.0.0.1', '删除电影:这是一张图片,id:1');
INSERT INTO `oplog` VALUES ('2019-05-10 14:46:35', '72', '1', '127.0.0.1', '添加电影:fate');

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('2019-05-13 16:10:24', '15', 'test77', 'uploads/image/20190513/20190513161021e8e71461f1f14673b90a72a82242ebd0.png');
INSERT INTO `preview` VALUES ('2019-05-13 16:09:13', '13', 'test8', 'uploads/image/20190513/201905131609130cf56643e1404096a5287e5e82d9c737.jpg');
INSERT INTO `preview` VALUES ('2019-05-13 16:09:25', '14', 'test66', 'uploads/image/20190513/20190513160924346f1172261a4425ac537d003b08dc7d.jpg');
INSERT INTO `preview` VALUES ('2019-05-13 16:08:55', '12', 'test2', 'uploads/image/20190513/2019051316085531c3f92bb99b445da2dc3183ade05073.jpg');
INSERT INTO `preview` VALUES ('2019-05-13 16:08:44', '11', 'test1', 'uploads/image/20190513/20190513160843dbdefe07a02b4f83a9feae6d57a2a41c.png');
INSERT INTO `preview` VALUES ('2019-05-10 13:51:33', '10', '111', 'uploads/image/20190510/2019051013513172c32ab1393b410f9398ba21b5011aa7.jpg');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_role_addtime` (`addtime`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('2019-05-02 15:49:27', '1', '标签管理员', '1,2,3');
INSERT INTO `role` VALUES ('2019-05-02 15:52:07', '2', '标签管理员1', '1,3');
INSERT INTO `role` VALUES ('2019-05-02 16:35:43', '4', 'test', '1,2,3,4');
INSERT INTO `role` VALUES ('2019-05-02 18:52:59', '5', '可以了', '1,4');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('2019-04-30 21:51:33', '1', '科幻');
INSERT INTO `tag` VALUES ('2019-04-30 21:54:11', '2', '悬疑');
INSERT INTO `tag` VALUES ('2019-04-30 21:55:06', '3', '喜剧');
INSERT INTO `tag` VALUES ('2019-04-30 21:55:14', '4', '悲剧');
INSERT INTO `tag` VALUES ('2019-04-30 21:55:18', '5', '爱情');
INSERT INTO `tag` VALUES ('2019-04-30 21:55:22', '6', '动作');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(150) DEFAULT NULL,
  `uuid` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2019-04-01 21:51:16', '1', 'testt_1', 'pbkdf2:sha256:50000$OU2DqpqTpbkdf2:sha256:50000$aDGs0TJl$75e411536d6bc2fb9d2953497a8573439e1771b83e7a2a5bbe0663bf648c3eaf', 'guaosi1@guaosi.com', '12345678911', '这是个人简介', 'avatar/1.jpg', '35ee17c428aa407395dfc475eb66075e');
INSERT INTO `user` VALUES ('2019-04-01 21:51:16', '2', 'testt_2', 'pbkdf2:sha256:50000$6Kp9APFT$2e3f7ee095b9b1ef9ca58fe5daa7461316a6358bfcfe304eb2f4691d3c286dae', 'guaosi2@guaosi.com', '12345678912', '这是个人简介', 'avatar/2.jpg', '6534b89d8d7840f1838de3a7c63159df');
INSERT INTO `user` VALUES ('2019-04-01 21:51:16', '3', 'testt_3', 'pbkdf2:sha256:50000$SKwmksqi$d20b0e67cbadc32e875f6d1d5bc1e5082f42d9d34766e64d0aed6be8808e6b36', 'guaosi3@guaosi.com', '12345678913', '这是个人简介', 'avatar/3.jpg', '1a117f29307348c58a4ce9a5f26b44f1');
INSERT INTO `user` VALUES ('2019-04-04 20:35:23', '8', 'testt_4', 'pbkdf2:sha256:50000$OkbGHlIn$df815d6c410d2248ce167494f5e00bb2b5c66d19b919851acae03ff286654a9f', '1234@qq.com', '13945678915', null, 'avatar/1.jpg', '7c1ade28a666448f9d8e9910ab3c201f');
INSERT INTO `user` VALUES ('2019-04-05 12:23:04', '6', 'admin', 'pbkdf2:sha256:50000$bUzCGWMn$161c126f611c4be30414f5e31f2a466c01f4c6e8862954d871abf7111b915df0', '123@qq.com', '13945678914', '123123', 'uploads/image/20180703/201807032000118c9f68fff6f94e898544af8ccb23a826.jpg', '54bb95d334a742e7ac1849cdfc30f7a7');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `addtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('2019-05-13 09:58:27', '19', '1', '127.0.0.1');
INSERT INTO `userlog` VALUES ('2019-05-13 15:19:35', '20', '1', '127.0.0.1');
INSERT INTO `userlog` VALUES ('2019-05-13 15:25:39', '21', '1', '127.0.0.1');
INSERT INTO `userlog` VALUES ('2019-05-13 15:25:56', '22', '1', '127.0.0.1');
INSERT INTO `userlog` VALUES ('2019-05-13 16:00:39', '23', '1', '127.0.0.1');
INSERT INTO `userlog` VALUES ('2019-05-12 19:01:14', '18', '1', '127.0.0.1');

/*
Navicat MySQL Data Transfer

Source Server         : zs
Source Server Version : 50173
Source Host           : 123.57.48.148:3306
Source Database       : jike201

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-01-23 13:24:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '活动标题',
  `content` varchar(255) DEFAULT NULL,
  `starttime` datetime NOT NULL COMMENT '活动开始时间',
  `endtime` datetime NOT NULL COMMENT '活动结束时间',
  `gift` varchar(20) DEFAULT NULL,
  `num` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for `addetail`
-- ----------------------------
DROP TABLE IF EXISTS `addetail`;
CREATE TABLE `addetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` varchar(45) NOT NULL DEFAULT '0' COMMENT '广告id',
  `goodsid` int(10) unsigned DEFAULT '0' COMMENT '商品id',
  `webaddr` varchar(200) DEFAULT NULL COMMENT 'web地址',
  `promotionprice` varchar(10) DEFAULT '' COMMENT '促销价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='广告躯体详情';

-- ----------------------------
-- Records of addetail
-- ----------------------------
INSERT INTO `addetail` VALUES ('21', '4', '0', 'http://jikesoon.com/online/index.htm', '');
INSERT INTO `addetail` VALUES ('25', '3', '0', 'http://mp.weixin.qq.com/s?__biz=MjM5ODI5NTE4Nw==&mid=205092633&idx=1&sn=cc45393f61295a521f7a1f036b2e5cc6#rd', '');
INSERT INTO `addetail` VALUES ('26', '1', '0', 'http://mp.weixin.qq.com/s?__biz=MjM5ODI5NTE4Nw==&mid=205092633&idx=1&sn=cc45393f61295a521f7a1f036b2e5cc6#rd', '');
INSERT INTO `addetail` VALUES ('27', '2', '1030998', null, '6.5');
INSERT INTO `addetail` VALUES ('28', '2', '1030999', null, '21');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminname` varchar(45) NOT NULL,
  `loginip` varchar(45) NOT NULL,
  `logintime` varchar(45) NOT NULL,
  `logouttime` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='管理员日志';

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('13', 'opearte1', '0:0:0:0:0:0:0:1', '2014-9-4 15:27:59', '2014-9-4 15:28:05');
INSERT INTO `adminlog` VALUES ('14', 'opearte1', '0:0:0:0:0:0:0:1', '2014-9-4 16:14:51', '2014-9-4 16:14:57');
INSERT INTO `adminlog` VALUES ('15', 'opearte1', '0:0:0:0:0:0:0:1', '2014-9-4 16:17:14', '2014-9-4 16:17:19');
INSERT INTO `adminlog` VALUES ('16', 'opearte1', '0:0:0:0:0:0:0:1', '2014-9-4 16:25:10', '2014-9-4 16:25:17');
INSERT INTO `adminlog` VALUES ('17', 'zhangli', '114.252.25.149', 'Oct 14, 2014 12:15:51 PM', 'Oct 14, 2014 12:16:13 PM');
INSERT INTO `adminlog` VALUES ('18', 'opearte1', '127.0.0.1', '2014-10-18 10:45:39', '2014-10-18 11:00:42');
INSERT INTO `adminlog` VALUES ('19', 'super', '123.122.0.17', 'Oct 20, 2014 3:22:05 PM', 'Oct 20, 2014 3:29:41 PM');
INSERT INTO `adminlog` VALUES ('20', 'opearte1', '123.122.2.38', 'Oct 20, 2014 3:29:01 PM', 'Oct 20, 2014 3:31:40 PM');
INSERT INTO `adminlog` VALUES ('21', 'common2', '127.0.0.1', '2014-10-21 10:32:10', '2014-10-21 10:33:05');

-- ----------------------------
-- Table structure for `adminlog_url`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog_url`;
CREATE TABLE `adminlog_url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adminlogid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(300) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='管理员访问的页面';

-- ----------------------------
-- Records of adminlog_url
-- ----------------------------
INSERT INTO `adminlog_url` VALUES ('10', '13', 'http://localhost:8888/jike/operate/addgoods.jsp', '2014-9-4 15:28:04');
INSERT INTO `adminlog_url` VALUES ('11', '13', 'http://localhost:8888/jike/operate/addgoods.jsp', '2014-9-4 15:28:04');
INSERT INTO `adminlog_url` VALUES ('12', '13', 'http://localhost:8888/jike/operate/addtype1.jsp', '2014-9-4 15:28:01');
INSERT INTO `adminlog_url` VALUES ('13', '13', 'http://localhost:8888/jike/operate/index.jsp', '2014-9-4 15:27:59');
INSERT INTO `adminlog_url` VALUES ('14', '14', 'http://localhost:8888/jike/operate/index.jsp', '2014-9-4 16:14:51');
INSERT INTO `adminlog_url` VALUES ('15', '14', 'http://localhost:8888/jike/operate/addtype2.jsp', '2014-9-4 16:14:54');
INSERT INTO `adminlog_url` VALUES ('16', '15', 'http://localhost:8888/jike/operate/addtype2.jsp', '2014-9-4 16:17:17');
INSERT INTO `adminlog_url` VALUES ('17', '15', 'http://localhost:8888/jike/operate/index.jsp', '2014-9-4 16:17:15');
INSERT INTO `adminlog_url` VALUES ('18', '16', 'http://localhost:8888/jike/operate/index.jsp', '2014-9-4 16:25:11');
INSERT INTO `adminlog_url` VALUES ('19', '16', 'http://localhost:8888/jike/operate/addtype2.jsp', '2014-9-4 16:25:13');
INSERT INTO `adminlog_url` VALUES ('20', '17', 'http://112.126.73.24:8080/jike/operate/index.jsp', 'Oct 14, 2014 12:15:54 PM');
INSERT INTO `adminlog_url` VALUES ('21', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:49');
INSERT INTO `adminlog_url` VALUES ('22', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:55:32');
INSERT INTO `adminlog_url` VALUES ('23', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:20');
INSERT INTO `adminlog_url` VALUES ('24', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:25');
INSERT INTO `adminlog_url` VALUES ('25', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:04');
INSERT INTO `adminlog_url` VALUES ('26', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:45:49');
INSERT INTO `adminlog_url` VALUES ('27', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:33');
INSERT INTO `adminlog_url` VALUES ('28', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:58:56');
INSERT INTO `adminlog_url` VALUES ('29', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:48:34');
INSERT INTO `adminlog_url` VALUES ('30', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:48:34');
INSERT INTO `adminlog_url` VALUES ('31', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:58:24');
INSERT INTO `adminlog_url` VALUES ('32', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:13');
INSERT INTO `adminlog_url` VALUES ('33', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:58:24');
INSERT INTO `adminlog_url` VALUES ('34', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:55:32');
INSERT INTO `adminlog_url` VALUES ('35', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:30');
INSERT INTO `adminlog_url` VALUES ('36', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:33');
INSERT INTO `adminlog_url` VALUES ('37', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:58:56');
INSERT INTO `adminlog_url` VALUES ('38', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:13');
INSERT INTO `adminlog_url` VALUES ('39', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:59');
INSERT INTO `adminlog_url` VALUES ('40', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:24');
INSERT INTO `adminlog_url` VALUES ('41', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:48:22');
INSERT INTO `adminlog_url` VALUES ('42', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 11:00:19');
INSERT INTO `adminlog_url` VALUES ('43', '18', 'http://localhost:8888/jike/operate/productlist.jsp', '2014-10-18 10:59:22');
INSERT INTO `adminlog_url` VALUES ('44', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:47:10');
INSERT INTO `adminlog_url` VALUES ('45', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:56:27');
INSERT INTO `adminlog_url` VALUES ('46', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:20');
INSERT INTO `adminlog_url` VALUES ('47', '18', 'http://localhost:8888/jike/operate/addtype1.jsp', '2014-10-18 10:59:30');
INSERT INTO `adminlog_url` VALUES ('48', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:47:39');
INSERT INTO `adminlog_url` VALUES ('49', '18', 'http://localhost:8888/jike/operate/addtype1.jsp', '2014-10-18 10:59:31');
INSERT INTO `adminlog_url` VALUES ('50', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:04');
INSERT INTO `adminlog_url` VALUES ('51', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 11:00:19');
INSERT INTO `adminlog_url` VALUES ('52', '18', 'http://localhost:8888/jike/operate/productlist.jsp', '2014-10-18 10:59:22');
INSERT INTO `adminlog_url` VALUES ('53', '18', 'http://localhost:8888/jike/operate/index.jsp', '2014-10-18 10:45:42');
INSERT INTO `adminlog_url` VALUES ('54', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:49');
INSERT INTO `adminlog_url` VALUES ('55', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:47:10');
INSERT INTO `adminlog_url` VALUES ('56', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:46:48');
INSERT INTO `adminlog_url` VALUES ('57', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:57:30');
INSERT INTO `adminlog_url` VALUES ('58', '18', 'http://localhost:8888/jike/operate/index.jsp', '2014-10-18 10:59:54');
INSERT INTO `adminlog_url` VALUES ('59', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:59:59');
INSERT INTO `adminlog_url` VALUES ('60', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:47:39');
INSERT INTO `adminlog_url` VALUES ('61', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:46:48');
INSERT INTO `adminlog_url` VALUES ('62', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:45:49');
INSERT INTO `adminlog_url` VALUES ('63', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:56:27');
INSERT INTO `adminlog_url` VALUES ('64', '18', 'http://localhost:8888/jike/operate/promotiongoods.jsp', '2014-10-18 10:48:22');
INSERT INTO `adminlog_url` VALUES ('65', '19', 'http://112.126.73.24:8080/jike/super/ordercount.jsp', 'Oct 20, 2014 3:24:27 PM');
INSERT INTO `adminlog_url` VALUES ('66', '19', 'http://112.126.73.24:8080/jike/super/usercount.jsp', 'Oct 20, 2014 3:23:03 PM');
INSERT INTO `adminlog_url` VALUES ('67', '19', 'http://112.126.73.24:8080/jike/super/index.jsp', 'Oct 20, 2014 3:22:08 PM');
INSERT INTO `adminlog_url` VALUES ('68', '19', 'http://112.126.73.24:8080/jike/super/commonuser.jsp', 'Oct 20, 2014 3:28:10 PM');
INSERT INTO `adminlog_url` VALUES ('69', '19', 'http://112.126.73.24:8080/jike/super/ordercount.jsp', 'Oct 20, 2014 3:22:17 PM');
INSERT INTO `adminlog_url` VALUES ('70', '19', 'http://112.126.73.24:8080/jike/super/ordercount.jsp', 'Oct 20, 2014 3:22:17 PM');
INSERT INTO `adminlog_url` VALUES ('71', '19', 'http://112.126.73.24:8080/jike/super/commonuser.jsp', 'Oct 20, 2014 3:28:09 PM');
INSERT INTO `adminlog_url` VALUES ('72', '19', 'http://112.126.73.24:8080/jike/super/ordercount.jsp', 'Oct 20, 2014 3:24:27 PM');
INSERT INTO `adminlog_url` VALUES ('73', '19', 'http://112.126.73.24:8080/jike/super/usercount.jsp', 'Oct 20, 2014 3:23:03 PM');
INSERT INTO `adminlog_url` VALUES ('74', '20', 'http://112.126.73.24:8080/jike/operate/index.jsp', 'Oct 20, 2014 3:29:01 PM');
INSERT INTO `adminlog_url` VALUES ('75', '20', 'http://112.126.73.24:8080/jike/operate/editshops.jsp', 'Oct 20, 2014 3:30:47 PM');
INSERT INTO `adminlog_url` VALUES ('76', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:30:59 PM');
INSERT INTO `adminlog_url` VALUES ('77', '20', 'http://112.126.73.24:8080/jike/operate/edittype.jsp', 'Oct 20, 2014 3:30:52 PM');
INSERT INTO `adminlog_url` VALUES ('78', '20', 'http://112.126.73.24:8080/jike/operate/shopslist.jsp', 'Oct 20, 2014 3:29:58 PM');
INSERT INTO `adminlog_url` VALUES ('79', '20', 'http://112.126.73.24:8080/jike/operate/edittype.jsp', 'Oct 20, 2014 3:29:16 PM');
INSERT INTO `adminlog_url` VALUES ('80', '20', 'http://112.126.73.24:8080/jike/operate/operateadminlog.jsp', 'Oct 20, 2014 3:30:41 PM');
INSERT INTO `adminlog_url` VALUES ('81', '20', 'http://112.126.73.24:8080/jike/operate/addtype2.jsp', 'Oct 20, 2014 3:29:18 PM');
INSERT INTO `adminlog_url` VALUES ('82', '20', 'http://112.126.73.24:8080/jike/operate/communitylist.jsp', 'Oct 20, 2014 3:30:32 PM');
INSERT INTO `adminlog_url` VALUES ('83', '20', 'http://112.126.73.24:8080/jike/operate/shopslist.jsp', 'Oct 20, 2014 3:30:43 PM');
INSERT INTO `adminlog_url` VALUES ('84', '20', 'http://112.126.73.24:8080/jike/operate/edittype.jsp', 'Oct 20, 2014 3:29:16 PM');
INSERT INTO `adminlog_url` VALUES ('85', '20', 'http://112.126.73.24:8080/jike/operate/edittype2.jsp', 'Oct 20, 2014 3:29:20 PM');
INSERT INTO `adminlog_url` VALUES ('86', '20', 'http://112.126.73.24:8080/jike/operate/productlist.jsp', 'Oct 20, 2014 3:29:33 PM');
INSERT INTO `adminlog_url` VALUES ('87', '20', 'http://112.126.73.24:8080/jike/operate/edittype.jsp', 'Oct 20, 2014 3:30:52 PM');
INSERT INTO `adminlog_url` VALUES ('88', '20', 'http://112.126.73.24:8080/jike/operate/shopslist.jsp', 'Oct 20, 2014 3:30:43 PM');
INSERT INTO `adminlog_url` VALUES ('89', '20', 'http://112.126.73.24:8080/jike/operate/editarea.jsp', 'Oct 20, 2014 3:30:36 PM');
INSERT INTO `adminlog_url` VALUES ('90', '20', 'http://112.126.73.24:8080/jike/operate/editproduct.jsp', 'Oct 20, 2014 3:29:42 PM');
INSERT INTO `adminlog_url` VALUES ('91', '20', 'http://112.126.73.24:8080/jike/operate/promotiongoods.jsp', 'Oct 20, 2014 3:29:50 PM');
INSERT INTO `adminlog_url` VALUES ('92', '20', 'http://112.126.73.24:8080/jike/operate/addarea.jsp', 'Oct 20, 2014 3:30:34 PM');
INSERT INTO `adminlog_url` VALUES ('93', '20', 'http://112.126.73.24:8080/jike/operate/addcommunity.jsp', 'Oct 20, 2014 3:30:30 PM');
INSERT INTO `adminlog_url` VALUES ('94', '20', 'http://112.126.73.24:8080/jike/operate/productlist.jsp', 'Oct 20, 2014 3:29:33 PM');
INSERT INTO `adminlog_url` VALUES ('95', '20', 'http://112.126.73.24:8080/jike/operate/addcommunity.jsp', 'Oct 20, 2014 3:30:30 PM');
INSERT INTO `adminlog_url` VALUES ('96', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:29:27 PM');
INSERT INTO `adminlog_url` VALUES ('97', '20', 'http://112.126.73.24:8080/jike/operate/addtype1.jsp', 'Oct 20, 2014 3:29:04 PM');
INSERT INTO `adminlog_url` VALUES ('98', '20', 'http://112.126.73.24:8080/jike/operate/promotiongoods.jsp', 'Oct 20, 2014 3:29:50 PM');
INSERT INTO `adminlog_url` VALUES ('99', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:29:27 PM');
INSERT INTO `adminlog_url` VALUES ('100', '20', 'http://112.126.73.24:8080/jike/operate/shopslist.jsp', 'Oct 20, 2014 3:29:58 PM');
INSERT INTO `adminlog_url` VALUES ('101', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:29:27 PM');
INSERT INTO `adminlog_url` VALUES ('102', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:30:59 PM');
INSERT INTO `adminlog_url` VALUES ('103', '20', 'http://112.126.73.24:8080/jike/operate/addtype2.jsp', 'Oct 20, 2014 3:29:06 PM');
INSERT INTO `adminlog_url` VALUES ('104', '20', 'http://112.126.73.24:8080/jike/operate/addarea.jsp', 'Oct 20, 2014 3:30:34 PM');
INSERT INTO `adminlog_url` VALUES ('105', '20', 'http://112.126.73.24:8080/jike/operate/index.jsp', 'Oct 20, 2014 3:29:46 PM');
INSERT INTO `adminlog_url` VALUES ('106', '20', 'http://112.126.73.24:8080/jike/operate/addtype1.jsp', 'Oct 20, 2014 3:29:04 PM');
INSERT INTO `adminlog_url` VALUES ('107', '20', 'http://112.126.73.24:8080/jike/operate/operateadminlog.jsp', 'Oct 20, 2014 3:30:41 PM');
INSERT INTO `adminlog_url` VALUES ('108', '20', 'http://112.126.73.24:8080/jike/operate/editarea.jsp', 'Oct 20, 2014 3:30:36 PM');
INSERT INTO `adminlog_url` VALUES ('109', '20', 'http://112.126.73.24:8080/jike/operate/communitylist.jsp', 'Oct 20, 2014 3:30:32 PM');
INSERT INTO `adminlog_url` VALUES ('110', '20', 'http://112.126.73.24:8080/jike/operate/addgoods.jsp', 'Oct 20, 2014 3:29:27 PM');
INSERT INTO `adminlog_url` VALUES ('111', '21', 'http://localhost:8888/jike/common/index.jsp', '2014-10-21 10:32:13');
INSERT INTO `adminlog_url` VALUES ('112', '21', 'http://localhost:8888/jike/common/commonuser.jsp', '2014-10-21 10:32:59');
INSERT INTO `adminlog_url` VALUES ('113', '21', 'http://localhost:8888/jike/common/completebill.jsp', '2014-10-21 10:32:34');
INSERT INTO `adminlog_url` VALUES ('114', '21', 'http://localhost:8888/jike/common/unhandlebill.jsp', '2014-10-21 10:32:29');
INSERT INTO `adminlog_url` VALUES ('115', '21', 'http://localhost:8888/jike/common/undobill.jsp', '2014-10-21 10:32:36');
INSERT INTO `adminlog_url` VALUES ('116', '21', 'http://localhost:8888/jike/common/preparebill.jsp', '2014-10-21 10:32:31');
INSERT INTO `adminlog_url` VALUES ('117', '21', 'http://localhost:8888/jike/common/preparebill.jsp', '2014-10-21 10:32:32');
INSERT INTO `adminlog_url` VALUES ('118', '21', 'http://localhost:8888/jike/common/completebill.jsp', '2014-10-21 10:32:34');
INSERT INTO `adminlog_url` VALUES ('119', '21', 'http://localhost:8888/jike/common/undobill.jsp', '2014-10-21 10:32:36');
INSERT INTO `adminlog_url` VALUES ('120', '21', 'http://localhost:8888/jike/common/addtype1.jsp', '2014-10-21 10:32:41');
INSERT INTO `adminlog_url` VALUES ('121', '21', 'http://localhost:8888/jike/common/addtype1.jsp', '2014-10-21 10:32:41');
INSERT INTO `adminlog_url` VALUES ('122', '21', 'http://localhost:8888/jike/common/unhandlebill.jsp', '2014-10-21 10:32:29');
INSERT INTO `adminlog_url` VALUES ('123', '21', 'http://localhost:8888/jike/common/deliveryuser.jsp', '2014-10-21 10:33:01');
INSERT INTO `adminlog_url` VALUES ('124', '21', 'http://localhost:8888/jike/common/deliveryuser.jsp', '2014-10-21 10:33:02');
INSERT INTO `adminlog_url` VALUES ('125', '21', 'http://localhost:8888/jike/common/commonuser.jsp', '2014-10-21 10:32:59');

-- ----------------------------
-- Table structure for `advertise`
-- ----------------------------
DROP TABLE IF EXISTS `advertise`;
CREATE TABLE `advertise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0代表list 1代表detail，2代表web',
  `isshow` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '（1,2,3,4）分别代表不同位置的广告',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `adimg` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '促销标题' COMMENT '促销标题',
  `style` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='推荐的广告栏';

-- ----------------------------
-- Records of advertise
-- ----------------------------
INSERT INTO `advertise` VALUES ('1', '3', '1', '2015-01-05 10:14:02', 'http://the-advertisement-picture.qiniudn.com/main5.png', '即客送豪礼', null);
INSERT INTO `advertise` VALUES ('2', '0', '2', '2015-01-23 12:41:44', 'http://the-advertisement-picture.qiniudn.com/left_big5.png', '即客促销', '1');
INSERT INTO `advertise` VALUES ('3', '2', '3', '2015-01-23 12:41:45', 'http://the-advertisement-picture.qiniudn.com/right_top3.png', '即客好礼', '1');
INSERT INTO `advertise` VALUES ('4', '2', '4', '2015-01-23 12:41:53', 'http://the-advertisement-picture.qiniudn.com/right_bottom3.png', '即客帮手', '1');
INSERT INTO `advertise` VALUES ('5', '0', '2', '2015-01-23 12:44:25', 'http://the-advertisement-picture.qiniudn.com/left1.png', '本周推荐', '2');
INSERT INTO `advertise` VALUES ('6', '2', '3', '2015-01-23 12:44:34', 'http://the-advertisement-picture.qiniudn.com/center1.png', '注册好礼', '2');
INSERT INTO `advertise` VALUES ('7', '2', '4', '2015-01-23 12:44:45', 'http://the-advertisement-picture.qiniudn.com/right1.png', '即客帮手', '2');

-- ----------------------------
-- Table structure for `allorder`
-- ----------------------------
DROP TABLE IF EXISTS `allorder`;
CREATE TABLE `allorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `bill_status` int(2) NOT NULL,
  `isview` int(2) NOT NULL DEFAULT '0',
  `customerid` int(11) NOT NULL DEFAULT '0',
  `total_price` varchar(255) NOT NULL DEFAULT '0',
  `deliveryid` int(11) NOT NULL DEFAULT '0',
  `checkcode` varchar(5) NOT NULL,
  `deliveryprice` varchar(255) NOT NULL DEFAULT '0',
  `ordertype` int(2) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `goodsnum` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `addressid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=634 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allorder
-- ----------------------------
INSERT INTO `allorder` VALUES ('633', '1421989295335003', '3', '0', '69', '99.2', '0', '4430', '0', '0', '2015-01-23 13:01:35', '8', '15201351246', '北京市海淀区--西土城路10号院-6号楼', '间隔', '272');
INSERT INTO `allorder` VALUES ('632', '1421989068854002', '3', '0', '69', '0', '0', '3725', '0', '2', '2015-01-23 12:57:48', '0', '15201351246', '北京市海淀区西土城路10号院-6号楼', '间隔', '272');
INSERT INTO `allorder` VALUES ('631', '1421989061548001', '3', '0', '69', '0', '0', '3701', '0', '1', '2015-01-23 12:57:41', '0', '15201351246', '北京市海淀区西土城路10号院-6号楼', '间隔', '272');
INSERT INTO `allorder` VALUES ('630', '1421989033694000', '3', '0', '69', '102.2', '0', '7356', '0', '0', '2015-01-23 12:57:13', '10', '15201351246', '北京市海淀区--西土城路10号院-6号楼', '间隔', '272');
INSERT INTO `allorder` VALUES ('541', '1419473360046000', '3', '0', '148', '19.0', '8', '4184', '0', '0', '2014-12-25 10:09:20', '6', '13186986147', '杭州市拱墅区--万家花城二期26幢603', '韦玉', '240');
INSERT INTO `allorder` VALUES ('542', '1419474870119001', '3', '0', '150', '72.7', '8', '6015', '0', '0', '2014-12-25 10:34:30', '2', '15715513876', '北京市海淀区新都建材城西二里 3号楼1207', '姚健', '241');
INSERT INTO `allorder` VALUES ('543', '1419478665116002', '3', '0', '145', '17.68', '10', '8260', '0', '0', '2014-12-25 11:37:45', '4', '13910699788', '北京市昌平区--天通苑太平家园23-708', '于洪', '242');
INSERT INTO `allorder` VALUES ('544', '1419593854098000', '3', '0', '146', '767.8', '0', '8777', '0', '0', '2014-12-26 19:37:34', '40', '13658214725', '重庆市九龙坡区--渝州路60号', '简历', '236');
INSERT INTO `allorder` VALUES ('545', '1419725000596000', '3', '0', '146', '13.3', '0', '0622', '0', '0', '2014-12-28 08:03:20', '6', '13658214725', '重庆市九龙坡区--渝州路60号', '简历', '236');
INSERT INTO `allorder` VALUES ('546', '1419760599177001', '3', '0', '132', '75.5', '10', '1472', '0', '0', '2014-12-28 17:56:39', '15', '18611828300', '北京市昌平区天通苑天通东苑二区天通苑东二区九号楼1408', '胡静', '232');
INSERT INTO `allorder` VALUES ('547', '1419765452933002', '3', '0', '74', '18.3', '10', '1035', '0', '0', '2014-12-28 19:17:32', '4', '18500135421', '北京市昌平区天通苑天通东苑一区3＃1402', '皮俊章', '186');
INSERT INTO `allorder` VALUES ('548', '1419769784082003', '3', '0', '228', '24.0', '0', '7211', '0', '0', '2014-12-28 20:29:44', '1', '13810945214', '北京市昌平区--北京市昌平区北七家镇白庙村西街132号', '房建军', '245');
INSERT INTO `allorder` VALUES ('549', '1419776220916004', '3', '0', '146', '11.200001', '0', '8817', '0', '0', '2014-12-28 22:17:00', '2', '13436066680', '重庆市渝北区--天竺路65号', '蹇波', '236');
INSERT INTO `allorder` VALUES ('550', '1419821879376000', '3', '0', '279', '10.799999', '10', '8734', '0', '0', '2014-12-29 10:57:59', '6', '18511218231', '北京市昌平区--天通苑东三13 号七单元', '刘杰', '246');
INSERT INTO `allorder` VALUES ('551', '1419842139863001', '2', '0', '303', '13.0', '10', '7843', '0', '0', '2014-12-29 16:35:39', '2', '13321192928', '北京市昌平区-- 天通苑东三区19号楼202', '苏晓敏', '247');
INSERT INTO `allorder` VALUES ('552', '1419847772679002', '2', '0', '306', '33.5', '10', '5150', '0', '0', '2014-12-29 18:09:32', '10', '13910239121', '北京市昌平区--中滩村北三街', '宫永进', '248');
INSERT INTO `allorder` VALUES ('553', '1419848255147003', '3', '0', '307', '10.4', '0', '4824', '0', '0', '2014-12-29 18:17:35', '4', '18660554279', '广东省番禺区-- 番禺区大石镇大山村镇北大街18号之三', '陈羽', '249');
INSERT INTO `allorder` VALUES ('554', '1419848283795004', '3', '0', '307', '10.4', '0', '0553', '0', '0', '2014-12-29 18:18:03', '4', '18660554279', '广东省番禺区-- 番禺区大石镇大山村镇北大街18号之三', '陈羽', '249');
INSERT INTO `allorder` VALUES ('555', '1419849301024005', '3', '0', '307', '10.85', '0', '7112', '0', '0', '2014-12-29 18:35:01', '9', '18660554279', '广东省番禺区-- 番禺区大石镇大山村镇北大街18号之三', '陈羽', '249');
INSERT INTO `allorder` VALUES ('556', '1419908045278000', '3', '0', '69', '31.5', '8', '2854', '0', '0', '2014-12-30 10:54:05', '3', '15201351249', '北京市昌平区天通苑天通东苑二区测试，请勿接单', '测试', '203');
INSERT INTO `allorder` VALUES ('557', '1419911885194001', '2', '0', '228', '24.0', '10', '0705', '0', '0', '2014-12-30 11:58:05', '1', '13810945214', '北京市昌平区--北京市昌平区北七家镇白庙村西街132号', '房建军', '245');
INSERT INTO `allorder` VALUES ('558', '1419912309772002', '2', '0', '281', '10.5', '8', '5436', '0', '0', '2014-12-30 12:05:09', '5', '13343120227', '北京市昌平区--白坊物美入口修表处', '张晶', '250');
INSERT INTO `allorder` VALUES ('559', '1419914292750003', '2', '0', '138', '35.8', '8', '1754', '0', '0', '2014-12-30 12:38:12', '2', '13701124311', '北京市昌平区天通苑天通东苑一区44-4-301', '孙宁', '235');
INSERT INTO `allorder` VALUES ('560', '1419930820355007', '2', '0', '85', '13.0', '10', '8503', '0', '0', '2014-12-30 17:13:40', '2', '18501153897', '北京市昌平区-- 天通苑中院11号', '王芮', '200');
INSERT INTO `allorder` VALUES ('561', '1419931532053008', '2', '0', '315', '13.0', '10', '5324', '0', '0', '2014-12-30 17:25:32', '2', '18201647037', '北京市昌平区--昌平区天通苑东二区一号楼底商中国电信业务代办点地下室', '丁悦', '252');
INSERT INTO `allorder` VALUES ('562', '1419931701519009', '2', '0', '316', '13.0', '10', '0183', '0', '0', '2014-12-30 17:28:21', '2', '18210940897', '北京市昌平区--昌平区天通苑东二区一号楼底商中国电信业务代办点地下室', '徐冉', '253');
INSERT INTO `allorder` VALUES ('563', '1419933586251010', '2', '0', '320', '13.0', '10', '5321', '0', '0', '2014-12-30 17:59:46', '2', '13641337831', '北京市昌平区--中苑13号楼', '郭女士', '258');
INSERT INTO `allorder` VALUES ('564', '1420004426686000', '2', '0', '325', '48.0', '12', '3382', '0', '0', '2014-12-31 13:40:26', '2', '13180218899', '北京市昌平区--太平庄东路', '张曼', '273');
INSERT INTO `allorder` VALUES ('565', '1420005847642001', '2', '0', '324', '10.299999', '10', '1152', '0', '0', '2014-12-31 14:04:07', '5', '13381022739', '北京市昌平区--天通苑物美超市', '赵杰', '274');
INSERT INTO `allorder` VALUES ('566', '1420019952910002', '3', '0', '328', '13.0', '10', '1472', '0', '0', '2014-12-31 17:59:12', '2', '15830771082', '邯郸市成安县--河北省邯郸市成安县商城镇东岗村', '王亚楠', '275');
INSERT INTO `allorder` VALUES ('567', '1420022645388003', '2', '0', '138', '23.7', '10', '6608', '0', '0', '2014-12-31 18:44:05', '9', '13701124311', '北京市昌平区天通苑天通东苑一区44-4-301', '孙宁', '235');
INSERT INTO `allorder` VALUES ('568', '1420026694882004', '3', '0', '122', '14.2', '10', '8444', '0', '0', '2014-12-31 19:51:34', '2', '15811124123', '北京市昌平区--瑞旗家园31号楼301', '冯红兵', '276');
INSERT INTO `allorder` VALUES ('569', '1420079122183000', '2', '0', '120', '32.58', '10', '3184', '0', '0', '2015-01-01 10:25:22', '9', '17710023336', '北京市昌平区天通苑天通东苑一区 天通苑东一区34号楼1301', '林杨', '227');
INSERT INTO `allorder` VALUES ('570', '1420081212848001', '2', '0', '331', '107.0', '10', '1261', '0', '0', '2015-01-01 11:00:12', '11', '13911533135', '北京市昌平区天通苑天通东苑一区 26号楼3单元602室', '刘雪超', '277');
INSERT INTO `allorder` VALUES ('571', '1420086815662002', '2', '0', '338', '24.0', '10', '0514', '0', '0', '2015-01-01 12:33:35', '1', '18600171848', '北京市昌平区--天通苑东一区45号楼13单元402室', '孙连科', '278');
INSERT INTO `allorder` VALUES ('572', '1420095213756003', '2', '0', '347', '51.0', '10', '6502', '0', '0', '2015-01-01 14:53:33', '12', '13161604003', '北京市昌平区--天通苑东三区9号楼4单元402', '李晓琳', '279');
INSERT INTO `allorder` VALUES ('573', '1420102889207004', '3', '0', '363', '15.9', '0', '2250', '0', '0', '2015-01-01 17:01:29', '1', '13401103733', '北京市房山区--京石高速公路', '杨先生', '280');
INSERT INTO `allorder` VALUES ('574', '1420103101897005', '3', '0', '363', '10.3', '10', '3036', '0', '0', '2015-01-01 17:05:01', '3', '13401103733', '北京市房山区--京石高速公路', '杨先生', '280');
INSERT INTO `allorder` VALUES ('575', '1420110926404006', '2', '0', '370', '44.18', '10', '5307', '0', '0', '2015-01-01 19:15:26', '3', '18600360466', '北京市昌平区天通苑天通东苑一区 48号楼2单元301', '李娜', '282');
INSERT INTO `allorder` VALUES ('576', '1420112388699007', '3', '0', '370', '44.18', '0', '7033', '0', '0', '2015-01-01 19:39:48', '3', '18600360466', '北京市昌平区天通苑天通东苑一区 48号楼2单元301', '李娜', '282');
INSERT INTO `allorder` VALUES ('577', '1420163659036000', '3', '0', '371', '17.3', '10', '6538', '0', '0', '2015-01-02 09:54:19', '5', '15010503554', '北京市昌平区--天通苑西二区15号楼2507', '刘鑫', '283');
INSERT INTO `allorder` VALUES ('578', '1420166342725001', '2', '0', '371', '20.3', '10', '4266', '0', '0', '2015-01-02 10:39:02', '8', '15010803554', '北京市昌平区--天通苑西二区15号楼2507', '刘鑫', '283');
INSERT INTO `allorder` VALUES ('579', '1420176393756002', '3', '0', '147', '24.0', '10', '7041', '0', '0', '2015-01-02 13:26:33', '1', '18612781478', '北京市海淀区--西土城路10号院     测试', '段俊', '238');
INSERT INTO `allorder` VALUES ('580', '1420176821769004', '3', '0', '382', '24.0', '12', '0268', '0', '0', '2015-01-02 13:33:41', '1', '15011217707', 'BeijingChangping-- 天通北苑2区1-8-1202', '张先生', '284');
INSERT INTO `allorder` VALUES ('581', '1420176824453005', '2', '0', '382', '24.0', '12', '8163', '0', '0', '2015-01-02 13:33:44', '1', '15011217707', 'BeijingChangping-- 天通北苑2区1-8-1202', '张先生', '284');
INSERT INTO `allorder` VALUES ('582', '1420190253924006', '3', '0', '372', '24.0', '10', '8430', '0', '0', '2015-01-02 17:17:33', '1', '15910551150', '北京市昌平区--天通苑西三区7号楼3单元801', '刘瑞芳', '285');
INSERT INTO `allorder` VALUES ('583', '1420198835317007', '3', '0', '385', '18.4', '10', '4278', '0', '0', '2015-01-02 19:40:35', '2', '18515493673', '北京市昌平区--燕丹家家福超市', '唐庆', '286');
INSERT INTO `allorder` VALUES ('584', '1420252187516000', '2', '0', '372', '24.0', '10', '7355', '0', '0', '2015-01-03 10:29:47', '1', '15910551150', '北京市昌平区--天通苑西三区7号楼3单元801', '刘瑞芳', '285');
INSERT INTO `allorder` VALUES ('585', '1420267321221001', '3', '0', '399', '48.0', '0', '7677', '0', '0', '2015-01-03 14:42:01', '2', '13681446682', '北京市昌平区--天通北苑二区一号楼8单元1202', '张先生', '287');
INSERT INTO `allorder` VALUES ('586', '1420270711792002', '2', '0', '399', '24.0', '10', '7481', '0', '0', '2015-01-03 15:38:31', '1', '13681446682', '北京市昌平区--天通北苑二区一号楼8单元1202', '张先生', '287');
INSERT INTO `allorder` VALUES ('587', '1420287847977003', '3', '0', '120', '36.45', '0', '0874', '0', '0', '2015-01-03 20:24:07', '6', '17710023336', '北京市昌平区天通苑天通东苑一区 天通苑东一区34号楼1301', '林杨', '227');
INSERT INTO `allorder` VALUES ('588', '1420287850688004', '3', '0', '120', '36.45', '0', '4225', '0', '0', '2015-01-03 20:24:10', '6', '17710023336', '北京市昌平区天通苑天通东苑一区 天通苑东一区34号楼1301', '林杨', '227');
INSERT INTO `allorder` VALUES ('589', '1420332479578000', '3', '0', '403', '24.0', '0', '2150', '0', '0', '2015-01-04 08:47:59', '1', '13512268195', '北京市海淀区--大街胡同102102', '李张', '289');
INSERT INTO `allorder` VALUES ('590', '1420373042342001', '3', '0', '404', '13.75', '10', '1466', '0', '0', '2015-01-04 20:04:02', '4', '15602326944', '广州市番禺区--沙湾镇市良路1342号', '许建衡', '290');
INSERT INTO `allorder` VALUES ('591', '1420378490366009', '2', '0', '139', '12.0', '10', '4728', '0', '0', '2015-01-04 21:34:50', '3', '18911268172', '北京市昌平区天通苑天通东苑一区 42号楼3单元202', '陈', '291');
INSERT INTO `allorder` VALUES ('592', '1420381130292010', '3', '0', '406', '13.4', '10', '2287', '0', '0', '2015-01-04 22:18:50', '3', '18642686588', '北京市昌平区--北苑领地office', 'peter', '292');
INSERT INTO `allorder` VALUES ('593', '1420426324310000', '3', '0', '408', '20.3', '0', '1665', '0', '0', '2015-01-05 10:52:04', '4', '13566889966', '陕西省雁塔区-- 团结南路', '李晓敏', '293');
INSERT INTO `allorder` VALUES ('594', '1420426515820001', '3', '0', '408', '34.4', '12', '8034', '0', '0', '2015-01-05 10:55:15', '3', '13566889966', '陕西省雁塔区-- 科技三路西格玛大厦', '李晓敏', '293');
INSERT INTO `allorder` VALUES ('595', '1420446291148002', '3', '0', '410', '12.5', '12', '8358', '0', '0', '2015-01-05 16:24:51', '1', '18701006675', '北京市海淀区--苏州街长远天地大厦B1座12A-02', '贾金利', '295');
INSERT INTO `allorder` VALUES ('596', '1420465410711003', '3', '0', '412', '17.9', '10', '6265', '0', '0', '2015-01-05 21:43:30', '2', '15911185981', '北京市昌平区--nullnull', '任梓溶', '297');
INSERT INTO `allorder` VALUES ('597', '1420600247485000', '3', '0', '124', '13.799999', '0', '5617', '0', '0', '2015-01-07 11:10:47', '3', '13912345678', '北京市昌平区天通苑天通东苑二区y', 'd', '229');
INSERT INTO `allorder` VALUES ('598', '1420611236294001', '3', '0', '124', '219.0', '0', '0284', '0', '0', '2015-01-07 14:13:56', '5', '13912345678', '北京市昌平区天通苑天通东苑二区y', 'd', '229');
INSERT INTO `allorder` VALUES ('599', '1420652711699000', '2', '0', '416', '113.6', '10', '8521', '0', '0', '2015-01-08 01:45:11', '2', '13683342539', '北京市昌平区-- 天通苑东一区19号楼8单元602', '张韧', '300');
INSERT INTO `allorder` VALUES ('600', '1420694777637001', '2', '0', '120', '139.28', '10', '2407', '0', '0', '2015-01-08 13:26:17', '18', '17710023336', '北京市昌平区天通苑天通东苑一区 天通苑东一区34号楼1301', '林杨', '227');
INSERT INTO `allorder` VALUES ('601', '1420879851912000', '2', '0', '426', '30.199999', '10', '4337', '0', '0', '2015-01-10 16:50:51', '11', '18600394477', '北京市昌平区--天通苑西二区15号楼2507', '刘鑫', '301');
INSERT INTO `allorder` VALUES ('602', '1420946129986000', '2', '0', '303', '25.5', '10', '8701', '0', '0', '2015-01-11 11:15:30', '6', '13321192928', '北京市昌平区-- 天通苑东三区19号楼10单元202', '苏晓敏', '247');
INSERT INTO `allorder` VALUES ('603', '1420967442274001', '2', '0', '382', '81.0', '10', '6810', '0', '0', '2015-01-11 17:10:42', '25', '15011217707', 'BeijingChangping-- 天通北苑2区1-8-1202', '张先生', '284');
INSERT INTO `allorder` VALUES ('604', '1420972402452002', '2', '0', '282', '58.1', '10', '2751', '0', '0', '2015-01-11 18:33:22', '25', '13366963499', '北京市昌平区-- 天通苑东二区24号楼12单元402', '孟祥同', '302');
INSERT INTO `allorder` VALUES ('605', '1421064737320000', '3', '0', '432', '35.0', '0', '1623', '0', '0', '2015-01-12 20:12:17', '1', '18618125725', '北京市昌平区--沙河镇定泗路信苑小区', '叶先生', '304');
INSERT INTO `allorder` VALUES ('606', '1421152303514000', '2', '0', '207', '36.0', '10', '7528', '0', '0', '2015-01-13 20:31:43', '5', '13161367330', '北京市昌平区--天通苑6区6号楼2单元601', '马晓曦', '305');
INSERT INTO `allorder` VALUES ('607', '1421317538907000', '2', '0', '282', '103.7', '10', '7888', '0', '0', '2015-01-15 18:25:38', '3', '13366963499', '北京市昌平区-- 天通苑东二区24号楼12单元402', '孟祥同', '302');
INSERT INTO `allorder` VALUES ('608', '1421389905613000', '2', '0', '75', '34.0', '10', '0224', '0', '0', '2015-01-16 14:31:45', '8', '13611164039', '北京市昌平区天通苑天通东苑一区37号楼608', '张娇', '187');
INSERT INTO `allorder` VALUES ('609', '1421509122715002', '3', '0', '445', '38.3', '0', '3073', '0', '0', '2015-01-17 23:38:42', '3', '18611176915', '北京市丰台区-- 齐庄子', '刘', '306');
INSERT INTO `allorder` VALUES ('610', '1421553647928000', '3', '1', '428', '11.8', '0', '6450', '0', '0', '2015-01-18 12:00:47', '2', '15608359107', '北京市昌平区--天通苑东一区49号楼一单元301', '安洁', '307');
INSERT INTO `allorder` VALUES ('611', '1421554286915001', '2', '0', '428', '25.5', '8', '6658', '0', '0', '2015-01-18 12:11:26', '4', '15608359107', '北京市昌平区--天通苑东一区49号楼一单元301', '安洁', '307');
INSERT INTO `allorder` VALUES ('612', '1421554618981002', '3', '0', '448', '34.0', '8', '4217', '0', '0', '2015-01-18 12:16:59', '6', '18513846607', '北京市海淀区--中关村0001', '王先生', '308');
INSERT INTO `allorder` VALUES ('613', '1421568215169003', '3', '0', '453', '27.9', '0', '7127', '0', '0', '2015-01-18 16:03:35', '7', '13910788549', '北京市昌平区天通苑天通东苑一区1001', '王', '309');
INSERT INTO `allorder` VALUES ('614', '1421574342733004', '2', '0', '75', '49.46', '10', '7117', '0', '0', '2015-01-18 17:45:42', '12', '13611164039', '北京市昌平区天通苑天通东苑一区37号楼608', '张娇', '187');
INSERT INTO `allorder` VALUES ('615', '1421639173265000', '3', '0', '454', '105.0', '0', '8578', '0', '0', '2015-01-19 11:46:13', '1', '18810093521', '北京市海淀区--知春路13号', '毛小', '310');
INSERT INTO `allorder` VALUES ('616', '1421829057785001', '3', '0', '138', '61.199997', '0', '8745', '0', '0', '2015-01-21 16:30:57', '4', '13701124311', '北京市昌平区天通苑天通东苑一区44-4-301', '孙宁', '235');
INSERT INTO `allorder` VALUES ('617', '1421839384904002', '3', '0', '455', '11.0', '0', '2272', '0', '0', '2015-01-21 19:23:04', '2', '18624119826', '大连市金州区--金石路啦咯啦咯啦咯', '看看', '311');
INSERT INTO `allorder` VALUES ('618', '1421906604689000', '3', '1', '456', '10.0', '0', '0232', '0', '0', '2015-01-22 14:03:24', '10', '13462587120', '北京市昌平区--德军狙击手', '烦烦烦', '312');
INSERT INTO `allorder` VALUES ('619', '1421981283604000', '2', '0', '75', '93.100006', '10', '5418', '0', '0', '2015-01-23 10:48:03', '10', '13611164039', '北京市昌平区天通苑天通东苑一区37号楼608', '张娇', '187');
INSERT INTO `allorder` VALUES ('620', '1421984788303001', '3', '0', '69', '47.0', '0', '4878', '0', '0', '2015-01-23 11:46:28', '5', '15201351246', '北京市海淀区-- 西土城路10号院-6号楼', '间隔', '272');
INSERT INTO `allorder` VALUES ('621', '1421984800543002', '3', '0', '69', '47.0', '0', '8761', '0', '0', '2015-01-23 11:46:40', '5', '15201351246', '北京市海淀区-- 西土城路10号院-6号楼', '间隔', '272');

-- ----------------------------
-- Table structure for `allorder_history`
-- ----------------------------
DROP TABLE IF EXISTS `allorder_history`;
CREATE TABLE `allorder_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `bill_status` int(2) NOT NULL,
  `isview` int(2) NOT NULL DEFAULT '0',
  `customerid` int(11) NOT NULL DEFAULT '0',
  `total_price` varchar(255) NOT NULL DEFAULT '0',
  `deliveryid` int(11) NOT NULL DEFAULT '0',
  `checkcode` varchar(5) NOT NULL,
  `deliveryprice` varchar(255) NOT NULL DEFAULT '0',
  `ordertype` int(2) NOT NULL DEFAULT '0',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `goodsnum` int(11) NOT NULL DEFAULT '0',
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `addressid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=541 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allorder_history
-- ----------------------------
INSERT INTO `allorder_history` VALUES ('447', '1416817734339000', '3', '0', '70', '51.5', '0', '3012', '0', '0', '2014-11-24 16:28:54', '11', '17701361266', '北京市昌平区天通苑天通东苑一区16号楼201室', '王先生', '181');
INSERT INTO `allorder_history` VALUES ('448', '1416890259630000', '3', '0', '77', '80.8', '9', '0113', '0', '0', '2014-11-25 12:37:39', '7', '18611192295', '北京市昌平区天通苑天通东苑一区56号楼1103', '胡健', '189');
INSERT INTO `allorder_history` VALUES ('449', '1417111576814000', '2', '0', '69', '12.7', '9', '7478', '0', '0', '2014-11-28 02:06:16', '2', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('450', '1417111913781000', '3', '0', '69', '12.7', '0', '3001', '0', '0', '2014-11-28 02:11:53', '2', '15211111111', '北京市昌平区天通苑天通东苑三区白杨', '王振江', '184');
INSERT INTO `allorder_history` VALUES ('451', '1417112195112001', '3', '0', '69', '20.4', '9', '8613', '0', '0', '2014-11-28 02:16:35', '4', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('452', '1417117616896002', '3', '0', '69', '191.6', '0', '7603', '0', '0', '2014-11-28 03:46:56', '11', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('453', '1417117840666003', '3', '0', '82', '11.0', '0', '3842', '0', '0', '2014-11-28 03:50:40', '2', '15201351249', '北京市昌平区天通苑天通东苑一区哈哈', '哈哈', '192');
INSERT INTO `allorder_history` VALUES ('454', '1417118040065004', '3', '0', '82', '14.0', '0', '3134', '0', '0', '2014-11-28 03:54:00', '7', '15201351249', '北京市昌平区天通苑天通东苑一区哈哈', '哈哈', '192');
INSERT INTO `allorder_history` VALUES ('455', '1417125242414005', '3', '0', '63', '41.9', '0', '5484', '0', '0', '2014-11-28 05:54:02', '2', '13911342615', '北京市昌平区天通苑天通东苑三区白杨', '孔雷', '184');
INSERT INTO `allorder_history` VALUES ('456', '1417136260625000', '3', '0', '63', '41.9', '8', '4474', '0', '0', '2014-11-28 08:57:40', '2', '13911342615', '北京市昌平区天通苑天通东苑三区白杨', '孔雷', '184');
INSERT INTO `allorder_history` VALUES ('457', '1417136495710000', '3', '0', '63', '41.9', '8', '6163', '0', '0', '2014-11-28 09:01:35', '2', '13911342615', '北京市昌平区天通苑天通东苑三区白杨', '孔雷', '184');
INSERT INTO `allorder_history` VALUES ('458', '1417136845625001', '3', '0', '63', '41.9', '0', '2566', '0', '0', '2014-11-28 09:07:25', '2', '13911342615', '北京市昌平区天通苑天通东苑三区白杨', '孔雷', '184');
INSERT INTO `allorder_history` VALUES ('459', '1417137110484002', '3', '0', '83', '122.600006', '0', '0044', '0', '0', '2014-11-28 09:11:50', '19', '15201351249', '北京市昌平区天通苑天通东苑一区哈哈接口', '江哥', '199');
INSERT INTO `allorder_history` VALUES ('460', '1417138128965003', '3', '0', '70', '46.5', '0', '5160', '0', '0', '2014-11-28 09:28:48', '4', '13810497654', '北京市昌平区天通苑天通东苑二区301', '吴柯维', '179');
INSERT INTO `allorder_history` VALUES ('461', '1417138648026004', '3', '0', '63', '41.9', '0', '7866', '0', '0', '2014-11-28 09:37:28', '2', '13911342615', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('462', '1417138699762005', '3', '0', '63', '41.9', '0', '4386', '0', '0', '2014-11-28 09:38:19', '2', '13911342615', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('463', '1417138900612006', '3', '0', '70', '10.1', '0', '6032', '0', '0', '2014-11-28 09:41:40', '3', '13810497654', '北京市昌平区天通苑天通东苑二区301', '吴柯维', '179');
INSERT INTO `allorder_history` VALUES ('464', '1417141160994055', '3', '0', '63', '35.0', '0', '0782', '0', '0', '2014-11-28 10:19:20', '1', '13911342615', '北京市昌平区天通苑天通东苑二区 哈哈哈', '我们', '198');
INSERT INTO `allorder_history` VALUES ('465', '1417141162537056', '3', '0', '63', '35.0', '0', '8663', '0', '0', '2014-11-28 10:19:22', '1', '13911342615', '北京市昌平区天通苑天通东苑二区 哈哈哈', '我们', '198');
INSERT INTO `allorder_history` VALUES ('466', '1417162063522057', '3', '0', '69', '12.7', '0', '8413', '0', '0', '2014-11-28 16:07:43', '2', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('467', '1417251747613000', '3', '0', '85', '17.0', '0', '6772', '0', '0', '2014-11-29 17:02:27', '2', '17701384344', '北京市昌平区天通苑天通东苑一区 天通苑东一区33号楼301', '赵鑫', '200');
INSERT INTO `allorder_history` VALUES ('468', '1417428593020000', '3', '0', '68', '14.0', '8', '3120', '0', '0', '2014-12-01 18:09:53', '2', '18510336313', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('469', '1417428674770001', '3', '0', '68', '35.0', '10', '0007', '0', '0', '2014-12-01 18:11:14', '5', '18510336313', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('470', '1417428675261002', '3', '0', '68', '35.0', '10', '8082', '0', '0', '2014-12-01 18:11:15', '5', '18510336313', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('471', '1417429980646008', '3', '0', '63', '35.0', '8', '6178', '0', '0', '2014-12-01 18:33:00', '1', '13911342615', '北京市海淀区新都建材城西二里  硅谷小区2栋 106', '孔雷', '183');
INSERT INTO `allorder_history` VALUES ('472', '1417430136239009', '3', '0', '69', '11.5', '8', '1085', '0', '0', '2014-12-01 18:35:36', '2', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('473', '1417444868100018', '3', '0', '69', '14.0', '8', '5718', '0', '0', '2014-12-01 22:41:08', '2', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('474', '1417444879244019', '3', '0', '69', '14.0', '8', '3400', '0', '0', '2014-12-01 22:41:19', '2', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('475', '1417444887868020', '3', '0', '69', '61.5', '8', '1111', '0', '0', '2014-12-01 22:41:27', '7', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('476', '1417445586906021', '3', '0', '69', '61.5', '0', '1801', '0', '0', '2014-12-01 22:53:06', '7', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('477', '1417449393946033', '3', '0', '69', '47.9', '0', '0725', '0', '0', '2014-12-01 23:56:33', '1', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('478', '1417449396502034', '3', '0', '69', '47.9', '0', '3856', '0', '0', '2014-12-01 23:56:36', '1', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('479', '1417449410726035', '3', '0', '69', '47.9', '0', '5583', '0', '0', '2014-12-01 23:56:50', '1', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('480', '1417449806055000', '3', '0', '69', '137.8', '0', '8236', '0', '0', '2014-12-02 00:03:26', '27', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('481', '1417544000321000', '3', '0', '63', '10.7', '0', '4634', '0', '0', '2014-12-03 02:13:20', '3', '13911342615', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('482', '1417544321280001', '3', '0', '63', '10.7', '0', '1784', '0', '0', '2014-12-03 02:18:41', '3', '13412345678', '北京市昌平区天通苑天通东苑二区 我么么', '牛牛牛', '210');
INSERT INTO `allorder_history` VALUES ('483', '1417544350879002', '3', '0', '63', '10.7', '0', '0207', '0', '0', '2014-12-03 02:19:10', '3', '13911342615', '北京市昌平区天通苑天通东苑二区 哈哈哈', '擦擦', '209');
INSERT INTO `allorder_history` VALUES ('484', '1417544352564003', '3', '0', '63', '10.7', '0', '1543', '0', '0', '2014-12-03 02:19:12', '3', '13911342615', '北京市昌平区天通苑天通东苑二区 哈哈哈', '擦擦', '209');
INSERT INTO `allorder_history` VALUES ('485', '1417544779095004', '3', '0', '63', '33.0', '0', '6545', '0', '0', '2014-12-03 02:26:19', '2', '13911342615', '北京市昌平区天通苑天通东苑二区 哈哈哈', '擦擦', '209');
INSERT INTO `allorder_history` VALUES ('486', '1417545197857005', '3', '0', '63', '33.0', '0', '8175', '0', '0', '2014-12-03 02:33:17', '2', '13412345678', '北京市昌平区天通苑天通东苑二区 我么么', '牛牛牛', '210');
INSERT INTO `allorder_history` VALUES ('487', '1417549377739006', '3', '0', '63', '33.0', '0', '3186', '0', '0', '2014-12-03 03:42:57', '2', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('488', '1417551125643007', '3', '0', '63', '10.4', '0', '5277', '0', '0', '2014-12-03 04:12:05', '2', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('489', '1417551464384008', '3', '0', '63', '10.4', '0', '3720', '0', '0', '2014-12-03 04:17:44', '2', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('490', '1417578166957009', '3', '0', '68', '10.6', '0', '5647', '0', '0', '2014-12-03 11:42:46', '3', '18510336313', '北京市昌平区天通苑天通东苑二区 天通苑', '张力', '191');
INSERT INTO `allorder_history` VALUES ('491', '1417613493887028', '3', '0', '89', '11.2', '0', '4770', '0', '0', '2014-12-03 21:31:33', '4', '18907982580', '北京市昌平区天通苑天通东苑一区12座2107', '徐翔', '212');
INSERT INTO `allorder_history` VALUES ('492', '1417618717474029', '3', '0', '69', '20.7', '0', '1662', '0', '0', '2014-12-03 22:58:37', '4', '15201351249', '北京市昌平区天通苑天通东苑二区不知道怎么减肥', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('493', '1417618889779030', '3', '0', '89', '11.2', '0', '7475', '0', '0', '2014-12-03 23:01:29', '4', '18907982580', '北京市昌平区天通苑天通东苑一区12座2107', '徐翔', '212');
INSERT INTO `allorder_history` VALUES ('494', '1417626612357000', '3', '0', '70', '12.0', '0', '1562', '0', '0', '2014-12-04 01:10:12', '3', '13810497654', '北京市昌平区天通苑天通东苑二区 301', '吴柯维', '179');
INSERT INTO `allorder_history` VALUES ('495', '1417656480210001', '3', '0', '89', '10.2', '0', '3487', '0', '0', '2014-12-04 09:28:00', '4', '18907982580', '北京市昌平区天通苑天通东苑一区12座2107', '徐翔', '212');
INSERT INTO `allorder_history` VALUES ('496', '1417685818101002', '3', '0', '90', '12.0', '0', '3477', '0', '0', '2014-12-04 17:36:58', '4', '13810108431', '北京市海淀区新都北新家园北新家园', '林咸元', '213');
INSERT INTO `allorder_history` VALUES ('497', '1417687495185003', '3', '0', '91', '15.9', '0', '4331', '0', '0', '2014-12-04 18:04:55', '1', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('498', '1417704420949004', '3', '0', '92', '18.0', '0', '0344', '0', '0', '2014-12-04 22:47:00', '6', '18610210465', '北京市昌平区天通苑天通东苑一区33号楼3单元101', '李先生', '215');
INSERT INTO `allorder_history` VALUES ('499', '1417748136830000', '3', '0', '69', '16.5', '0', '8068', '0', '0', '2014-12-05 10:55:36', '3', '15201351249', '北京市昌平区天通苑天通东苑二区不知道怎么减肥', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('500', '1417845577659000', '3', '0', '92', '18.5', '0', '7366', '0', '0', '2014-12-06 13:59:37', '3', '18610210465', '北京市昌平区天通苑天通东苑一区33号楼3单元101', '李先生', '215');
INSERT INTO `allorder_history` VALUES ('501', '1417846914653001', '2', '0', '92', '17.0', '10', '4352', '0', '0', '2014-12-06 14:21:54', '2', '18610210465', '北京市昌平区天通苑天通东苑一区33号楼3单元101', '李先生', '215');
INSERT INTO `allorder_history` VALUES ('502', '1417847165829002', '3', '0', '92', '15.0', '10', '4421', '0', '0', '2014-12-06 14:26:05', '1', '18610210465', '北京市昌平区天通苑天通东苑一区33号楼3单元101', '李先生', '215');
INSERT INTO `allorder_history` VALUES ('503', '1417847415445003', '3', '0', '85', '16.5', '0', '0616', '0', '0', '2014-12-06 14:30:15', '3', '17701384344', '北京市昌平区天通苑天通东苑一区 测试地址。', '赵鑫', '217');
INSERT INTO `allorder_history` VALUES ('504', '1417847417851004', '3', '0', '85', '16.5', '0', '2808', '0', '0', '2014-12-06 14:30:17', '3', '17701384344', '北京市昌平区天通苑天通东苑一区 测试地址。', '赵鑫', '217');
INSERT INTO `allorder_history` VALUES ('505', '1417856238066005', '3', '0', '101', '128.5', '0', '2157', '0', '0', '2014-12-06 16:57:18', '4', '15810191284', '北京市海淀区新都硅谷小区无', '李大伟', '218');
INSERT INTO `allorder_history` VALUES ('506', '1417861171368006', '3', '0', '102', '21.3', '10', '1555', '0', '0', '2014-12-06 18:19:31', '4', '18600120490', '北京市昌平区天通苑天通东苑一区 测试', '双桥', '219');
INSERT INTO `allorder_history` VALUES ('507', '1418029218721000', '3', '0', '106', '12.0', '0', '0705', '0', '0', '2014-12-08 17:00:18', '3', '18610606765', '北京市昌平区天通苑天通东苑一区 19号楼', '赵先生', '221');
INSERT INTO `allorder_history` VALUES ('508', '1418029218824002', '3', '0', '106', '12.0', '0', '4526', '0', '0', '2014-12-08 17:00:18', '3', '18610606765', '北京市昌平区天通苑天通东苑一区 19号楼', '赵先生', '221');
INSERT INTO `allorder_history` VALUES ('509', '1418029218823001', '3', '0', '106', '12.0', '0', '1848', '0', '0', '2014-12-08 17:00:18', '3', '18610606765', '北京市昌平区天通苑天通东苑一区 19号楼', '赵先生', '221');
INSERT INTO `allorder_history` VALUES ('510', '1418029218970003', '3', '0', '106', '12.0', '0', '3360', '0', '0', '2014-12-08 17:00:18', '3', '18610606765', '北京市昌平区天通苑天通东苑一区 19号楼', '赵先生', '221');
INSERT INTO `allorder_history` VALUES ('511', '1418110109396000', '3', '0', '69', '50.9', '0', '4782', '0', '0', '2014-12-09 15:28:29', '8', '15201351249', '北京市昌平区天通苑天通东苑一区测试，请勿取消订单', '王振江', '178');
INSERT INTO `allorder_history` VALUES ('512', '1418119040708001', '3', '0', '66', '28.4', '0', '1585', '0', '0', '2014-12-09 17:57:20', '5', '15056694639', '北京市昌平区天通苑天通东苑一区 一条街', '海子', '223');
INSERT INTO `allorder_history` VALUES ('513', '1418119042602002', '3', '0', '66', '28.4', '0', '2564', '0', '0', '2014-12-09 17:57:22', '5', '15056694639', '北京市昌平区天通苑天通东苑一区 一条街', '海子', '223');
INSERT INTO `allorder_history` VALUES ('514', '1418119043520003', '3', '0', '66', '28.4', '0', '1127', '0', '0', '2014-12-09 17:57:23', '5', '15056694639', '北京市昌平区天通苑天通东苑一区 一条街', '海子', '223');
INSERT INTO `allorder_history` VALUES ('515', '1418119570637004', '3', '0', '109', '22.1', '8', '7056', '0', '0', '2014-12-09 18:06:10', '2', '13910900287', '北京市海淀区新都建材城西二里 你好', '立', '224');
INSERT INTO `allorder_history` VALUES ('516', '1418119857544005', '3', '0', '63', '23.0', '0', '8173', '0', '0', '2014-12-09 18:10:57', '3', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('517', '1418119891645006', '3', '0', '63', '10.8', '0', '1444', '0', '0', '2014-12-09 18:11:31', '3', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('518', '1418120012099007', '3', '0', '63', '11.0', '0', '7846', '0', '0', '2014-12-09 18:13:32', '2', '13112345678', '北京市昌平区天通苑天通东苑三区 走在一条路', '咱们', '211');
INSERT INTO `allorder_history` VALUES ('519', '1418128802180009', '3', '0', '69', '82.8', '0', '6680', '0', '0', '2014-12-09 20:40:02', '17', '15201351249', '北京市昌平区天通苑天通东苑二区 不知道怎么减肥', '家庭', '203');
INSERT INTO `allorder_history` VALUES ('520', '1418130074026010', '3', '0', '69', '12.5', '0', '1468', '0', '0', '2014-12-09 21:01:14', '3', '15201351249', '北京市昌平区天通苑天通东苑二区 测试，请勿接单', '测试', '203');
INSERT INTO `allorder_history` VALUES ('521', '1418193782101000', '3', '0', '110', '11.9', '0', '2180', '0', '0', '2014-12-10 14:43:02', '2', '13845233365', '北京市海淀区新都北新家园啊啊啊啊', '加南村', '225');
INSERT INTO `allorder_history` VALUES ('522', '1418231769737000', '3', '0', '113', '73.3', '8', '2032', '0', '0', '2014-12-11 01:16:09', '4', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('523', '1418231770390001', '3', '0', '113', '73.3', '8', '0022', '0', '0', '2014-12-11 01:16:10', '4', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('524', '1418231781766002', '3', '0', '113', '73.3', '8', '5715', '0', '0', '2014-12-11 01:16:21', '4', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('525', '1418472199908000', '2', '0', '120', '20.3', '8', '8341', '0', '0', '2014-12-13 20:03:19', '5', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('526', '1418482626155001', '3', '0', '122', '41.699997', '0', '5443', '0', '0', '2014-12-13 22:57:06', '6', '15611063333', '北京市昌平区天通苑天通东苑三区放个假加减了吗', '吃不饱那', '228');
INSERT INTO `allorder_history` VALUES ('527', '1418553644775000', '3', '0', '124', '15.0', '0', '6736', '0', '0', '2014-12-14 18:40:44', '5', '13912345678', '北京市昌平区天通苑天通东苑二区y', 'd', '229');
INSERT INTO `allorder_history` VALUES ('528', '1418624992994000', '3', '0', '127', '11.9', '0', '6763', '0', '0', '2014-12-15 14:29:53', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('529', '1419038119847000', '3', '0', '136', '10.2', '8', '6522', '0', '0', '2014-12-20 09:15:19', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('530', '1419038131792001', '3', '0', '136', '10.2', '8', '5842', '0', '0', '2014-12-20 09:15:31', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('531', '1419038135730002', '3', '0', '136', '10.2', '8', '5166', '0', '0', '2014-12-20 09:15:35', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('532', '1419038139759003', '3', '0', '136', '10.2', '0', '4370', '0', '0', '2014-12-20 09:15:39', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('533', '1419038150626004', '3', '0', '136', '10.2', '8', '8262', '0', '0', '2014-12-20 09:15:50', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('534', '1419038152545005', '3', '0', '136', '10.2', '8', '1713', '0', '0', '2014-12-20 09:15:52', '2', '(null)', '(null)', '(null)', '0');
INSERT INTO `allorder_history` VALUES ('535', '1419129574356000', '3', '0', '120', '28.5', '0', '5463', '0', '0', '2014-12-21 10:39:34', '7', '17710023336', '北京市昌平区天通苑天通东苑一区 天通苑东一区34号楼1301', '林杨', '227');
INSERT INTO `allorder_history` VALUES ('536', '1419238519335000', '2', '0', '138', '31.6', '8', '2321', '0', '0', '2014-12-22 16:55:19', '4', '13701124311', '北京市昌平区天通苑天通东苑一区44-4-301', '孙宁', '235');
INSERT INTO `allorder_history` VALUES ('537', '1419401776009000', '3', '0', '68', '32.9', '0', '1006', '0', '0', '2014-12-24 14:16:16', '1', '18510336313', '北京市昌平区天通苑天通东苑二区天通苑（测试勿接单）', '张力', '191');
INSERT INTO `allorder_history` VALUES ('538', '1419402443636001', '3', '0', '147', '109.600006', '0', '4438', '0', '0', '2014-12-24 14:27:23', '10', '18612781478', '北京市海淀区--西土城路10号院     测试', '段俊', '238');
INSERT INTO `allorder_history` VALUES ('539', '1419407228555002', '3', '0', '69', '45.0', '8', '1710', '0', '0', '2014-12-24 15:47:08', '2', '15201351249', '北京市昌平区天通苑天通东苑二区测试，请勿接单', '测试', '203');
INSERT INTO `allorder_history` VALUES ('540', '1419417275464003', '3', '0', '69', '13.3', '0', '8428', '0', '0', '2014-12-24 18:34:35', '3', '15201351249', '北京市昌平区天通苑天通东苑二区 测试，请勿接单', '测试', '203');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(64) DEFAULT NULL COMMENT '地区名称',
  `longitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `parent_id` int(64) DEFAULT NULL COMMENT '地区',
  `description` varchar(500) DEFAULT NULL COMMENT '地区描述',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', '北京市', '1111', '1111', '-1', '北京市111', '2014-08-19 17:34:34');
INSERT INTO `area` VALUES ('3', '海淀区', '1212', '1212', '1', '海淀区111', '2014-08-14 17:36:47');
INSERT INTO `area` VALUES ('41', '新都', '0', '0', '0', '新都', '2014-12-10 14:59:55');
INSERT INTO `area` VALUES ('50', '昌平区', '0', '0', '1', '昌平区', '2014-10-24 21:23:14');
INSERT INTO `area` VALUES ('51', '天通苑', '0', '0', '50', '天通苑', '2014-10-24 21:23:14');

-- ----------------------------
-- Table structure for `bill`
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `product_number` int(11) NOT NULL DEFAULT '0',
  `product_price` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1494 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('934', '1414300244769007', '1000506', '9', '5.5');
INSERT INTO `bill` VALUES ('935', '1414306432989008', '1000504', '1', '5');
INSERT INTO `bill` VALUES ('936', '1414306432989008', '1000625', '2', '3');
INSERT INTO `bill` VALUES ('937', '1414306432989008', '1000550', '1', '3.5');
INSERT INTO `bill` VALUES ('938', '1414306432989008', '1000593', '1', '4');
INSERT INTO `bill` VALUES ('939', '1414306432989008', '1000583', '1', '5');
INSERT INTO `bill` VALUES ('940', '1414306432989008', '1000581', '2', '3.8');
INSERT INTO `bill` VALUES ('941', '1414306714846009', '1000548', '1', '3.5');
INSERT INTO `bill` VALUES ('942', '1414306714846009', '1000625', '2', '3');
INSERT INTO `bill` VALUES ('943', '1414306714846009', '1000504', '1', '5');
INSERT INTO `bill` VALUES ('944', '1414306714846009', '1000593', '1', '4');
INSERT INTO `bill` VALUES ('945', '1414306714846009', '1000583', '1', '5');
INSERT INTO `bill` VALUES ('946', '1414306714846009', '1000581', '2', '3.8');
INSERT INTO `bill` VALUES ('947', '1414402200693000', '1000610', '1', '7');
INSERT INTO `bill` VALUES ('948', '1414402200693000', '1000682', '1', '47.9');
INSERT INTO `bill` VALUES ('949', '1414402200693000', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('950', '1414402253648001', '1000679', '4', '18.9');
INSERT INTO `bill` VALUES ('951', '1414402894773002', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('952', '1414402894773002', '1000504', '2', '5');
INSERT INTO `bill` VALUES ('953', '1414402894773002', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('954', '1414403621184003', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('955', '1414403621184003', '1000504', '2', '5');
INSERT INTO `bill` VALUES ('956', '1414403621184003', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('957', '1414419437366000', '1000680', '1', '59');
INSERT INTO `bill` VALUES ('958', '1414426648282000', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('959', '1414426648282000', '1000504', '2', '5');
INSERT INTO `bill` VALUES ('960', '1414426648282000', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('961', '1414469199501001', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('962', '1414469199501001', '1000504', '3', '5');
INSERT INTO `bill` VALUES ('963', '1414469199501001', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('964', '1414469965478002', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('965', '1414469965478002', '1000504', '1', '5');
INSERT INTO `bill` VALUES ('966', '1414469965478002', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('967', '1415245643812000', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('968', '1415335964389000', '1000650', '2', '26');
INSERT INTO `bill` VALUES ('969', '1415428577283000', '1000721', '1', '9.5');
INSERT INTO `bill` VALUES ('970', '1415428577283000', '1000582', '2', '3.5');
INSERT INTO `bill` VALUES ('971', '1415428577283000', '1000592', '2', '3');
INSERT INTO `bill` VALUES ('972', '1415428577283000', '1000627', '4', '2');
INSERT INTO `bill` VALUES ('973', '1415429250480001', '1000720', '2', '4.5');
INSERT INTO `bill` VALUES ('974', '1415429250480001', '1000571', '3', '2.5');
INSERT INTO `bill` VALUES ('975', '1415429250480001', '1000630', '2', '2');
INSERT INTO `bill` VALUES ('976', '1415429250480001', '1000627', '5', '2');
INSERT INTO `bill` VALUES ('977', '1416107877080000', '1000705', '8', '1.8');
INSERT INTO `bill` VALUES ('978', '1416107877080000', '1000585', '2', '4.2');
INSERT INTO `bill` VALUES ('979', '1416107877080000', '1000753', '3', '1');
INSERT INTO `bill` VALUES ('980', '1416107877080000', '1000686', '1', '35');
INSERT INTO `bill` VALUES ('981', '1416107877080000', '1000746', '2', '2.5');
INSERT INTO `bill` VALUES ('982', '1416107877080000', '1000595', '1', '3');
INSERT INTO `bill` VALUES ('983', '1416107877080000', '1000626', '2', '1.6');
INSERT INTO `bill` VALUES ('984', '1416107877080000', '1000599', '1', '3.5');
INSERT INTO `bill` VALUES ('985', '1416108332854001', '1000705', '8', '1.8');
INSERT INTO `bill` VALUES ('986', '1416108332854001', '1000753', '3', '1');
INSERT INTO `bill` VALUES ('987', '1416108332854001', '1000585', '2', '4.2');
INSERT INTO `bill` VALUES ('988', '1416108332854001', '1000686', '1', '35');
INSERT INTO `bill` VALUES ('989', '1416108332854001', '1000746', '2', '2.5');
INSERT INTO `bill` VALUES ('990', '1416108332854001', '1000595', '1', '3');
INSERT INTO `bill` VALUES ('991', '1416108332854001', '1000626', '2', '1.6');
INSERT INTO `bill` VALUES ('992', '1416108332854001', '1000599', '1', '3.5');
INSERT INTO `bill` VALUES ('993', '1416116701209002', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('994', '1416116701209002', '1000793', '1', '8.5');
INSERT INTO `bill` VALUES ('995', '1416116701209002', '1000511', '1', '10');
INSERT INTO `bill` VALUES ('996', '1416116701209002', '1000570', '1', '3');
INSERT INTO `bill` VALUES ('997', '1416140687661003', '1000729', '2', '18');
INSERT INTO `bill` VALUES ('998', '1416140687661003', '1000507', '2', '4.9');
INSERT INTO `bill` VALUES ('999', '1416140687661003', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1000', '1416140687661003', '1000509', '1', '6');
INSERT INTO `bill` VALUES ('1001', '1416140687661003', '1000508', '2', '6');
INSERT INTO `bill` VALUES ('1002', '1416214471984000', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('1003', '1416214471984000', '1000504', '1', '5');
INSERT INTO `bill` VALUES ('1004', '1416214471984000', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('1005', '1416214471984000', '1000638', '2', '5.9');
INSERT INTO `bill` VALUES ('1006', '1416214471984000', '1000639', '2', '5.5');
INSERT INTO `bill` VALUES ('1007', '1416284167157000', '1000509', '1', '6');
INSERT INTO `bill` VALUES ('1008', '1416284167157000', '1000508', '1', '6');
INSERT INTO `bill` VALUES ('1009', '1416284167157000', '1000507', '2', '4.9');
INSERT INTO `bill` VALUES ('1010', '1416284167157000', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('1011', '1416285768572001', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('1012', '1416285768572001', '1000686', '1', '35');
INSERT INTO `bill` VALUES ('1013', '1416817734339000', '1000518', '1', '9.5');
INSERT INTO `bill` VALUES ('1014', '1416817734339000', '1000619', '3', '2.5');
INSERT INTO `bill` VALUES ('1015', '1416817734339000', '1000512', '1', '7.2');
INSERT INTO `bill` VALUES ('1016', '1416817734339000', '1000579', '1', '3.5');
INSERT INTO `bill` VALUES ('1017', '1416817734339000', '1000543', '1', '8.3');
INSERT INTO `bill` VALUES ('1018', '1416817734339000', '1000625', '1', '3');
INSERT INTO `bill` VALUES ('1019', '1416817734339000', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1020', '1416817734339000', '1000570', '1', '3');
INSERT INTO `bill` VALUES ('1021', '1416817734339000', '1000521', '1', '4');
INSERT INTO `bill` VALUES ('1022', '1416890259630000', '1000797', '1', '7.5');
INSERT INTO `bill` VALUES ('1023', '1416890259630000', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('1024', '1416890259630000', '1000799', '1', '7.5');
INSERT INTO `bill` VALUES ('1025', '1416890259630000', '1000798', '1', '7.5');
INSERT INTO `bill` VALUES ('1026', '1416890259630000', '1000637', '2', '7.9');
INSERT INTO `bill` VALUES ('1027', '1416890259630000', '1000800', '1', '7.5');
INSERT INTO `bill` VALUES ('1028', '1417111576814000', '1000505', '1', '7.2');
INSERT INTO `bill` VALUES ('1029', '1417111576814000', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1030', '1417111913781000', '1000505', '1', '7.2');
INSERT INTO `bill` VALUES ('1031', '1417111913781000', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1032', '1417112195112001', '1000579', '1', '3.5');
INSERT INTO `bill` VALUES ('1033', '1417112195112001', '1000638', '1', '5.9');
INSERT INTO `bill` VALUES ('1034', '1417112195112001', '1000639', '1', '5.5');
INSERT INTO `bill` VALUES ('1035', '1417112195112001', '1000640', '1', '5.5');
INSERT INTO `bill` VALUES ('1036', '1417117616896002', '1000584', '1', '4.5');
INSERT INTO `bill` VALUES ('1037', '1417117616896002', '1000680', '1', '59');
INSERT INTO `bill` VALUES ('1038', '1417117616896002', '1000650', '4', '26');
INSERT INTO `bill` VALUES ('1039', '1417117616896002', '1000505', '1', '7.2');
INSERT INTO `bill` VALUES ('1040', '1417117616896002', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1041', '1417117616896002', '1000688', '1', '3.8');
INSERT INTO `bill` VALUES ('1042', '1417117616896002', '1000689', '1', '3.8');
INSERT INTO `bill` VALUES ('1043', '1417117616896002', '1000690', '1', '3.8');
INSERT INTO `bill` VALUES ('1044', '1417117840666003', '1000506', '2', '5.5');
INSERT INTO `bill` VALUES ('1045', '1417118040065004', '1000677', '7', '2');
INSERT INTO `bill` VALUES ('1046', '1417125242414005', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1047', '1417125242414005', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1048', '1417136260625000', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1049', '1417136260625000', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1050', '1417136495710000', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1051', '1417136495710000', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1052', '1417136845625001', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1053', '1417136845625001', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1054', '1417137110484002', '1000586', '1', '4');
INSERT INTO `bill` VALUES ('1055', '1417137110484002', '1000650', '1', '26');
INSERT INTO `bill` VALUES ('1056', '1417137110484002', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('1057', '1417137110484002', '1000579', '5', '3.5');
INSERT INTO `bill` VALUES ('1058', '1417137110484002', '1000578', '1', '3.6');
INSERT INTO `bill` VALUES ('1059', '1417137110484002', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1060', '1417137110484002', '1000678', '2', '15.9');
INSERT INTO `bill` VALUES ('1061', '1417137110484002', '1000571', '4', '2.5');
INSERT INTO `bill` VALUES ('1062', '1417137110484002', '1000580', '1', '6.8');
INSERT INTO `bill` VALUES ('1063', '1417137110484002', '1000570', '1', '3');
INSERT INTO `bill` VALUES ('1064', '1417138128965003', '1000650', '1', '26');
INSERT INTO `bill` VALUES ('1065', '1417138128965003', '1000571', '1', '2.5');
INSERT INTO `bill` VALUES ('1066', '1417138128965003', '1000574', '1', '15');
INSERT INTO `bill` VALUES ('1067', '1417138128965003', '1000570', '1', '3');
INSERT INTO `bill` VALUES ('1068', '1417138648026004', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1069', '1417138648026004', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1070', '1417138699762005', '1000650', '1', '26.00');
INSERT INTO `bill` VALUES ('1071', '1417138699762005', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1072', '1417138900612006', '1000579', '1', '3.5');
INSERT INTO `bill` VALUES ('1073', '1417138900612006', '1000578', '1', '3.6');
INSERT INTO `bill` VALUES ('1074', '1417138900612006', '1000570', '1', '3');
INSERT INTO `bill` VALUES ('1075', '1417141160994055', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1076', '1417141162537056', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1077', '1417162063522057', '1000505', '1', '7.2');
INSERT INTO `bill` VALUES ('1078', '1417162063522057', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1079', '1417251747613000', '1000512', '1', '7.20');
INSERT INTO `bill` VALUES ('1080', '1417251747613000', '1000736', '1', '9.80');
INSERT INTO `bill` VALUES ('1081', '1417428593020000', '1000577', '2', '7.00');
INSERT INTO `bill` VALUES ('1082', '1417428674770001', '1000577', '5', '7.00');
INSERT INTO `bill` VALUES ('1083', '1417428675261002', '1000577', '5', '7.00');
INSERT INTO `bill` VALUES ('1084', '1417429980646008', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1085', '1417430136239009', '1000508', '1', '6');
INSERT INTO `bill` VALUES ('1086', '1417430136239009', '1000506', '1', '5.5');
INSERT INTO `bill` VALUES ('1087', '1417444868100018', '1000720', '1', '4.50');
INSERT INTO `bill` VALUES ('1088', '1417444868100018', '1000721', '1', '9.50');
INSERT INTO `bill` VALUES ('1089', '1417444879244019', '1000720', '1', '4.50');
INSERT INTO `bill` VALUES ('1090', '1417444879244019', '1000721', '1', '9.50');
INSERT INTO `bill` VALUES ('1091', '1417444887868020', '1000720', '1', '4.50');
INSERT INTO `bill` VALUES ('1092', '1417444887868020', '1000721', '6', '9.50');
INSERT INTO `bill` VALUES ('1093', '1417445586906021', '1000720', '1', '4.50');
INSERT INTO `bill` VALUES ('1094', '1417445586906021', '1000721', '6', '9.50');
INSERT INTO `bill` VALUES ('1095', '1417449393946033', '1000682', '1', '47.90');
INSERT INTO `bill` VALUES ('1096', '1417449396502034', '1000682', '1', '47.90');
INSERT INTO `bill` VALUES ('1097', '1417449410726035', '1000682', '1', '47.90');
INSERT INTO `bill` VALUES ('1098', '1417449806055000', '1000508', '5', '6.00');
INSERT INTO `bill` VALUES ('1099', '1417449806055000', '1000507', '22', '4.90');
INSERT INTO `bill` VALUES ('1100', '1417544000321000', '1000578', '2', '3.60');
INSERT INTO `bill` VALUES ('1101', '1417544000321000', '1000579', '1', '3.50');
INSERT INTO `bill` VALUES ('1102', '1417544321280001', '1000578', '2', '3.60');
INSERT INTO `bill` VALUES ('1103', '1417544321280001', '1000579', '1', '3.50');
INSERT INTO `bill` VALUES ('1104', '1417544350879002', '1000578', '2', '3.60');
INSERT INTO `bill` VALUES ('1105', '1417544350879002', '1000579', '1', '3.50');
INSERT INTO `bill` VALUES ('1106', '1417544352564003', '1000578', '2', '3.60');
INSERT INTO `bill` VALUES ('1107', '1417544352564003', '1000579', '1', '3.50');
INSERT INTO `bill` VALUES ('1108', '1417544779095004', '1000731', '2', '16.50');
INSERT INTO `bill` VALUES ('1109', '1417545197857005', '1000731', '2', '16.50');
INSERT INTO `bill` VALUES ('1110', '1417549377739006', '1000731', '2', '16.50');
INSERT INTO `bill` VALUES ('1111', '1417551125643007', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1112', '1417551125643007', '1000507', '1', '4.90');
INSERT INTO `bill` VALUES ('1113', '1417551464384008', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1114', '1417551464384008', '1000507', '1', '4.90');
INSERT INTO `bill` VALUES ('1115', '1417578166957009', '1000570', '1', '3.00');
INSERT INTO `bill` VALUES ('1116', '1417578166957009', '1000572', '1', '3.80');
INSERT INTO `bill` VALUES ('1117', '1417578166957009', '1000689', '1', '3.80');
INSERT INTO `bill` VALUES ('1118', '1417613493887028', '1000624', '2', '3');
INSERT INTO `bill` VALUES ('1119', '1417613493887028', '1000778', '2', '2.6');
INSERT INTO `bill` VALUES ('1120', '1417618717474029', '1000508', '1', '6');
INSERT INTO `bill` VALUES ('1121', '1417618717474029', '1000507', '3', '4.9');
INSERT INTO `bill` VALUES ('1122', '1417618889779030', '1000624', '2', '3');
INSERT INTO `bill` VALUES ('1123', '1417618889779030', '1000778', '2', '2.6');
INSERT INTO `bill` VALUES ('1124', '1417626612357000', '1000724', '3', '4.00');
INSERT INTO `bill` VALUES ('1125', '1417656480210001', '1000620', '2', '2.5');
INSERT INTO `bill` VALUES ('1126', '1417656480210001', '1000778', '2', '2.6');
INSERT INTO `bill` VALUES ('1127', '1417685818101002', '1000625', '4', '3');
INSERT INTO `bill` VALUES ('1128', '1417687495185003', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1129', '1417704420949004', '1000570', '6', '3');
INSERT INTO `bill` VALUES ('1130', '1417748136830000', '1000506', '3', '5.5');
INSERT INTO `bill` VALUES ('1131', '1417845577659000', '1000647', '1', '10.3');
INSERT INTO `bill` VALUES ('1132', '1417845577659000', '1000687', '2', '4.1');
INSERT INTO `bill` VALUES ('1133', '1417846914653001', '1000793', '2', '8.5');
INSERT INTO `bill` VALUES ('1134', '1417847165829002', '1000574', '1', '15');
INSERT INTO `bill` VALUES ('1135', '1417847415445003', '1000506', '3', '5.50');
INSERT INTO `bill` VALUES ('1136', '1417847417851004', '1000506', '3', '5.50');
INSERT INTO `bill` VALUES ('1137', '1417856238066005', '1000831', '1', '18.9');
INSERT INTO `bill` VALUES ('1138', '1417856238066005', '1000827', '1', '36');
INSERT INTO `bill` VALUES ('1139', '1417856238066005', '1000826', '2', '36.8');
INSERT INTO `bill` VALUES ('1140', '1417861171368006', '1000519', '1', '9.50');
INSERT INTO `bill` VALUES ('1141', '1417861171368006', '1000521', '1', '4.00');
INSERT INTO `bill` VALUES ('1142', '1417861171368006', '1000522', '1', '3.80');
INSERT INTO `bill` VALUES ('1143', '1417861171368006', '1000523', '1', '4.00');
INSERT INTO `bill` VALUES ('1144', '1418029218721000', '1000724', '3', '4.00');
INSERT INTO `bill` VALUES ('1145', '1418029218824002', '1000724', '3', '4.00');
INSERT INTO `bill` VALUES ('1146', '1418029218823001', '1000724', '3', '4.00');
INSERT INTO `bill` VALUES ('1147', '1418029218970003', '1000724', '3', '4.00');
INSERT INTO `bill` VALUES ('1148', '1418110109396000', '1000505', '2', '7.2');
INSERT INTO `bill` VALUES ('1149', '1418110109396000', '1000721', '1', '9.5');
INSERT INTO `bill` VALUES ('1150', '1418110109396000', '1000720', '1', '4.5');
INSERT INTO `bill` VALUES ('1151', '1418110109396000', '1000782', '1', '6');
INSERT INTO `bill` VALUES ('1152', '1418110109396000', '1000506', '3', '5.5');
INSERT INTO `bill` VALUES ('1153', '1418119040708001', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1154', '1418119040708001', '1000507', '1', '4.90');
INSERT INTO `bill` VALUES ('1155', '1418119040708001', '1000509', '1', '6.00');
INSERT INTO `bill` VALUES ('1156', '1418119040708001', '1000508', '1', '6.00');
INSERT INTO `bill` VALUES ('1157', '1418119040708001', '1000510', '1', '6.00');
INSERT INTO `bill` VALUES ('1158', '1418119042602002', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1159', '1418119042602002', '1000507', '1', '4.90');
INSERT INTO `bill` VALUES ('1160', '1418119042602002', '1000509', '1', '6.00');
INSERT INTO `bill` VALUES ('1161', '1418119042602002', '1000508', '1', '6.00');
INSERT INTO `bill` VALUES ('1162', '1418119042602002', '1000510', '1', '6.00');
INSERT INTO `bill` VALUES ('1163', '1418119043520003', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1164', '1418119043520003', '1000507', '1', '4.90');
INSERT INTO `bill` VALUES ('1165', '1418119043520003', '1000509', '1', '6.00');
INSERT INTO `bill` VALUES ('1166', '1418119043520003', '1000508', '1', '6.00');
INSERT INTO `bill` VALUES ('1167', '1418119043520003', '1000510', '1', '6.00');
INSERT INTO `bill` VALUES ('1168', '1418119570637004', '1000729', '1', '18');
INSERT INTO `bill` VALUES ('1169', '1418119570637004', '1000687', '1', '4.1');
INSERT INTO `bill` VALUES ('1170', '1418119857544005', '1000719', '1', '9.00');
INSERT INTO `bill` VALUES ('1171', '1418119857544005', '1000720', '1', '4.50');
INSERT INTO `bill` VALUES ('1172', '1418119857544005', '1000721', '1', '9.50');
INSERT INTO `bill` VALUES ('1173', '1418119891645006', '1000578', '3', '3.60');
INSERT INTO `bill` VALUES ('1174', '1418120012099007', '1000506', '2', '5.50');
INSERT INTO `bill` VALUES ('1175', '1418128802180009', '1000619', '6', '2.50');
INSERT INTO `bill` VALUES ('1176', '1418128802180009', '1000505', '2', '7.20');
INSERT INTO `bill` VALUES ('1177', '1418128802180009', '1000506', '1', '5.50');
INSERT INTO `bill` VALUES ('1178', '1418128802180009', '1000593', '1', '4.00');
INSERT INTO `bill` VALUES ('1179', '1418128802180009', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1180', '1418128802180009', '1000595', '1', '3.00');
INSERT INTO `bill` VALUES ('1181', '1418128802180009', '1000596', '1', '4.00');
INSERT INTO `bill` VALUES ('1182', '1418128802180009', '1000731', '1', '16.50');
INSERT INTO `bill` VALUES ('1183', '1418128802180009', '1000781', '1', '4.50');
INSERT INTO `bill` VALUES ('1184', '1418128802180009', '1000782', '1', '6.00');
INSERT INTO `bill` VALUES ('1185', '1418128802180009', '1000730', '1', '6.90');
INSERT INTO `bill` VALUES ('1186', '1418130074026010', '1000832', '1', '3.60');
INSERT INTO `bill` VALUES ('1187', '1418130074026010', '1000713', '1', '4.00');
INSERT INTO `bill` VALUES ('1188', '1418130074026010', '1000712', '1', '4.90');
INSERT INTO `bill` VALUES ('1189', '1418193782101000', '1000504', '1', '5');
INSERT INTO `bill` VALUES ('1190', '1418193782101000', '1000730', '1', '6.9');
INSERT INTO `bill` VALUES ('1191', '1418231769737000', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1192', '1418231769737000', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1193', '1418231769737000', '1000734', '1', '9.90');
INSERT INTO `bill` VALUES ('1194', '1418231769737000', '1000700', '1', '12.50');
INSERT INTO `bill` VALUES ('1195', '1418231770390001', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1196', '1418231770390001', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1197', '1418231770390001', '1000734', '1', '9.90');
INSERT INTO `bill` VALUES ('1198', '1418231770390001', '1000700', '1', '12.50');
INSERT INTO `bill` VALUES ('1199', '1418231781766002', '1000685', '1', '35.00');
INSERT INTO `bill` VALUES ('1200', '1418231781766002', '1000678', '1', '15.90');
INSERT INTO `bill` VALUES ('1201', '1418231781766002', '1000734', '1', '9.90');
INSERT INTO `bill` VALUES ('1202', '1418231781766002', '1000700', '1', '12.50');
INSERT INTO `bill` VALUES ('1203', '1418472199908000', '1000584', '3', '4.50');
INSERT INTO `bill` VALUES ('1204', '1418472199908000', '1000590', '1', '4.00');
INSERT INTO `bill` VALUES ('1205', '1418472199908000', '1000618', '1', '2.80');
INSERT INTO `bill` VALUES ('1206', '1418482626155001', '1000736', '1', '9.8');
INSERT INTO `bill` VALUES ('1207', '1418482626155001', '1000506', '4', '5.5');
INSERT INTO `bill` VALUES ('1208', '1418482626155001', '1000737', '1', '9.9');
INSERT INTO `bill` VALUES ('1209', '1418553644775000', '1000570', '5', '3');
INSERT INTO `bill` VALUES ('1210', '1418624992994000', '1000719', '1', '9.00');
INSERT INTO `bill` VALUES ('1211', '1418624992994000', '1000792', '1', '2.90');
INSERT INTO `bill` VALUES ('1212', '1419038119847000', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1213', '1419038119847000', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1214', '1419038131792001', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1215', '1419038131792001', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1216', '1419038135730002', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1217', '1419038135730002', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1218', '1419038139759003', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1219', '1419038139759003', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1220', '1419038150626004', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1221', '1419038150626004', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1222', '1419038152545005', '1000505', '1', '7.20');
INSERT INTO `bill` VALUES ('1223', '1419038152545005', '1000594', '1', '3.00');
INSERT INTO `bill` VALUES ('1224', '1419129574356000', '1000623', '1', '2.50');
INSERT INTO `bill` VALUES ('1225', '1419129574356000', '1000618', '1', '2.80');
INSERT INTO `bill` VALUES ('1226', '1419129574356000', '1000613', '1', '4.00');
INSERT INTO `bill` VALUES ('1227', '1419129574356000', '1000584', '2', '4.50');
INSERT INTO `bill` VALUES ('1228', '1419129574356000', '1000590', '1', '4.00');
INSERT INTO `bill` VALUES ('1229', '1419129574356000', '1000567', '1', '6.20');
INSERT INTO `bill` VALUES ('1230', '1419238519335000', '1000637', '4', '7.9');
INSERT INTO `bill` VALUES ('1231', '1419401776009000', '1030486', '1', '32.9');
INSERT INTO `bill` VALUES ('1232', '1419402443636001', '1030877', '1', '6.2');
INSERT INTO `bill` VALUES ('1233', '1419402443636001', '1000543', '4', '8.3');
INSERT INTO `bill` VALUES ('1234', '1419402443636001', '1000687', '1', '4.1');
INSERT INTO `bill` VALUES ('1235', '1419402443636001', '1000716', '1', '15');
INSERT INTO `bill` VALUES ('1236', '1419402443636001', '1030220', '1', '18.3');
INSERT INTO `bill` VALUES ('1237', '1419402443636001', '1030091', '1', '7.8');
INSERT INTO `bill` VALUES ('1238', '1419402443636001', '1000727', '1', '25');
INSERT INTO `bill` VALUES ('1239', '1419407228555002', '1030996', '1', '43.2');
INSERT INTO `bill` VALUES ('1240', '1419407228555002', '1030997', '1', '1.8');
INSERT INTO `bill` VALUES ('1241', '1419417275464003', '1030574', '1', '3.30');
INSERT INTO `bill` VALUES ('1242', '1419417275464003', '1000583', '2', '5.00');
INSERT INTO `bill` VALUES ('1243', '1419473360046000', '1030776', '2', '2.4');
INSERT INTO `bill` VALUES ('1244', '1419473360046000', '1030174', '2', '2.2');
INSERT INTO `bill` VALUES ('1245', '1419473360046000', '1030040', '2', '4.9');
INSERT INTO `bill` VALUES ('1246', '1419474870119001', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('1247', '1419474870119001', '1030181', '1', '37.7');
INSERT INTO `bill` VALUES ('1248', '1419478665116002', '1030411', '1', '2');
INSERT INTO `bill` VALUES ('1249', '1419478665116002', '1030124', '1', '7.98');
INSERT INTO `bill` VALUES ('1250', '1419478665116002', '1030990', '1', '1.9');
INSERT INTO `bill` VALUES ('1251', '1419478665116002', '1030245', '1', '5.8');
INSERT INTO `bill` VALUES ('1252', '1419593854098000', '1000721', '10', '9.5');
INSERT INTO `bill` VALUES ('1253', '1419593854098000', '1000585', '1', '4.2');
INSERT INTO `bill` VALUES ('1254', '1419593854098000', '1030226', '2', '3.75');
INSERT INTO `bill` VALUES ('1255', '1419593854098000', '1030908', '1', '11.9');
INSERT INTO `bill` VALUES ('1256', '1419593854098000', '1030392', '3', '11.9');
INSERT INTO `bill` VALUES ('1257', '1419593854098000', '1030144', '4', '4.9');
INSERT INTO `bill` VALUES ('1258', '1419593854098000', '1030469', '5', '12.8');
INSERT INTO `bill` VALUES ('1259', '1419593854098000', '1030071', '5', '27.5');
INSERT INTO `bill` VALUES ('1260', '1419593854098000', '1030835', '1', '2.9');
INSERT INTO `bill` VALUES ('1261', '1419593854098000', '1030141', '5', '76');
INSERT INTO `bill` VALUES ('1262', '1419593854098000', '1030159', '1', '2');
INSERT INTO `bill` VALUES ('1263', '1419593854098000', '1030170', '2', '3.75');
INSERT INTO `bill` VALUES ('1264', '1419725000596000', '1030998', '1', '6.5');
INSERT INTO `bill` VALUES ('1265', '1419725000596000', '1000573', '1', '2.8');
INSERT INTO `bill` VALUES ('1266', '1419725000596000', '1030997', '4', '1');
INSERT INTO `bill` VALUES ('1267', '1419760599177001', '1030759', '1', '15.1');
INSERT INTO `bill` VALUES ('1268', '1419760599177001', '1030113', '2', '2.9');
INSERT INTO `bill` VALUES ('1269', '1419760599177001', '1030518', '2', '2.2');
INSERT INTO `bill` VALUES ('1270', '1419760599177001', '1000744', '2', '6');
INSERT INTO `bill` VALUES ('1271', '1419760599177001', '1030524', '2', '2.2');
INSERT INTO `bill` VALUES ('1272', '1419760599177001', '1000519', '1', '9.5');
INSERT INTO `bill` VALUES ('1273', '1419760599177001', '1030225', '2', '2.9');
INSERT INTO `bill` VALUES ('1274', '1419760599177001', '1000550', '2', '3.5');
INSERT INTO `bill` VALUES ('1275', '1419760599177001', '1030504', '1', '11.5');
INSERT INTO `bill` VALUES ('1276', '1419765452933002', '1000746', '1', '2.5');
INSERT INTO `bill` VALUES ('1277', '1419765452933002', '1000736', '1', '9.8');
INSERT INTO `bill` VALUES ('1278', '1419765452933002', '1000750', '1', '2');
INSERT INTO `bill` VALUES ('1279', '1419765452933002', '1000561', '1', '4');
INSERT INTO `bill` VALUES ('1280', '1419769784082003', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1281', '1419776220916004', '1000543', '1', '8.3');
INSERT INTO `bill` VALUES ('1282', '1419776220916004', '1030835', '1', '2.9');
INSERT INTO `bill` VALUES ('1283', '1419821879376000', '1000705', '6', '1.8');
INSERT INTO `bill` VALUES ('1284', '1419842139863001', '1030998', '2', '6.50');
INSERT INTO `bill` VALUES ('1285', '1419847772679002', '1000677', '1', '2');
INSERT INTO `bill` VALUES ('1286', '1419847772679002', '1030125', '5', '2.2');
INSERT INTO `bill` VALUES ('1287', '1419847772679002', '1030931', '1', '13.9');
INSERT INTO `bill` VALUES ('1288', '1419847772679002', '1030320', '3', '2.2');
INSERT INTO `bill` VALUES ('1289', '1419848255147003', '1030088', '4', '2.60');
INSERT INTO `bill` VALUES ('1290', '1419848283795004', '1030088', '4', '2.60');
INSERT INTO `bill` VALUES ('1291', '1419849301024005', '1030681', '1', '2.85');
INSERT INTO `bill` VALUES ('1292', '1419849301024005', '1030997', '8', '1.00');
INSERT INTO `bill` VALUES ('1293', '1419908045278000', '1030998', '1', '6.5');
INSERT INTO `bill` VALUES ('1294', '1419908045278000', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1295', '1419908045278000', '1030997', '1', '1');
INSERT INTO `bill` VALUES ('1296', '1419911885194001', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1297', '1419912309772002', '1030340', '5', '2.1');
INSERT INTO `bill` VALUES ('1298', '1419914292750003', '1030675', '2', '17.9');
INSERT INTO `bill` VALUES ('1299', '1419930820355007', '1030998', '2', '6.50');
INSERT INTO `bill` VALUES ('1300', '1419931532053008', '1030998', '2', '6.5');
INSERT INTO `bill` VALUES ('1301', '1419931701519009', '1030998', '2', '6.5');
INSERT INTO `bill` VALUES ('1302', '1419933586251010', '1030998', '2', '6.5');
INSERT INTO `bill` VALUES ('1303', '1420004426686000', '1030996', '2', '24');
INSERT INTO `bill` VALUES ('1304', '1420005847642001', '1030340', '4', '2.1');
INSERT INTO `bill` VALUES ('1305', '1420005847642001', '1030375', '1', '1.9');
INSERT INTO `bill` VALUES ('1306', '1420019952910002', '1030998', '2', '6.5');
INSERT INTO `bill` VALUES ('1307', '1420022645388003', '1030516', '1', '12.5');
INSERT INTO `bill` VALUES ('1308', '1420022645388003', '1030738', '2', '2.6');
INSERT INTO `bill` VALUES ('1309', '1420022645388003', '1030997', '6', '1');
INSERT INTO `bill` VALUES ('1310', '1420026694882004', '1030150', '1', '9.9');
INSERT INTO `bill` VALUES ('1311', '1420026694882004', '1030425', '1', '4.3');
INSERT INTO `bill` VALUES ('1312', '1420079122183000', '1030574', '1', '3.30');
INSERT INTO `bill` VALUES ('1313', '1420079122183000', '1000613', '1', '4.00');
INSERT INTO `bill` VALUES ('1314', '1420079122183000', '1030145', '1', '5.98');
INSERT INTO `bill` VALUES ('1315', '1420079122183000', '1030393', '1', '3.70');
INSERT INTO `bill` VALUES ('1316', '1420079122183000', '1030030', '2', '4.10');
INSERT INTO `bill` VALUES ('1317', '1420079122183000', '1000618', '1', '2.80');
INSERT INTO `bill` VALUES ('1318', '1420079122183000', '1030618', '1', '2.60');
INSERT INTO `bill` VALUES ('1319', '1420079122183000', '1030778', '1', '2.00');
INSERT INTO `bill` VALUES ('1320', '1420081212848001', '1030939', '3', '6.80');
INSERT INTO `bill` VALUES ('1321', '1420081212848001', '1030245', '2', '5.80');
INSERT INTO `bill` VALUES ('1322', '1420081212848001', '1030769', '2', '12.50');
INSERT INTO `bill` VALUES ('1323', '1420081212848001', '1030820', '2', '12.50');
INSERT INTO `bill` VALUES ('1324', '1420081212848001', '1030845', '2', '12.50');
INSERT INTO `bill` VALUES ('1325', '1420086815662002', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1326', '1420095213756003', '1030035', '1', '3.7');
INSERT INTO `bill` VALUES ('1327', '1420095213756003', '1000550', '1', '3.5');
INSERT INTO `bill` VALUES ('1328', '1420095213756003', '1030590', '1', '3.5');
INSERT INTO `bill` VALUES ('1329', '1420095213756003', '1000805', '1', '6.9');
INSERT INTO `bill` VALUES ('1330', '1420095213756003', '1000561', '1', '4');
INSERT INTO `bill` VALUES ('1331', '1420095213756003', '1030113', '1', '2.9');
INSERT INTO `bill` VALUES ('1332', '1420095213756003', '1030312', '1', '3.8');
INSERT INTO `bill` VALUES ('1333', '1420095213756003', '1030397', '2', '2.6');
INSERT INTO `bill` VALUES ('1334', '1420095213756003', '1000593', '1', '4');
INSERT INTO `bill` VALUES ('1335', '1420095213756003', '1030781', '1', '3.6');
INSERT INTO `bill` VALUES ('1336', '1420095213756003', '1030789', '1', '9.9');
INSERT INTO `bill` VALUES ('1337', '1420102889207004', '1000678', '1', '15.9');
INSERT INTO `bill` VALUES ('1338', '1420103101897005', '1030035', '2', '3.7');
INSERT INTO `bill` VALUES ('1339', '1420103101897005', '1000792', '1', '2.9');
INSERT INTO `bill` VALUES ('1340', '1420110926404006', '1030768', '1', '23.40');
INSERT INTO `bill` VALUES ('1341', '1420110926404006', '1030825', '1', '12.80');
INSERT INTO `bill` VALUES ('1342', '1420110926404006', '1030102', '1', '7.98');
INSERT INTO `bill` VALUES ('1343', '1420112388699007', '1030825', '1', '12.80');
INSERT INTO `bill` VALUES ('1344', '1420112388699007', '1030768', '1', '23.40');
INSERT INTO `bill` VALUES ('1345', '1420112388699007', '1030102', '1', '7.98');
INSERT INTO `bill` VALUES ('1346', '1420163659036000', '1030319', '1', '3');
INSERT INTO `bill` VALUES ('1347', '1420163659036000', '1000589', '1', '4');
INSERT INTO `bill` VALUES ('1348', '1420163659036000', '1000516', '1', '5.5');
INSERT INTO `bill` VALUES ('1349', '1420163659036000', '1030544', '2', '2.4');
INSERT INTO `bill` VALUES ('1350', '1420166342725001', '1030319', '1', '3');
INSERT INTO `bill` VALUES ('1351', '1420166342725001', '1000516', '1', '5.5');
INSERT INTO `bill` VALUES ('1352', '1420166342725001', '1030997', '3', '1');
INSERT INTO `bill` VALUES ('1353', '1420166342725001', '1000589', '1', '4');
INSERT INTO `bill` VALUES ('1354', '1420166342725001', '1030544', '2', '2.4');
INSERT INTO `bill` VALUES ('1355', '1420176393756002', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1356', '1420176821769004', '1030996', '1', '24.00');
INSERT INTO `bill` VALUES ('1357', '1420176824453005', '1030996', '1', '24.00');
INSERT INTO `bill` VALUES ('1358', '1420190253924006', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1359', '1420198835317007', '1030427', '2', '9.2');
INSERT INTO `bill` VALUES ('1360', '1420252187516000', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1361', '1420267321221001', '1030996', '2', '24');
INSERT INTO `bill` VALUES ('1362', '1420270711792002', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1363', '1420287847977003', '1030847', '1', '10.60');
INSERT INTO `bill` VALUES ('1364', '1420287847977003', '1000590', '2', '4.00');
INSERT INTO `bill` VALUES ('1365', '1420287847977003', '1030915', '1', '6.95');
INSERT INTO `bill` VALUES ('1366', '1420287847977003', '1030030', '1', '4.10');
INSERT INTO `bill` VALUES ('1367', '1420287847977003', '1030477', '1', '6.80');
INSERT INTO `bill` VALUES ('1368', '1420287850688004', '1030847', '1', '10.60');
INSERT INTO `bill` VALUES ('1369', '1420287850688004', '1000590', '2', '4.00');
INSERT INTO `bill` VALUES ('1370', '1420287850688004', '1030915', '1', '6.95');
INSERT INTO `bill` VALUES ('1371', '1420287850688004', '1030030', '1', '4.10');
INSERT INTO `bill` VALUES ('1372', '1420287850688004', '1030477', '1', '6.80');
INSERT INTO `bill` VALUES ('1373', '1420332479578000', '1030996', '1', '24');
INSERT INTO `bill` VALUES ('1374', '1420373042342001', '1000561', '1', '4');
INSERT INTO `bill` VALUES ('1375', '1420373042342001', '1030285', '1', '2.2');
INSERT INTO `bill` VALUES ('1376', '1420373042342001', '1030165', '1', '2.65');
INSERT INTO `bill` VALUES ('1377', '1420373042342001', '1030144', '1', '4.9');
INSERT INTO `bill` VALUES ('1378', '1420378490366009', '1000612', '3', '4.00');
INSERT INTO `bill` VALUES ('1379', '1420381130292010', '1000530', '1', '5.5');
INSERT INTO `bill` VALUES ('1380', '1420381130292010', '1000690', '1', '3.8');
INSERT INTO `bill` VALUES ('1381', '1420381130292010', '1000687', '1', '4.1');
INSERT INTO `bill` VALUES ('1382', '1420426324310000', '1000543', '1', '8.30');
INSERT INTO `bill` VALUES ('1383', '1420426324310000', '1000561', '1', '4.00');
INSERT INTO `bill` VALUES ('1384', '1420426324310000', '1000562', '2', '4.00');
INSERT INTO `bill` VALUES ('1385', '1420426515820001', '1030484', '1', '16.50');
INSERT INTO `bill` VALUES ('1386', '1420426515820001', '1030106', '1', '13.90');
INSERT INTO `bill` VALUES ('1387', '1420426515820001', '1000561', '1', '4.00');
INSERT INTO `bill` VALUES ('1388', '1420446291148002', '1030845', '1', '12.5');
INSERT INTO `bill` VALUES ('1389', '1420465410711003', '1030077', '1', '2');
INSERT INTO `bill` VALUES ('1390', '1420465410711003', '1000678', '1', '15.9');
INSERT INTO `bill` VALUES ('1391', '1420600247485000', '1000539', '3', '4.6');
INSERT INTO `bill` VALUES ('1392', '1420611236294001', '1030246', '3', '49');
INSERT INTO `bill` VALUES ('1393', '1420611236294001', '1030416', '2', '36');
INSERT INTO `bill` VALUES ('1394', '1420652711699000', '1030627', '2', '56.80');
INSERT INTO `bill` VALUES ('1395', '1420694777637001', '1030150', '1', '9.90');
INSERT INTO `bill` VALUES ('1396', '1420694777637001', '1030142', '1', '2.20');
INSERT INTO `bill` VALUES ('1397', '1420694777637001', '1030101', '1', '7.98');
INSERT INTO `bill` VALUES ('1398', '1420694777637001', '1030760', '1', '30.30');
INSERT INTO `bill` VALUES ('1399', '1420694777637001', '1030926', '1', '14.50');
INSERT INTO `bill` VALUES ('1400', '1420694777637001', '1030960', '1', '13.90');
INSERT INTO `bill` VALUES ('1401', '1420694777637001', '1030315', '1', '2.15');
INSERT INTO `bill` VALUES ('1402', '1420694777637001', '1000613', '1', '4.00');
INSERT INTO `bill` VALUES ('1403', '1420694777637001', '1030393', '1', '3.70');
INSERT INTO `bill` VALUES ('1404', '1420694777637001', '1030895', '1', '6.60');
INSERT INTO `bill` VALUES ('1405', '1420694777637001', '1030125', '1', '2.20');
INSERT INTO `bill` VALUES ('1406', '1420694777637001', '1030222', '1', '3.80');
INSERT INTO `bill` VALUES ('1407', '1420694777637001', '1030915', '1', '6.95');
INSERT INTO `bill` VALUES ('1408', '1420694777637001', '1030106', '1', '13.90');
INSERT INTO `bill` VALUES ('1409', '1420694777637001', '1030656', '1', '4.90');
INSERT INTO `bill` VALUES ('1410', '1420694777637001', '1030030', '3', '4.10');
INSERT INTO `bill` VALUES ('1411', '1420879851912000', '1000601', '1', '4');
INSERT INTO `bill` VALUES ('1412', '1420879851912000', '1030340', '3', '2.1');
INSERT INTO `bill` VALUES ('1413', '1420879851912000', '1000515', '1', '5.5');
INSERT INTO `bill` VALUES ('1414', '1420879851912000', '1030776', '1', '2.4');
INSERT INTO `bill` VALUES ('1415', '1420879851912000', '1030544', '5', '2.4');
INSERT INTO `bill` VALUES ('1416', '1420946129986000', '1030998', '2', '6.50');
INSERT INTO `bill` VALUES ('1417', '1420946129986000', '1000747', '1', '2.70');
INSERT INTO `bill` VALUES ('1418', '1420946129986000', '1030424', '1', '1.00');
INSERT INTO `bill` VALUES ('1419', '1420946129986000', '1000748', '1', '3.00');
INSERT INTO `bill` VALUES ('1420', '1420946129986000', '1030196', '1', '5.80');
INSERT INTO `bill` VALUES ('1421', '1420967442274001', '1030999', '1', '21.00');
INSERT INTO `bill` VALUES ('1422', '1420967442274001', '1030559', '24', '2.50');
INSERT INTO `bill` VALUES ('1423', '1420972402452002', '1030315', '24', '2.15');
INSERT INTO `bill` VALUES ('1424', '1420972402452002', '1000676', '1', '6.50');
INSERT INTO `bill` VALUES ('1425', '1421064737320000', '1000685', '1', '35');
INSERT INTO `bill` VALUES ('1426', '1421152303514000', '1030464', '1', '3.4');
INSERT INTO `bill` VALUES ('1427', '1421152303514000', '1000637', '1', '7.9');
INSERT INTO `bill` VALUES ('1428', '1421152303514000', '1030820', '1', '12.5');
INSERT INTO `bill` VALUES ('1429', '1421152303514000', '1030044', '1', '6.4');
INSERT INTO `bill` VALUES ('1430', '1421152303514000', '1030537', '1', '5.8');
INSERT INTO `bill` VALUES ('1431', '1421317538907000', '1030647', '1', '10.20');
INSERT INTO `bill` VALUES ('1432', '1421317538907000', '1030919', '1', '17.50');
INSERT INTO `bill` VALUES ('1433', '1421317538907000', '1030422', '1', '76.00');
INSERT INTO `bill` VALUES ('1434', '1421389905613000', '1030573', '1', '4.6');
INSERT INTO `bill` VALUES ('1435', '1421389905613000', '1000515', '1', '5.5');
INSERT INTO `bill` VALUES ('1436', '1421389905613000', '1030624', '2', '1.3');
INSERT INTO `bill` VALUES ('1437', '1421389905613000', '1030156', '1', '5.3');
INSERT INTO `bill` VALUES ('1438', '1421389905613000', '1030567', '1', '6.5');
INSERT INTO `bill` VALUES ('1439', '1421389905613000', '1000748', '1', '3');
INSERT INTO `bill` VALUES ('1440', '1421389905613000', '1030223', '1', '6.5');
INSERT INTO `bill` VALUES ('1441', '1421509122715002', '1030835', '1', '2.90');
INSERT INTO `bill` VALUES ('1442', '1421509122715002', '1000622', '1', '2.50');
INSERT INTO `bill` VALUES ('1443', '1421509122715002', '1030486', '1', '32.90');
INSERT INTO `bill` VALUES ('1444', '1421553647928000', '1000750', '1', '2');
INSERT INTO `bill` VALUES ('1445', '1421553647928000', '1000736', '1', '9.8');
INSERT INTO `bill` VALUES ('1446', '1421554286915001', '1000750', '1', '2');
INSERT INTO `bill` VALUES ('1447', '1421554286915001', '1000796', '1', '8.5');
INSERT INTO `bill` VALUES ('1448', '1421554286915001', '1000736', '1', '9.8');
INSERT INTO `bill` VALUES ('1449', '1421554286915001', '1000648', '1', '5.2');
INSERT INTO `bill` VALUES ('1450', '1421554618981002', '1000548', '1', '3.5');
INSERT INTO `bill` VALUES ('1451', '1421554618981002', '1000549', '1', '3.5');
INSERT INTO `bill` VALUES ('1452', '1421554618981002', '1000550', '1', '3.5');
INSERT INTO `bill` VALUES ('1453', '1421554618981002', '1000553', '1', '7.5');
INSERT INTO `bill` VALUES ('1454', '1421554618981002', '1000554', '1', '7.5');
INSERT INTO `bill` VALUES ('1455', '1421554618981002', '1000555', '1', '8.5');
INSERT INTO `bill` VALUES ('1456', '1421568215169003', '1030835', '1', '2.9');
INSERT INTO `bill` VALUES ('1457', '1421568215169003', '1000586', '1', '4');
INSERT INTO `bill` VALUES ('1458', '1421568215169003', '1000585', '5', '4.2');
INSERT INTO `bill` VALUES ('1459', '1421574342733004', '1000705', '2', '1.8');
INSERT INTO `bill` VALUES ('1460', '1421574342733004', '1030949', '1', '7.1');
INSERT INTO `bill` VALUES ('1461', '1421574342733004', '1000514', '1', '6.5');
INSERT INTO `bill` VALUES ('1462', '1421574342733004', '1000595', '2', '3');
INSERT INTO `bill` VALUES ('1463', '1421574342733004', '1030817', '1', '9.8');
INSERT INTO `bill` VALUES ('1464', '1421574342733004', '1000813', '2', '1');
INSERT INTO `bill` VALUES ('1465', '1421574342733004', '1030763', '2', '2.9');
INSERT INTO `bill` VALUES ('1466', '1421574342733004', '1030342', '1', '8.66');
INSERT INTO `bill` VALUES ('1467', '1421639173265000', '1030151', '1', '105');
INSERT INTO `bill` VALUES ('1468', '1421829057785001', '1030649', '1', '34.5');
INSERT INTO `bill` VALUES ('1469', '1421829057785001', '1030618', '1', '2.6');
INSERT INTO `bill` VALUES ('1470', '1421829057785001', '1030208', '1', '21.5');
INSERT INTO `bill` VALUES ('1471', '1421829057785001', '1030291', '1', '2.6');
INSERT INTO `bill` VALUES ('1472', '1421839384904002', '1000530', '2', '5.5');
INSERT INTO `bill` VALUES ('1473', '1421906604689000', '1000813', '10', '1');
INSERT INTO `bill` VALUES ('1474', '1421981283604000', '1030013', '1', '6.5');
INSERT INTO `bill` VALUES ('1475', '1421981283604000', '1000705', '4', '1.8');
INSERT INTO `bill` VALUES ('1476', '1421981283604000', '1000684', '1', '49.9');
INSERT INTO `bill` VALUES ('1477', '1421981283604000', '1030949', '1', '7.1');
INSERT INTO `bill` VALUES ('1478', '1421981283604000', '1030624', '2', '1.3');
INSERT INTO `bill` VALUES ('1479', '1421981283604000', '1030463', '1', '19.8');
INSERT INTO `bill` VALUES ('1480', '1421984788303001', '1030999', '1', '21.00');
INSERT INTO `bill` VALUES ('1481', '1421984788303001', '1030998', '4', '6.50');
INSERT INTO `bill` VALUES ('1482', '1421984800543002', '1030999', '1', '21.00');
INSERT INTO `bill` VALUES ('1483', '1421984800543002', '1030998', '4', '6.50');
INSERT INTO `bill` VALUES ('1487', '1421989033694000', '1030835', '5', '2.9');
INSERT INTO `bill` VALUES ('1488', '1421989033694000', '1030999', '2', '21');
INSERT INTO `bill` VALUES ('1489', '1421989033694000', '1030480', '1', '30.5');
INSERT INTO `bill` VALUES ('1490', '1421989033694000', '1030571', '2', '7.6');
INSERT INTO `bill` VALUES ('1491', '1421989295335003', '1030835', '3', '2.9');
INSERT INTO `bill` VALUES ('1492', '1421989295335003', '1030998', '1', '6.5');
INSERT INTO `bill` VALUES ('1493', '1421989295335003', '1030999', '4', '21');

-- ----------------------------
-- Table structure for `bill_history`
-- ----------------------------
DROP TABLE IF EXISTS `bill_history`;
CREATE TABLE `bill_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `product_number` int(11) NOT NULL DEFAULT '0',
  `product_price` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_history
-- ----------------------------
INSERT INTO `bill_history` VALUES ('1013', '1416817734339000', '1000518', '1', '9.5');
INSERT INTO `bill_history` VALUES ('1014', '1416817734339000', '1000619', '3', '2.5');
INSERT INTO `bill_history` VALUES ('1015', '1416817734339000', '1000512', '1', '7.2');
INSERT INTO `bill_history` VALUES ('1016', '1416817734339000', '1000579', '1', '3.5');
INSERT INTO `bill_history` VALUES ('1017', '1416817734339000', '1000543', '1', '8.3');
INSERT INTO `bill_history` VALUES ('1018', '1416817734339000', '1000625', '1', '3');
INSERT INTO `bill_history` VALUES ('1019', '1416817734339000', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1020', '1416817734339000', '1000570', '1', '3');
INSERT INTO `bill_history` VALUES ('1021', '1416817734339000', '1000521', '1', '4');
INSERT INTO `bill_history` VALUES ('1022', '1416890259630000', '1000797', '1', '7.5');
INSERT INTO `bill_history` VALUES ('1023', '1416890259630000', '1000685', '1', '35');
INSERT INTO `bill_history` VALUES ('1024', '1416890259630000', '1000799', '1', '7.5');
INSERT INTO `bill_history` VALUES ('1025', '1416890259630000', '1000798', '1', '7.5');
INSERT INTO `bill_history` VALUES ('1026', '1416890259630000', '1000637', '2', '7.9');
INSERT INTO `bill_history` VALUES ('1027', '1416890259630000', '1000800', '1', '7.5');
INSERT INTO `bill_history` VALUES ('1028', '1417111576814000', '1000505', '1', '7.2');
INSERT INTO `bill_history` VALUES ('1029', '1417111576814000', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1030', '1417111913781000', '1000505', '1', '7.2');
INSERT INTO `bill_history` VALUES ('1031', '1417111913781000', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1032', '1417112195112001', '1000579', '1', '3.5');
INSERT INTO `bill_history` VALUES ('1033', '1417112195112001', '1000638', '1', '5.9');
INSERT INTO `bill_history` VALUES ('1034', '1417112195112001', '1000639', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1035', '1417112195112001', '1000640', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1036', '1417117616896002', '1000584', '1', '4.5');
INSERT INTO `bill_history` VALUES ('1037', '1417117616896002', '1000680', '1', '59');
INSERT INTO `bill_history` VALUES ('1038', '1417117616896002', '1000650', '4', '26');
INSERT INTO `bill_history` VALUES ('1039', '1417117616896002', '1000505', '1', '7.2');
INSERT INTO `bill_history` VALUES ('1040', '1417117616896002', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1041', '1417117616896002', '1000688', '1', '3.8');
INSERT INTO `bill_history` VALUES ('1042', '1417117616896002', '1000689', '1', '3.8');
INSERT INTO `bill_history` VALUES ('1043', '1417117616896002', '1000690', '1', '3.8');
INSERT INTO `bill_history` VALUES ('1044', '1417117840666003', '1000506', '2', '5.5');
INSERT INTO `bill_history` VALUES ('1045', '1417118040065004', '1000677', '7', '2');
INSERT INTO `bill_history` VALUES ('1046', '1417125242414005', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1047', '1417125242414005', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1048', '1417136260625000', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1049', '1417136260625000', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1050', '1417136495710000', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1051', '1417136495710000', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1052', '1417136845625001', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1053', '1417136845625001', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1054', '1417137110484002', '1000586', '1', '4');
INSERT INTO `bill_history` VALUES ('1055', '1417137110484002', '1000650', '1', '26');
INSERT INTO `bill_history` VALUES ('1056', '1417137110484002', '1000505', '2', '7.2');
INSERT INTO `bill_history` VALUES ('1057', '1417137110484002', '1000579', '5', '3.5');
INSERT INTO `bill_history` VALUES ('1058', '1417137110484002', '1000578', '1', '3.6');
INSERT INTO `bill_history` VALUES ('1059', '1417137110484002', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1060', '1417137110484002', '1000678', '2', '15.9');
INSERT INTO `bill_history` VALUES ('1061', '1417137110484002', '1000571', '4', '2.5');
INSERT INTO `bill_history` VALUES ('1062', '1417137110484002', '1000580', '1', '6.8');
INSERT INTO `bill_history` VALUES ('1063', '1417137110484002', '1000570', '1', '3');
INSERT INTO `bill_history` VALUES ('1064', '1417138128965003', '1000650', '1', '26');
INSERT INTO `bill_history` VALUES ('1065', '1417138128965003', '1000571', '1', '2.5');
INSERT INTO `bill_history` VALUES ('1066', '1417138128965003', '1000574', '1', '15');
INSERT INTO `bill_history` VALUES ('1067', '1417138128965003', '1000570', '1', '3');
INSERT INTO `bill_history` VALUES ('1068', '1417138648026004', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1069', '1417138648026004', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1070', '1417138699762005', '1000650', '1', '26.00');
INSERT INTO `bill_history` VALUES ('1071', '1417138699762005', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1072', '1417138900612006', '1000579', '1', '3.5');
INSERT INTO `bill_history` VALUES ('1073', '1417138900612006', '1000578', '1', '3.6');
INSERT INTO `bill_history` VALUES ('1074', '1417138900612006', '1000570', '1', '3');
INSERT INTO `bill_history` VALUES ('1075', '1417141160994055', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1076', '1417141162537056', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1077', '1417162063522057', '1000505', '1', '7.2');
INSERT INTO `bill_history` VALUES ('1078', '1417162063522057', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1079', '1417251747613000', '1000512', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1080', '1417251747613000', '1000736', '1', '9.80');
INSERT INTO `bill_history` VALUES ('1081', '1417428593020000', '1000577', '2', '7.00');
INSERT INTO `bill_history` VALUES ('1082', '1417428674770001', '1000577', '5', '7.00');
INSERT INTO `bill_history` VALUES ('1083', '1417428675261002', '1000577', '5', '7.00');
INSERT INTO `bill_history` VALUES ('1084', '1417429980646008', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1085', '1417430136239009', '1000508', '1', '6');
INSERT INTO `bill_history` VALUES ('1086', '1417430136239009', '1000506', '1', '5.5');
INSERT INTO `bill_history` VALUES ('1087', '1417444868100018', '1000720', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1088', '1417444868100018', '1000721', '1', '9.50');
INSERT INTO `bill_history` VALUES ('1089', '1417444879244019', '1000720', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1090', '1417444879244019', '1000721', '1', '9.50');
INSERT INTO `bill_history` VALUES ('1091', '1417444887868020', '1000720', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1092', '1417444887868020', '1000721', '6', '9.50');
INSERT INTO `bill_history` VALUES ('1093', '1417445586906021', '1000720', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1094', '1417445586906021', '1000721', '6', '9.50');
INSERT INTO `bill_history` VALUES ('1095', '1417449393946033', '1000682', '1', '47.90');
INSERT INTO `bill_history` VALUES ('1096', '1417449396502034', '1000682', '1', '47.90');
INSERT INTO `bill_history` VALUES ('1097', '1417449410726035', '1000682', '1', '47.90');
INSERT INTO `bill_history` VALUES ('1098', '1417449806055000', '1000508', '5', '6.00');
INSERT INTO `bill_history` VALUES ('1099', '1417449806055000', '1000507', '22', '4.90');
INSERT INTO `bill_history` VALUES ('1100', '1417544000321000', '1000578', '2', '3.60');
INSERT INTO `bill_history` VALUES ('1101', '1417544000321000', '1000579', '1', '3.50');
INSERT INTO `bill_history` VALUES ('1102', '1417544321280001', '1000578', '2', '3.60');
INSERT INTO `bill_history` VALUES ('1103', '1417544321280001', '1000579', '1', '3.50');
INSERT INTO `bill_history` VALUES ('1104', '1417544350879002', '1000578', '2', '3.60');
INSERT INTO `bill_history` VALUES ('1105', '1417544350879002', '1000579', '1', '3.50');
INSERT INTO `bill_history` VALUES ('1106', '1417544352564003', '1000578', '2', '3.60');
INSERT INTO `bill_history` VALUES ('1107', '1417544352564003', '1000579', '1', '3.50');
INSERT INTO `bill_history` VALUES ('1108', '1417544779095004', '1000731', '2', '16.50');
INSERT INTO `bill_history` VALUES ('1109', '1417545197857005', '1000731', '2', '16.50');
INSERT INTO `bill_history` VALUES ('1110', '1417549377739006', '1000731', '2', '16.50');
INSERT INTO `bill_history` VALUES ('1111', '1417551125643007', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1112', '1417551125643007', '1000507', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1113', '1417551464384008', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1114', '1417551464384008', '1000507', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1115', '1417578166957009', '1000570', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1116', '1417578166957009', '1000572', '1', '3.80');
INSERT INTO `bill_history` VALUES ('1117', '1417578166957009', '1000689', '1', '3.80');
INSERT INTO `bill_history` VALUES ('1118', '1417613493887028', '1000624', '2', '3');
INSERT INTO `bill_history` VALUES ('1119', '1417613493887028', '1000778', '2', '2.6');
INSERT INTO `bill_history` VALUES ('1120', '1417618717474029', '1000508', '1', '6');
INSERT INTO `bill_history` VALUES ('1121', '1417618717474029', '1000507', '3', '4.9');
INSERT INTO `bill_history` VALUES ('1122', '1417618889779030', '1000624', '2', '3');
INSERT INTO `bill_history` VALUES ('1123', '1417618889779030', '1000778', '2', '2.6');
INSERT INTO `bill_history` VALUES ('1124', '1417626612357000', '1000724', '3', '4.00');
INSERT INTO `bill_history` VALUES ('1125', '1417656480210001', '1000620', '2', '2.5');
INSERT INTO `bill_history` VALUES ('1126', '1417656480210001', '1000778', '2', '2.6');
INSERT INTO `bill_history` VALUES ('1127', '1417685818101002', '1000625', '4', '3');
INSERT INTO `bill_history` VALUES ('1128', '1417687495185003', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1129', '1417704420949004', '1000570', '6', '3');
INSERT INTO `bill_history` VALUES ('1130', '1417748136830000', '1000506', '3', '5.5');
INSERT INTO `bill_history` VALUES ('1131', '1417845577659000', '1000647', '1', '10.3');
INSERT INTO `bill_history` VALUES ('1132', '1417845577659000', '1000687', '2', '4.1');
INSERT INTO `bill_history` VALUES ('1133', '1417846914653001', '1000793', '2', '8.5');
INSERT INTO `bill_history` VALUES ('1134', '1417847165829002', '1000574', '1', '15');
INSERT INTO `bill_history` VALUES ('1135', '1417847415445003', '1000506', '3', '5.50');
INSERT INTO `bill_history` VALUES ('1136', '1417847417851004', '1000506', '3', '5.50');
INSERT INTO `bill_history` VALUES ('1137', '1417856238066005', '1000831', '1', '18.9');
INSERT INTO `bill_history` VALUES ('1138', '1417856238066005', '1000827', '1', '36');
INSERT INTO `bill_history` VALUES ('1139', '1417856238066005', '1000826', '2', '36.8');
INSERT INTO `bill_history` VALUES ('1140', '1417861171368006', '1000519', '1', '9.50');
INSERT INTO `bill_history` VALUES ('1141', '1417861171368006', '1000521', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1142', '1417861171368006', '1000522', '1', '3.80');
INSERT INTO `bill_history` VALUES ('1143', '1417861171368006', '1000523', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1144', '1418029218721000', '1000724', '3', '4.00');
INSERT INTO `bill_history` VALUES ('1145', '1418029218824002', '1000724', '3', '4.00');
INSERT INTO `bill_history` VALUES ('1146', '1418029218823001', '1000724', '3', '4.00');
INSERT INTO `bill_history` VALUES ('1147', '1418029218970003', '1000724', '3', '4.00');
INSERT INTO `bill_history` VALUES ('1148', '1418110109396000', '1000505', '2', '7.2');
INSERT INTO `bill_history` VALUES ('1149', '1418110109396000', '1000721', '1', '9.5');
INSERT INTO `bill_history` VALUES ('1150', '1418110109396000', '1000720', '1', '4.5');
INSERT INTO `bill_history` VALUES ('1151', '1418110109396000', '1000782', '1', '6');
INSERT INTO `bill_history` VALUES ('1152', '1418110109396000', '1000506', '3', '5.5');
INSERT INTO `bill_history` VALUES ('1153', '1418119040708001', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1154', '1418119040708001', '1000507', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1155', '1418119040708001', '1000509', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1156', '1418119040708001', '1000508', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1157', '1418119040708001', '1000510', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1158', '1418119042602002', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1159', '1418119042602002', '1000507', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1160', '1418119042602002', '1000509', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1161', '1418119042602002', '1000508', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1162', '1418119042602002', '1000510', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1163', '1418119043520003', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1164', '1418119043520003', '1000507', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1165', '1418119043520003', '1000509', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1166', '1418119043520003', '1000508', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1167', '1418119043520003', '1000510', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1168', '1418119570637004', '1000729', '1', '18');
INSERT INTO `bill_history` VALUES ('1169', '1418119570637004', '1000687', '1', '4.1');
INSERT INTO `bill_history` VALUES ('1170', '1418119857544005', '1000719', '1', '9.00');
INSERT INTO `bill_history` VALUES ('1171', '1418119857544005', '1000720', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1172', '1418119857544005', '1000721', '1', '9.50');
INSERT INTO `bill_history` VALUES ('1173', '1418119891645006', '1000578', '3', '3.60');
INSERT INTO `bill_history` VALUES ('1174', '1418120012099007', '1000506', '2', '5.50');
INSERT INTO `bill_history` VALUES ('1175', '1418128802180009', '1000619', '6', '2.50');
INSERT INTO `bill_history` VALUES ('1176', '1418128802180009', '1000505', '2', '7.20');
INSERT INTO `bill_history` VALUES ('1177', '1418128802180009', '1000506', '1', '5.50');
INSERT INTO `bill_history` VALUES ('1178', '1418128802180009', '1000593', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1179', '1418128802180009', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1180', '1418128802180009', '1000595', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1181', '1418128802180009', '1000596', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1182', '1418128802180009', '1000731', '1', '16.50');
INSERT INTO `bill_history` VALUES ('1183', '1418128802180009', '1000781', '1', '4.50');
INSERT INTO `bill_history` VALUES ('1184', '1418128802180009', '1000782', '1', '6.00');
INSERT INTO `bill_history` VALUES ('1185', '1418128802180009', '1000730', '1', '6.90');
INSERT INTO `bill_history` VALUES ('1186', '1418130074026010', '1000832', '1', '3.60');
INSERT INTO `bill_history` VALUES ('1187', '1418130074026010', '1000713', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1188', '1418130074026010', '1000712', '1', '4.90');
INSERT INTO `bill_history` VALUES ('1189', '1418193782101000', '1000504', '1', '5');
INSERT INTO `bill_history` VALUES ('1190', '1418193782101000', '1000730', '1', '6.9');
INSERT INTO `bill_history` VALUES ('1191', '1418231769737000', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1192', '1418231769737000', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1193', '1418231769737000', '1000734', '1', '9.90');
INSERT INTO `bill_history` VALUES ('1194', '1418231769737000', '1000700', '1', '12.50');
INSERT INTO `bill_history` VALUES ('1195', '1418231770390001', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1196', '1418231770390001', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1197', '1418231770390001', '1000734', '1', '9.90');
INSERT INTO `bill_history` VALUES ('1198', '1418231770390001', '1000700', '1', '12.50');
INSERT INTO `bill_history` VALUES ('1199', '1418231781766002', '1000685', '1', '35.00');
INSERT INTO `bill_history` VALUES ('1200', '1418231781766002', '1000678', '1', '15.90');
INSERT INTO `bill_history` VALUES ('1201', '1418231781766002', '1000734', '1', '9.90');
INSERT INTO `bill_history` VALUES ('1202', '1418231781766002', '1000700', '1', '12.50');
INSERT INTO `bill_history` VALUES ('1203', '1418472199908000', '1000584', '3', '4.50');
INSERT INTO `bill_history` VALUES ('1204', '1418472199908000', '1000590', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1205', '1418472199908000', '1000618', '1', '2.80');
INSERT INTO `bill_history` VALUES ('1206', '1418482626155001', '1000736', '1', '9.8');
INSERT INTO `bill_history` VALUES ('1207', '1418482626155001', '1000506', '4', '5.5');
INSERT INTO `bill_history` VALUES ('1208', '1418482626155001', '1000737', '1', '9.9');
INSERT INTO `bill_history` VALUES ('1209', '1418553644775000', '1000570', '5', '3');
INSERT INTO `bill_history` VALUES ('1210', '1418624992994000', '1000719', '1', '9.00');
INSERT INTO `bill_history` VALUES ('1211', '1418624992994000', '1000792', '1', '2.90');
INSERT INTO `bill_history` VALUES ('1212', '1419038119847000', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1213', '1419038119847000', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1214', '1419038131792001', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1215', '1419038131792001', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1216', '1419038135730002', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1217', '1419038135730002', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1218', '1419038139759003', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1219', '1419038139759003', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1220', '1419038150626004', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1221', '1419038150626004', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1222', '1419038152545005', '1000505', '1', '7.20');
INSERT INTO `bill_history` VALUES ('1223', '1419038152545005', '1000594', '1', '3.00');
INSERT INTO `bill_history` VALUES ('1224', '1419129574356000', '1000623', '1', '2.50');
INSERT INTO `bill_history` VALUES ('1225', '1419129574356000', '1000618', '1', '2.80');
INSERT INTO `bill_history` VALUES ('1226', '1419129574356000', '1000613', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1227', '1419129574356000', '1000584', '2', '4.50');
INSERT INTO `bill_history` VALUES ('1228', '1419129574356000', '1000590', '1', '4.00');
INSERT INTO `bill_history` VALUES ('1229', '1419129574356000', '1000567', '1', '6.20');
INSERT INTO `bill_history` VALUES ('1230', '1419238519335000', '1000637', '4', '7.9');
INSERT INTO `bill_history` VALUES ('1231', '1419401776009000', '1030486', '1', '32.9');
INSERT INTO `bill_history` VALUES ('1232', '1419402443636001', '1030877', '1', '6.2');
INSERT INTO `bill_history` VALUES ('1233', '1419402443636001', '1000543', '4', '8.3');
INSERT INTO `bill_history` VALUES ('1234', '1419402443636001', '1000687', '1', '4.1');
INSERT INTO `bill_history` VALUES ('1235', '1419402443636001', '1000716', '1', '15');
INSERT INTO `bill_history` VALUES ('1236', '1419402443636001', '1030220', '1', '18.3');
INSERT INTO `bill_history` VALUES ('1237', '1419402443636001', '1030091', '1', '7.8');
INSERT INTO `bill_history` VALUES ('1238', '1419402443636001', '1000727', '1', '25');
INSERT INTO `bill_history` VALUES ('1239', '1419407228555002', '1030996', '1', '43.2');
INSERT INTO `bill_history` VALUES ('1240', '1419407228555002', '1030997', '1', '1.8');
INSERT INTO `bill_history` VALUES ('1241', '1419417275464003', '1030574', '1', '3.30');
INSERT INTO `bill_history` VALUES ('1242', '1419417275464003', '1000583', '2', '5.00');

-- ----------------------------
-- Table structure for `bill_items`
-- ----------------------------
DROP TABLE IF EXISTS `bill_items`;
CREATE TABLE `bill_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_number` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `product_price` varchar(255) DEFAULT NULL,
  `product_stamp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bill_items
-- ----------------------------

-- ----------------------------
-- Table structure for `cancelorder`
-- ----------------------------
DROP TABLE IF EXISTS `cancelorder`;
CREATE TABLE `cancelorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(45) NOT NULL COMMENT '订单id',
  `deliveryid` int(10) unsigned NOT NULL COMMENT '配送员id',
  `reason` varchar(45) NOT NULL COMMENT '取消原因',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '取消时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配送员取消订单表';

-- ----------------------------
-- Records of cancelorder
-- ----------------------------

-- ----------------------------
-- Table structure for `community`
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `community_name` varchar(64) DEFAULT NULL COMMENT '小区名称',
  `longitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `area` int(64) DEFAULT NULL COMMENT '地区',
  `description` varchar(500) DEFAULT NULL COMMENT '小区描述',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('18', '硅谷小区', '0', '0', '41', '硅谷小区', '2014-09-20 16:57:32');
INSERT INTO `community` VALUES ('20', '建材城东一里', '0', '0', '41', '建材城东一里', '2014-10-23 18:44:22');
INSERT INTO `community` VALUES ('21', '知本时代', '0', '0', '41', '知本时代', '2014-09-20 16:59:35');
INSERT INTO `community` VALUES ('23', '枫丹丽舍', '0', '0', '41', '枫丹丽舍', '2014-10-23 18:44:13');
INSERT INTO `community` VALUES ('24', '旗胜家园', '0', '0', '41', '旗胜家园', '2014-09-20 17:00:48');
INSERT INTO `community` VALUES ('25', '富力桃园', '0', '0', '41', '富力桃园', '2014-09-20 17:01:03');
INSERT INTO `community` VALUES ('32', '天通东苑一区', '0', '0', '51', '天通东苑一区', '2014-10-24 21:23:56');
INSERT INTO `community` VALUES ('33', '润生源', '0', '0', '41', '润生源', '2014-10-24 21:31:32');
INSERT INTO `community` VALUES ('34', '建材城西二里 ', '0', '0', '41', '建材城西二里  ', '2014-10-24 21:31:52');
INSERT INTO `community` VALUES ('35', '金隅翡丽', '0', '0', '41', '金隅翡丽', '2014-10-24 21:32:17');
INSERT INTO `community` VALUES ('36', '建材城西一里', '0', '0', '41', '建材城西一里', '2014-10-24 21:32:29');
INSERT INTO `community` VALUES ('37', '新康园 ', '0', '0', '41', '新康园 ', '2014-10-24 21:32:37');
INSERT INTO `community` VALUES ('38', '北新家园', '0', '0', '41', '北新家园', '2014-10-24 21:32:45');
INSERT INTO `community` VALUES ('39', '育新小区', '0', '0', '41', '育新小区', '2014-10-24 21:32:52');
INSERT INTO `community` VALUES ('40', '建材城东二里 ', '0', '0', '41', '建材城东二里 ', '2014-10-24 21:32:59');
INSERT INTO `community` VALUES ('41', '森林大第', '0', '0', '41', '森林大第', '2014-10-24 21:33:05');
INSERT INTO `community` VALUES ('42', '天通东苑二区', '0', '0', '51', '天通东苑二区', '2014-11-07 18:07:45');
INSERT INTO `community` VALUES ('43', '天通东苑三区', '0', '0', '51', '天通东苑三区', '2014-11-07 18:07:56');

-- ----------------------------
-- Table structure for `complain`
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增标识',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT '客户ID',
  `complain_content` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `complain_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='投诉反馈表\r\n存储用户意见信息';

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES ('89', '57', '你是谁啊', '', '2014-10-25 22:07:56', 'customer');
INSERT INTO `complain` VALUES ('90', '0', '哈哈哈', '', '2014-10-26 03:29:41', 'customer');
INSERT INTO `complain` VALUES ('91', '64', '健康快乐', '13699255034', '2014-10-27 11:34:31', 'customer');
INSERT INTO `complain` VALUES ('92', '73', '商品种类太少了', '18010028992', '2014-11-14 18:31:33', 'customer');
INSERT INTO `complain` VALUES ('93', '75', '应该写上多少钱起送吧，购物车里没全选这项的一个个点，种类还是不够多啊，比如冰淇淋，馒头，暂时这么多了', '13611164039', '2014-11-16 10:28:17', 'customer');
INSERT INTO `complain` VALUES ('94', '8', '今年', '', '2014-11-17 17:06:05', 'customer');
INSERT INTO `complain` VALUES ('95', '0', '注册时获取验证码总是失败', '15611224913', '2014-11-26 13:32:09', 'customer');
INSERT INTO `complain` VALUES ('96', '8', '估计', '', '2014-11-27 14:06:00', 'customer');
INSERT INTO `complain` VALUES ('97', '9', '他咯', '看看我', '2014-11-28 02:13:11', 'customer');
INSERT INTO `complain` VALUES ('98', '9', '托运', '', '2014-11-28 02:13:16', 'customer');
INSERT INTO `complain` VALUES ('99', '0', '偷我', '', '2014-11-28 02:14:43', 'customer');
INSERT INTO `complain` VALUES ('100', '0', '提莫', '您你', '2014-11-28 02:14:51', 'customer');
INSERT INTO `complain` VALUES ('101', '82', '入口', '', '2014-11-28 03:49:56', 'customer');
INSERT INTO `complain` VALUES ('102', '83', '还多呢', '', '2014-11-28 09:09:41', 'customer');
INSERT INTO `complain` VALUES ('103', '69', '发挥 v 回家uhhj', '45367744', '2014-12-02 00:15:23', 'customer');
INSERT INTO `complain` VALUES ('104', '0', 'ggg', 'ggg', '2014-12-02 11:04:36', 'customer');
INSERT INTO `complain` VALUES ('105', '147', '继续努力', '18612781478', '2014-12-24 14:22:48', 'customer');
INSERT INTO `complain` VALUES ('106', '147', '继续努力', '', '2014-12-24 14:23:05', 'customer');
INSERT INTO `complain` VALUES ('107', '69', '迷宫', '', '2014-12-24 15:53:35', 'customer');
INSERT INTO `complain` VALUES ('108', '399', '下的订单关闭了？', '13681446682', '2015-01-03 15:30:38', 'customer');
INSERT INTO `complain` VALUES ('109', '433', '你们是天通苑的吗，我是温馨天通苑管理员qq68625818', '', '2015-01-14 01:10:02', 'customer');

-- ----------------------------
-- Table structure for `device_model`
-- ----------------------------
DROP TABLE IF EXISTS `device_model`;
CREATE TABLE `device_model` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(64) DEFAULT NULL COMMENT '设备名称',
  `device_type` varchar(32) DEFAULT NULL COMMENT '设备类型（平板、手机...）',
  `device_resolution` varchar(64) DEFAULT NULL COMMENT '设备分辨率',
  `device_screen` varchar(64) DEFAULT NULL COMMENT '设备屏幕',
  `device_os` varchar(64) DEFAULT NULL COMMENT '设备系统',
  `device_os_version` varchar(64) DEFAULT NULL COMMENT '设备系统版本',
  `device_hardware_vendors` varchar(128) DEFAULT NULL COMMENT '设备厂商',
  `device_detail_info` varchar(500) DEFAULT NULL COMMENT '设备详细信息',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `device_id` varchar(45) DEFAULT NULL COMMENT '设备id',
  `device_mac` varchar(45) DEFAULT NULL COMMENT 'mac地址',
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_model
-- ----------------------------
INSERT INTO `device_model` VALUES ('367', 'R830[*#_JK_1]OPPO72_13083[*#_JK_2]R830', 'mobile', '480.0_854.0', '4.019027537991818', 'Android', '4.2.2', '', '17', '2014-11-28 01:17:54', '863165029275853', 'e8:bb:a8:53:f7:6a');
INSERT INTO `device_model` VALUES ('366', 'crater[*#_JK_1]craterzc[*#_JK_2]GT-I9152', 'mobile', '540.0_960.0', '5.835560304111141', 'Android', '4.2.2', '', '17', '2014-11-27 23:35:11', '355795055284000', '18:26:66:B2:79:A1');
INSERT INTO `device_model` VALUES ('365', 'hwC199[*#_JK_1]C199[*#_JK_2]HUAWEI C199', 'pad', '720.0_1184.0', '8.648499525391617', 'Android', '4.4.2', '', '19', '2014-11-27 23:02:53', 'A000004F5FB87A', '80:71:7a:34:f9:35');
INSERT INTO `device_model` VALUES ('364', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.2.1', '', '17', '2014-11-26 19:46:46', '864595025822358', '68:df:dd:a4:4e:af');
INSERT INTO `device_model` VALUES ('363', 'hlte[*#_JK_1]h3gduosctc[*#_JK_2]SM-N9009', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.4.2', '', '19', '2014-11-26 13:19:06', 'A0000047B88321', 'F0:25:B7:6E:2B:86');
INSERT INTO `device_model` VALUES ('362', 'lcsh92_wet_tdd[*#_JK_1]lcsh92_wet_tdd[*#_JK_2]HM NOTE 1TD', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-11-26 13:15:51', '864375021018859', '68:df:dd:ec:7a:cd');
INSERT INTO `device_model` VALUES ('361', 'bbk89_cmcc_jb2[*#_JK_1]bbk89_cmcc_jb2[*#_JK_2]vivo X3t', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-11-25 20:43:46', '863516022640750', '30:9b:ad:7a:be:85');
INSERT INTO `device_model` VALUES ('360', 'ja3g[*#_JK_1]ja3gzn[*#_JK_2]GT-I9500', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.2.2', '', '17', '2014-11-25 19:29:34', '357747056978088', 'CC:3A:61:DB:79:4F');
INSERT INTO `device_model` VALUES ('359', 'cs03lte[*#_JK_1]cs03ltezm[*#_JK_2]SM-G3518', 'mobile', '480.0_800.0', '5.586837282298752', 'Android', '4.3', '', '18', '2014-11-25 10:20:45', '359090052109889', '08:FD:0E:07:3C:CD');
INSERT INTO `device_model` VALUES ('358', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1SC', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.0.4', '', '15', '2014-11-23 14:47:55', '99000219123683', 'C4:6A:B7:69:83:4C');
INSERT INTO `device_model` VALUES ('357', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M045', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.2.1', '', '17', '2014-11-23 13:35:18', '861135027878075', '38:bc:1a:8b:83:84');
INSERT INTO `device_model` VALUES ('356', 'm0chn[*#_JK_1]m0zc[*#_JK_2]GT-I9300', 'mobile', '720.0_1280.0', '4.795409998120847', 'Android', '4.3', '', '18', '2014-11-22 08:51:57', '354316057937908', '60:21:C0:5E:29:79');
INSERT INTO `device_model` VALUES ('355', 'klte[*#_JK_1]kltezm[*#_JK_2]SM-G9008V', 'mobile', '1080.0_1920.0', '5.2007338145504045', 'Android', '4.4.2', '', '19', '2014-11-22 03:34:10', '352107061685829', '84:38:38:02:4E:97');
INSERT INTO `device_model` VALUES ('354', 'S880i[*#_JK_1]S880i[*#_JK_2]Lenovo S880i', 'mobile', '480.0_728.0', '3.633333306793773', 'Android', '4.0.4', '', '15', '2014-11-21 15:02:56', '866365018318790', '14:9f:e8:db:b1:88');
INSERT INTO `device_model` VALUES ('353', 'D6603[*#_JK_1]D6603[*#_JK_2]D6603', 'mobile', '1080.0_1776.0', '4.856379721465175', 'Android', '4.4.4', '', '19', '2014-11-20 21:19:11', '004402452696390', '30:a8:db:94:4a:27');
INSERT INTO `device_model` VALUES ('352', 'hwH60[*#_JK_1]H60-L01[*#_JK_2]H60-L01', 'mobile', '720.0_1184.0', '4.639443156039851', 'Android', '4.4.2', '', '19', '2014-11-20 19:38:48', '357143041335883', '60:e7:01:31:42:08');
INSERT INTO `device_model` VALUES ('351', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-11-20 10:08:38', '868033013454725', '38:BC:1A:05:5A:F4');
INSERT INTO `device_model` VALUES ('350', 'hwG610-T11[*#_JK_1]G610-T11[*#_JK_2]HUAWEI G610-T11', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-11-19 22:26:53', '862594024297433', '78:6a:89:07:9d:c6');
INSERT INTO `device_model` VALUES ('349', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo X3V', 'mobile', '720.0_1280.0', '4.707487718523731', 'Android', '4.4.2', '', '19', '2014-11-19 16:43:53', 'A100003A5478E4', '48:6b:2c:a7:47:25');
INSERT INTO `device_model` VALUES ('348', 'aries[*#_JK_1]aries[*#_JK_2]MI 2', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2014-11-19 13:40:09', '867064012488373', 'c4:6a:b7:4c:0e:aa');
INSERT INTO `device_model` VALUES ('347', 'obakem[*#_JK_1]obakem_verizon[*#_JK_2]XT1030', 'mobile', '720.0_1280.0', '4.282849579155515', 'Android', '4.4', '', '19', '2014-11-18 16:58:31', '990002028008090', 'f8:f1:b6:5a:32:8b');
INSERT INTO `device_model` VALUES ('346', 'aries[*#_JK_1]aries[*#_JK_2]MI 2', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2014-11-18 16:42:00', '867064017521962', 'c4:6a:b7:dd:8b:ca');
INSERT INTO `device_model` VALUES ('345', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-11-17 19:23:40', '863637027147441', '8c:be:be:f0:76:b5');
INSERT INTO `device_model` VALUES ('344', 'hlte[*#_JK_1]h3gduoszn[*#_JK_2]SM-N9002', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.4.2', '', '19', '2014-11-17 18:52:27', '357555054137700', 'D0:22:BE:E8:AB:B8');
INSERT INTO `device_model` VALUES ('343', 'jflte[*#_JK_1]jfltezm[*#_JK_2]GT-I9508', 'mobile', '1080.0_1920.0', '5.00558130242933', 'Android', '4.4.2', '', '19', '2014-11-17 18:16:28', '355637054269667', 'CC:3A:61:BD:20:D5');
INSERT INTO `device_model` VALUES ('342', 'Coolpad9976T[*#_JK_1]Coolpad9976T[*#_JK_2]Coolpad 9976T', 'mobile', '1200.0_1920.0', '4.716990566028302', 'Android', '4.2.2', '', '17', '2014-11-17 12:27:09', '863061027729100', '18:dc:56:f0:00:fd');
INSERT INTO `device_model` VALUES ('341', 'hwC8813DQ[*#_JK_1]C8813DQ[*#_JK_2]HUAWEI C8813DQ', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-11-17 09:28:30', 'A00000494A4ADC', '3c:df:bd:40:3a:ab');
INSERT INTO `device_model` VALUES ('340', 'hwp7[*#_JK_1]P7-L00[*#_JK_2]HUAWEI P7-L00', 'mobile', '1080.0_1776.0', '4.639448389425474', 'Android', '4.4.2', '', '19', '2014-11-16 11:56:28', '357458042791300', '9c:c1:72:3b:fc:3a');
INSERT INTO `device_model` VALUES ('339', 'crane-G12[*#_JK_1]crane_G12[*#_JK_2]READBOY G12', 'pad', '600.0_1024.0', '7.408373399892907', 'Android', '4.0.4', '', '15', '2014-11-16 00:34:17', '352005044156902', '00:92:c4:04:92:d5');
INSERT INTO `device_model` VALUES ('338', 'K860i[*#_JK_1]K860i[*#_JK_2]Lenovo K860i', 'mobile', '720.0_1208.0', '4.394670149172076', 'Android', '4.2.1', '', '17', '2014-11-15 16:23:13', '869460011363005', '00:12:fe:dc:14:6c');
INSERT INTO `device_model` VALUES ('337', 'hwp6-t00[*#_JK_1]P6-T00[*#_JK_2]HUAWEI P6-T00', 'mobile', '720.0_1184.0', '4.391372098954274', 'Android', '4.4.2', '', '19', '2014-11-15 15:39:04', '861022002957928', '08:7a:4c:79:36:4f');
INSERT INTO `device_model` VALUES ('336', 'vastalte[*#_JK_1]vastaltetdzc[*#_JK_2]SM-G7508Q', 'mobile', '720.0_1280.0', '5.957775582536266', 'Android', '4.4.4', '', '19', '2014-11-15 09:21:50', '353925061085396', '64:6C:B2:0F:E3:9D');
INSERT INTO `device_model` VALUES ('335', 'hlte[*#_JK_1]h3gduosctc[*#_JK_2]SM-N9009', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.4.2', '', '19', '2014-11-14 18:20:08', 'A00000455DB859', 'D0:22:BE:57:92:FB');
INSERT INTO `device_model` VALUES ('334', 'hwG525-U00[*#_JK_1]G525-U00[*#_JK_2]HUAWEI G525-U00', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.1.2', '', '16', '2014-11-14 04:13:10', '860499020451202', 'a4:99:47:b2:36:a8');
INSERT INTO `device_model` VALUES ('333', 'armani[*#_JK_1]armani[*#_JK_2]HM 1SW', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-11-13 10:35:24', '865624027451427', '28:e3:1f:7e:5f:5d');
INSERT INTO `device_model` VALUES ('332', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-11-13 03:11:39', '864981029878770', '98:fa:e3:31:bd:10');
INSERT INTO `device_model` VALUES ('331', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 3W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-11-12 19:30:10', '865002023328875', '14:f6:5a:94:40:dd');
INSERT INTO `device_model` VALUES ('330', 'P770[*#_JK_1]P770[*#_JK_2]Lenovo P770', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.1.1', '', '16', '2014-11-12 18:15:20', '866959012977831', '14:9f:e8:0e:8b:38');
INSERT INTO `device_model` VALUES ('329', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-11-12 17:17:16', '865056022352567', '14:f6:5a:84:12:e7');
INSERT INTO `device_model` VALUES ('328', 'mx3[*#_JK_1]meizu_mx3[*#_JK_2]M355', 'mobile', '1080.0_1800.0', '5.050435522308375', 'Android', '4.4.4', '', '19', '2014-11-12 10:52:11', '863151022147471', '38:bc:1a:9c:97:27');
INSERT INTO `device_model` VALUES ('327', 'shellt[*#_JK_1]shellt[*#_JK_2]Lenovo S810t', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-11-12 00:20:25', '864178020096987', '6c:5f:1c:fc:25:e2');
INSERT INTO `device_model` VALUES ('326', 'craterq3g[*#_JK_1]craterq3gzc[*#_JK_2]GT-I9152P', 'mobile', '540.0_960.0', '5.586814387176345', 'Android', '4.3', '', '18', '2014-11-11 19:20:08', '359901050926001', '24:DB:ED:B6:AF:FC');
INSERT INTO `device_model` VALUES ('325', 'hlte[*#_JK_1]h3gduosctc[*#_JK_2]SM-N9009', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.4.2', '', '19', '2014-11-11 19:03:04', 'A00000485DEB5F', '84:38:38:B6:91:A9');
INSERT INTO `device_model` VALUES ('324', 'mx3[*#_JK_1]meizu_mx3[*#_JK_2]M351', 'mobile', '1080.0_1800.0', '5.050435522308375', 'Android', '4.2.1', '', '17', '2014-11-11 13:34:28', '862845023564045', '38:bc:1a:93:40:5d');
INSERT INTO `device_model` VALUES ('323', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-11-11 11:57:01', '867747015369802', 'c4:6a:b7:9d:d1:da');
INSERT INTO `device_model` VALUES ('322', 'baffinvetd3g[*#_JK_1]baffinvetd3gzc[*#_JK_2]GT-I9128E', 'mobile', '480.0_800.0', '5.826905150689579', 'Android', '4.2.2', '', '17', '2014-11-11 10:54:15', '357083054312165', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('321', 'A850[*#_JK_1]aux[*#_JK_2]Lenovo A850', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-11-10 23:14:39', '862297023751109', 'd4:22:3f:f8:b9:46');
INSERT INTO `device_model` VALUES ('320', 'hwmt7[*#_JK_1]MT7-TL00[*#_JK_2]HUAWEI MT7-TL00', 'mobile', '1080.0_1812.0', '5.840641676481724', 'Android', '4.4.2', '', '19', '2014-11-10 17:42:02', '865166021613438', '68:a0:f6:a4:69:ec');
INSERT INTO `device_model` VALUES ('319', 'hlte[*#_JK_1]h3gzc[*#_JK_2]SM-N9006', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.4.2', '', '19', '2014-11-10 14:55:54', '357784057718676', 'D0:22:BE:B1:E5:D4');
INSERT INTO `device_model` VALUES ('318', '4G[*#_JK_1]4G[*#_JK_2]4G', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.4', '', '17', '2014-11-10 14:00:19', '863388027165419', '00:08:22:42:20:96');
INSERT INTO `device_model` VALUES ('317', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-11-09 22:47:31', '868033014253811', '38:BC:1A:80:62:C2');
INSERT INTO `device_model` VALUES ('316', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-11-09 14:25:48', '867747010372249', 'c4:6a:b7:7c:69:94');
INSERT INTO `device_model` VALUES ('315', 'GT-I9100G[*#_JK_1]GT-I9100G[*#_JK_2]GT-I9100G', 'mobile', '480.0_800.0', '4.27396614291449', 'Android', '4.2.2', '', '17', '2014-11-09 11:31:55', '357474049444314', '98:0c:82:b6:e5:82');
INSERT INTO `device_model` VALUES ('314', 'msm7627a[*#_JK_1]msm7627a[*#_JK_2]K-Touch E619', 'mobile', '320.0_480.0', '3.603383961797983', 'Android', '1.5.1.16-RT-20120531.214856', '', '10', '2014-11-09 09:33:05', 'a1000014cb15d3', '80:22:75:21:3E:63');
INSERT INTO `device_model` VALUES ('313', 'hwG716-L070[*#_JK_1]G716-L070[*#_JK_2]HUAWEI G716-L070', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.2.2', '', '17', '2014-11-08 19:27:07', '862372020227625', '88:e3:ab:6d:79:4c');
INSERT INTO `device_model` VALUES ('312', 'hwH30-T00[*#_JK_1]H30-T00[*#_JK_2]H30-T00', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-11-08 15:08:36', '358142037641113', '20:08:ed:46:ee:17');
INSERT INTO `device_model` VALUES ('311', 'hwH30[*#_JK_1]H30-L01[*#_JK_2]HONOR H30-L01', 'mobile', '720.0_1280.0', '5.986340910110713', 'Android', '4.4.2', '', '19', '2014-11-08 14:41:26', '864502025966029', '68:a0:f6:6f:93:6a');
INSERT INTO `device_model` VALUES ('310', 'delos3gchn[*#_JK_1]delos3gzc[*#_JK_2]GT-I8552', 'mobile', '480.0_800.0', '5.826904660976051', 'Android', '4.1.2', '', '16', '2014-11-07 11:50:41', '358198057210544', '78:F7:BE:2C:F8:54');
INSERT INTO `device_model` VALUES ('309', 'hlte[*#_JK_1]hltezm[*#_JK_2]SM-N9008V', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.3', '', '18', '2014-11-06 21:53:07', '358584054369633', 'F0:25:B7:74:CD:E2');
INSERT INTO `device_model` VALUES ('308', 'V9180[*#_JK_1]V9180[*#_JK_2]V9180', 'mobile', '720.0_1280.0', '4.707487718523731', 'Android', '4.3', '', '18', '2014-11-06 16:53:58', '863890028170546', '98:6c:f5:5f:c0:50');
INSERT INTO `device_model` VALUES ('307', 'msm8974sfo[*#_JK_1]msm8974sfo[*#_JK_2]SM701', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-11-05 15:25:25', '864516020077343', 'b4:0b:44:01:0c:c3');
INSERT INTO `device_model` VALUES ('306', 'hwH30-U10[*#_JK_1]H30-U10[*#_JK_2]H30-U10', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-11-05 10:54:23', '359209024157194', '14:b9:68:5b:b8:a1');
INSERT INTO `device_model` VALUES ('305', 'A788t[*#_JK_1]A788t[*#_JK_2]Lenovo A788t', 'pad', '480.0_854.0', '6.152103844511042', 'Android', '4.3', '', '18', '2014-11-04 20:04:51', '863184021010739', 'cc:07:e4:6a:8a:d1');
INSERT INTO `device_model` VALUES ('304', 'HM2013023[*#_JK_1]2013023[*#_JK_2]2013023', 'mobile', '720.0_1280.0', '5.10901656407532', 'Android', '4.2.2', '', '17', '2014-11-04 16:12:00', '862966020358494', 'f8:a4:5f:f8:fa:9a');
INSERT INTO `device_model` VALUES ('303', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-11-03 16:30:51', '867746013245915', 'c4:6a:b7:56:f9:73');
INSERT INTO `device_model` VALUES ('302', 'hwc8860E[*#_JK_1]C8860E[*#_JK_2]HUAWEI C8860E', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '2.3.6', '', '10', '2014-11-03 13:36:26', 'a0000033581dfa', '80:B6:86:5D:CD:BE');
INSERT INTO `device_model` VALUES ('301', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-11-02 15:08:39', '868033015591912', '38:BC:1A:80:6D:76');
INSERT INTO `device_model` VALUES ('300', 't03gchnduos[*#_JK_1]t03gduoszc[*#_JK_2]GT-N7102', 'mobile', '720.0_1280.0', '5.552442827711836', 'Android', '4.3', '', '18', '2014-11-01 19:04:58', '355546057391248', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('299', 'm811[*#_JK_1]m811[*#_JK_2]M811', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-11-01 13:26:28', '864279020702416', '74:ad:b7:72:93:44');
INSERT INTO `device_model` VALUES ('298', 'msm8625[*#_JK_1]msm8625[*#_JK_2]100B', 'pad', '720.0_1184.0', '8.648473759234573', 'Android', '4.1.2', '', '16', '2014-10-31 17:26:10', '861319020272805', '20:59:d4:f8:33:6f');
INSERT INTO `device_model` VALUES ('297', 'hwH30-C00[*#_JK_1]H30-C00[*#_JK_2]H30-C00', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-10-31 15:53:03', 'A000004F414537', '60:e7:01:ba:32:81');
INSERT INTO `device_model` VALUES ('296', 'kingdom[*#_JK_1]htc_kingdom[*#_JK_2]HTC HeroS', 'mobile', '540.0_960.0', '3.9847498620787767', 'Android', '4.0.3', '', '15', '2014-10-29 12:35:59', 'A1000017DF953E', 'E8:99:C4:33:F0:AE');
INSERT INTO `device_model` VALUES ('295', 'hwG700-U00[*#_JK_1]G700-U00[*#_JK_2]HUAWEI G700-U00', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-10-27 20:44:59', '860452020246759', 'ac:e2:15:15:4b:39');
INSERT INTO `device_model` VALUES ('294', 'hwG520-T10[*#_JK_1]G520-T10[*#_JK_2]HUAWEI G520-T10', 'mobile', '480.0_854.0', '4.0818790481317055', 'Android', '4.2.1', '', '17', '2014-10-27 11:55:32', '861999003396257', '08:7a:4c:57:c9:3a');
INSERT INTO `device_model` VALUES ('293', 'delos3gcmcc[*#_JK_1]delos3gzm[*#_JK_2]GT-I8558', 'mobile', '480.0_800.0', '5.830951894845301', 'Android', '4.2.2', '', '17', '2014-10-27 10:54:01', '359797050547379', 'B0:DF:3A:69:41:B4');
INSERT INTO `device_model` VALUES ('292', 'cs03lte[*#_JK_1]cs03ltezm[*#_JK_2]SM-G3518', 'mobile', '480.0_800.0', '5.586837282298752', 'Android', '4.3', '', '18', '2014-10-27 09:36:41', '359090052750336', 'C4:50:06:39:5F:DF');
INSERT INTO `device_model` VALUES ('291', 'aries[*#_JK_1]aries[*#_JK_2]MI 2S', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2014-10-27 06:42:58', '863077024517686', 'f8:a4:5f:3d:ac:2e');
INSERT INTO `device_model` VALUES ('290', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-10-27 02:34:00', '866229025249382', '7c:1d:d9:3c:9d:ed');
INSERT INTO `device_model` VALUES ('289', 'ja3g[*#_JK_1]ja3gzs[*#_JK_2]GT-I9500', 'mobile', '1080.0_1920.0', '4.707483571075172', 'Android', '4.2.2', '', '17', '2014-10-26 21:55:07', '357504059759563', '40:F3:08:C0:3F:2E');
INSERT INTO `device_model` VALUES ('288', 'hwG610-U00[*#_JK_1]G610-U00[*#_JK_2]HUAWEI G610-U00', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-10-26 21:17:28', '863493024098546', '70:72:3c:7b:23:3e');
INSERT INTO `device_model` VALUES ('287', 'CROSS_LTE[*#_JK_1]TCL_P728M[*#_JK_2]TCL P728M', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.4.2', '', '19', '2014-10-26 21:08:58', '865179020488488', 'd8:e5:6d:b7:9f:82');
INSERT INTO `device_model` VALUES ('286', 'ja3g[*#_JK_1]ja3gub[*#_JK_2]GT-I9500', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.2.2', '', '17', '2014-10-26 19:46:37', '357504053603957', '40:F3:08:76:F7:A5');
INSERT INTO `device_model` VALUES ('285', 'GT-I9100[*#_JK_1]GT-I9100[*#_JK_2]GT-I9100', 'mobile', '480.0_800.0', '4.27396614291449', 'Android', '4.4.4', '', '19', '2014-10-26 18:05:36', '359090040173179', '04:46:65:88:26:eb');
INSERT INTO `device_model` VALUES ('284', 'R821T[*#_JK_1]OPPO72T_13033[*#_JK_2]R821T', 'mobile', '480.0_800.0', '3.990386196656946', 'Android', '4.2.2', '', '17', '2014-10-26 13:00:07', '863177022486346', 'e8:bb:a8:98:46:2e');
INSERT INTO `device_model` VALUES ('283', 'hwc8860E[*#_JK_1]C8860E[*#_JK_2]HUAWEI C8860E', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '2.3.6', '', '10', '2014-10-26 11:54:22', 'a000002dd776d7', '80:B6:86:5E:61:81');
INSERT INTO `device_model` VALUES ('282', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.2', '', '19', '2014-10-26 01:57:15', '864260026218862', '68:df:dd:97:6d:e9');
INSERT INTO `device_model` VALUES ('281', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-10-26 00:19:08', '868033013875507', '38:BC:1A:00:B0:CC');
INSERT INTO `device_model` VALUES ('280', 'hwmt7[*#_JK_1]MT7-CL00[*#_JK_2]HUAWEI MT7-CL00', 'mobile', '1080.0_1812.0', '5.840641676481724', 'Android', '4.4.2', '', '19', '2014-10-25 22:57:38', 'a000004f6e612e', '80:71:7a:98:81:4a');
INSERT INTO `device_model` VALUES ('279', 'mione_plus_cdma[*#_JK_1]libra_mione_plus_cdma[*#_JK_2]MI-ONE C1', 'mobile', '480.0_854.0', '4.07266288952905', 'Android', '2.3.5', '', '10', '2014-10-25 21:54:01', '863020018607014', 'C4:6A:B7:30:4E:8C');
INSERT INTO `device_model` VALUES ('278', 'ZTE-Q701C[*#_JK_1]ZTE-Q701C[*#_JK_2]ZTE Q701C', 'pad', '540.0_960.0', '6.875694110452777', 'Android', '4.3', '', '18', '2014-10-25 21:51:16', 'A0000038A76B88', '98:6c:f5:2b:19:92');
INSERT INTO `device_model` VALUES ('368', 'mione_plus_cdma[*#_JK_1]libra_mione_plus_cdma[*#_JK_2]MI-ONE C1', 'mobile', '480.0_854.0', '4.07266288952905', 'Android', '2.3.5', '', '10', '2014-11-28 02:26:36', 'AjHz06E3N62LbPWzIWYJoPYEkXCvoJ9SRPa3Ppo7zG9c', 'C4:6A:B7:30:4E:8C');
INSERT INTO `device_model` VALUES ('369', 'mione_plus_cdma[*#_JK_1]libra_mione_plus_cdma[*#_JK_2]MI-ONE C1', 'mobile', '480.0_854.0', '4.07266288952905', 'Android', '2.3.5', '', '10', '2014-11-28 02:27:08', '', 'C4:6A:B7:30:4E:8C');
INSERT INTO `device_model` VALUES ('370', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-11-28 02:40:54', 'AlM5ERoCxNKXeQ7eFDlKy2h5ZziPFmRac8H9AQda5sUd', '38:BC:1A:00:B0:CC');
INSERT INTO `device_model` VALUES ('371', 'ZTE-Q701C[*#_JK_1]ZTE-Q701C[*#_JK_2]ZTE Q701C', 'pad', '540.0_960.0', '6.875694110452777', 'Android', '4.3', '', '18', '2014-11-28 09:42:37', '862722026025169', '98:6c:f5:2b:19:92');
INSERT INTO `device_model` VALUES ('372', 'logan[*#_JK_1]loganctc[*#_JK_2]SCH-I679', 'mobile', '480.0_800.0', '5.826905150689579', 'Android', '4.3', '', '18', '2014-11-28 12:43:43', 'A0000048B64CFB', '24:DB:ED:96:FD:ED');
INSERT INTO `device_model` VALUES ('373', '8675[*#_JK_1]8675[*#_JK_2]Coolpad 8675', 'mobile', '720.0_1280.0', '5.464508726613722', 'Android', '4.4.2', '', '19', '2014-11-28 14:58:54', 'AnJH4oWQEFlozzTDLP3a58O5PMCg9FtSQYUCYzcMQFmn', '18:dc:56:f0:5c:e2');
INSERT INTO `device_model` VALUES ('374', 'marvel[*#_JK_1]htc_marvel[*#_JK_2]HTC Wildfire S', 'mobile', '320.0_480.0', '3.603383961797983', 'Android', '2.3.7', '', '10', '2014-11-28 23:27:07', 'Ai_7bZaUhmERSH0BzgeCcWqG7TmbR6-XRQDrN73-yzwL', 'A8:26:D9:55:74:E7');
INSERT INTO `device_model` VALUES ('375', 't03gcmcc[*#_JK_1]t03gzm[*#_JK_2]GT-N7108', 'mobile', '720.0_1280.0', '5.552437467042797', 'Android', '4.1.2', '', '16', '2014-11-29 13:38:16', 'Ao8ubjqGUqZaE-waNKsmx6yTQrUuwclk9eVIAr6W8J6G', '34:23:BA:85:2D:90');
INSERT INTO `device_model` VALUES ('376', 'trltechn[*#_JK_1]trlteduoszc[*#_JK_2]SM-N9100', 'mobile', '1440.0_2560.0', '5.713415198256387', 'Android', '4.4.4', '', '19', '2014-11-29 22:17:48', 'AmCoA2Ww1bYMcSHaowtXLXgGLrjGekoQBHmutECc1sQ1', '98:F1:70:17:02:3A');
INSERT INTO `device_model` VALUES ('377', 'EG970[*#_JK_1]EG970[*#_JK_2]HS-EG970', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.1.2', '', '16', '2014-12-03 21:22:57', 'Ak39hhSSn-0HQeMbLqrcEA7gQbWsjconVUahn89roBvy', '00:1a:99:e5:db:f8');
INSERT INTO `device_model` VALUES ('378', 'hlte[*#_JK_1]h3gduoszn[*#_JK_2]SM-N9002', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.3', '', '18', '2014-12-04 17:25:17', 'AnPjSinpCSTaLDZkM4XM03Rf0nNQqDT_-1d0K14ApxN4', 'F0:25:B7:2D:55:0F');
INSERT INTO `device_model` VALUES ('379', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-12-04 18:39:08', 'Agq8lYlfAYrQf-EVIxoZ_YkLnn-qtd19qlQz1K_l5J7S', 'c4:6a:b7:ea:41:3e');
INSERT INTO `device_model` VALUES ('380', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-12-04 18:50:22', 'AsVCgpWe65z1gmUgb_hX-hNcotQa9fxxF73POo7l14NR', '14:f6:5a:8e:a2:73');
INSERT INTO `device_model` VALUES ('381', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-12-05 12:13:33', 'AihqScuu3jO3cP5ynxgIMsjyRBG8cg3YlnVcAJq9Ygln', '68:df:dd:8e:ba:df');
INSERT INTO `device_model` VALUES ('382', 't03gchnduos[*#_JK_1]t03gduoszc[*#_JK_2]GT-N7102', 'mobile', '720.0_1280.0', '5.552437467042797', 'Android', '4.1.2', '', '16', '2014-12-05 12:43:45', 'AkoAYn_eK7rWcU-pHrYnhDOLLykBaMt3iFMEwXbqkwyv', '90:18:7C:CA:C1:C7');
INSERT INTO `device_model` VALUES ('383', 'cancro[*#_JK_1]cancro_wc_lte[*#_JK_2]MI 4LTE', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-12-05 17:46:33', 'Ar0QJxMOwEJptMJzTlcQP385VtNNQ_dUS6Ig8z5GL4ib', '7c:1d:d9:72:de:f4');
INSERT INTO `device_model` VALUES ('384', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2014-12-06 08:39:58', '867747013527336', 'c4:6a:b7:88:18:ef');
INSERT INTO `device_model` VALUES ('385', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-12-06 11:01:53', 'AnBw0c9yUdj7urRwApkVhE0_Z9AgoegJFa-clbe53Rte', '14:f6:5a:b3:72:6d');
INSERT INTO `device_model` VALUES ('386', 'cancro[*#_JK_1]cancro_wc_lte[*#_JK_2]MI 4W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-12-06 12:05:42', 'AiYgwzo6HC68bSdN4aSIe0h_10z0kb1oqhai9nRXxRnB', '0c:1d:af:cb:bf:2e');
INSERT INTO `device_model` VALUES ('387', 'aries[*#_JK_1]aries[*#_JK_2]MI 2S', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.4', '', '19', '2014-12-06 16:18:39', 'ApjSR-Nac_qgRoc2h9WMFmTpVCs0e6HOkfPQ4jhFY2aK', 'f8:a4:5f:30:a0:26');
INSERT INTO `device_model` VALUES ('388', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-12-06 22:46:47', 'AuAYYAzpnj58a4azfvA0XzgIw5b66m4ChMfNKDkEfoJ2', '7c:1d:d9:3d:2a:3d');
INSERT INTO `device_model` VALUES ('389', 't6tl[*#_JK_1]htccn_chs_cmcc[*#_JK_2]HTC 8088', 'mobile', '1080.0_1920.0', '5.8698481891300425', 'Android', '4.4.2', '', '19', '2014-12-07 23:49:03', 'Ar8ebTN-uEkBYw6PexZvT-TGr8Ovwme-8bsQYBkKliu0', '00:ee:bd:01:13:ca');
INSERT INTO `device_model` VALUES ('390', 'v819_4g[*#_JK_1]v819_4g[*#_JK_2]v819_4g', 'pad', '800.0_1208.0', '9.055523335517195', 'Android', '4.3', '', '18', '2014-12-08 15:17:28', 'AnAJgovu1lD3WXeaDzzh3T5PUKW3BXn4vyse6yJQKLmz', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('391', 'hlte[*#_JK_1]h3gzm[*#_JK_2]SM-N9008', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.3', '', '18', '2014-12-08 19:14:58', 'AjMXSp6ny6FyOlLPZ1DGCLqvtepq_wmIuVFaRutFxpIy', 'D0:22:BE:3F:F0:29');
INSERT INTO `device_model` VALUES ('392', 'HM2013022[*#_JK_1]2013022[*#_JK_2]2013022', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-12-09 12:43:55', 'AqyqcdK6yZAVURFwGh0AKOsk6kOe8nx5tm4GmFYnargF', 'f8:a4:5f:a9:dd:1a');
INSERT INTO `device_model` VALUES ('393', 'aries[*#_JK_1]aries[*#_JK_2]MI 2S', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2014-12-09 21:43:52', 'AjSgKmHXr4XEH5KwmtEIIYowYTXbmX7K1t95WwUcyMGa', '8c:be:be:9b:db:79');
INSERT INTO `device_model` VALUES ('394', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2014-12-10 14:37:16', 'AjzDbH8MnolUYAtUlIJpdcflcjX54-EbLQZX7jIIEu9x', 'c4:6a:b7:d2:5d:e3');
INSERT INTO `device_model` VALUES ('395', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M045', 'mobile', '800.0_1280.0', '4.273970188346937', 'Android', '4.4.4', '', '19', '2014-12-10 15:35:46', 'An-SVYTy9dsx_0a6z7zGy8prC0vq4r6Zpeq1jTLA-Q8H', '38:bc:1a:95:f2:04');
INSERT INTO `device_model` VALUES ('396', 'mx2[*#_JK_1]meizu_mx2[*#_JK_2]M040', 'mobile', '800.0_1280.0', '4.27396601992632', 'Android', '4.1.1', '', '16', '2014-12-10 15:36:18', 'AsOv5eFHw3GZEBgON1bPLub7nP83uvMu0zs7jx4TORxC', '38:BC:1A:82:EF:C0');
INSERT INTO `device_model` VALUES ('397', 'msm8974sfo[*#_JK_1]msm8974sfo[*#_JK_2]SM701', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-12-11 17:06:15', 'Aj28KFQ_fwUvcV7tZSDN-zc01Mwd1HFy6FG-Ziob9S0J', '54:b0:75:c3:c3:d3');
INSERT INTO `device_model` VALUES ('398', 'Coolpad7295C[*#_JK_1]Coolpad7295C[*#_JK_2]Coolpad 7295C', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-12-12 00:29:56', 'Aj9cVoTNErEwpSazLEezUbejuDRnzuDGRAIRfPKIelS1', '18:dc:56:f0:45:e4');
INSERT INTO `device_model` VALUES ('399', 'hwG750-T20[*#_JK_1]G750-T20[*#_JK_2]HUAWEI G750-T20', 'mobile', '1080.0_1920.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-12-13 14:18:53', 'AjbRXo0Uw7H2zoQT8ZZMIxmnJ7qptEoASzVV5680222c', 'cc:a2:23:fb:00:b2');
INSERT INTO `device_model` VALUES ('400', 'msm8974sfo_lte[*#_JK_1]msm8974sfo_lte[*#_JK_2]SM705', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-12-13 22:54:52', 'AgOocTtzD4YSUUo6cVjWRowTeB2Jm-dFKOX7l8HIbTl4', 'b4:0b:44:03:d2:bc');
INSERT INTO `device_model` VALUES ('401', 'hwp7[*#_JK_1]P7-L07[*#_JK_2]HUAWEI P7-L07', 'mobile', '1080.0_1776.0', '4.639448389425474', 'Android', '4.4.2', '', '19', '2014-12-14 13:42:57', 'AjVF0vis0N29O6SP6XesK6vTqq7Z2fwdF7IxZJkmcPIE', '9c:c1:72:3c:5b:92');
INSERT INTO `device_model` VALUES ('402', 't03gcmcc[*#_JK_1]t03gzm[*#_JK_2]GT-N7108', 'mobile', '720.0_1280.0', '5.552437467042797', 'Android', '4.1.2', '', '16', '2014-12-14 17:51:06', 'AhL7767MO5vFgsoTeQoZULjiQRfi166_phCgzmbzXcOT', '5C:0A:5B:FD:1D:BD');
INSERT INTO `device_model` VALUES ('403', 'P826T20[*#_JK_1]P826T20[*#_JK_2]ZTE Q505T', 'mobile', '480.0_782.0', '5.743812768012634', 'Android', '4.3', '', '18', '2014-12-14 21:30:17', 'AjDrXGkdtuFjzR4LdUIwGkorS_j2p78CV1JbVQ3u8ni2', '9c:a9:e4:97:d7:bf');
INSERT INTO `device_model` VALUES ('404', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-12-14 23:52:55', 'AsNjq5khp-tDU4AHV7nCcPPYslyqf1YlxUxgl_zfiVCr', '0c:1d:af:eb:fe:d3');
INSERT INTO `device_model` VALUES ('405', 'delos3gduosctc[*#_JK_1]delos3gduosctc[*#_JK_2]SCH-I869', 'mobile', '480.0_800.0', '5.826904660976051', 'Android', '4.1.2', '', '16', '2014-12-15 22:25:28', 'Ag4CODVycIww2S2uj3jPHYkQxGh7XydXL3ZTvdVPouad', 'E4:92:FB:67:2E:8D');
INSERT INTO `device_model` VALUES ('406', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTEW', 'mobile', '720.0_1280.0', '5.464508726613722', 'Android', '4.4.4', '', '19', '2014-12-16 06:31:32', 'AjhEcod8ni5jT1ltP3_jR-1orVq1tbFlDLGe8wB2j2pz', '7c:1d:d9:47:c4:2d');
INSERT INTO `device_model` VALUES ('407', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-12-16 10:55:06', 'AqG0ozYbQ6RW5GviRxOniSU2CtPlcpZW09If_I9s0gIW', '7c:1d:d9:4f:94:4e');
INSERT INTO `device_model` VALUES ('408', 't03gctc[*#_JK_1]t03gctc[*#_JK_2]SCH-N719', 'mobile', '720.0_1280.0', '5.552442827711836', 'Android', '4.3', '', '18', '2014-12-17 10:54:07', 'An_YdDmB5bj4dI1EuB7bEL_5POuscEopUZkMSVhDXQI3', '88:32:9B:74:74:C9');
INSERT INTO `device_model` VALUES ('409', 'ms013g[*#_JK_1]ms013gzn[*#_JK_2]SM-G7106', 'mobile', '720.0_1280.0', '5.586818597577948', 'Android', '4.3', '', '18', '2014-12-18 01:32:43', 'AuNmif-sGBGb31QPrwMH8jZPr8B40lXsiuUymF_KgeYh', 'B0:DF:3A:B8:BF:03');
INSERT INTO `device_model` VALUES ('410', 'ms013g[*#_JK_1]ms013gctc[*#_JK_2]SM-G7109', 'mobile', '720.0_1280.0', '5.586818597577948', 'Android', '4.3', '', '18', '2014-12-18 07:35:17', 'AppkcdpU3on1LBsfoRyA4tqPSuOs4ltu8nRtTcuCeUwz', '18:83:31:B7:63:77');
INSERT INTO `device_model` VALUES ('411', 'msm8960[*#_JK_1]msm8960[*#_JK_2]K-Touch Tou ch 1', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.2.2', '', '17', '2014-12-18 11:21:43', '862302020138373', 'e8:d4:e0:8b:c9:d4');
INSERT INTO `device_model` VALUES ('412', 'A0001[*#_JK_1]A0001[*#_JK_2]A0001', 'mobile', '1080.0_1920.0', '5.464510361895758', 'Android', '4.3', '', '18', '2014-12-19 23:49:11', 'AueLUSHSonBqUANhetGy_07P4X5Yjt_Gcu2KraaN7hO2', 'c0:ee:fb:00:4c:33');
INSERT INTO `device_model` VALUES ('413', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo X710L', 'pad', '1080.0_1920.0', '13.766366812144597', 'Android', '4.3', '', '18', '2014-12-20 10:08:29', 'AmFtmb8UIOC6Ev3c8OM7HlXyq7dwwyb3kBy2S4eOCZGT', '00:0a:f5:d1:4b:3c');
INSERT INTO `device_model` VALUES ('414', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo X710L', 'pad', '1080.0_1920.0', '13.766366812144597', 'Android', '4.3', '', '18', '2014-12-20 10:08:30', 'AtSr3EiLAYgZuC4Mtep96cyuHlAdWIi_M4E55wIpoD_8', '00:0a:f5:c6:e8:58');
INSERT INTO `device_model` VALUES ('415', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo Xplay3S', 'mobile', '1440.0_2560.0', '5.957775582536266', 'Android', '4.3', '', '18', '2014-12-20 10:08:33', 'AhlX3HStWSDyABdHP4sUotXlv_qQsPBeRr_5k9WwvvqO', '00:0a:f5:2c:bc:d4');
INSERT INTO `device_model` VALUES ('416', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo X710L', 'pad', '1080.0_1920.0', '13.766366812144597', 'Android', '4.3', '', '18', '2014-12-20 10:08:33', 'AkluMaMQ_5cs2DiyCZRYM8svJzYFSDhsWRUUYYAev4vj', '00:0a:f5:da:21:ec');
INSERT INTO `device_model` VALUES ('417', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo Xplay3S', 'pad', '1440.0_2560.0', '18.35163751321206', 'Android', '4.3', '', '18', '2014-12-20 10:08:35', 'AnByobTR0BwihoV3YQGbn0xCRSqv7F5Ep_hRCbLbdEVV', '48:13:f3:00:ff:9f');
INSERT INTO `device_model` VALUES ('418', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo X3L', 'mobile', '720.0_1280.0', '4.707487718523731', 'Android', '4.3', '', '18', '2014-12-20 10:08:36', 'Av6B9grgDEu3btc4IXI7qoO7aUT3MQu8LA0Q5EAjo94U', '00:0a:f5:88:3b:b8');
INSERT INTO `device_model` VALUES ('419', 'msm8974[*#_JK_1]msm8974[*#_JK_2]vivo Xplay3S', 'pad', '1440.0_2560.0', '18.35163751321206', 'Android', '4.3', '', '18', '2014-12-20 10:08:37', 'AgJRmndxsEwsgaJ1cut3EwAoDTgkgl0jkxeTcpQ0Uwz1', '00:0a:f5:63:c6:78');
INSERT INTO `device_model` VALUES ('420', 'bbk82_wet_jb5[*#_JK_1]bbk82_wet_jb5[*#_JK_2]vivo Y15T', 'mobile', '480.0_854.0', '4.0818790481317055', 'Android', '4.2.2', '', '17', '2014-12-20 10:08:43', 'Al9DtZmk6JpyveHOFmgpVZZxNExHtqdl5wW3-ZDOrLt1', '00:08:22:0c:ee:fb');
INSERT INTO `device_model` VALUES ('421', 'bbk89_cmcc_jb2[*#_JK_1]bbk89_cmcc_jb2[*#_JK_2]vivo X1St', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-12-20 10:08:43', 'Ar_CePLJo5JsaIDXVmG-KslT4nJ0MupIlgMlMHr--AJ_', '00:08:22:52:af:fe');
INSERT INTO `device_model` VALUES ('422', 'bbk89_cmcc_jb2[*#_JK_1]bbk89_cmcc_jb2[*#_JK_2]vivo X1St', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-12-20 10:08:45', 'AjgdgyG1eOSkRf1IbMAEJ13KiQmuo_d-MdZ6TOHc4_El', '00:08:22:8e:2c:3e');
INSERT INTO `device_model` VALUES ('423', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y22L', 'pad', '480.0_854.0', '6.133653454098641', 'Android', '4.3', '', '18', '2014-12-20 10:08:45', 'Aq_ZUKJjOJnvot7N9_644NmZ_H2-AL2vNfmFqZ4JuBa1', '00:0a:50:ce:58:c3');
INSERT INTO `device_model` VALUES ('424', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y22L', 'pad', '480.0_854.0', '6.133653454098641', 'Android', '4.3', '', '18', '2014-12-20 10:08:45', 'AnAfdhAcSyekQXmDkUVvuE05zkpVysIqZXIo8wSllQu2', '00:0a:4d:d8:59:c3');
INSERT INTO `device_model` VALUES ('425', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y22L', 'pad', '480.0_854.0', '6.133653454098641', 'Android', '4.3', '', '18', '2014-12-20 10:08:47', 'Al0amaCcckhl7tb2ZDSmZjsbul1Yk52JsmYq8Bu3M9lT', '48:13:f3:00:5f:d8');
INSERT INTO `device_model` VALUES ('426', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y22L', 'pad', '480.0_854.0', '6.133653454098641', 'Android', '4.3', '', '18', '2014-12-20 10:08:47', 'ArB01IaxYZLduy38rHskyJ-iqyal77kCrar3k5Uw0ZO8', '48:13:f3:00:60:2b');
INSERT INTO `device_model` VALUES ('427', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y18L', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-12-20 10:09:01', 'AtQfztE55BszdzbfN42SSUL7zrBKjlZ2ru6n7nne_in8', '00:0a:f5:0a:f3:28');
INSERT INTO `device_model` VALUES ('428', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y18L', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2014-12-20 10:09:03', 'AjXKtD1UYGkUsCokCtp4jIDBomIiufozJRSq5lIk-rxk', '00:0a:f5:22:f3:a4');
INSERT INTO `device_model` VALUES ('429', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 4W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-12-21 14:14:34', 'Ai0vcoVqh_ueG-MCU0O7omFS0qudbe-QjzHRzg6tStyV', '0c:1d:af:d1:39:38');
INSERT INTO `device_model` VALUES ('430', 'SHV-E120L[*#_JK_1]SHV-E120L[*#_JK_2]SHV-E120L', 'mobile', '720.0_1280.0', '4.653836436186351', 'Android', '4.1.2', '', '16', '2014-12-21 23:49:35', 'AhrHqloJEGeBR-dcBSEo3sc5mt0lXi1PPbeL-rP10WAe', '60:D0:A9:87:5D:F0');
INSERT INTO `device_model` VALUES ('431', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 3C', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-12-22 16:29:12', 'AhZ8GRgXQQv6SD3RvhKtmfpNprbLNv7hD6BIw92go7cb', 'd4:97:0b:53:bc:94');
INSERT INTO `device_model` VALUES ('432', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTEW', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2014-12-22 23:07:23', 'AsC57QZXV4nEeg0fLBT5D3XjL-DjJK8qdva5yPF7OIyN', '7c:1d:d9:40:d7:08');
INSERT INTO `device_model` VALUES ('433', 'msm8974sfo_lte[*#_JK_1]msm8974sfo_lte[*#_JK_2]SM705', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-12-23 18:35:43', 'AuoGtQIG4u3tOz_kz_UmUZ7X6hP6d-Hh1qHMPuotQKGY', 'b4:0b:44:03:dc:79');
INSERT INTO `device_model` VALUES ('434', 'S720[*#_JK_1]S720[*#_JK_2]Lenovo S720', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.0.4', '', '15', '2014-12-23 18:52:19', 'AvFLp028RcnAmxx3d2kC78U6cfDxkAQH4Ec4wkP6FfZ7', '80:cf:41:99:bb:c9');
INSERT INTO `device_model` VALUES ('435', 'HandHeld-1[*#_JK_1]HandHeld-1[*#_JK_2]HandHeld-1', 'mobile', '480.0_800.0', '3.902605659761948', 'Android', '4.2.2', '', '17', '2014-12-23 23:29:13', 'As067awB2vWtenG38KqD1GDy1aUdUDoS2VyyUW7_Ga58', 'c4:6a:b7:92:69:47');
INSERT INTO `device_model` VALUES ('436', 'HM2014501[*#_JK_1]2014501[*#_JK_2]2014501', 'mobile', '720.0_1280.0', '5.109019411820861', 'Android', '4.4.2', '', '19', '2014-12-24 01:14:39', 'Apnemw_f7JvOe-Dqob8awUzGFUUkUbZnJNO3y64WN0Jj', '98:fa:e3:cc:56:67');
INSERT INTO `device_model` VALUES ('437', 'lcsh92_wet_tdd[*#_JK_1]lcsh92_wet_tdd[*#_JK_2]HM NOTE 1TD', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2014-12-24 17:20:04', 'AoDXBciEePiHfp2x7LajBxt71TgmaWRG_BpB0LDZMJXe', '28:e3:1f:c9:02:b9');
INSERT INTO `device_model` VALUES ('438', 'melius3g[*#_JK_1]melius3gzc[*#_JK_2]GT-I9200', 'pad', '720.0_1280.0', '6.27518470458345', 'Android', '4.2.2', '', '17', '2014-12-24 18:29:56', 'AvcckbCQ6kwDnnT2Tp3DLXiOTt59ZVqI9zZTZZyrwQ2p', 'E4:32:CB:02:DE:59');
INSERT INTO `device_model` VALUES ('439', 'hwC8815[*#_JK_1]C8815[*#_JK_2]HUAWEI C8815', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.1.2', '', '16', '2014-12-24 23:21:54', 'AgoH6LwYlNINR3rbOAyCBmh4PX7oc0P8bRpJDeVxF9FI', '00:66:4b:3f:7b:8f');
INSERT INTO `device_model` VALUES ('440', 'ja3g[*#_JK_1]ja3gzn[*#_JK_2]GT-I9500', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-12-25 10:02:45', 'AuDUJQYFji4X7-U2rOiIIB4FnY0x-fLbtxQGJ71Rff08', 'F0:27:65:1C:49:3A');
INSERT INTO `device_model` VALUES ('441', 'A0001[*#_JK_1]A0001[*#_JK_2]A0001', 'mobile', '1080.0_1920.0', '5.464510361895758', 'Android', '4.3', '', '18', '2014-12-25 10:02:58', 'As0rB5Qr7U4NQX6H_2jGaU_GZ-Ia81r4xMytbW0smaAZ', 'c0:ee:fb:05:ac:41');
INSERT INTO `device_model` VALUES ('442', 'cs02ve3g[*#_JK_1]cs02ve3gzc[*#_JK_2]SM-G3502C', 'mobile', '480.0_800.0', '5.826905150689579', 'Android', '4.3', '', '18', '2014-12-25 16:55:25', 'AqC96XeuI3cjYSih4RjsCePUparFG4eGG5scoPB5uJNF', '34:31:11:9E:CB:E8');
INSERT INTO `device_model` VALUES ('443', 'hwG610-T00[*#_JK_1]G610-T00[*#_JK_2]HUAWEI G610-T00', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-12-25 17:32:10', 'Ao8DjzKq_jcFAay54HtnzVLU0CPH6_vuJ3XhPGonllN6', '50:9f:27:43:48:47');
INSERT INTO `device_model` VALUES ('444', 'mx3[*#_JK_1]meizu_mx3[*#_JK_2]M355', 'mobile', '1080.0_1800.0', '5.050435522308375', 'Android', '4.4.4', '', '19', '2014-12-26 17:12:05', 'ApTxhMj7Q2VPPweEKtHSX4JVBXiaRpm7ynnmf3jKa2QK', '38:bc:1a:ab:a4:87');
INSERT INTO `device_model` VALUES ('445', 't03gctc[*#_JK_1]t03gctc[*#_JK_2]SCH-N719', 'mobile', '720.0_1280.0', '5.552442827711836', 'Android', '4.3', '', '18', '2014-12-26 17:49:38', 'AsORe8O43IWzEzVbliJpu-r9cJVebsZqRv8ZbZmShUaI', '88:32:9B:79:08:27');
INSERT INTO `device_model` VALUES ('446', 'cs02cmcc[*#_JK_1]cs02zm[*#_JK_2]SM-G3508', 'mobile', '480.0_800.0', '3.990386196656946', 'Android', '4.1.2', '', '16', '2014-12-26 18:12:44', 'Auubtd_W99F9r1BQIdCx6R81YABnQgYNgTTqgiZ_mhzq', 'B0:DF:3A:44:28:8C');
INSERT INTO `device_model` VALUES ('447', 'R1S[*#_JK_1]R8007[*#_JK_2]R8007', 'mobile', '720.0_1280.0', '4.707487718523731', 'Android', '4.3', '', '18', '2014-12-27 13:44:03', 'AuuFwc3jNAbCrsE_ndadyAFi295ur3DElkwj9hYgR94r', 'a4:3d:78:28:b1:60');
INSERT INTO `device_model` VALUES ('448', 'marvel[*#_JK_1]htc_marvel[*#_JK_2]HTC Wildfire S A510e', 'mobile', '320.0_480.0', '3.603383961797983', 'Android', '2.3.3', '', '10', '2014-12-27 16:08:24', 'AmtDYfmg5ttBTWdgQfy81dCD6qg3AEJ5jyPh_4gR-4ej', 'D8:B3:77:D0:6C:91');
INSERT INTO `device_model` VALUES ('449', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 4W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.2', '', '19', '2014-12-27 16:31:36', 'Ah1IzPD7ED_q6JOy__0zac7w4Sku4zv1mlYbKjbIEmnt', '0c:1d:af:c5:0a:f4');
INSERT INTO `device_model` VALUES ('450', 'hlte[*#_JK_1]h3gzm[*#_JK_2]SM-N9008', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.3', '', '18', '2014-12-27 17:34:22', 'AjlsYshWIXUaDGV_KHAQhColyM-Uhijby7MfU-whF-4S', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('451', 'baffin[*#_JK_1]baffinvezn[*#_JK_2]GT-I9082i', 'mobile', '480.0_800.0', '5.050437893838416', 'Android', '4.1.2', '', '16', '2014-12-28 12:31:28', 'AmHakGxmoLYZdlA9hndx0qHFrUfuVdB0Px5XEqLv_Os2', '18:1E:B0:A9:53:82');
INSERT INTO `device_model` VALUES ('452', 'K860i[*#_JK_1]K860i[*#_JK_2]Lenovo K860i', 'mobile', '720.0_1208.0', '4.394670149172076', 'Android', '4.2.1', '', '17', '2014-12-28 12:48:58', 'Ag_8R4u714l790JzphLZiLnXrip1HywV6tn089cQsVu7', '00:12:fe:dc:14:6c');
INSERT INTO `device_model` VALUES ('453', 'HM2013022[*#_JK_1]2013022[*#_JK_2]2013022', 'mobile', '720.0_1280.0', '5.10901656407532', 'Android', '4.2.1', '', '17', '2014-12-28 13:08:53', 'AtAw3qUkYvhb59-E7cQWQ3HcjW5MF_P0TsE26uo_d-xr', 'f8:a4:5f:af:7f:cd');
INSERT INTO `device_model` VALUES ('454', 'S820[*#_JK_1]S820[*#_JK_2]Lenovo S820', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-12-28 14:18:29', 'AmrgfTQ-_INQ4w-QY8e2huTniG5DY-NLR8JKXSRZ7c5q', '50:3c:c4:22:25:ad');
INSERT INTO `device_model` VALUES ('455', '7011[*#_JK_1]7011[*#_JK_2]Coolpad 7011', 'mobile', '320.0_480.0', '3.603383961797983', 'Android', '2.3.5', '', '10', '2014-12-28 16:49:17', 'AvVeNIv4bLyAuaB_0iKkl4x46BfxblSzezyTxwZww0Zi', '00:23:B1:DE:82:31');
INSERT INTO `device_model` VALUES ('456', 'msm8625[*#_JK_1]msm8625[*#_JK_2]LA-M2', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.1.2', '', '16', '2014-12-28 17:14:45', 'Aq6BFh59Wwx4ir2D-djS9mAFSq9VVgA_v8bCsLQ2fxfI', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('457', 'hwG700-U00[*#_JK_1]G700-U00[*#_JK_2]HUAWEI G700-U00', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2014-12-28 21:02:34', 'AiYTOJkmMuCqjMrwtEHaOKEzM41_7eLICxmpUuuMe0z2', '08:7a:4c:5d:41:e4');
INSERT INTO `device_model` VALUES ('458', 'cancro[*#_JK_1]cancro_wc_lte[*#_JK_2]MI 4W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2014-12-28 23:43:42', 'AiWMyzL4Pb8-rKJAQe7hzsO9FBWEaGeTePOVcvTr2Lx4', '0c:1d:af:d3:79:25');
INSERT INTO `device_model` VALUES ('459', 'GT-I9100[*#_JK_1]GT-I9100[*#_JK_2]GT-I9100', 'mobile', '480.0_800.0', '4.27396614291449', 'Android', '4.0.3', '', '15', '2014-12-29 08:48:29', 'AjNHxjxFCHFIZ4mdDBIayldCPXQW7epbAR9i8xLmLeLT', '00:37:6d:a9:48:bc');
INSERT INTO `device_model` VALUES ('460', 'crater[*#_JK_1]craterzc[*#_JK_2]GT-I9152', 'mobile', '540.0_960.0', '5.835560304111141', 'Android', '4.2.2', '', '17', '2014-12-29 13:55:01', 'Ast68CXRyyWMAGpnREEFPfXI1MLWlTbPRbwsab1SMKD-', '1C:AF:05:31:40:56');
INSERT INTO `device_model` VALUES ('461', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTEW', 'mobile', '720.0_1280.0', '5.464508726613722', 'Android', '4.4.4', '', '19', '2014-12-29 17:36:17', 'AjH_6OWGhkvvpwmx37WlA6aaPTgk5_y9tjNIMXH8yv5r', '14:f6:5a:ed:23:b7');
INSERT INTO `device_model` VALUES ('462', 'R831S[*#_JK_1]R831S[*#_JK_2]R831S', 'mobile', '480.0_854.0', '4.70748440056479', 'Android', '4.3', '', '18', '2014-12-30 16:08:45', 'AsLyCRf4iR8h_AdUI_vHGI0Hi9w8YNWGARlRBT6ZWCMZ', 'a4:3d:78:53:4e:43');
INSERT INTO `device_model` VALUES ('463', 'A820t[*#_JK_1]A820t[*#_JK_2]Lenovo A820t', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.1.2', '', '16', '2014-12-30 16:11:45', 'Al_Wb46R57415PpP9-ht3q0PLihIQeV9v8injee-P_xs', 'd4:22:3f:00:b2:a7');
INSERT INTO `device_model` VALUES ('464', 'msm7627a[*#_JK_1]XT553[*#_JK_2]MOT-XT553', 'mobile', '320.0_480.0', '3.603383961797983', 'Android', '2.3.6', '', '10', '2014-12-30 17:44:33', 'ApDqZhiEktkbiUHlnqn5ZaELj_O1B0XB5ZeHCagGc3rc', '18:3B:D2:3D:A7:35');
INSERT INTO `device_model` VALUES ('465', 'trltechn[*#_JK_1]trlteduoszc[*#_JK_2]SM-N9100', 'mobile', '1440.0_2560.0', '5.713415198256387', 'Android', '4.4.4', '', '19', '2014-12-31 14:14:43', 'AjSlDpbjE1AwoLwtSeRR4k6Zu0IltVVUC92T_R40LNpI', '98:F1:70:09:E3:AE');
INSERT INTO `device_model` VALUES ('466', 'msm8974sfo_lte[*#_JK_1]msm8974sfo_lte[*#_JK_2]SM705', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2014-12-31 15:56:20', 'ApZ1-MHZnRlNvrmsWnNvXwkI6t6CJ1X4SihWTvmF_gYP', 'b4:0b:44:0b:4a:ac');
INSERT INTO `device_model` VALUES ('467', 'fortunaltectc[*#_JK_1]fortunaltectc[*#_JK_2]SM-G5309W', 'mobile', '540.0_960.0', '4.971258911633199', 'Android', '4.4.4', '', '19', '2014-12-31 22:26:05', 'AsUzH2soFK6LexjkUvdPRTusaRcjITo4VRmfyEBVxyKJ', '14:A3:64:7E:AA:91');
INSERT INTO `device_model` VALUES ('468', 'armani[*#_JK_1]armani[*#_JK_2]HM 1SW', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2015-01-01 09:26:56', 'AmWDltt0o2QvSJ4Cq7guWvaqgl7ptjUj1Zu6K3h5k0Ey', 'd4:97:0b:90:7a:c1');
INSERT INTO `device_model` VALUES ('469', 'hsdroid[*#_JK_1]sprdroid_base[*#_JK_2]HS-T912', 'pad', '480.0_800.0', '36.7304061133161', 'Android', '2.3.5', '', '10', '2015-01-01 12:03:11', 'ApNc-xVwuBr2jyyaxklBeAXkEFFUYKygUEH4t6ruhbxG', '00:1A:98:B5:34:61');
INSERT INTO `device_model` VALUES ('470', 'cancro[*#_JK_1]cancro_wc_lte[*#_JK_2]MI 4W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2015-01-01 13:28:49', 'AtNZqG5Tj5S3PYctOVrSCyYQMxaj6iryAuqmOggKIk11', '0c:1d:af:c7:74:92');
INSERT INTO `device_model` VALUES ('471', 'HWG606[*#_JK_1]G606-T00[*#_JK_2]HUAWEI G606-T00', 'pad', '540.0_960.0', '6.875688693412913', 'Android', '4.0.3', '', '15', '2015-01-01 13:53:25', 'At1sPo9LvrIoUDfsFX-GWYFKA_LQ3dFzsywfSr2mMzCh', '34:cd:be:4f:fa:bf');
INSERT INTO `device_model` VALUES ('472', 'GT-I9100G[*#_JK_1]GT-I9100G[*#_JK_2]GT-I9100G', 'pad', '480.0_800.0', '2.3913389674506623E8', 'Android', '2.3.6', '', '10', '2015-01-01 14:39:00', 'ArLIBrA8maJ0iETCKdJ_uDU0ZsYzLGh8164QAMi-iUkH', '98:0C:82:EA:56:AD');
INSERT INTO `device_model` VALUES ('473', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTEW', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.4.2', '', '19', '2015-01-01 14:39:19', 'AnpHnU9gIYgFsL8O6TkAmVaMtg8Q9eaG848zXp8fg5Lo', '0c:1d:af:fc:3c:71');
INSERT INTO `device_model` VALUES ('474', 'amoi77_cu_ics2[*#_JK_1]amoi77_cu_ics2[*#_JK_2]AMOI N821', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.0.4', '', '15', '2015-01-01 16:59:24', 'Am6wOeH-02JwkicmZlnoW69N4WPbkrrp7-_x-7lVmqaP', '00:12:40:ec:69:c4');
INSERT INTO `device_model` VALUES ('475', 'mocha[*#_JK_1]mocha[*#_JK_2]MI PAD', 'pad', '1536.0_2048.0', '7.874015712738039', 'Android', '4.4.4', '', '19', '2015-01-01 22:16:46', 'AiVG-3nzNxPpUBnb8_CkSPLFdj5gri21GDRwBDJwt9TE', '0c:1d:af:58:06:93');
INSERT INTO `device_model` VALUES ('476', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 3W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2015-01-02 09:43:32', 'ApKFBmAhLdvxv1TpJ9RHnipUjyHhODQX5Va8NMUsn-Oq', '8c:be:be:75:9f:0f');
INSERT INTO `device_model` VALUES ('477', 'Coolpad7296[*#_JK_1]Coolpad7296[*#_JK_2]Coolpad 7296', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-02 13:04:57', 'AplhYu4tP14MUo4OvoLFgpVL4wz5Y0aQryq2Sbk0Ym51', '18:dc:56:37:a7:cf');
INSERT INTO `device_model` VALUES ('478', 'bbk77_cu_jb[*#_JK_1]bbk77_cu_jb[*#_JK_2]vivo X1', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.1.1', '', '16', '2015-01-02 13:56:45', 'Apl7Zp7IvKBJUjQjrg5G4zoInIypVDfzHeUIVA8XtDnh', '48:13:f3:af:2b:19');
INSERT INTO `device_model` VALUES ('479', 'htc_m8tl[*#_JK_1]htccn_chs_cmcc[*#_JK_2]HTC M8t', 'mobile', '1080.0_1776.0', '4.639448389425474', 'Android', '4.4.4', '', '19', '2015-01-02 15:56:26', 'AnT2Z_VyaxVZjMw62sTY-huassBTu9cDckMPi2FsRdH1', '00:ee:bd:98:07:22');
INSERT INTO `device_model` VALUES ('480', 'U707T[*#_JK_1]OPPO89T_13003[*#_JK_2]U707T', 'mobile', '720.0_1280.0', '5.059170260066228', 'Android', '4.2.1', '', '17', '2015-01-03 05:26:24', 'AlN8MuLh-ThDKPeuQfEma_CNY7bMLkc1L4kifIq8zHxb', 'e8:bb:a8:c6:0a:cf');
INSERT INTO `device_model` VALUES ('481', 'baffin[*#_JK_1]baffinvezn[*#_JK_2]GT-I9082i', 'mobile', '480.0_800.0', '5.050437893838416', 'Android', '4.1.2', '', '16', '2015-01-03 06:55:33', 'AhHLOyMflXuNeVuIZ9Hbv7ljcAAm9sqO9wyXDLBzIeHC', '00:00:00:00:00:00');
INSERT INTO `device_model` VALUES ('482', 'Coolpad7296[*#_JK_1]Coolpad7296[*#_JK_2]Coolpad 7296', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-03 15:01:09', 'AmsR3DMv3Sm0kJU2KGUoRXdr7R1IlWxB_rdTr4tL0aA8', '18:dc:56:36:9d:2b');
INSERT INTO `device_model` VALUES ('483', 'aries[*#_JK_1]aries[*#_JK_2]MI 2S', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2015-01-04 01:16:41', 'AplfxaliQSLXhOSl27WHatnGZaIJVzmwp6-IjNs5o3iD', 'f8:a4:5f:84:ec:e4');
INSERT INTO `device_model` VALUES ('484', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2015-01-04 09:39:04', 'AlRN3HPM4ZhFHoXZBAdYmZLqTS19hZSdiPFWP8i0CBgH', 'f8:a4:5f:75:95:37');
INSERT INTO `device_model` VALUES ('485', 'aries[*#_JK_1]aries[*#_JK_2]MI 2', 'mobile', '720.0_1280.0', '4.282842215158729', 'Android', '4.1.1', '', '16', '2015-01-05 21:14:11', 'Am1Shk_dR8pq82zD3gEZLArZxF1lRnRpLa83_Vk-QJFB', 'c4:6a:b7:dd:8b:ca');
INSERT INTO `device_model` VALUES ('486', 'A788t[*#_JK_1]A788t[*#_JK_2]Lenovo A788t', 'pad', '480.0_854.0', '6.152103844511042', 'Android', '4.3', '', '18', '2015-01-06 13:13:13', 'AsCDzIw7kqTqPfftUOV5-6YkepS5pfAZhQErykGHpRGe', '70:72:0d:28:07:d1');
INSERT INTO `device_model` VALUES ('487', 'hwH30-U10[*#_JK_1]H30-U10[*#_JK_2]H30-U10', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-06 13:23:25', 'AlylOgIrVBjomjO7e5tbpxBJLA_0uGgV_OUlVspqLdXa', '20:08:ed:5c:a5:91');
INSERT INTO `device_model` VALUES ('488', 'mx3[*#_JK_1]meizu_mx3[*#_JK_2]M356', 'mobile', '1080.0_1800.0', '5.050435522308375', 'Android', '4.4.4', '', '19', '2015-01-06 17:46:09', 'AgqEdXfJQqEBp0XtO7Rend2cAmoHYdOxRuHYTD8rOy2P', '38:bc:1a:ae:a0:5a');
INSERT INTO `device_model` VALUES ('489', 'HWHol-U[*#_JK_1]Hol-U10[*#_JK_2]Hol-U10', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-07 12:08:33', 'AuOGCMTfLnJK4CBx6AQ43ZJaQo3fvOpYxIN1w0J-vaP9', '88:ce:fa:50:4f:99');
INSERT INTO `device_model` VALUES ('490', 'msm8974sfo[*#_JK_1]msm8974sfo[*#_JK_2]SM701', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2015-01-07 17:29:04', 'AjNFobXGOG5WRY5ObfkjAIarhAr6QwFv561O0pWqUfu9', 'b4:0b:44:03:80:59');
INSERT INTO `device_model` VALUES ('491', 'bbk73_gb[*#_JK_1]bbk73_gb[*#_JK_2]vivo E1', 'mobile', '320.0_480.0', '3.605551275463989', 'Android', '2.3.5', '', '10', '2015-01-08 14:10:15', 'AhdmepL8IuQImqPwmB-1gxm2xC83KuJPKvbjXdkTF0Gz', '48:13:f3:3f:d6:aa');
INSERT INTO `device_model` VALUES ('492', 'ja3gchnduos[*#_JK_1]ja3gchnduoszn[*#_JK_2]GT-I9502', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2015-01-09 23:16:48', 'AsHbifbLcmUV1ZNC4SjV4uzkk2X1ecJPJgY-rXfN1l67', '40:0E:85:46:C3:62');
INSERT INTO `device_model` VALUES ('493', 'msm8226[*#_JK_1]msm8226[*#_JK_2]vivo Y18L', 'pad', '720.0_1280.0', '9.166157292694583', 'Android', '4.3', '', '18', '2015-01-11 05:37:05', 'AmQrC2uT-zVwm-0NbAIrwI1t1qNYTUn_f3FePrRfIdIf', '00:0a:f5:36:f0:20');
INSERT INTO `device_model` VALUES ('494', 'hwH30-T10[*#_JK_1]H30-T10[*#_JK_2]H30-T10', 'mobile', '720.0_1280.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-12 23:53:55', 'AtWD-9WLepfp1VLe9A3Egqvyt4XQovPlJATD284DbARo', 'd0:7a:b5:9c:24:be');
INSERT INTO `device_model` VALUES ('495', 'bbk72_t_jb3[*#_JK_1]bbk72_t_jb3[*#_JK_2]vivo Y11', 'mobile', '480.0_800.0', '5.826904660976051', 'Android', '4.2.2', '', '17', '2015-01-13 16:03:18', 'AlVQtBTLuNlhx6TiIl2cMuCEk7dQ8h79v5vXDk3X6tcq', '80:41:4e:3a:95:78');
INSERT INTO `device_model` VALUES ('496', 'mione_plus[*#_JK_1]mione_plus[*#_JK_2]MI 1S', 'pad', '480.0_854.0', '6.1336513238683805', 'Android', '4.1.2', '', '16', '2015-01-13 17:16:58', 'Ap-JTvxpH7LSoikc_wVmx8NBKdZPxUHiNe6rB17DZelA', 'c4:6a:b7:60:94:71');
INSERT INTO `device_model` VALUES ('497', 'Coolpad7620L[*#_JK_1]Coolpad7620L[*#_JK_2]Coolpad 7620L', 'pad', '540.0_960.0', '6.875694110452777', 'Android', '4.3', '', '18', '2015-01-15 18:23:49', 'Al21YyrT1LQ1OvX0VS_Ko6X7kldtY5R8EWv2bHGplGlG', '18:dc:56:b4:c3:de');
INSERT INTO `device_model` VALUES ('498', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2015-01-15 22:19:03', 'AmKXtOjlH_jq8gJPHxpxqRjiCmdCtHgKCFUca4p0bz7E', '14:f6:5a:87:2f:d8');
INSERT INTO `device_model` VALUES ('499', 'dior[*#_JK_1]dior[*#_JK_2]HM NOTE 1LTETD', 'mobile', '720.0_1280.0', '5.464508726613722', 'Android', '4.4.4', '', '19', '2015-01-15 23:17:21', 'AiAlizSB6RyoAwC8LGtXj4wzgsPljpFgK4YlMQtV5zYo', '7c:1d:d9:3c:9d:ed');
INSERT INTO `device_model` VALUES ('500', 'Coolpad8702[*#_JK_1]Coolpad8702[*#_JK_2]Coolpad 8702', 'mobile', '480.0_854.0', '4.971250116530495', 'Android', '4.3', '', '18', '2015-01-16 22:04:14', 'AignLJbhNgyX7fJ-1auzYFGSVjIHIRnG5nwRnOmjsXFO', '18:dc:56:b6:25:4d');
INSERT INTO `device_model` VALUES ('501', 'pisces[*#_JK_1]pisces[*#_JK_2]MI 3', 'mobile', '1080.0_1920.0', '4.971245218614666', 'Android', '4.4.4', '', '19', '2015-01-18 11:52:41', 'Ao2KIZ7jLjCAdFtreXXGAPaI6ON2BQFgTaUTDUUV1aL7', '8c:be:be:f9:29:16');
INSERT INTO `device_model` VALUES ('502', 'cancro[*#_JK_1]cancro_wc_lte[*#_JK_2]MI 4LTE', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2015-01-18 13:07:16', 'AqIC5NosKCArqBsewufNh5mpIA5-qF-PAp2iCZCNdctk', '0c:1d:af:c8:d6:86');
INSERT INTO `device_model` VALUES ('503', 'msm8974sfo[*#_JK_1]msm8974sfo[*#_JK_2]SM701', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2015-01-19 02:01:12', 'Aqs1Nsm41vZNWNwc0b8YPQQAYd6n19RBwjlSSgMeqNLI', 'b4:0b:44:01:6e:05');
INSERT INTO `device_model` VALUES ('504', 'hammerhead[*#_JK_1]hammerhead[*#_JK_2]Nexus 5', 'mobile', '1080.0_1776.0', '4.691006162189619', 'Android', '4.4.4', '', '19', '2015-01-19 16:56:47', 'Akuzl03iuHYkAXds4J9VOkH1aSpukIqlElfaei4Iv4kA', 'cc:fa:00:a9:6d:3c');
INSERT INTO `device_model` VALUES ('505', 'msm8974sfo[*#_JK_1]msm8974sfo[*#_JK_2]SM701', 'mobile', '1080.0_1920.0', '4.971247911145661', 'Android', '4.4.2', '', '19', '2015-01-19 17:07:38', 'Ag20qUF5fTNJbHux23p2FJSWNDB_lrqul3OG5DbzIZOf', 'b4:0b:44:03:90:cd');
INSERT INTO `device_model` VALUES ('506', 'cancro[*#_JK_1]cancro[*#_JK_2]MI 3W', 'mobile', '1080.0_1920.0', '4.917646181702473', 'Android', '4.4.4', '', '19', '2015-01-19 23:48:50', 'AhvAae-MoC_isXAGQIu8Dl7wm8ofmxTn44zyohXWM-Zz', '8c:be:be:70:96:cb');
INSERT INTO `device_model` VALUES ('507', 'bbk89_cmcc_jb2[*#_JK_1]bbk89_cmcc_jb2[*#_JK_2]vivo Y19t', 'mobile', '540.0_960.0', '4.589389937671455', 'Android', '4.2.1', '', '17', '2015-01-21 14:08:50', 'Ah6RPf2neNU-ZvMgPjhu6p2oUF2TQjEYPVtQ_hiRvGpD', '2c:28:2d:67:6e:01');
INSERT INTO `device_model` VALUES ('508', 'SCRIBEPRO[*#_JK_1]TCL_Y910[*#_JK_2]TCL Y910', 'mobile', '1080.0_1920.0', '4.589389937671455', 'Android', '4.2.2', '', '17', '2015-01-21 19:20:32', 'AlZ1ZT-diwd-JNZalcDtFy20QNPqQbmc8eriuPhAv4gc', '60:51:2c:8e:8c:04');
INSERT INTO `device_model` VALUES ('509', 'Coolpad8705[*#_JK_1]Coolpad8705[*#_JK_2]Coolpad 8705', 'pad', '480.0_854.0', '6.152103844511042', 'Android', '4.3', '', '18', '2015-01-22 12:45:38', 'Ak9iaTifqnjwGSMjfPqPc5rm0pK9zKxLsVh5AYOjh9qe', '18:dc:56:7c:3f:25');
INSERT INTO `device_model` VALUES ('510', 'hlte[*#_JK_1]h3gduoszn[*#_JK_2]SM-N9002', 'mobile', '1080.0_1920.0', '5.6939884085129915', 'Android', '4.3', '', '18', '2015-01-22 13:59:23', 'ApThdxWH1aSzF8KBKMx8OSxhyiHiJFo91Q5GsF1xb6v4', 'F0:25:B7:1E:D6:B5');

-- ----------------------------
-- Table structure for `devices`
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `device_id` varchar(64) DEFAULT NULL COMMENT '设备ID',
  `device_mac` varchar(32) DEFAULT NULL COMMENT '设备类型（平板、手机...）',
  `device_model_id` varchar(64) DEFAULT NULL COMMENT '设备分辨率',
  `token` varchar(64) DEFAULT NULL COMMENT 'token值',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `userid` varchar(45) NOT NULL COMMENT '用户唯一id',
  `role` varchar(45) NOT NULL COMMENT '用户角色',
  `registration_id` varchar(255) DEFAULT '0',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1879 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of devices
-- ----------------------------
INSERT INTO `devices` VALUES ('1246', 'AihqScuu3jO3cP5ynxgIMsjyRBG8cg3YlnVcAJq9Ygln', null, null, 'id-96@n-141205121610@u-e58982f910544a718035725573a91be6', '2014-12-05 12:16:10', '96', 'customer', null);
INSERT INTO `devices` VALUES ('1245', 'iPhone4JK', null, null, 'id-95@n-141205114547@u-af193d0555e24bbd82b38d85faa9e0e3', '2014-12-05 11:45:47', '95', 'customer', null);
INSERT INTO `devices` VALUES ('1461', 'iPhone4JK', null, null, 'id-85@n-141227171908@u-389cecc378de4e74a0f23bbd7f0b8a52', '2014-12-27 17:19:08', '85', 'customer', null);
INSERT INTO `devices` VALUES ('1189', 'iPhone4JK', null, null, 'id-86@n-141129095556@u-d2902c3ceffa40719a8aa3d6e2d74da9', '2014-11-29 09:55:56', '86', 'customer', null);
INSERT INTO `devices` VALUES ('1831', '../../../../../../../../windows/win.ini\0.jpg', null, null, 'id-68@n-150116204701@u-9bb104e5936c45f59aafce6dc7297dfa', '2015-01-16 20:47:01', '68', 'customer', null);
INSERT INTO `devices` VALUES ('1207', '', null, null, 'id-87@n-141201202606@u-297b1f7bbe634f59ae9dc747bfd37fa9', '2014-12-01 20:26:06', '87', 'customer', null);
INSERT INTO `devices` VALUES ('1272', 'iPhone4JK', null, null, 'id-66@n-141209175603@u-fbb141c3de1b43619c19c38a2b9a93e9', '2014-12-09 17:56:03', '66', 'customer', null);
INSERT INTO `devices` VALUES ('1202', 'AtsYosWLw0DkzfyYgtDAL3ZJyOEhfmxfCNCRUzkeUYu_', null, null, 'id-10@n-141129201157@u-ed7870cc632a4ea7b2c017e2504121d4', '2014-11-29 20:11:57', '10', 'delivery', null);
INSERT INTO `devices` VALUES ('1270', '', null, null, 'id-88@n-141209052714@u-87733d8e423e484d9cdf84fd019b2947', '2014-12-09 05:27:14', '88', 'customer', null);
INSERT INTO `devices` VALUES ('1232', 'AjlFUqeO07d-S39wUKQt59l3Osj-VCXU66jLiT_QTGo0', null, null, 'id-67@n-141203201933@u-b3bfa2d505df4980820d4bf5d9889736', '2014-12-03 20:19:33', '67', 'customer', null);
INSERT INTO `devices` VALUES ('1362', 'Ak39hhSSn-0HQeMbLqrcEA7gQbWsjconVUahn89roBvy', null, null, 'id-89@n-141225080539@u-7acda25134884bf69242494cda52e171', '2014-12-25 08:05:39', '89', 'customer', null);
INSERT INTO `devices` VALUES ('1383', '', null, null, 'id-70@n-141225220803@u-6167c78809ad4a90b4dcb569948cc8f0', '2014-12-25 22:08:03', '70', 'customer', null);
INSERT INTO `devices` VALUES ('1238', 'AnPjSinpCSTaLDZkM4XM03Rf0nNQqDT_-1d0K14ApxN4', null, null, 'id-90@n-141204172719@u-5c22535a949e4b87897d304d34ec972a', '2014-12-04 17:27:19', '90', 'customer', null);
INSERT INTO `devices` VALUES ('1357', '', null, null, 'id-94@n-141224150535@u-b3a8eb125e46494ab33690c3bc948211', '2014-12-24 15:05:35', '94', 'customer', null);
INSERT INTO `devices` VALUES ('1242', '', null, null, 'id-93@n-141204201851@u-82f541f1987349439d55a5cdd284165b', '2014-12-04 20:18:51', '93', 'customer', null);
INSERT INTO `devices` VALUES ('1240', 'iPhone4JK', null, null, 'id-91@n-141204180056@u-dede801b26e941858075cbe16656eb93', '2014-12-04 18:00:56', '91', 'customer', null);
INSERT INTO `devices` VALUES ('1241', 'Agq8lYlfAYrQf-EVIxoZ_YkLnn-qtd19qlQz1K_l5J7S', null, null, 'id-92@n-141204185041@u-a2b2c791a83148be90a79c9f7e0a418d', '2014-12-04 18:50:41', '92', 'customer', null);
INSERT INTO `devices` VALUES ('1178', 'Ai990FVsSeS0tUm_Q7jglCXKjOgxQbUvH8CDITP4_fqM', null, null, 'id-2@n-141128102948@u-38dc4bd52e9e43c59fb9011787cf9894', '2014-11-28 10:29:48', '2', 'delivery', null);
INSERT INTO `devices` VALUES ('1476', '', null, null, 'id-226@n-141228120718@u-53e8fec7483a42afa420ad79d52be72d', '2014-12-28 12:07:18', '226', 'customer', null);
INSERT INTO `devices` VALUES ('1637', 'AiNmS1bJ0nIXAbOQ4J0aJQb0ayHPRGuHPwip8t9CdGxc', null, null, 'id-13@n-141231175323@u-4a2ad830ccd2488baeb76c71f023130a', '2014-12-31 17:53:23', '13', 'delivery', null);
INSERT INTO `devices` VALUES ('1247', 'AkoAYn_eK7rWcU-pHrYnhDOLLykBaMt3iFMEwXbqkwyv', null, null, 'id-97@n-141205124643@u-2688efb73c9c41c18e2bd91708b7dfc2', '2014-12-05 12:46:43', '97', 'customer', null);
INSERT INTO `devices` VALUES ('1248', '', null, null, 'id-98@n-141205185857@u-81ad1c826fbe441aa1950c84f9522c16', '2014-12-05 18:58:57', '98', 'customer', null);
INSERT INTO `devices` VALUES ('1249', '867747013527336', null, null, 'id-99@n-141206084113@u-196fae5bf2eb4f1fa0ee4ed283e31cbf', '2014-12-06 08:41:13', '99', 'customer', null);
INSERT INTO `devices` VALUES ('1251', '', null, null, 'id-100@n-141206133108@u-dc855b65e1ab4d6d9c17679d02e0af37', '2014-12-06 13:31:08', '100', 'customer', null);
INSERT INTO `devices` VALUES ('1252', '', null, null, 'id-101@n-141206165612@u-84434ebcc63646bca50ce95da11675f5', '2014-12-06 16:56:12', '101', 'customer', null);
INSERT INTO `devices` VALUES ('1254', 'iPhone4JK', null, null, 'id-102@n-141206181830@u-bba743f294764cecb747e21626cfb94c', '2014-12-06 18:18:30', '102', 'customer', null);
INSERT INTO `devices` VALUES ('1256', 'iPhone4JK', null, null, 'id-103@n-141206222610@u-b512df6d63c14b99918a4ff656e95a37', '2014-12-06 22:26:10', '103', 'customer', null);
INSERT INTO `devices` VALUES ('1259', 'iPhone4JK', null, null, 'id-104@n-141207235327@u-998209c6ed794f529e7517dd222e7373', '2014-12-07 23:53:27', '104', 'customer', null);
INSERT INTO `devices` VALUES ('1260', 'AnAJgovu1lD3WXeaDzzh3T5PUKW3BXn4vyse6yJQKLmz', null, null, 'id-105@n-141208152659@u-0c8d28793cd949b7bb7504d7ad7a2943', '2014-12-08 15:26:59', '105', 'customer', null);
INSERT INTO `devices` VALUES ('1265', 'iPhone4JK', null, null, 'id-106@n-141208165744@u-3e16c38f1cb145549eecd732395927ff', '2014-12-08 16:57:44', '106', 'customer', null);
INSERT INTO `devices` VALUES ('1267', 'iPhone4JK', null, null, 'id-107@n-141208170843@u-3715fb9209934748b10e3151f0ee9f5f', '2014-12-08 17:08:43', '107', 'customer', null);
INSERT INTO `devices` VALUES ('1422', '', null, null, 'id-108@n-141227015821@u-ebf28d50db1b4e9aa047e9e4a4052672', '2014-12-27 01:58:21', '108', 'customer', null);
INSERT INTO `devices` VALUES ('1273', '', null, null, 'id-109@n-141209180521@u-e312f732d2df4691a0fc506c5a42b0cc', '2014-12-09 18:05:21', '109', 'customer', null);
INSERT INTO `devices` VALUES ('1284', '', null, null, 'id-112@n-141210173518@u-68bee88d903c45638e205548cbba451b', '2014-12-10 17:35:18', '112', 'customer', null);
INSERT INTO `devices` VALUES ('1283', 'An-SVYTy9dsx_0a6z7zGy8prC0vq4r6Zpeq1jTLA-Q8H', null, null, 'id-111@n-141210153706@u-fd9652dc42e94eeba3e812e5c64bbc0a', '2014-12-10 15:37:06', '111', 'customer', null);
INSERT INTO `devices` VALUES ('1286', 'iPhone4JK', null, null, 'id-113@n-141211011503@u-5a64ae837aef433195772c363a90ebca', '2014-12-11 01:15:03', '113', 'customer', null);
INSERT INTO `devices` VALUES ('1287', '', null, null, 'id-114@n-141211100815@u-d654ba5c55db4126a808cf13b080111a', '2014-12-11 10:08:15', '114', 'customer', null);
INSERT INTO `devices` VALUES ('1289', 'iPhone4JK', null, null, 'id-115@n-141211102343@u-446de40c202a4af6a2cf1c528fd748d9', '2014-12-11 10:23:43', '115', 'customer', null);
INSERT INTO `devices` VALUES ('1366', '', null, null, 'id-116@n-141225104343@u-87039a8c4ef44892ab3492a7e42acb01', '2014-12-25 10:43:43', '116', 'customer', null);
INSERT INTO `devices` VALUES ('1291', 'AjzDbH8MnolUYAtUlIJpdcflcjX54-EbLQZX7jIIEu9x', null, null, 'id-110@n-141211145304@u-f04786b99d7845a492814aaff0a8a7a1', '2014-12-11 14:53:04', '110', 'customer', null);
INSERT INTO `devices` VALUES ('1293', 'iPhone4JK', null, null, 'id-117@n-141212125120@u-6653e4a7e0d84302b0e93845ee97fb90', '2014-12-12 12:51:20', '117', 'customer', null);
INSERT INTO `devices` VALUES ('1294', '', null, null, 'id-118@n-141212131316@u-f379a5b4dd464943b10e579e8c00d1ea', '2014-12-12 13:13:16', '118', 'customer', null);
INSERT INTO `devices` VALUES ('1295', '', null, null, 'id-119@n-141212211536@u-33cff583f36f4b49ab45c87f48cc6125', '2014-12-12 21:15:36', '119', 'customer', null);
INSERT INTO `devices` VALUES ('1299', 'iPhone4JK', null, null, 'id-120@n-141213195951@u-1a3184c409d04afb869d08c5ca8b4fef', '2014-12-13 19:59:51', '120', 'customer', null);
INSERT INTO `devices` VALUES ('1300', '', null, null, 'id-121@n-141213211027@u-22e64dccc12f4aacb7fc3ef7f47a7b67', '2014-12-13 21:10:27', '121', 'customer', null);
INSERT INTO `devices` VALUES ('1640', '', null, null, 'id-122@n-141231195010@u-01dc4892b4f34b8980709649f0538a5c', '2014-12-31 19:50:10', '122', 'customer', null);
INSERT INTO `devices` VALUES ('1303', 'AjVF0vis0N29O6SP6XesK6vTqq7Z2fwdF7IxZJkmcPIE', null, null, 'id-123@n-141214134458@u-273d56b4d1f04ab099b30be0981ad354', '2014-12-14 13:44:58', '123', 'customer', null);
INSERT INTO `devices` VALUES ('1749', 'iPhone4JK', null, null, 'id-415@n-150107221147@u-04ec7b02912e4a529bbb343f0dfaf5c3', '2015-01-07 22:11:47', '415', 'customer', null);
INSERT INTO `devices` VALUES ('1305', 'AjDrXGkdtuFjzR4LdUIwGkorS_j2p78CV1JbVQ3u8ni2', null, null, 'id-125@n-141214214041@u-a6168d8d850a4442ae3776a6feb9d5bf', '2014-12-14 21:40:41', '125', 'customer', null);
INSERT INTO `devices` VALUES ('1307', 'iPhone4JK', null, null, 'id-126@n-141215090652@u-462d104d5d994563b3b8140084ff6943', '2014-12-15 09:06:52', '126', 'customer', null);
INSERT INTO `devices` VALUES ('1309', 'iPhone4JK', null, null, 'id-127@n-141215142812@u-5bd1ed78d789435fa603722abaeef5da', '2014-12-15 14:28:12', '127', 'customer', null);
INSERT INTO `devices` VALUES ('1316', 'iPhone4JK', null, null, 'id-128@n-141216171452@u-75ecb4c7fa8945d895d2262a31660961', '2014-12-16 17:14:52', '128', 'customer', null);
INSERT INTO `devices` VALUES ('1317', 'AsNjq5khp-tDU4AHV7nCcPPYslyqf1YlxUxgl_zfiVCr', null, null, 'id-129@n-141216174321@u-1504c416695642d38fdfa61447e22c9f', '2014-12-16 17:43:21', '129', 'customer', null);
INSERT INTO `devices` VALUES ('1320', '862302020138373', null, null, 'id-130@n-141218112305@u-80e711ba2ff8424cb9ff0162e882e89f', '2014-12-18 11:23:05', '130', 'customer', null);
INSERT INTO `devices` VALUES ('1324', 'iPhone4JK', null, null, 'id-131@n-141218205848@u-5cb38018eb7d449fbe883d9dd351b5b2', '2014-12-18 20:58:48', '131', 'customer', null);
INSERT INTO `devices` VALUES ('1421', '', null, null, 'id-132@n-141227000314@u-83fad6ff194446c2aabb719319aed4d1', '2014-12-27 00:03:14', '132', 'customer', null);
INSERT INTO `devices` VALUES ('1327', 'iPhone4JK', null, null, 'id-133@n-141219154332@u-f8cc62c6ed2b45419009669ab66de53c', '2014-12-19 15:43:32', '133', 'customer', null);
INSERT INTO `devices` VALUES ('1328', '', null, null, 'id-134@n-141219203521@u-e91896e88bcf4ecfafe811231dc09227', '2014-12-19 20:35:21', '134', 'customer', null);
INSERT INTO `devices` VALUES ('1329', 'AueLUSHSonBqUANhetGy_07P4X5Yjt_Gcu2KraaN7hO2', null, null, 'id-135@n-141219235107@u-4b02e0c1cd1b48b290e5c27f8f03009e', '2014-12-19 23:51:07', '135', 'customer', null);
INSERT INTO `devices` VALUES ('1331', 'iPhone4JK', null, null, 'id-136@n-141220091335@u-9b9ae449b64042679100da9302cd5012', '2014-12-20 09:13:35', '136', 'customer', null);
INSERT INTO `devices` VALUES ('1334', 'iPhone4JK', null, null, 'id-137@n-141221155627@u-7da71c027ca84cbe911ea102ce597568', '2014-12-21 15:56:27', '137', 'customer', null);
INSERT INTO `devices` VALUES ('1639', '', null, null, 'id-138@n-141231181903@u-1610c5ea4249449da83cc43b84129977', '2014-12-31 18:19:03', '138', 'customer', null);
INSERT INTO `devices` VALUES ('1337', 'iPhone4JK', null, null, 'id-139@n-141222183251@u-2427153cd5014a3aaa2dffd014f558a9', '2014-12-22 18:32:51', '139', 'customer', null);
INSERT INTO `devices` VALUES ('1338', 'AsC57QZXV4nEeg0fLBT5D3XjL-DjJK8qdva5yPF7OIyN', null, null, 'id-140@n-141222230927@u-9c61f8ec237c413d9d404796dac7f3ba', '2014-12-22 23:09:27', '140', 'customer', null);
INSERT INTO `devices` VALUES ('1340', 'iPhone4JK', null, null, 'id-141@n-141223154401@u-36268ec2e4f34e8e884eae12dfd07ec0', '2014-12-23 15:44:01', '141', 'customer', null);
INSERT INTO `devices` VALUES ('1355', 'iPhone4JK', null, null, 'id-63@n-141224141728@u-7b9410cf77dc43a8baad1e68bd67ffc5', '2014-12-24 14:17:28', '63', 'customer', null);
INSERT INTO `devices` VALUES ('1473', '', null, null, 'id-142@n-141227212106@u-ac61124ec3e44545884ac3130e8f5eb9', '2014-12-27 21:21:06', '142', 'customer', null);
INSERT INTO `devices` VALUES ('1348', '', null, null, 'id-143@n-141223203710@u-9f35103813834d6fa305befb1ea94c88', '2014-12-23 20:37:10', '143', 'customer', null);
INSERT INTO `devices` VALUES ('1350', 'iPhone4JK', null, null, 'id-144@n-141223214127@u-9fda70b4a3124ac69299c0916fae0e0b', '2014-12-23 21:41:27', '144', 'customer', null);
INSERT INTO `devices` VALUES ('1367', 'Apnemw_f7JvOe-Dqob8awUzGFUUkUbZnJNO3y64WN0Jj', null, null, 'id-145@n-141225112457@u-0040940281f74de099d488806cb369ea', '2014-12-25 11:24:57', '145', 'customer', null);
INSERT INTO `devices` VALUES ('1806', '', null, null, 'id-431@n-150112183631@u-b93c5559540640cdac84992789a6ef64', '2015-01-12 18:36:31', '431', 'customer', null);
INSERT INTO `devices` VALUES ('1356', '', null, null, 'id-147@n-141224141957@u-4cac3c329f0f442dbfd954f9526285b5', '2014-12-24 14:19:57', '147', 'customer', null);
INSERT INTO `devices` VALUES ('1633', '', null, null, 'id-325@n-141231133632@u-26044c87e45c4f7a83fbdb800653296b', '2014-12-31 13:36:32', '325', 'customer', null);
INSERT INTO `devices` VALUES ('1363', 'AuDUJQYFji4X7-U2rOiIIB4FnY0x-fLbtxQGJ71Rff08', null, null, 'id-148@n-141225100340@u-89a596881893479ca8db31c58d415f85', '2014-12-25 10:03:40', '148', 'customer', null);
INSERT INTO `devices` VALUES ('1364', 'As0rB5Qr7U4NQX6H_2jGaU_GZ-Ia81r4xMytbW0smaAZ', null, null, 'id-149@n-141225100438@u-6f98a63016af4c8ca73198896b85abec', '2014-12-25 10:04:38', '149', 'customer', null);
INSERT INTO `devices` VALUES ('1365', 'AnBw0c9yUdj7urRwApkVhE0_Z9AgoegJFa-clbe53Rte', null, null, 'id-150@n-141225103335@u-e51fa016a7b940d8934815485321f682', '2014-12-25 10:33:35', '150', 'customer', null);
INSERT INTO `devices` VALUES ('1369', 'iPhone4JK', null, null, 'id-151@n-141225160831@u-4f216bf194b045b0965ac05d32767a10', '2014-12-25 16:08:31', '151', 'customer', null);
INSERT INTO `devices` VALUES ('1371', 'iPhone4JK', null, null, 'id-152@n-141225164959@u-344c29784248455389fc1c653d7a1785', '2014-12-25 16:49:59', '152', 'customer', null);
INSERT INTO `devices` VALUES ('1372', 'AqC96XeuI3cjYSih4RjsCePUparFG4eGG5scoPB5uJNF', null, null, 'id-153@n-141225165633@u-d11cae37eef04da6822d56ea7cb18919', '2014-12-25 16:56:33', '153', 'customer', null);
INSERT INTO `devices` VALUES ('1374', 'iPhone4JK', null, null, 'id-154@n-141225170159@u-d75b4b433e86490aab8412452f548957', '2014-12-25 17:01:59', '154', 'customer', null);
INSERT INTO `devices` VALUES ('1376', 'iPhone4JK', null, null, 'id-155@n-141225171928@u-9194c7a014624ab09f26514239baebb7', '2014-12-25 17:19:28', '155', 'customer', null);
INSERT INTO `devices` VALUES ('1377', '', null, null, 'id-156@n-141225172133@u-974db99d4e144d1faa520e4cfb89ae4a', '2014-12-25 17:21:33', '156', 'customer', null);
INSERT INTO `devices` VALUES ('1378', '', null, null, 'id-157@n-141225173255@u-c4942112565d41ceb393f92b82c8875f', '2014-12-25 17:32:55', '157', 'customer', null);
INSERT INTO `devices` VALUES ('1379', 'Ao8DjzKq_jcFAay54HtnzVLU0CPH6_vuJ3XhPGonllN6', null, null, 'id-158@n-141225173321@u-f28f077414e545d8ae7f5b0005acd29a', '2014-12-25 17:33:21', '158', 'customer', null);
INSERT INTO `devices` VALUES ('1380', '', null, null, 'id-159@n-141225175714@u-446f77dc42f84d8c9da2684b8d3bff27', '2014-12-25 17:57:14', '159', 'customer', null);
INSERT INTO `devices` VALUES ('1382', 'iPhone4JK', null, null, 'id-160@n-141225180020@u-8beeba2ad3ac4bc89b5815919705a65b', '2014-12-25 18:00:20', '160', 'customer', null);
INSERT INTO `devices` VALUES ('1385', 'iPhone4JK', null, null, 'id-161@n-141226122442@u-b70568895d444dc585e0c85be6a6bdbe', '2014-12-26 12:24:42', '161', 'customer', null);
INSERT INTO `devices` VALUES ('1387', 'iPhone4JK', null, null, 'id-162@n-141226132810@u-abcc5dbf5e91407992ab3b8c890673d6', '2014-12-26 13:28:10', '162', 'customer', null);
INSERT INTO `devices` VALUES ('1388', 'AtNZqG5Tj5S3PYctOVrSCyYQMxaj6iryAuqmOggKIk11', null, null, 'id-163@n-141226135902@u-103c61503ffa49338a5a68166fbd50a3', '2014-12-26 13:59:02', '163', 'customer', null);
INSERT INTO `devices` VALUES ('1390', '', null, null, 'id-164@n-141226170853@u-d0d86a18119b49a49cd1250eb1e3fd9d', '2014-12-26 17:08:53', '164', 'customer', null);
INSERT INTO `devices` VALUES ('1392', 'iPhone4JK', null, null, 'id-165@n-141226170944@u-babc12ee3b2a40b29514b452cc2d6799', '2014-12-26 17:09:44', '165', 'customer', null);
INSERT INTO `devices` VALUES ('1393', 'ApTxhMj7Q2VPPweEKtHSX4JVBXiaRpm7ynnmf3jKa2QK', null, null, 'id-166@n-141226171248@u-16e9e300ae8f42dda7a6b300d5643798', '2014-12-26 17:12:48', '166', 'customer', null);
INSERT INTO `devices` VALUES ('1395', 'iPhone4JK', null, null, 'id-167@n-141226172253@u-6e4f25770e6e4638ad44727605bd7f15', '2014-12-26 17:22:53', '167', 'customer', null);
INSERT INTO `devices` VALUES ('1396', '', null, null, 'id-168@n-141226173228@u-a28f2d09376c4dfaaefa0c2020681963', '2014-12-26 17:32:28', '168', 'customer', null);
INSERT INTO `devices` VALUES ('1397', '', null, null, 'id-169@n-141226173609@u-6a1d8f26eac14577ba41ecfaff9684a4', '2014-12-26 17:36:09', '169', 'customer', null);
INSERT INTO `devices` VALUES ('1399', 'iPhone4JK', null, null, 'id-170@n-141226173709@u-5e723c344e5046ffb13f4adbe65f0c3c', '2014-12-26 17:37:09', '170', 'customer', null);
INSERT INTO `devices` VALUES ('1400', '', null, null, 'id-171@n-141226175054@u-6fd7e45f66bb4dd7939b2d1a4fd2524b', '2014-12-26 17:50:54', '171', 'customer', null);
INSERT INTO `devices` VALUES ('1401', 'AsORe8O43IWzEzVbliJpu-r9cJVebsZqRv8ZbZmShUaI', null, null, 'id-172@n-141226175100@u-6bebdf749f3a489680eb86c2fc152c30', '2014-12-26 17:51:00', '172', 'customer', null);
INSERT INTO `devices` VALUES ('1402', '', null, null, 'id-173@n-141226180310@u-13cd3a05b55c4aa4901a76247c8dcd9f', '2014-12-26 18:03:10', '173', 'customer', null);
INSERT INTO `devices` VALUES ('1403', '', null, null, 'id-174@n-141226180608@u-07689b74f74047709fed3757c6b51272', '2014-12-26 18:06:08', '174', 'customer', null);
INSERT INTO `devices` VALUES ('1404', '', null, null, 'id-175@n-141226181130@u-e17d2811b5824728ba4ac4388ebf510d', '2014-12-26 18:11:30', '175', 'customer', null);
INSERT INTO `devices` VALUES ('1405', '', null, null, 'id-176@n-141226181159@u-fbd106f410994f248f7ee8d27c784902', '2014-12-26 18:11:59', '176', 'customer', null);
INSERT INTO `devices` VALUES ('1406', '', null, null, 'id-177@n-141226181250@u-c9112621877745daad99bd387b3f1be2', '2014-12-26 18:12:50', '177', 'customer', null);
INSERT INTO `devices` VALUES ('1407', 'Auubtd_W99F9r1BQIdCx6R81YABnQgYNgTTqgiZ_mhzq', null, null, 'id-178@n-141226181357@u-5955e1cd88f74e04bdcdc286fa777ebf', '2014-12-26 18:13:57', '178', 'customer', null);
INSERT INTO `devices` VALUES ('1409', 'iPhone4JK', null, null, 'id-179@n-141226183128@u-c5aa06f5bf824c66b1470d504bede7a0', '2014-12-26 18:31:28', '179', 'customer', null);
INSERT INTO `devices` VALUES ('1410', '', null, null, 'id-180@n-141226184358@u-78a3d2661e564be3ac7ba6a5f0982611', '2014-12-26 18:43:58', '180', 'customer', null);
INSERT INTO `devices` VALUES ('1412', 'iPhone4JK', null, null, 'id-181@n-141226185334@u-c683f394bc3c43e2829af4ee2d54ba4b', '2014-12-26 18:53:34', '181', 'customer', null);
INSERT INTO `devices` VALUES ('1414', 'iPhone4JK', null, null, 'id-182@n-141226185637@u-0cf8e55514604481b84fea15a1c64034', '2014-12-26 18:56:37', '182', 'customer', null);
INSERT INTO `devices` VALUES ('1415', '', null, null, 'id-183@n-141226185739@u-a806a6b513ee4ad084d880991f4531e7', '2014-12-26 18:57:39', '183', 'customer', null);
INSERT INTO `devices` VALUES ('1416', '', null, null, 'id-184@n-141226190008@u-90e590abed5c4a9db5f2a021e0768f3f', '2014-12-26 19:00:08', '184', 'customer', null);
INSERT INTO `devices` VALUES ('1417', '', null, null, 'id-185@n-141226190635@u-20d9fed1bf1944a3a1b92116e0e0106e', '2014-12-26 19:06:35', '185', 'customer', null);
INSERT INTO `devices` VALUES ('1418', '', null, null, 'id-186@n-141226190922@u-4cbae83c9ef14a289e86fd0564ec7250', '2014-12-26 19:09:22', '186', 'customer', null);
INSERT INTO `devices` VALUES ('1419', '', null, null, 'id-187@n-141226190942@u-4cfcbcd413364accb521ea4501b5293d', '2014-12-26 19:09:42', '187', 'customer', null);
INSERT INTO `devices` VALUES ('1420', '', null, null, 'id-188@n-141226191811@u-587d5998d5754162a87082077b86ce3a', '2014-12-26 19:18:11', '188', 'customer', null);
INSERT INTO `devices` VALUES ('1424', 'iPhone4JK', null, null, 'id-189@n-141227132748@u-b8ef05cd12114cdabf695987be1fe4eb', '2014-12-27 13:27:48', '189', 'customer', null);
INSERT INTO `devices` VALUES ('1425', '', null, null, 'id-190@n-141227133046@u-66ae249d3ca54f9fb6ef1894efbd6ff4', '2014-12-27 13:30:46', '190', 'customer', null);
INSERT INTO `devices` VALUES ('1427', 'iPhone4JK', null, null, 'id-191@n-141227133049@u-778ed1d0ea454ec8a9013f3ffc25b8b0', '2014-12-27 13:30:49', '191', 'customer', null);
INSERT INTO `devices` VALUES ('1475', '', null, null, 'id-225@n-141227232221@u-1ab9609604024d26af9d8506eb1ab4a1', '2014-12-27 23:22:21', '225', 'customer', null);
INSERT INTO `devices` VALUES ('1429', '', null, null, 'id-193@n-141227133409@u-35cf669e5c4f431fbda471ca92bd27b9', '2014-12-27 13:34:09', '193', 'customer', null);
INSERT INTO `devices` VALUES ('1430', '', null, null, 'id-194@n-141227133542@u-cb184e27b4664215a43f97925fa04e72', '2014-12-27 13:35:42', '194', 'customer', null);
INSERT INTO `devices` VALUES ('1431', '', null, null, 'id-195@n-141227133801@u-96b4c092d5d44c4784c9d8a9bed43c47', '2014-12-27 13:38:01', '195', 'customer', null);
INSERT INTO `devices` VALUES ('1432', '', null, null, 'id-196@n-141227133810@u-9b0ddbc061db4438b07d820d6b50cf73', '2014-12-27 13:38:10', '196', 'customer', null);
INSERT INTO `devices` VALUES ('1434', 'iPhone4JK', null, null, 'id-197@n-141227134345@u-0cc0f6d5de89439c80894c85de13274a', '2014-12-27 13:43:45', '197', 'customer', null);
INSERT INTO `devices` VALUES ('1435', 'AuuFwc3jNAbCrsE_ndadyAFi295ur3DElkwj9hYgR94r', null, null, 'id-198@n-141227134454@u-24a9c4eeae234a29953c3d6659f25fe6', '2014-12-27 13:44:54', '198', 'customer', null);
INSERT INTO `devices` VALUES ('1437', 'iPhone4JK', null, null, 'id-199@n-141227134733@u-b5f37dcca3d84533b78d757e2659410b', '2014-12-27 13:47:33', '199', 'customer', null);
INSERT INTO `devices` VALUES ('1438', '', null, null, 'id-200@n-141227140207@u-0aa6e13b02ec45cba0ca11424b27cb8e', '2014-12-27 14:02:07', '200', 'customer', null);
INSERT INTO `devices` VALUES ('1439', '', null, null, 'id-201@n-141227140239@u-fdda594cb20e472d966e154f30e919ee', '2014-12-27 14:02:39', '201', 'customer', null);
INSERT INTO `devices` VALUES ('1440', '', null, null, 'id-202@n-141227140819@u-a59a84fb42164bce8b4fc1427670922d', '2014-12-27 14:08:19', '202', 'customer', null);
INSERT INTO `devices` VALUES ('1442', 'iPhone4JK', null, null, 'id-203@n-141227142257@u-124240cca87a42aa881e9a4b4a787b13', '2014-12-27 14:22:57', '203', 'customer', null);
INSERT INTO `devices` VALUES ('1444', 'iPhone4JK', null, null, 'id-204@n-141227151033@u-94b75223c52248949f2804fb13a96ccb', '2014-12-27 15:10:33', '204', 'customer', null);
INSERT INTO `devices` VALUES ('1445', '', null, null, 'id-205@n-141227151408@u-36614d86f4f644aaa2fa90409229a60f', '2014-12-27 15:14:08', '205', 'customer', null);
INSERT INTO `devices` VALUES ('1447', '', null, null, 'id-207@n-141227152832@u-6963abe5959942298ebecf6df0d16ef9', '2014-12-27 15:28:32', '207', 'customer', null);
INSERT INTO `devices` VALUES ('1449', 'iPhone4JK', null, null, 'id-208@n-141227155852@u-a67e4cf057e740a888536c03c83a23de', '2014-12-27 15:58:52', '208', 'customer', null);
INSERT INTO `devices` VALUES ('1450', 'AmtDYfmg5ttBTWdgQfy81dCD6qg3AEJ5jyPh_4gR-4ej', null, null, 'id-209@n-141227160951@u-ac8b5c5a17484f49afd0c208748257e6', '2014-12-27 16:09:51', '209', 'customer', null);
INSERT INTO `devices` VALUES ('1861', 'iPhone4JK', null, null, 'id-210@n-150118155241@u-b89508edc15b44d6b2dbeb541e5c40c6', '2015-01-18 15:52:41', '210', 'customer', null);
INSERT INTO `devices` VALUES ('1455', 'iPhone4JK', null, null, 'id-211@n-141227163110@u-f0efb961d4ae42c5b06fa9f00ccd6443', '2014-12-27 16:31:10', '211', 'customer', null);
INSERT INTO `devices` VALUES ('1456', 'Ah1IzPD7ED_q6JOy__0zac7w4Sku4zv1mlYbKjbIEmnt', null, null, 'id-212@n-141227163250@u-976e0131f13346e0a4433ed497424673', '2014-12-27 16:32:50', '212', 'customer', null);
INSERT INTO `devices` VALUES ('1457', '', null, null, 'id-213@n-141227165350@u-c5038fa576df40e7b6080ba112eed0b4', '2014-12-27 16:53:50', '213', 'customer', null);
INSERT INTO `devices` VALUES ('1458', '', null, null, 'id-214@n-141227170638@u-6e595ba1a6a746dd9000a5d94c573c45', '2014-12-27 17:06:38', '214', 'customer', null);
INSERT INTO `devices` VALUES ('1460', 'iPhone4JK', null, null, 'id-215@n-141227171746@u-83739e6ba28b4231ab2ad9ded36ecf7b', '2014-12-27 17:17:46', '215', 'customer', null);
INSERT INTO `devices` VALUES ('1462', 'AjlsYshWIXUaDGV_KHAQhColyM-Uhijby7MfU-whF-4S', null, null, 'id-216@n-141227173513@u-7b0b44c7bc1c45f3807a9e50cc1c9f48', '2014-12-27 17:35:13', '216', 'customer', null);
INSERT INTO `devices` VALUES ('1463', '', null, null, 'id-217@n-141227174103@u-492e438280674ba3b37c2510c6e057b4', '2014-12-27 17:41:03', '217', 'customer', null);
INSERT INTO `devices` VALUES ('1464', '', null, null, 'id-218@n-141227175612@u-13338df2aeb247b8af5baadbcf8004c5', '2014-12-27 17:56:12', '218', 'customer', null);
INSERT INTO `devices` VALUES ('1465', '', null, null, 'id-219@n-141227175859@u-f2e3dd070c324d89a0ddd26468aee9be', '2014-12-27 17:58:59', '219', 'customer', null);
INSERT INTO `devices` VALUES ('1466', '', null, null, 'id-220@n-141227181539@u-cbd09415e35a419ea3b3256b748833b8', '2014-12-27 18:15:39', '220', 'customer', null);
INSERT INTO `devices` VALUES ('1468', 'iPhone4JK', null, null, 'id-221@n-141227182859@u-57da438997664cc9966225ba67724a99', '2014-12-27 18:28:59', '221', 'customer', null);
INSERT INTO `devices` VALUES ('1469', '', null, null, 'id-222@n-141227183012@u-45b90f02ce364c91b1bbdd996032fa6a', '2014-12-27 18:30:12', '222', 'customer', null);
INSERT INTO `devices` VALUES ('1470', '', null, null, 'id-223@n-141227183207@u-733f24276896401a92971c10de90dc15', '2014-12-27 18:32:07', '223', 'customer', null);
INSERT INTO `devices` VALUES ('1472', 'iPhone4JK', null, null, 'id-224@n-141227183221@u-549fd549e2de47d6beaafa6c988fed82', '2014-12-27 18:32:21', '224', 'customer', null);
INSERT INTO `devices` VALUES ('1477', 'AmHakGxmoLYZdlA9hndx0qHFrUfuVdB0Px5XEqLv_Os2', null, null, 'id-227@n-141228123216@u-c48b459921404093bc8ddbda6d4c3a49', '2014-12-28 12:32:16', '227', 'customer', null);
INSERT INTO `devices` VALUES ('1478', '', null, null, 'id-228@n-141228123337@u-467fc197da3c4d81a39dd7dd9257dcc8', '2014-12-28 12:33:37', '228', 'customer', null);
INSERT INTO `devices` VALUES ('1485', '', null, null, 'id-233@n-141228124907@u-a10de4a02d784d669728b2090a2189bc', '2014-12-28 12:49:07', '233', 'customer', null);
INSERT INTO `devices` VALUES ('1480', '', null, null, 'id-230@n-141228123900@u-2495d209638c4772a354b499d3206df9', '2014-12-28 12:39:00', '230', 'customer', null);
INSERT INTO `devices` VALUES ('1482', 'iPhone4JK', null, null, 'id-231@n-141228123902@u-5444c94a93394851aebc5757fc1a7e76', '2014-12-28 12:39:02', '231', 'customer', null);
INSERT INTO `devices` VALUES ('1484', 'iPhone4JK', null, null, 'id-232@n-141228123905@u-9fcce580e88c404f881ecd9763d50dc3', '2014-12-28 12:39:05', '232', 'customer', null);
INSERT INTO `devices` VALUES ('1486', 'Ag_8R4u714l790JzphLZiLnXrip1HywV6tn089cQsVu7', null, null, 'id-74@n-141228124924@u-7529ed4e654848678241487d0570d13e', '2014-12-28 12:49:24', '74', 'customer', null);
INSERT INTO `devices` VALUES ('1487', '', null, null, 'id-234@n-141228125257@u-857db7847fcd4309b0d77a488085ac40', '2014-12-28 12:52:57', '234', 'customer', null);
INSERT INTO `devices` VALUES ('1488', '', null, null, 'id-235@n-141228125431@u-2065597b6305457d9254370a71820b2f', '2014-12-28 12:54:31', '235', 'customer', null);
INSERT INTO `devices` VALUES ('1489', '', null, null, 'id-236@n-141228125737@u-590f6d1582f44ebe85c3d602827552cb', '2014-12-28 12:57:37', '236', 'customer', null);
INSERT INTO `devices` VALUES ('1491', 'iPhone4JK', null, null, 'id-237@n-141228130158@u-98c9878d58b44d44bcb40acf02e2bbc4', '2014-12-28 13:01:58', '237', 'customer', null);
INSERT INTO `devices` VALUES ('1493', 'iPhone4JK', null, null, 'id-238@n-141228130208@u-c21aa724a01b4c89a7a80f426e63ad0a', '2014-12-28 13:02:08', '238', 'customer', null);
INSERT INTO `devices` VALUES ('1494', 'AtAw3qUkYvhb59-E7cQWQ3HcjW5MF_P0TsE26uo_d-xr', null, null, 'id-239@n-141228130944@u-00aca96fa41e4de4b935e54c79718fb9', '2014-12-28 13:09:44', '239', 'customer', null);
INSERT INTO `devices` VALUES ('1496', 'iPhone4JK', null, null, 'id-240@n-141228131422@u-1941390f6356481685d12786bb744bf0', '2014-12-28 13:14:22', '240', 'customer', null);
INSERT INTO `devices` VALUES ('1497', '', null, null, 'id-241@n-141228132426@u-077201a2317043cbb53bb66d662f7fab', '2014-12-28 13:24:26', '241', 'customer', null);
INSERT INTO `devices` VALUES ('1499', 'iPhone4JK', null, null, 'id-242@n-141228133110@u-a32bdf32f45740cbb2e1ef0b9659e9ff', '2014-12-28 13:31:10', '242', 'customer', null);
INSERT INTO `devices` VALUES ('1501', 'iPhone4JK', null, null, 'id-243@n-141228134030@u-1adbf547024b4ad9ab8ed93c974b9e41', '2014-12-28 13:40:30', '243', 'customer', null);
INSERT INTO `devices` VALUES ('1502', '', null, null, 'id-244@n-141228134444@u-1b0f0d0eae184d83acdec93a726359fb', '2014-12-28 13:44:44', '244', 'customer', null);
INSERT INTO `devices` VALUES ('1503', '', null, null, 'id-245@n-141228134522@u-8e9cd5159fa74e7a9de32aeceb28a7f2', '2014-12-28 13:45:22', '245', 'customer', null);
INSERT INTO `devices` VALUES ('1505', 'iPhone4JK', null, null, 'id-246@n-141228135250@u-51a6cc2e62314a37bed91ade63a6f18a', '2014-12-28 13:52:50', '246', 'customer', null);
INSERT INTO `devices` VALUES ('1506', '', null, null, 'id-247@n-141228135328@u-b0176512c34d4cc0bc35004940935f7a', '2014-12-28 13:53:28', '247', 'customer', null);
INSERT INTO `devices` VALUES ('1507', '', null, null, 'id-248@n-141228135855@u-9de9b22ab32a417590d169f12db72ae0', '2014-12-28 13:58:55', '248', 'customer', null);
INSERT INTO `devices` VALUES ('1508', '', null, null, 'id-249@n-141228140010@u-b52d1f2589884b26b4f9cb07c3fb10d7', '2014-12-28 14:00:10', '249', 'customer', null);
INSERT INTO `devices` VALUES ('1556', 'iPhone4JK', null, null, 'id-286@n-141228172735@u-154c094fd3184b229535ddd52e42f4ff', '2014-12-28 17:27:35', '286', 'customer', null);
INSERT INTO `devices` VALUES ('1511', 'iPhone4JK', null, null, 'id-251@n-141228141400@u-bfa3734854f24bec92061a4f85a938d7', '2014-12-28 14:14:00', '251', 'customer', null);
INSERT INTO `devices` VALUES ('1513', 'iPhone4JK', null, null, 'id-252@n-141228141602@u-79d3257286b5402aacac87cb1ae52c27', '2014-12-28 14:16:02', '252', 'customer', null);
INSERT INTO `devices` VALUES ('1514', 'AmrgfTQ-_INQ4w-QY8e2huTniG5DY-NLR8JKXSRZ7c5q', null, null, 'id-253@n-141228141936@u-11a61cb36dfd475080b61c75e0f2929a', '2014-12-28 14:19:36', '253', 'customer', null);
INSERT INTO `devices` VALUES ('1515', '', null, null, 'id-254@n-141228142439@u-549303ef9ff94c6da316a2351e72dbc5', '2014-12-28 14:24:39', '254', 'customer', null);
INSERT INTO `devices` VALUES ('1516', '', null, null, 'id-255@n-141228142459@u-d85791ed67154d089698442b1fdb688b', '2014-12-28 14:24:59', '255', 'customer', null);
INSERT INTO `devices` VALUES ('1517', '', null, null, 'id-256@n-141228142548@u-2e071bd0ec2b4c4e89e46c02d87a5250', '2014-12-28 14:25:48', '256', 'customer', null);
INSERT INTO `devices` VALUES ('1519', 'iPhone4JK', null, null, 'id-257@n-141228145509@u-bcaea4bc0eea4ea599e2343d526f4e73', '2014-12-28 14:55:09', '257', 'customer', null);
INSERT INTO `devices` VALUES ('1520', '', null, null, 'id-258@n-141228150204@u-71485717c8fe484982d01e44e414cf48', '2014-12-28 15:02:04', '258', 'customer', null);
INSERT INTO `devices` VALUES ('1521', '', null, null, 'id-259@n-141228150327@u-1c5bd56577c94e258842fb77ae8ecccb', '2014-12-28 15:03:27', '259', 'customer', null);
INSERT INTO `devices` VALUES ('1522', '', null, null, 'id-260@n-141228150337@u-ef07e196a7c549548f3a7a432cbec089', '2014-12-28 15:03:37', '260', 'customer', null);
INSERT INTO `devices` VALUES ('1524', 'iPhone4JK', null, null, 'id-261@n-141228150433@u-1745ced476b64a619bdfdd373f452115', '2014-12-28 15:04:33', '261', 'customer', null);
INSERT INTO `devices` VALUES ('1525', '', null, null, 'id-262@n-141228150627@u-430e892111f44b709ab2ce04acc1f1bf', '2014-12-28 15:06:27', '262', 'customer', null);
INSERT INTO `devices` VALUES ('1527', 'iPhone4JK', null, null, 'id-263@n-141228150827@u-340117d31d0643f9bebad260d921482f', '2014-12-28 15:08:27', '263', 'customer', null);
INSERT INTO `devices` VALUES ('1528', '', null, null, 'id-264@n-141228150927@u-ac8b6d622cba4c84b7564070e1340bb4', '2014-12-28 15:09:27', '264', 'customer', null);
INSERT INTO `devices` VALUES ('1529', '', null, null, 'id-265@n-141228151555@u-697a984906a24d3da97623040afdf105', '2014-12-28 15:15:55', '265', 'customer', null);
INSERT INTO `devices` VALUES ('1530', '', null, null, 'id-266@n-141228152001@u-30741973f55d4aa2ad399d0314d28ab3', '2014-12-28 15:20:01', '266', 'customer', null);
INSERT INTO `devices` VALUES ('1546', '', null, null, 'id-278@n-141228164313@u-1f274a3645714639b4e8e3104c125142', '2014-12-28 16:43:13', '278', 'customer', null);
INSERT INTO `devices` VALUES ('1533', 'iPhone4JK', null, null, 'id-268@n-141228154212@u-00b85ec8e94a42a9b6e947039867be23', '2014-12-28 15:42:12', '268', 'customer', null);
INSERT INTO `devices` VALUES ('1535', 'iPhone4JK', null, null, 'id-269@n-141228160819@u-9407ac942aea497bbebc6840d49eef77', '2014-12-28 16:08:19', '269', 'customer', null);
INSERT INTO `devices` VALUES ('1537', 'iPhone4JK', null, null, 'id-270@n-141228161833@u-9b47024e7156472ab512e81115c073ea', '2014-12-28 16:18:33', '270', 'customer', null);
INSERT INTO `devices` VALUES ('1538', '', null, null, 'id-271@n-141228162020@u-1d8b3d765d0247d9be77cbcbc9e5f5da', '2014-12-28 16:20:20', '271', 'customer', null);
INSERT INTO `devices` VALUES ('1540', 'iPhone4JK', null, null, 'id-272@n-141228162104@u-87bf242ebb9f4d958b9bd53cc1ca8ad9', '2014-12-28 16:21:04', '272', 'customer', null);
INSERT INTO `devices` VALUES ('1542', '', null, null, 'id-274@n-141228162715@u-1e97fa955fea403b982fb57eef4fb352', '2014-12-28 16:27:15', '274', 'customer', null);
INSERT INTO `devices` VALUES ('1544', 'iPhone4JK', null, null, 'id-275@n-141228162717@u-5e88f067795143b6ba4336da4a699bfa', '2014-12-28 16:27:17', '275', 'customer', null);
INSERT INTO `devices` VALUES ('1545', 'Aqks9cy9R3r4iMbgh5dALa1xY2cDI3-EGpoZ0Rgfw_Io', null, null, 'id-277@n-141228163529@u-05078163d80043fb800ac5d366466fb0', '2014-12-28 16:35:29', '277', 'customer', null);
INSERT INTO `devices` VALUES ('1547', 'AvVeNIv4bLyAuaB_0iKkl4x46BfxblSzezyTxwZww0Zi', null, null, 'id-279@n-141228165101@u-24bf7d0679104bf1845f1b3d3a036629', '2014-12-28 16:51:01', '279', 'customer', null);
INSERT INTO `devices` VALUES ('1548', '', null, null, 'id-280@n-141228165738@u-e68b389516974080a3bf12e2e8734ca3', '2014-12-28 16:57:38', '280', 'customer', null);
INSERT INTO `devices` VALUES ('1549', 'Aq9sm9cJjRnFxDrRrEjEPghdgQDaKvP_AgOazgElUW90', null, null, 'id-281@n-141228165902@u-1fcd9a0aef2349eb9e395e5072a00e91', '2014-12-28 16:59:02', '281', 'customer', null);
INSERT INTO `devices` VALUES ('1551', 'iPhone4JK', null, null, 'id-282@n-141228170845@u-bfe4eac22f7447aeba515f15f390213d', '2014-12-28 17:08:45', '282', 'customer', null);
INSERT INTO `devices` VALUES ('1559', 'AjNHxjxFCHFIZ4mdDBIayldCPXQW7epbAR9i8xLmLeLT', null, null, 'id-75@n-141229084852@u-6a1db350ec4c42c08d79d8d0716ff116', '2014-12-29 08:48:52', '75', 'customer', null);
INSERT INTO `devices` VALUES ('1553', 'Aq6BFh59Wwx4ir2D-djS9mAFSq9VVgA_v8bCsLQ2fxfI', null, null, 'id-284@n-141228171529@u-bf00ee32e02649eb9ff325cb500a771a', '2014-12-28 17:15:29', '284', 'customer', null);
INSERT INTO `devices` VALUES ('1554', '', null, null, 'id-285@n-141228172131@u-f412c4dab50942d89f7b6580076f8e5c', '2014-12-28 17:21:31', '285', 'customer', null);
INSERT INTO `devices` VALUES ('1558', 'iPhone4JK', null, null, 'id-287@n-141228174344@u-fc1a90c7b6b9407da37c58e46f4e89c5', '2014-12-28 17:43:44', '287', 'customer', null);
INSERT INTO `devices` VALUES ('1560', '', null, null, 'id-288@n-141229124743@u-c5c1686992324902ac31667fba107cb8', '2014-12-29 12:47:43', '288', 'customer', null);
INSERT INTO `devices` VALUES ('1561', '', null, null, 'id-289@n-141229130140@u-c9f6d611057f4862b696a53adf94f657', '2014-12-29 13:01:40', '289', 'customer', null);
INSERT INTO `devices` VALUES ('1562', '', null, null, 'id-290@n-141229130507@u-ccd46ea78bb2458bab13dc087947252e', '2014-12-29 13:05:07', '290', 'customer', null);
INSERT INTO `devices` VALUES ('1563', '', null, null, 'id-291@n-141229132103@u-1437d2e1e4d34f42b2f6b955f09b3d12', '2014-12-29 13:21:03', '291', 'customer', null);
INSERT INTO `devices` VALUES ('1565', '', null, null, 'id-292@n-141229133021@u-2f30873ed0784099b9bb6e8c602b03a9', '2014-12-29 13:30:21', '292', 'customer', null);
INSERT INTO `devices` VALUES ('1566', '', null, null, 'id-293@n-141229133223@u-8ff1b40c45e8419595686d5027b195a6', '2014-12-29 13:32:23', '293', 'customer', null);
INSERT INTO `devices` VALUES ('1567', '', null, null, 'id-294@n-141229134707@u-c9d10d3171e440b199204f019650d3bd', '2014-12-29 13:47:07', '294', 'customer', null);
INSERT INTO `devices` VALUES ('1569', 'iPhone4JK', null, null, 'id-295@n-141229135406@u-b194bd9ea04648a2b0283ee4efd4bcf5', '2014-12-29 13:54:06', '295', 'customer', null);
INSERT INTO `devices` VALUES ('1571', 'iPhone4JK', null, null, 'id-296@n-141229135527@u-0a24e92a5cf745dd8ecb743b746b9838', '2014-12-29 13:55:27', '296', 'customer', null);
INSERT INTO `devices` VALUES ('1572', '', null, null, 'id-297@n-141229145033@u-bb1a3f0888e7498fbf314203acc2f813', '2014-12-29 14:50:33', '297', 'customer', null);
INSERT INTO `devices` VALUES ('1574', 'iPhone4JK', null, null, 'id-298@n-141229154002@u-cc7f5a1d603d4edd83b000df0086803b', '2014-12-29 15:40:02', '298', 'customer', null);
INSERT INTO `devices` VALUES ('1575', '', null, null, 'id-299@n-141229162219@u-3998e7eb8a4e41be99fa40e4e2c94388', '2014-12-29 16:22:19', '299', 'customer', null);
INSERT INTO `devices` VALUES ('1576', '', null, null, 'id-300@n-141229162248@u-de5204df16294f58884a5fbf457dccc5', '2014-12-29 16:22:48', '300', 'customer', null);
INSERT INTO `devices` VALUES ('1577', '', null, null, 'id-301@n-141229162801@u-c92f480dc16d40009f47a753059009f9', '2014-12-29 16:28:01', '301', 'customer', null);
INSERT INTO `devices` VALUES ('1578', '', null, null, 'id-302@n-141229163004@u-f1c9489c8b7041e19d31dcb61cf0c5ed', '2014-12-29 16:30:04', '302', 'customer', null);
INSERT INTO `devices` VALUES ('1580', 'iPhone4JK', null, null, 'id-303@n-141229163009@u-9ff9e6c53d2d4ea99b3677e66b1c02d9', '2014-12-29 16:30:09', '303', 'customer', null);
INSERT INTO `devices` VALUES ('1581', '', null, null, 'id-304@n-141229163340@u-645c8de1578e47fdbd1f4b00962118e4', '2014-12-29 16:33:40', '304', 'customer', null);
INSERT INTO `devices` VALUES ('1583', 'iPhone4JK', null, null, 'id-305@n-141229171409@u-97fe9edb39e2486bbdf4ebc40c6d9498', '2014-12-29 17:14:09', '305', 'customer', null);
INSERT INTO `devices` VALUES ('1584', '', null, null, 'id-306@n-141229180701@u-6a54a46d2a9b441cbee8c9d2b9448906', '2014-12-29 18:07:01', '306', 'customer', null);
INSERT INTO `devices` VALUES ('1586', 'iPhone4JK', null, null, 'id-307@n-141229181004@u-a12efe9748284b328669111efd9a9b94', '2014-12-29 18:10:04', '307', 'customer', null);
INSERT INTO `devices` VALUES ('1588', 'Ald_I8v0VUlt9yAznse6IHHuDZJy0mHXiiMK0SWCFaCa', null, null, 'id-11@n-141229184116@u-789c67c1a9ca447abf2f350254218ad2', '2014-12-29 18:41:16', '11', 'delivery', null);
INSERT INTO `devices` VALUES ('1592', 'AvmElQyFrQDsGn6Rga3OX2OZ_JUhDrRLOhZKpnujhrOr', null, null, 'id-12@n-141230124456@u-1e70648c96f74f02b2d181fa45ed93c8', '2014-12-30 12:44:56', '12', 'delivery', null);
INSERT INTO `devices` VALUES ('1594', 'iPhone4JK', null, null, 'id-308@n-141230141410@u-ac44037b84a943a08261bc77b024ff28', '2014-12-30 14:14:10', '308', 'customer', null);
INSERT INTO `devices` VALUES ('1598', 'AsLyCRf4iR8h_AdUI_vHGI0Hi9w8YNWGARlRBT6ZWCMZ', null, null, 'id-309@n-141230160940@u-53500cf7c1b448508c62f144bf31b5a3', '2014-12-30 16:09:40', '309', 'customer', null);
INSERT INTO `devices` VALUES ('1599', 'Al_Wb46R57415PpP9-ht3q0PLihIQeV9v8injee-P_xs', null, null, 'id-310@n-141230161316@u-47b5499a298c497e8ac18cde8f1ca4dc', '2014-12-30 16:13:16', '310', 'customer', null);
INSERT INTO `devices` VALUES ('1600', '', null, null, 'id-311@n-141230161357@u-2c7e0ddd07f348f58d538c9dd9677ab1', '2014-12-30 16:13:57', '311', 'customer', null);
INSERT INTO `devices` VALUES ('1603', '', null, null, 'id-312@n-141230164435@u-a7766e4314684bcd91c13c6a05729e96', '2014-12-30 16:44:35', '312', 'customer', null);
INSERT INTO `devices` VALUES ('1609', 'iPhone4JK', null, null, 'id-313@n-141230165853@u-72d46ece989441b2b90d6b4d49892e90', '2014-12-30 16:58:53', '313', 'customer', null);
INSERT INTO `devices` VALUES ('1613', 'iPhone4JK', null, null, 'id-314@n-141230171057@u-0009e9fe56554b5598bd3325cba1664b', '2014-12-30 17:10:57', '314', 'customer', null);
INSERT INTO `devices` VALUES ('1616', '', null, null, 'id-315@n-141230172354@u-86da47e604e64574907975f13373fdc0', '2014-12-30 17:23:54', '315', 'customer', null);
INSERT INTO `devices` VALUES ('1617', '', null, null, 'id-316@n-141230172653@u-119bd587454f4c93a40ad06e84b9746f', '2014-12-30 17:26:53', '316', 'customer', null);
INSERT INTO `devices` VALUES ('1618', '', null, null, 'id-317@n-141230173001@u-9806258d2e72456bba730f2ef8a048ed', '2014-12-30 17:30:01', '317', 'customer', null);
INSERT INTO `devices` VALUES ('1620', 'ApDqZhiEktkbiUHlnqn5ZaELj_O1B0XB5ZeHCagGc3rc', null, null, 'id-318@n-141230174554@u-dabfc63ba6154dcc8d3546d724596ca3', '2014-12-30 17:45:54', '318', 'customer', null);
INSERT INTO `devices` VALUES ('1622', 'iPhone4JK', null, null, 'id-319@n-141230175433@u-9594389453d24de080e1b2d5e66cab98', '2014-12-30 17:54:33', '319', 'customer', null);
INSERT INTO `devices` VALUES ('1623', '', null, null, 'id-320@n-141230175653@u-f7a39cd10ecf41868fd9ff94e3b267b6', '2014-12-30 17:56:53', '320', 'customer', null);
INSERT INTO `devices` VALUES ('1624', '', null, null, 'id-321@n-141230175824@u-d77c15466a994f0d9e617855822fa3f8', '2014-12-30 17:58:24', '321', 'customer', null);
INSERT INTO `devices` VALUES ('1626', '', null, null, 'id-322@n-141230180936@u-86517e8107bb4e1191ec5a541600ebc3', '2014-12-30 18:09:36', '322', 'customer', null);
INSERT INTO `devices` VALUES ('1630', 'iPhone4JK', null, null, 'id-323@n-141230183158@u-6bc06a52475e4b8ead48ffa2cdfc9380', '2014-12-30 18:31:58', '323', 'customer', null);
INSERT INTO `devices` VALUES ('1631', '', null, null, 'id-324@n-141231095203@u-a72cd425c0b1452bae89a97f2d4831b4', '2014-12-31 09:52:03', '324', 'customer', null);
INSERT INTO `devices` VALUES ('1635', 'iPhone4JK', null, null, 'id-326@n-141231134832@u-dd2619da70914e33bfb8ba3406418685', '2014-12-31 13:48:32', '326', 'customer', null);
INSERT INTO `devices` VALUES ('1636', 'ApZ1-MHZnRlNvrmsWnNvXwkI6t6CJ1X4SihWTvmF_gYP', null, null, 'id-327@n-141231155838@u-68fc0a9a00204b28935c351dec907b13', '2014-12-31 15:58:38', '327', 'customer', null);
INSERT INTO `devices` VALUES ('1638', '', null, null, 'id-328@n-141231175637@u-3c7724f576344630b90b036110dcf5a3', '2014-12-31 17:56:37', '328', 'customer', null);
INSERT INTO `devices` VALUES ('1877', '', null, null, 'id-8@n-150123130056@u-fb42d25f146b4cc29e51648fea773bb2', '2015-01-23 12:57:56', '8', 'delivery', '0107ae1750e');
INSERT INTO `devices` VALUES ('1643', 'iPhone4JK', null, null, 'id-329@n-141231220234@u-55dc0cff14b04177ac7fa92a50006a6e', '2014-12-31 22:02:34', '329', 'customer', null);
INSERT INTO `devices` VALUES ('1645', 'AmWDltt0o2QvSJ4Cq7guWvaqgl7ptjUj1Zu6K3h5k0Ey', null, null, 'id-330@n-150101093756@u-49e4031d3d104f3c83a2e4ff2a05e549', '2015-01-01 09:37:56', '330', 'customer', null);
INSERT INTO `devices` VALUES ('1647', 'iPhone4JK', null, null, 'id-331@n-150101105907@u-1c8177d38b6c4e688c161b72b0491fd0', '2015-01-01 10:59:07', '331', 'customer', null);
INSERT INTO `devices` VALUES ('1648', '', null, null, 'id-332@n-150101120211@u-eb943a0e91524730a45114ae03fb9093', '2015-01-01 12:02:11', '332', 'customer', null);
INSERT INTO `devices` VALUES ('1649', '', null, null, 'id-333@n-150101120423@u-62b788a3a21e4dc78701932c6a570564', '2015-01-01 12:04:23', '333', 'customer', null);
INSERT INTO `devices` VALUES ('1650', 'ApNc-xVwuBr2jyyaxklBeAXkEFFUYKygUEH4t6ruhbxG', null, null, 'id-334@n-150101120511@u-accaf64cedc448c6af390a1285b89558', '2015-01-01 12:05:11', '334', 'customer', null);
INSERT INTO `devices` VALUES ('1651', '', null, null, 'id-335@n-150101120530@u-35837765e0fa4cd88674f90cb5ac4dda', '2015-01-01 12:05:30', '335', 'customer', null);
INSERT INTO `devices` VALUES ('1653', 'iPhone4JK', null, null, 'id-336@n-150101121431@u-b88cb8ae264a4fff9f68ad8e2059d686', '2015-01-01 12:14:31', '336', 'customer', null);
INSERT INTO `devices` VALUES ('1655', 'iPhone4JK', null, null, 'id-337@n-150101122549@u-23416e0a2834467dae48d92da7927385', '2015-01-01 12:25:49', '337', 'customer', null);
INSERT INTO `devices` VALUES ('1656', '', null, null, 'id-338@n-150101122641@u-1c56c0c89b5b4e06ba4ae9cfc9315364', '2015-01-01 12:26:41', '338', 'customer', null);
INSERT INTO `devices` VALUES ('1657', '', null, null, 'id-339@n-150101125104@u-51ffc9a8d27543e7a554a982232a12d2', '2015-01-01 12:51:04', '339', 'customer', null);
INSERT INTO `devices` VALUES ('1658', '', null, null, 'id-340@n-150101134901@u-389312935f0348aebd1875040e8fe1f7', '2015-01-01 13:49:01', '340', 'customer', null);
INSERT INTO `devices` VALUES ('1659', '', null, null, 'id-341@n-150101135052@u-3d1f0264d7744deeac18e4a1cbb501e6', '2015-01-01 13:50:52', '341', 'customer', null);
INSERT INTO `devices` VALUES ('1660', 'At1sPo9LvrIoUDfsFX-GWYFKA_LQ3dFzsywfSr2mMzCh', null, null, 'id-342@n-150101135441@u-85c30657cc6b44f5b36b914c731ab17e', '2015-01-01 13:54:41', '342', 'customer', null);
INSERT INTO `devices` VALUES ('1661', '', null, null, 'id-343@n-150101140129@u-760002f3162c4df0b227adfb7d6cd613', '2015-01-01 14:01:29', '343', 'customer', null);
INSERT INTO `devices` VALUES ('1663', '', null, null, 'id-345@n-150101143128@u-70e52d0fa66e4694820283d6bd75d3fe', '2015-01-01 14:31:28', '345', 'customer', null);
INSERT INTO `devices` VALUES ('1664', 'AnpHnU9gIYgFsL8O6TkAmVaMtg8Q9eaG848zXp8fg5Lo', null, null, 'id-346@n-150101144102@u-610a4a03902d48c8b2a571f982ac4acc', '2015-01-01 14:41:02', '346', 'customer', null);
INSERT INTO `devices` VALUES ('1665', '', null, null, 'id-347@n-150101145217@u-50b21f4aec3b4a1280f03490a2c03893', '2015-01-01 14:52:17', '347', 'customer', null);
INSERT INTO `devices` VALUES ('1812', '', null, null, 'id-348@n-150116142100@u-45b9891bfb63494eb372e684d2c9baa3', '2015-01-16 14:21:00', '348', 'customer', null);
INSERT INTO `devices` VALUES ('1668', 'iPhone4JK', null, null, 'id-349@n-150101150155@u-73121dff79e440b09fff2fcf47fcf441', '2015-01-01 15:01:55', '349', 'customer', null);
INSERT INTO `devices` VALUES ('1670', 'iPhone4JK', null, null, 'id-350@n-150101150717@u-b665a6f1cfeb4692b2176b13affa72b8', '2015-01-01 15:07:17', '350', 'customer', null);
INSERT INTO `devices` VALUES ('1672', 'iPhone4JK', null, null, 'id-351@n-150101151048@u-c45b072193214666aa01f3ea49f7f9f8', '2015-01-01 15:10:48', '351', 'customer', null);
INSERT INTO `devices` VALUES ('1673', '', null, null, 'id-352@n-150101151054@u-82f3e53b289d45e8920beda1dcc1e8a7', '2015-01-01 15:10:54', '352', 'customer', null);
INSERT INTO `devices` VALUES ('1674', '', null, null, 'id-353@n-150101151334@u-05dc0b110d414742b9eb51ee919a61a0', '2015-01-01 15:13:34', '353', 'customer', null);
INSERT INTO `devices` VALUES ('1675', '', null, null, 'id-354@n-150101151531@u-1bfc5c22535d4bdeaa4e7cc41ba98e35', '2015-01-01 15:15:31', '354', 'customer', null);
INSERT INTO `devices` VALUES ('1677', 'iPhone4JK', null, null, 'id-355@n-150101151947@u-27745f99873447b9a6b22f790ce7bd77', '2015-01-01 15:19:47', '355', 'customer', null);
INSERT INTO `devices` VALUES ('1678', '', null, null, 'id-356@n-150101152533@u-672886b559654b03aca0f408c555eb36', '2015-01-01 15:25:33', '356', 'customer', null);
INSERT INTO `devices` VALUES ('1679', '', null, null, 'id-357@n-150101152931@u-8bd5848d09c14334b2410a7bd4dd85a5', '2015-01-01 15:29:31', '357', 'customer', null);
INSERT INTO `devices` VALUES ('1680', '', null, null, 'id-358@n-150101160032@u-0c9497983343465db66faf51076864c9', '2015-01-01 16:00:32', '358', 'customer', null);
INSERT INTO `devices` VALUES ('1682', 'iPhone4JK', null, null, 'id-359@n-150101160802@u-e9b325181c094cd48d933f4b0ec1c9c7', '2015-01-01 16:08:02', '359', 'customer', null);
INSERT INTO `devices` VALUES ('1683', '', null, null, 'id-360@n-150101161737@u-990bb1e591ce4d318c8e3cc60c8ab074', '2015-01-01 16:17:37', '360', 'customer', null);
INSERT INTO `devices` VALUES ('1684', '', null, null, 'id-361@n-150101164418@u-68e9375b0ddf4dd7baa11540f8eaaad5', '2015-01-01 16:44:18', '361', 'customer', null);
INSERT INTO `devices` VALUES ('1685', '', null, null, 'id-362@n-150101165045@u-53ccb2b21ac8492ab55eb6595589d4d5', '2015-01-01 16:50:45', '362', 'customer', null);
INSERT INTO `devices` VALUES ('1686', 'Am6wOeH-02JwkicmZlnoW69N4WPbkrrp7-_x-7lVmqaP', null, null, 'id-363@n-150101170044@u-b165fc18a28b4a66a05f88b76c52b76b', '2015-01-01 17:00:44', '363', 'customer', null);
INSERT INTO `devices` VALUES ('1687', '', null, null, 'id-364@n-150101171151@u-e7aa38a8c8c14cec842e1f3b22222dee', '2015-01-01 17:11:51', '364', 'customer', null);
INSERT INTO `devices` VALUES ('1688', '', null, null, 'id-365@n-150101171348@u-a889dde787944499b61b5a7303f5af35', '2015-01-01 17:13:48', '365', 'customer', null);
INSERT INTO `devices` VALUES ('1689', '', null, null, 'id-366@n-150101172555@u-36ede6bb33e9485ba34b65e4237976a5', '2015-01-01 17:25:55', '366', 'customer', null);
INSERT INTO `devices` VALUES ('1690', '', null, null, 'id-367@n-150101172751@u-424238d429224424aef0ee0a226af1bb', '2015-01-01 17:27:51', '367', 'customer', null);
INSERT INTO `devices` VALUES ('1691', '', null, null, 'id-368@n-150101173942@u-00d3020b18db4b76aed86fba969372e1', '2015-01-01 17:39:42', '368', 'customer', null);
INSERT INTO `devices` VALUES ('1692', '', null, null, 'id-369@n-150101181050@u-51a1e9f7c3e04a50b1321740ff68c53e', '2015-01-01 18:10:50', '369', 'customer', null);
INSERT INTO `devices` VALUES ('1694', 'iPhone4JK', null, null, 'id-370@n-150101191409@u-ca272f517dd447dd87269be9b234adfe', '2015-01-01 19:14:09', '370', 'customer', null);
INSERT INTO `devices` VALUES ('1786', 'ApKFBmAhLdvxv1TpJ9RHnipUjyHhODQX5Va8NMUsn-Oq', null, null, 'id-426@n-150110163222@u-acf4c13b223a479c86c79d3336d99939', '2015-01-10 16:32:22', '426', 'customer', null);
INSERT INTO `devices` VALUES ('1696', '', null, null, 'id-372@n-150102125526@u-6c8ae9ac072748759614a9c45ee9e9eb', '2015-01-02 12:55:26', '372', 'customer', null);
INSERT INTO `devices` VALUES ('1697', '', null, null, 'id-373@n-150102130148@u-5b717f14fcf648dcbc2cad0bfdb0e522', '2015-01-02 13:01:48', '373', 'customer', null);
INSERT INTO `devices` VALUES ('1698', '', null, null, 'id-374@n-150102130451@u-da6f18dd89874526be8da646e16c53c2', '2015-01-02 13:04:51', '374', 'customer', null);
INSERT INTO `devices` VALUES ('1700', '', null, null, 'id-376@n-150102131123@u-c362d754e81f419381fdbb5ae30f785d', '2015-01-02 13:11:23', '376', 'customer', null);
INSERT INTO `devices` VALUES ('1702', 'iPhone4JK', null, null, 'id-377@n-150102131213@u-705e2d71ecd546189ced0888bdcbd0ca', '2015-01-02 13:12:13', '377', 'customer', null);
INSERT INTO `devices` VALUES ('1704', 'iPhone4JK', null, null, 'id-378@n-150102131257@u-a5b662c071034ed29cd795f6a4b08fe0', '2015-01-02 13:12:57', '378', 'customer', null);
INSERT INTO `devices` VALUES ('1705', '', null, null, 'id-379@n-150102131803@u-c94ae0ec816b4ae3ae3a85fe4d92497d', '2015-01-02 13:18:03', '379', 'customer', null);
INSERT INTO `devices` VALUES ('1706', '', null, null, 'id-380@n-150102132026@u-87eaefb06ee34381864c512d90b54e64', '2015-01-02 13:20:26', '380', 'customer', null);
INSERT INTO `devices` VALUES ('1707', '', null, null, 'id-381@n-150102132125@u-ea29d04a70d94468b1b266026d2cbb43', '2015-01-02 13:21:25', '381', 'customer', null);
INSERT INTO `devices` VALUES ('1709', 'iPhone4JK', null, null, 'id-382@n-150102132857@u-cb6c96cde1e94f718ef3f2ce394f54ad', '2015-01-02 13:28:57', '382', 'customer', null);
INSERT INTO `devices` VALUES ('1711', 'iPhone4JK', null, null, 'id-383@n-150102133947@u-63c0b5e13cb844b3b8ef0f8a650d51aa', '2015-01-02 13:39:47', '383', 'customer', null);
INSERT INTO `devices` VALUES ('1712', '', null, null, 'id-384@n-150102135205@u-cf68f6b444554d95bba35a37f93863af', '2015-01-02 13:52:05', '384', 'customer', null);
INSERT INTO `devices` VALUES ('1713', 'Apl7Zp7IvKBJUjQjrg5G4zoInIypVDfzHeUIVA8XtDnh', null, null, 'id-385@n-150102135846@u-832c0535abd2428ab1d1d5c0d085eecd', '2015-01-02 13:58:46', '385', 'customer', null);
INSERT INTO `devices` VALUES ('1714', '', null, null, 'id-386@n-150102140045@u-0799362b0f0146b9969a04ba68c52526', '2015-01-02 14:00:45', '386', 'customer', null);
INSERT INTO `devices` VALUES ('1715', '', null, null, 'id-387@n-150102140301@u-aed1ecf6090d43d7a73131712e3402f2', '2015-01-02 14:03:01', '387', 'customer', null);
INSERT INTO `devices` VALUES ('1716', '', null, null, 'id-388@n-150102142500@u-4996dcf767fe45bdb0be4d38dc4b6dff', '2015-01-02 14:25:00', '388', 'customer', null);
INSERT INTO `devices` VALUES ('1717', '', null, null, 'id-389@n-150102142552@u-62595eda75dd4d12a1376f4b9f8006d2', '2015-01-02 14:25:52', '389', 'customer', null);
INSERT INTO `devices` VALUES ('1718', '', null, null, 'id-390@n-150102142614@u-470d712ddb1840a5a1a349d61f42ed13', '2015-01-02 14:26:14', '390', 'customer', null);
INSERT INTO `devices` VALUES ('1719', '', null, null, 'id-391@n-150102142811@u-f31c028dfe974ba0bb91f8308f91ee42', '2015-01-02 14:28:11', '391', 'customer', null);
INSERT INTO `devices` VALUES ('1720', '', null, null, 'id-392@n-150102143051@u-048134f2680d480bbc23c02d06305f1a', '2015-01-02 14:30:51', '392', 'customer', null);
INSERT INTO `devices` VALUES ('1721', '', null, null, 'id-393@n-150102152345@u-c70e9000ee73431b9cfedbd3c8f172e7', '2015-01-02 15:23:45', '393', 'customer', null);
INSERT INTO `devices` VALUES ('1722', '', null, null, 'id-394@n-150102152411@u-2489b75a124b496eab1adeb4288066ce', '2015-01-02 15:24:11', '394', 'customer', null);
INSERT INTO `devices` VALUES ('1723', '', null, null, 'id-395@n-150102152901@u-320b7f2da19e4090a86ee03cbd93195c', '2015-01-02 15:29:01', '395', 'customer', null);
INSERT INTO `devices` VALUES ('1724', '', null, null, 'id-396@n-150102153138@u-4a07623ef9db47009cd2739db844c032', '2015-01-02 15:31:38', '396', 'customer', null);
INSERT INTO `devices` VALUES ('1725', '', null, null, 'id-397@n-150102153411@u-a9c3354d76a644749872137a4fb2ad2a', '2015-01-02 15:34:11', '397', 'customer', null);
INSERT INTO `devices` VALUES ('1726', 'AlN8MuLh-ThDKPeuQfEma_CNY7bMLkc1L4kifIq8zHxb', null, null, 'id-398@n-150103052751@u-fbdb8855ec8347439bce242ed5522615', '2015-01-03 05:27:51', '398', 'customer', null);
INSERT INTO `devices` VALUES ('1727', 'AnT2Z_VyaxVZjMw62sTY-huassBTu9cDckMPi2FsRdH1', null, null, 'id-399@n-150103143758@u-63f53c6caaa040eab6b3e5fc25e2cd70', '2015-01-03 14:37:58', '399', 'customer', null);
INSERT INTO `devices` VALUES ('1728', 'AmsR3DMv3Sm0kJU2KGUoRXdr7R1IlWxB_rdTr4tL0aA8', null, null, 'id-400@n-150103150314@u-0102701d62ec40489a1140decd8b3f4f', '2015-01-03 15:03:14', '400', 'customer', null);
INSERT INTO `devices` VALUES ('1730', 'iPhone4JK', null, null, 'id-401@n-150103231953@u-cf82b12a526d457fb0dab506da1d7ce1', '2015-01-03 23:19:53', '401', 'customer', null);
INSERT INTO `devices` VALUES ('1731', 'AplfxaliQSLXhOSl27WHatnGZaIJVzmwp6-IjNs5o3iD', null, null, 'id-402@n-150104011811@u-ddbb462bb4204ea4958e7ae916c57e9a', '2015-01-04 01:18:11', '402', 'customer', null);
INSERT INTO `devices` VALUES ('1732', 'AkTUPinM4ab23HAMZISWuW30PG2zDP3POUfCc0PD1iCX', null, null, 'id-403@n-150104084629@u-8bc43e23ead64f15ac2c484557281243', '2015-01-04 08:46:29', '403', 'customer', null);
INSERT INTO `devices` VALUES ('1733', '', null, null, 'id-404@n-150104200130@u-9418acad72fc4d329861a2ea7c9f95a8', '2015-01-04 20:01:30', '404', 'customer', null);
INSERT INTO `devices` VALUES ('1735', '', null, null, 'id-406@n-150104221732@u-2b6e7a0332db4468ae7e5b4ced119d3d', '2015-01-04 22:17:32', '406', 'customer', null);
INSERT INTO `devices` VALUES ('1736', '', null, null, 'id-405@n-150104221815@u-44030343a5b1440aa296c80ba86514f8', '2015-01-04 22:18:15', '405', 'customer', null);
INSERT INTO `devices` VALUES ('1738', 'iPhone4JK', null, null, 'id-407@n-150104224158@u-70d4ccdd31404d7185827b93cab50cdd', '2015-01-04 22:41:58', '407', 'customer', null);
INSERT INTO `devices` VALUES ('1740', 'iPhone4JK', null, null, 'id-408@n-150105105124@u-3194eb2d66974c5fbe9bfb1fa0bbebb6', '2015-01-05 10:51:24', '408', 'customer', null);
INSERT INTO `devices` VALUES ('1741', '', null, null, 'id-409@n-150105110522@u-2e2e74a3f98a4110af3227ee7cfcd214', '2015-01-05 11:05:22', '409', 'customer', null);
INSERT INTO `devices` VALUES ('1742', '', null, null, 'id-410@n-150105161114@u-2cfca613180c46d594190a66d873cf06', '2015-01-05 16:11:14', '410', 'customer', null);
INSERT INTO `devices` VALUES ('1746', 'iPhone4JK', null, null, 'id-413@n-150107101449@u-925b9039e17e4da2b50e0442a84dade5', '2015-01-07 10:14:49', '413', 'customer', null);
INSERT INTO `devices` VALUES ('1744', '', null, null, 'id-412@n-150105214226@u-00d83816706e441da5883c6e171b96af', '2015-01-05 21:42:26', '412', 'customer', null);
INSERT INTO `devices` VALUES ('1747', 'AuOGCMTfLnJK4CBx6AQ43ZJaQo3fvOpYxIN1w0J-vaP9', null, null, 'id-414@n-150107121537@u-4c69c621eb794d4dbe17b771020a3abb', '2015-01-07 12:15:37', '414', 'customer', null);
INSERT INTO `devices` VALUES ('1753', 'iPhone4JK', null, null, 'id-417@n-150109122525@u-1d38b0e0225a4a25840205197e20f85a', '2015-01-09 12:25:25', '417', 'customer', null);
INSERT INTO `devices` VALUES ('1754', '', null, null, 'id-418@n-150109131000@u-5e3b7d13eb9f46079f1116f8b686c4d8', '2015-01-09 13:10:00', '418', 'customer', null);
INSERT INTO `devices` VALUES ('1755', '', null, null, 'id-419@n-150109131021@u-5170c8924d4c4af48ef1339704b6264f', '2015-01-09 13:10:21', '419', 'customer', null);
INSERT INTO `devices` VALUES ('1775', 'iPhone4JK', null, null, 'id-416@n-150109180744@u-e918ed805eb043da9d92580f8d24ada6', '2015-01-09 18:07:44', '416', 'customer', null);
INSERT INTO `devices` VALUES ('1777', 'iPhone4JK', null, null, 'id-420@n-150110120527@u-b5525919fbf94758bdc73b59e1272daf', '2015-01-10 12:05:27', '420', 'customer', null);
INSERT INTO `devices` VALUES ('1778', '', null, null, 'id-421@n-150110123820@u-4fd69c59ae1d45b88d059cc9fd9b701a', '2015-01-10 12:38:20', '421', 'customer', null);
INSERT INTO `devices` VALUES ('1779', '', null, null, 'id-422@n-150110124120@u-23fc4f6958854a65b2b004456c9aa297', '2015-01-10 12:41:20', '422', 'customer', null);
INSERT INTO `devices` VALUES ('1781', 'iPhone4JK', null, null, 'id-423@n-150110134521@u-2fb3689aaeff475bb32b7fdc9677cb36', '2015-01-10 13:45:21', '423', 'customer', null);
INSERT INTO `devices` VALUES ('1783', 'iPhone4JK', null, null, 'id-424@n-150110140707@u-302b00bc93a34226969731622b3b9961', '2015-01-10 14:07:07', '424', 'customer', null);
INSERT INTO `devices` VALUES ('1832', 'iPhone4JK', null, null, 'id-425@n-150117080541@u-8ad1905da35144fea7bcd90df367e0c4', '2015-01-17 08:05:41', '425', 'customer', null);
INSERT INTO `devices` VALUES ('1787', '', null, null, 'id-427@n-150111121643@u-1be3b653068a46a285e98ceaee616608', '2015-01-11 12:16:43', '427', 'customer', null);
INSERT INTO `devices` VALUES ('1788', '', null, null, 'id-428@n-150111193527@u-58ebff9984024b45871dfb4ace58976b', '2015-01-11 19:35:27', '428', 'customer', null);
INSERT INTO `devices` VALUES ('1789', '', null, null, 'id-429@n-150111212347@u-d9cbc9c2d226423f8af451aef56f25ee', '2015-01-11 21:23:47', '429', 'customer', null);
INSERT INTO `devices` VALUES ('1878', '', null, null, 'id-69@n-150123130131@u-7995bd641b2042ad8972a63094c1ca5c', '2015-01-23 12:58:31', '69', 'customer', '0');
INSERT INTO `devices` VALUES ('1803', '', null, null, 'id-430@n-150112154631@u-0ee417f635654a55ac8630d125be0ece', '2015-01-12 15:46:31', '430', 'customer', null);
INSERT INTO `devices` VALUES ('1807', '', null, null, 'id-432@n-150112201013@u-94232b57a5844778a3cbe9053a70441b', '2015-01-12 20:10:13', '432', 'customer', null);
INSERT INTO `devices` VALUES ('1808', '', null, null, 'id-433@n-150114010900@u-44e4805e12f341888dc623311a94157e', '2015-01-14 01:09:00', '433', 'customer', null);
INSERT INTO `devices` VALUES ('1810', 'iPhone4JK', null, null, 'id-434@n-150115132838@u-19e72b52f35948ba82a5c4d701ccbe61', '2015-01-15 13:28:38', '434', 'customer', null);
INSERT INTO `devices` VALUES ('1834', 'iPhone4JK', null, null, 'id-435@n-150117131214@u-625aa325ec964666a1039f18878ed9c0', '2015-01-17 13:12:14', '435', 'customer', null);
INSERT INTO `devices` VALUES ('1835', '', null, null, 'id-436@n-150117131828@u-d1a63497c60d40d496322930d4252341', '2015-01-17 13:18:28', '436', 'customer', null);
INSERT INTO `devices` VALUES ('1836', 'AhHLOyMflXuNeVuIZ9Hbv7ljcAAm9sqO9wyXDLBzIeHC', null, null, 'id-437@n-150117132812@u-d126536da79d4bb7a931a4d3f6941d43', '2015-01-17 13:28:12', '437', 'customer', null);
INSERT INTO `devices` VALUES ('1837', '', null, null, 'id-438@n-150117164535@u-629545c6e8b044ceae3770ef30aa7364', '2015-01-17 16:45:35', '438', 'customer', null);
INSERT INTO `devices` VALUES ('1839', 'iPhone4JK', null, null, 'id-439@n-150117164559@u-f06d71abc3ee43b2b7f12f4920d984d0', '2015-01-17 16:45:59', '439', 'customer', null);
INSERT INTO `devices` VALUES ('1841', 'iPhone4JK', null, null, 'id-440@n-150117164611@u-2e62d72546294024afd90bc9eaaafdf3', '2015-01-17 16:46:11', '440', 'customer', null);
INSERT INTO `devices` VALUES ('1842', '', null, null, 'id-441@n-150117164821@u-992ef66b9fe949b0ab50025de10cf5a8', '2015-01-17 16:48:21', '441', 'customer', null);
INSERT INTO `devices` VALUES ('1843', '', null, null, 'id-442@n-150117165416@u-b09f4f866a144c26a8853f5408f823c4', '2015-01-17 16:54:16', '442', 'customer', null);
INSERT INTO `devices` VALUES ('1845', 'iPhone4JK', null, null, 'id-443@n-150117202830@u-cec31572cada46b8b17383e1cc470b6c', '2015-01-17 20:28:30', '443', 'customer', null);
INSERT INTO `devices` VALUES ('1847', 'iPhone4JK', null, null, 'id-444@n-150117211434@u-af2d9a7254b1481ea1f4d09c452159e1', '2015-01-17 21:14:34', '444', 'customer', null);
INSERT INTO `devices` VALUES ('1849', 'iPhone4JK', null, null, 'id-445@n-150117233717@u-0997c9d8bb7f43e3a3d5dc8c7bbe2f5d', '2015-01-17 23:37:17', '445', 'customer', null);
INSERT INTO `devices` VALUES ('1851', 'iPhone4JK', null, null, 'id-446@n-150118115225@u-4c62ca058e3d493c8308fa2db5e05cef', '2015-01-18 11:52:25', '446', 'customer', null);
INSERT INTO `devices` VALUES ('1852', 'Ao2KIZ7jLjCAdFtreXXGAPaI6ON2BQFgTaUTDUUV1aL7', null, null, 'id-447@n-150118115408@u-4763836f0d09483f8ab9bcff6c316322', '2015-01-18 11:54:08', '447', 'customer', null);
INSERT INTO `devices` VALUES ('1860', 'iPhone4JK', null, null, 'id-452@n-150118152701@u-dc508720c55b4e349f13052a3055d32d', '2015-01-18 15:27:01', '452', 'customer', null);
INSERT INTO `devices` VALUES ('1856', 'iPhone4JK', null, null, 'id-449@n-150118123557@u-28dbd9238b7f4f268b4ef0834a5d155d', '2015-01-18 12:35:57', '449', 'customer', null);
INSERT INTO `devices` VALUES ('1857', 'AqIC5NosKCArqBsewufNh5mpIA5-qF-PAp2iCZCNdctk', null, null, 'id-450@n-150118130750@u-78675d77ce0c47b8a548f0276b18f5bd', '2015-01-18 13:07:50', '450', 'customer', null);
INSERT INTO `devices` VALUES ('1858', '', null, null, 'id-451@n-150118130853@u-4c8a6c7a92f44225aa78b947adac08b9', '2015-01-18 13:08:53', '451', 'customer', null);
INSERT INTO `devices` VALUES ('1862', '', null, null, 'id-453@n-150118160223@u-85a78146716442a09e7df3d3928ff491', '2015-01-18 16:02:23', '453', 'customer', null);
INSERT INTO `devices` VALUES ('1863', '', null, null, 'id-454@n-150119114143@u-07d2ed2030724d3abbf297bc1c82f833', '2015-01-19 11:41:43', '454', 'customer', null);
INSERT INTO `devices` VALUES ('1865', 'AlZ1ZT-diwd-JNZalcDtFy20QNPqQbmc8eriuPhAv4gc', null, null, 'id-455@n-150121192232@u-9f9f776e365b439eaf0ec6edeffbf7dd', '2015-01-21 19:22:32', '455', 'customer', null);
INSERT INTO `devices` VALUES ('1866', '', null, null, 'id-456@n-150122140111@u-f2e9379d72eb46bc8914d9a80452a631', '2015-01-22 14:01:11', '456', 'customer', null);

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dict_type` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of dict
-- ----------------------------

-- ----------------------------
-- Table structure for `dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of dict_type
-- ----------------------------
INSERT INTO `dict_type` VALUES ('1', '支付类型', null);
INSERT INTO `dict_type` VALUES ('2', '支付状态', null);
INSERT INTO `dict_type` VALUES ('3', '订单状态', null);
INSERT INTO `dict_type` VALUES ('4', '系统类型', null);

-- ----------------------------
-- Table structure for `dreceviebill`
-- ----------------------------
DROP TABLE IF EXISTS `dreceviebill`;
CREATE TABLE `dreceviebill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `deliveryid` int(11) NOT NULL COMMENT '配送员id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接单时间',
  `ordertype` int(2) NOT NULL DEFAULT '0',
  `status` int(45) NOT NULL DEFAULT '0' COMMENT '处理类型(0=取消接单 2=完成订单)',
  `orderid` varchar(45) NOT NULL COMMENT '订单id',
  `reason` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='配送员接单表';

-- ----------------------------
-- Records of dreceviebill
-- ----------------------------
INSERT INTO `dreceviebill` VALUES ('8', '4', '2014-10-26 13:12:36', '0', '2', '1414300244769007', '');
INSERT INTO `dreceviebill` VALUES ('9', '4', '2014-10-26 15:37:08', '0', '2', '1414306714846009', '');
INSERT INTO `dreceviebill` VALUES ('10', '1', '2014-10-27 17:32:15', '0', '2', '1414402253648001', '');
INSERT INTO `dreceviebill` VALUES ('11', '1', '2014-10-27 17:49:02', '0', '2', '1414402894773002', '');
INSERT INTO `dreceviebill` VALUES ('12', '1', '2014-10-27 17:57:13', '0', '2', '1414403621184003', '');
INSERT INTO `dreceviebill` VALUES ('13', '3', '2014-10-28 08:45:47', '0', '3', '1414419437366000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('14', '3', '2014-10-28 08:45:49', '0', '3', '1414426648282000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('15', '5', '2014-10-28 12:07:43', '0', '2', '1414469199501001', '');
INSERT INTO `dreceviebill` VALUES ('16', '3', '2014-10-28 12:25:01', '0', '3', '1414469965478002', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('17', '1', '2014-11-06 11:49:48', '0', '3', '1415245643812000', '客户出门');
INSERT INTO `dreceviebill` VALUES ('18', '6', '2014-11-07 17:14:04', '0', '3', '1415335964389000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('19', '31', '2014-11-08 15:04:38', '0', '2', '1415428577283000', '');
INSERT INTO `dreceviebill` VALUES ('20', '8', '2014-11-17 17:01:04', '0', '3', '1416214471984000', '客户出门');
INSERT INTO `dreceviebill` VALUES ('21', '9', '2014-11-28 02:17:49', '0', '2', '1417111576814000', '');
INSERT INTO `dreceviebill` VALUES ('22', '9', '2014-11-28 02:18:02', '0', '3', '1417112195112001', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('23', '9', '2014-11-28 02:18:32', '0', '3', '1416890259630000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('24', '8', '2014-11-28 09:12:44', '0', '0', '1417137110484002', '缺货...');
INSERT INTO `dreceviebill` VALUES ('25', '8', '2014-11-28 09:14:37', '0', '3', '1417136495710000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('26', '8', '2014-11-28 11:01:10', '0', '3', '1417136260625000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('27', '10', '2014-12-01 18:22:59', '0', '3', '1417428593020000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('28', '10', '2014-12-01 18:15:57', '0', '3', '1417428674770001', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('29', '10', '2014-12-01 18:15:55', '0', '3', '1417428675261002', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('30', '8', '2014-12-01 18:22:59', '0', '3', '1417428593020000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('31', '8', '2014-12-01 18:36:23', '0', '3', '1417430136239009', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('32', '8', '2014-12-01 18:36:24', '0', '3', '1417429980646008', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('33', '8', '2014-12-01 22:43:29', '0', '3', '1417444887868020', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('34', '8', '2014-12-01 22:43:31', '0', '3', '1417444879244019', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('35', '8', '2014-12-01 22:43:28', '0', '3', '1417444868100018', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('36', '8', '2014-12-03 22:58:52', '0', '0', '1417618717474029', '缺货...');
INSERT INTO `dreceviebill` VALUES ('37', '8', '2014-12-04 17:42:52', '0', '0', '1417685818101002', '缺货...');
INSERT INTO `dreceviebill` VALUES ('38', '10', '2014-12-06 14:24:48', '0', '2', '1417846914653001', '');
INSERT INTO `dreceviebill` VALUES ('39', '10', '2014-12-06 14:28:14', '0', '3', '1417847165829002', '客户出门');
INSERT INTO `dreceviebill` VALUES ('40', '10', '2014-12-06 18:55:51', '0', '3', '1417861171368006', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('41', '8', '2014-12-08 17:02:49', '0', '0', '1418029218970003', '缺货...');
INSERT INTO `dreceviebill` VALUES ('42', '8', '2014-12-10 15:00:01', '0', '3', '1418119570637004', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('43', '8', '2014-12-13 11:15:32', '0', '3', '1418231769737000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('44', '8', '2014-12-13 11:15:36', '0', '3', '1418231770390001', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('45', '8', '2014-12-13 11:15:34', '0', '3', '1418231781766002', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('46', '8', '2014-12-13 21:04:45', '0', '2', '1418472199908000', '');
INSERT INTO `dreceviebill` VALUES ('47', '8', '2014-12-20 10:21:10', '0', '3', '1419038119847000', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('48', '8', '2014-12-20 10:21:06', '0', '3', '1419038131792001', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('49', '8', '2014-12-20 10:21:13', '0', '3', '1419038135730002', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('50', '8', '2014-12-20 10:21:12', '0', '3', '1419038150626004', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('51', '8', '2014-12-20 10:21:08', '0', '3', '1419038152545005', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('52', '8', '2014-12-22 17:58:12', '0', '2', '1419238519335000', '');
INSERT INTO `dreceviebill` VALUES ('53', '8', '2014-12-24 18:38:04', '0', '3', '1419407228555002', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('54', '8', '2014-12-25 10:21:57', '0', '3', '1419473360046000', '客户出门');
INSERT INTO `dreceviebill` VALUES ('55', '8', '2014-12-25 10:45:19', '0', '3', '1419474870119001', '客户拒收');
INSERT INTO `dreceviebill` VALUES ('56', '10', '2014-12-25 11:55:26', '0', '3', '1419478665116002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('57', '10', '2014-12-29 20:10:35', '0', '3', '1419760599177001', '其他问题');
INSERT INTO `dreceviebill` VALUES ('58', '10', '2014-12-29 19:40:50', '0', '3', '1419765452933002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('59', '10', '2014-12-28 20:36:03', '0', '0', '1419769784082003', '缺货...');
INSERT INTO `dreceviebill` VALUES ('60', '10', '2014-12-29 19:40:31', '0', '3', '1419821879376000', '其他问题');
INSERT INTO `dreceviebill` VALUES ('61', '10', '2014-12-29 16:37:45', '0', '2', '1419842139863001', '');
INSERT INTO `dreceviebill` VALUES ('62', '10', '2014-12-29 18:41:38', '0', '2', '1419847772679002', '');
INSERT INTO `dreceviebill` VALUES ('63', '10', '2014-12-29 18:44:13', '0', '0', '1419849301024005', '缺货...');
INSERT INTO `dreceviebill` VALUES ('64', '8', '2014-12-30 12:37:29', '0', '3', '1419908045278000', '虚假联系方式');
INSERT INTO `dreceviebill` VALUES ('65', '10', '2014-12-30 11:58:33', '0', '2', '1419911885194001', '');
INSERT INTO `dreceviebill` VALUES ('66', '8', '2014-12-30 12:37:08', '0', '2', '1419912309772002', '');
INSERT INTO `dreceviebill` VALUES ('67', '10', '2014-12-30 12:57:11', '0', '2', '1419914292750003', '缺货...');
INSERT INTO `dreceviebill` VALUES ('68', '8', '2014-12-30 12:57:11', '0', '2', '1419914292750003', '');
INSERT INTO `dreceviebill` VALUES ('69', '10', '2014-12-30 17:14:19', '0', '2', '1419930820355007', '');
INSERT INTO `dreceviebill` VALUES ('70', '10', '2014-12-30 17:25:58', '0', '2', '1419931532053008', '');
INSERT INTO `dreceviebill` VALUES ('71', '10', '2014-12-30 17:28:52', '0', '2', '1419931701519009', '');
INSERT INTO `dreceviebill` VALUES ('72', '10', '2014-12-30 18:00:06', '0', '2', '1419933586251010', '');
INSERT INTO `dreceviebill` VALUES ('73', '12', '2014-12-31 13:51:06', '0', '2', '1420004426686000', '');
INSERT INTO `dreceviebill` VALUES ('74', '10', '2014-12-31 14:42:48', '0', '2', '1420005847642001', '');
INSERT INTO `dreceviebill` VALUES ('75', '10', '2014-12-31 18:08:21', '0', '3', '1420019952910002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('76', '10', '2015-01-01 11:29:52', '0', '2', '1420022645388003', '');
INSERT INTO `dreceviebill` VALUES ('77', '10', '2014-12-31 19:53:45', '0', '3', '1420026694882004', '其他问题');
INSERT INTO `dreceviebill` VALUES ('78', '10', '2015-01-01 10:54:45', '0', '2', '1420079122183000', '');
INSERT INTO `dreceviebill` VALUES ('79', '10', '2015-01-01 11:21:22', '0', '2', '1420081212848001', '');
INSERT INTO `dreceviebill` VALUES ('80', '10', '2015-01-01 12:34:21', '0', '2', '1420086815662002', '');
INSERT INTO `dreceviebill` VALUES ('81', '10', '2015-01-02 13:17:17', '0', '2', '1420095213756003', '');
INSERT INTO `dreceviebill` VALUES ('82', '10', '2015-01-01 17:09:35', '0', '3', '1420103101897005', '其他问题');
INSERT INTO `dreceviebill` VALUES ('83', '10', '2015-01-02 13:17:44', '0', '2', '1420110926404006', '');
INSERT INTO `dreceviebill` VALUES ('84', '10', '2015-01-02 10:06:06', '0', '3', '1420163659036000', '虚假联系方式');
INSERT INTO `dreceviebill` VALUES ('85', '10', '2015-01-02 13:17:51', '0', '2', '1420166342725001', '');
INSERT INTO `dreceviebill` VALUES ('86', '12', '2015-01-02 13:41:34', '0', '3', '1420176393756002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('87', '12', '2015-01-02 15:44:28', '0', '2', '1420176824453005', '');
INSERT INTO `dreceviebill` VALUES ('88', '12', '2015-01-02 13:42:17', '0', '3', '1420176821769004', '其他问题');
INSERT INTO `dreceviebill` VALUES ('89', '10', '2015-01-02 13:41:34', '0', '3', '1420176393756002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('90', '10', '2015-01-02 17:24:59', '0', '3', '1420190253924006', '其他问题');
INSERT INTO `dreceviebill` VALUES ('91', '10', '2015-01-02 20:05:09', '0', '3', '1420198835317007', '其他问题');
INSERT INTO `dreceviebill` VALUES ('92', '10', '2015-01-03 15:42:37', '0', '2', '1420252187516000', '');
INSERT INTO `dreceviebill` VALUES ('93', '10', '2015-01-04 10:11:50', '0', '2', '1420270711792002', '');
INSERT INTO `dreceviebill` VALUES ('94', '10', '2015-01-04 20:10:29', '0', '3', '1420373042342001', '虚假联系方式');
INSERT INTO `dreceviebill` VALUES ('95', '10', '2015-01-04 21:38:49', '0', '2', '1420378490366009', '');
INSERT INTO `dreceviebill` VALUES ('96', '10', '2015-01-04 22:30:02', '0', '3', '1420381130292010', '其他问题');
INSERT INTO `dreceviebill` VALUES ('97', '12', '2015-01-05 11:02:22', '0', '3', '1420426515820001', '其他问题');
INSERT INTO `dreceviebill` VALUES ('98', '12', '2015-01-05 16:30:23', '0', '3', '1420446291148002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('99', '10', '2015-01-05 21:59:59', '0', '3', '1420465410711003', '其他问题');
INSERT INTO `dreceviebill` VALUES ('100', '10', '2015-01-08 09:55:24', '0', '2', '1420652711699000', '');
INSERT INTO `dreceviebill` VALUES ('101', '10', '2015-01-08 14:08:46', '0', '2', '1420694777637001', '');
INSERT INTO `dreceviebill` VALUES ('102', '10', '2015-01-10 17:31:24', '0', '2', '1420879851912000', '');
INSERT INTO `dreceviebill` VALUES ('103', '10', '2015-01-11 12:26:36', '0', '2', '1420946129986000', '');
INSERT INTO `dreceviebill` VALUES ('104', '10', '2015-01-11 17:56:49', '0', '2', '1420967442274001', '');
INSERT INTO `dreceviebill` VALUES ('105', '10', '2015-01-11 19:09:03', '0', '2', '1420972402452002', '');
INSERT INTO `dreceviebill` VALUES ('106', '10', '2015-01-13 21:12:13', '0', '2', '1421152303514000', '');
INSERT INTO `dreceviebill` VALUES ('107', '10', '2015-01-15 18:50:29', '0', '2', '1421317538907000', '');
INSERT INTO `dreceviebill` VALUES ('108', '10', '2015-01-16 15:20:26', '0', '2', '1421389905613000', '');
INSERT INTO `dreceviebill` VALUES ('109', '8', '2015-01-18 12:45:02', '0', '2', '1421554286915001', '');
INSERT INTO `dreceviebill` VALUES ('110', '8', '2015-01-18 12:44:52', '0', '3', '1421554618981002', '其他问题');
INSERT INTO `dreceviebill` VALUES ('111', '10', '2015-01-18 18:44:36', '0', '2', '1421574342733004', '');
INSERT INTO `dreceviebill` VALUES ('112', '10', '2015-01-23 12:26:04', '0', '2', '1421981283604000', '');

-- ----------------------------
-- Table structure for `dreceviebill_history`
-- ----------------------------
DROP TABLE IF EXISTS `dreceviebill_history`;
CREATE TABLE `dreceviebill_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `deliveryid` int(11) NOT NULL COMMENT '配送员id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '接单时间',
  `status` int(45) NOT NULL DEFAULT '0' COMMENT '处理类型(0=取消接单 2=完成订单)',
  `orderid` varchar(45) NOT NULL COMMENT '订单id',
  `reason` varchar(100) DEFAULT '',
  `ordertype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配送员接单表';

-- ----------------------------
-- Records of dreceviebill_history
-- ----------------------------

-- ----------------------------
-- Table structure for `jk_cache`
-- ----------------------------
DROP TABLE IF EXISTS `jk_cache`;
CREATE TABLE `jk_cache` (
  `_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `cache_key` varchar(64) DEFAULT NULL COMMENT '缓存key',
  `cache_value` varchar(500) DEFAULT NULL COMMENT '缓存内容',
  `cache_type` int(11) DEFAULT NULL COMMENT '缓存类型',
  `cache_expired` int(11) DEFAULT NULL COMMENT '缓存有效时间',
  `opt_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1753 DEFAULT CHARSET=utf8 COMMENT='缓存';

-- ----------------------------
-- Records of jk_cache
-- ----------------------------
INSERT INTO `jk_cache` VALUES ('1598', '14033350086411755641889274315762', '{\"device_id\":\"90E8102F-B7A3-4432-A5C0-C1EB7F013478\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403335008', '2014-06-21 15:16:48');
INSERT INTO `jk_cache` VALUES ('1599', '14033360226376670196150083052210', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403336022', '2014-06-21 15:33:42');
INSERT INTO `jk_cache` VALUES ('1600', '14033389252121219328622465596048', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403338925', '2014-06-21 16:22:05');
INSERT INTO `jk_cache` VALUES ('1601', '14033407304491221881412833235562', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403340730', '2014-06-21 16:52:10');
INSERT INTO `jk_cache` VALUES ('1602', '14033427819608639564150442989231', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403342781', '2014-06-21 17:26:21');
INSERT INTO `jk_cache` VALUES ('1603', '14033447402074309151188629622790', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403344740', '2014-06-21 17:59:00');
INSERT INTO `jk_cache` VALUES ('1604', '14033458729931646971237755571917', '{\"device_id\":\"7c91b587-de18-48df-b12f-e135c49e9160\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403345872', '2014-06-21 18:17:52');
INSERT INTO `jk_cache` VALUES ('1605', '14033458933299361112445662732291', '{\"device_id\":\"7c91b587-de18-48df-b12f-e135c49e9160\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403345893', '2014-06-21 18:18:13');
INSERT INTO `jk_cache` VALUES ('1606', '14033460559242226586216930418396', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403346055', '2014-06-21 18:20:55');
INSERT INTO `jk_cache` VALUES ('1607', '14033460784719863734584730569380', '{\"device_id\":\"7c91b587-de18-48df-b12f-e135c49e9160\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403346078', '2014-06-21 18:21:18');
INSERT INTO `jk_cache` VALUES ('1608', '14033460905134629130158905519961', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403346090', '2014-06-21 18:21:30');
INSERT INTO `jk_cache` VALUES ('1609', '14033475235622965431560890141201', '{\"device_id\":\"7c91b587-de18-48df-b12f-e135c49e9160\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403347523', '2014-06-21 18:45:36');
INSERT INTO `jk_cache` VALUES ('1610', '14033476988199982141803227355325', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403347698', '2014-06-21 18:48:18');
INSERT INTO `jk_cache` VALUES ('1611', '14033521232280815824568968900850', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403352123', '2014-06-21 20:02:03');
INSERT INTO `jk_cache` VALUES ('1612', '14033548695647358219907907217141', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403354869', '2014-06-21 20:47:49');
INSERT INTO `jk_cache` VALUES ('1592', '14033311201112417664808714798701', '{\"device_id\":\"02a6ea1a-ec1e-4afe-8239-d23fd6fed0e0\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403331120', '2014-06-21 14:12:00');
INSERT INTO `jk_cache` VALUES ('1593', '14033311654603368526577112030032', '{\"device_id\":\"3eafe8a0-f85b-43bb-a22b-50163dfd3004\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403331165', '2014-06-21 14:12:45');
INSERT INTO `jk_cache` VALUES ('1594', '14033314990593604450540374751900', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403331499', '2014-06-21 14:18:19');
INSERT INTO `jk_cache` VALUES ('1595', '14033347577574665605893056398557', '{\"device_id\":\"90E8102F-B7A3-4432-A5C0-C1EB7F013456\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403334757', '2014-06-21 15:12:37');
INSERT INTO `jk_cache` VALUES ('1596', '14033349673773806119352050980294', '{\"device_id\":\"44ac352f-383c-4c54-837d-4ff195639534\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403334967', '2014-06-21 15:16:07');
INSERT INTO `jk_cache` VALUES ('1597', '14033350067423427175164340084676', '{\"device_id\":\"44ac352f-683c-4c54-837d-4ff195639534\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403335006', '2014-06-21 15:16:46');
INSERT INTO `jk_cache` VALUES ('1625', '14033797996359770221526824828988', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403379799', '2014-06-22 03:43:19');
INSERT INTO `jk_cache` VALUES ('1626', '14033817941062786250832716562875', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403381794', '2014-06-22 04:16:34');
INSERT INTO `jk_cache` VALUES ('1627', '14033838616727410676165121944008', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403383861', '2014-06-22 04:51:01');
INSERT INTO `jk_cache` VALUES ('1628', '14033858149953857170891090185513', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403385814', '2014-06-22 05:23:34');
INSERT INTO `jk_cache` VALUES ('1629', '14033880348720473160790820130479', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403388034', '2014-06-22 06:00:34');
INSERT INTO `jk_cache` VALUES ('1630', '14033947114481392806259084274215', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403394711', '2014-06-22 07:51:51');
INSERT INTO `jk_cache` VALUES ('1631', '14034011466268226189920074684884', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403401146', '2014-06-22 09:39:06');
INSERT INTO `jk_cache` VALUES ('1632', '14034011466267709074330857335117', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403401146', '2014-06-22 09:39:06');
INSERT INTO `jk_cache` VALUES ('1633', '14034033595123329582750060332880', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403403359', '2014-06-22 10:15:59');
INSERT INTO `jk_cache` VALUES ('1634', '14034059425862156219518552209492', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403405942', '2014-06-22 10:59:02');
INSERT INTO `jk_cache` VALUES ('1635', '14034078624042338727937634040363', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403407862', '2014-06-22 11:31:02');
INSERT INTO `jk_cache` VALUES ('1636', '14034099355482402788753718638351', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403409935', '2014-06-22 12:05:35');
INSERT INTO `jk_cache` VALUES ('1637', '14034117513205294674219257136632', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403411751', '2014-06-22 12:35:51');
INSERT INTO `jk_cache` VALUES ('1638', '14034140959264979899959424520534', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403414095', '2014-06-22 13:14:55');
INSERT INTO `jk_cache` VALUES ('1639', '14034187374389097514926256404885', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403418737', '2014-06-22 14:32:17');
INSERT INTO `jk_cache` VALUES ('1640', '14034223757196119815452311074456', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403422375', '2014-06-22 15:32:55');
INSERT INTO `jk_cache` VALUES ('1641', '14034285520773470849961728725483', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403428552', '2014-06-22 17:15:52');
INSERT INTO `jk_cache` VALUES ('1642', '14034307911880259665758869396411', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403430791', '2014-06-22 17:53:11');
INSERT INTO `jk_cache` VALUES ('1643', '14034334817511580898379491470133', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403433481', '2014-06-22 18:38:01');
INSERT INTO `jk_cache` VALUES ('1644', '14034353306826315351325057207460', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403435330', '2014-06-22 19:08:50');
INSERT INTO `jk_cache` VALUES ('1645', '14034372367453068210948569900108', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403437236', '2014-06-22 19:40:36');
INSERT INTO `jk_cache` VALUES ('1646', '14034391349274495138756272883533', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403439134', '2014-06-22 20:12:14');
INSERT INTO `jk_cache` VALUES ('1647', '14034409819287801195699559897009', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403440981', '2014-06-22 20:43:01');
INSERT INTO `jk_cache` VALUES ('1648', '14034427873672809873667088238036', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403442787', '2014-06-22 21:13:07');
INSERT INTO `jk_cache` VALUES ('1649', '14034446141801901556895678706093', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403444614', '2014-06-22 21:43:34');
INSERT INTO `jk_cache` VALUES ('1650', '14034466294510429082132385459047', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403446629', '2014-06-22 22:17:09');
INSERT INTO `jk_cache` VALUES ('1651', '14034485189222530000250222771140', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403448518', '2014-06-22 22:48:38');
INSERT INTO `jk_cache` VALUES ('1652', '14034503802245357844039402114205', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403450380', '2014-06-22 23:19:40');
INSERT INTO `jk_cache` VALUES ('1653', '14034521898362486775913879609988', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403452189', '2014-06-22 23:49:49');
INSERT INTO `jk_cache` VALUES ('1654', '14034542669864563672204645604035', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403454266', '2014-06-23 00:24:26');
INSERT INTO `jk_cache` VALUES ('1655', '14034560794446007209957596321264', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403456079', '2014-06-23 00:54:39');
INSERT INTO `jk_cache` VALUES ('1656', '14034578907453794607605790151888', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403457890', '2014-06-23 01:24:50');
INSERT INTO `jk_cache` VALUES ('1657', '14034597412130025596885524779377', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403459741', '2014-06-23 01:55:41');
INSERT INTO `jk_cache` VALUES ('1658', '14034616227191782541537439290354', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403461622', '2014-06-23 02:27:02');
INSERT INTO `jk_cache` VALUES ('1659', '14034634928374565603715347192832', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403463492', '2014-06-23 02:58:12');
INSERT INTO `jk_cache` VALUES ('1660', '14034653325568738512765579446720', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403465332', '2014-06-23 03:28:52');
INSERT INTO `jk_cache` VALUES ('1661', '14034671389973114508816268021691', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403467138', '2014-06-23 03:58:58');
INSERT INTO `jk_cache` VALUES ('1662', '14034689718803223391212679546373', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403468971', '2014-06-23 04:29:31');
INSERT INTO `jk_cache` VALUES ('1663', '14034708009246726329637969125910', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403470800', '2014-06-23 05:00:00');
INSERT INTO `jk_cache` VALUES ('1664', '14034726147414889325901774584358', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403472614', '2014-06-23 05:30:14');
INSERT INTO `jk_cache` VALUES ('1665', '14034744568086767034394967479574', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403474456', '2014-06-23 06:00:56');
INSERT INTO `jk_cache` VALUES ('1666', '14034764085503797624304543136101', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403476408', '2014-06-23 06:33:28');
INSERT INTO `jk_cache` VALUES ('1667', '14034782151951828773627253187333', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403478215', '2014-06-23 07:03:35');
INSERT INTO `jk_cache` VALUES ('1668', '14034804086043631422103572528827', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403480408', '2014-06-23 07:40:08');
INSERT INTO `jk_cache` VALUES ('1669', '14034835689409055568745232139198', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403483568', '2014-06-23 08:32:48');
INSERT INTO `jk_cache` VALUES ('1670', '14034883206367125276886003095740', '{\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403488320', '2014-06-23 09:52:00');
INSERT INTO `jk_cache` VALUES ('1671', '14034905983141860033993815792277', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403490598', '2014-06-23 10:29:58');
INSERT INTO `jk_cache` VALUES ('1672', '14034908163063589378499224600732', '{\"device_id\":\"2ee3e9cd-40bb-48df-b927-fd4c4d9886ce\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403490816', '2014-06-23 10:33:36');
INSERT INTO `jk_cache` VALUES ('1673', '14034909980702901928318560927853', '{\"device_id\":\"\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403490998', '2014-06-23 10:36:38');
INSERT INTO `jk_cache` VALUES ('1674', '14034934773409139307536461003160', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403493477', '2014-06-23 11:17:57');
INSERT INTO `jk_cache` VALUES ('1675', '14034970017437825855829053472870', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403497001', '2014-06-23 12:16:41');
INSERT INTO `jk_cache` VALUES ('1676', '14035015837892270095746856818973', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403501583', '2014-06-23 13:33:03');
INSERT INTO `jk_cache` VALUES ('1677', '14035046118078298803024868641245', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403504611', '2014-06-23 14:23:31');
INSERT INTO `jk_cache` VALUES ('1678', '14035083196553202279907656283715', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403508319', '2014-06-23 15:25:19');
INSERT INTO `jk_cache` VALUES ('1679', '14035101553020455528484595911488', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403510155', '2014-06-23 15:55:55');
INSERT INTO `jk_cache` VALUES ('1680', '14035145452229141237832557283545', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403514545', '2014-06-23 17:09:05');
INSERT INTO `jk_cache` VALUES ('1681', '14035195972411829758934741257087', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403519597', '2014-06-23 18:33:17');
INSERT INTO `jk_cache` VALUES ('1682', '14035230688758358788830656626667', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403523068', '2014-06-23 19:31:08');
INSERT INTO `jk_cache` VALUES ('1683', '14035261287826728788444135077444', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403526128', '2014-06-23 20:22:08');
INSERT INTO `jk_cache` VALUES ('1684', '14035282893705966316942209241599', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403528289', '2014-06-23 20:58:09');
INSERT INTO `jk_cache` VALUES ('1685', '14035313250796812292767757379709', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403531325', '2014-06-23 21:48:45');
INSERT INTO `jk_cache` VALUES ('1686', '14035345012821627641816727912440', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403534501', '2014-06-23 22:41:41');
INSERT INTO `jk_cache` VALUES ('1687', '14035369317107256037830268349788', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403536931', '2014-06-23 23:22:11');
INSERT INTO `jk_cache` VALUES ('1688', '14035387510191367310112903347192', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403538751', '2014-06-23 23:52:31');
INSERT INTO `jk_cache` VALUES ('1689', '14035668496780442685172766387394', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403566849', '2014-06-24 07:40:49');
INSERT INTO `jk_cache` VALUES ('1690', '14035668496791175831567825959332', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403566849', '2014-06-24 07:40:49');
INSERT INTO `jk_cache` VALUES ('1691', '14035704581011595932977419455517', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403570458', '2014-06-24 08:40:58');
INSERT INTO `jk_cache` VALUES ('1692', '14035728563234656310836479735854', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403572856', '2014-06-24 09:20:56');
INSERT INTO `jk_cache` VALUES ('1693', '14035751476390409633525682907742', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403575147', '2014-06-24 09:59:07');
INSERT INTO `jk_cache` VALUES ('1694', '14035754028336514374421325209834', '{\"device_id\":\"f7f53797-a162-4a53-bfc0-16178554a71b\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403575402', '2014-06-24 10:03:22');
INSERT INTO `jk_cache` VALUES ('1695', '14035779017566192040845924612604', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403577901', '2014-06-24 10:45:01');
INSERT INTO `jk_cache` VALUES ('1696', '14035790886007072705408575508628', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403579088', '2014-06-24 11:08:25');
INSERT INTO `jk_cache` VALUES ('1697', '14035796121768202962952655400149', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403579612', '2014-06-24 11:13:32');
INSERT INTO `jk_cache` VALUES ('1698', '14035798234033480067034810858979', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403579823', '2014-06-24 11:17:03');
INSERT INTO `jk_cache` VALUES ('1699', '14035799549726125480755445726844', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403579954', '2014-06-24 11:19:38');
INSERT INTO `jk_cache` VALUES ('1700', '14035802068384679733614610370232', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403580206', '2014-06-24 11:23:52');
INSERT INTO `jk_cache` VALUES ('1701', '14035803194912997175907233638884', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403580319', '2014-06-24 11:25:19');
INSERT INTO `jk_cache` VALUES ('1702', '14035804635081551841502067672769', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403580463', '2014-06-24 11:27:43');
INSERT INTO `jk_cache` VALUES ('1703', '14035804810949223375414481685622', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403580481', '2014-06-24 11:28:01');
INSERT INTO `jk_cache` VALUES ('1704', '14035809102175701972130473728463', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403580910', '2014-06-24 11:46:41');
INSERT INTO `jk_cache` VALUES ('1705', '14035821905885701850107161624725', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403582190', '2014-06-24 11:56:30');
INSERT INTO `jk_cache` VALUES ('1706', '14035822867950249447903782344960', '{\"device_id\":\"09a9186d-bae7-4e41-a103-858337281866\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403582286', '2014-06-24 11:58:26');
INSERT INTO `jk_cache` VALUES ('1707', '14035840137946344624042390214481', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403584013', '2014-06-24 12:26:53');
INSERT INTO `jk_cache` VALUES ('1708', '14035865891469473751351554366980', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403586589', '2014-06-24 13:09:49');
INSERT INTO `jk_cache` VALUES ('1709', '14035884243784245290652686389248', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403588424', '2014-06-24 13:40:24');
INSERT INTO `jk_cache` VALUES ('1710', '14035909970603249902969065457775', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403590997', '2014-06-24 14:23:17');
INSERT INTO `jk_cache` VALUES ('1711', '14035928284126258674974882812115', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403592828', '2014-06-24 14:53:48');
INSERT INTO `jk_cache` VALUES ('1712', '14035953004546442237552679904818', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403595300', '2014-06-24 15:35:00');
INSERT INTO `jk_cache` VALUES ('1713', '14035982634510274808626085166944', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403598263', '2014-06-24 16:24:23');
INSERT INTO `jk_cache` VALUES ('1714', '14036010862877018395385278679315', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403601086', '2014-06-24 17:11:26');
INSERT INTO `jk_cache` VALUES ('1715', '14036038656260713100957204024880', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403603865', '2014-06-24 17:57:45');
INSERT INTO `jk_cache` VALUES ('1718', '14036058619936793806160752597033', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403605861', '2014-06-24 18:31:01');
INSERT INTO `jk_cache` VALUES ('1719', '14036076683177903973482660169956', '{\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403607668', '2014-06-24 19:01:08');
INSERT INTO `jk_cache` VALUES ('1720', '14036098375706727666208429795029', '{\"device_id\":\"25f1722a-d751-430e-9174-80585dc1bf46\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403609837', '2014-06-24 19:37:17');
INSERT INTO `jk_cache` VALUES ('1723', '14036128241134972240389700966694', '{\"device_id\":\"734779b1-589b-4dd6-b3c3-1ebf06de7664\",\"is_login\":1,\"is_credit\":1,\"user_id\":5}', '2', '604800', '1403612824', '2014-06-24 20:27:27');
INSERT INTO `jk_cache` VALUES ('1722', '14036100658827420365452761461097', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403610065', '2014-06-24 19:41:05');
INSERT INTO `jk_cache` VALUES ('1724', '14036129108338499440367781849604', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403612910', '2014-06-24 20:28:30');
INSERT INTO `jk_cache` VALUES ('1725', '14036129324683918251804217964997', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403612932', '2014-06-24 20:28:52');
INSERT INTO `jk_cache` VALUES ('1726', '14036136492484647228147420969061', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403613649', '2014-06-24 20:40:49');
INSERT INTO `jk_cache` VALUES ('1727', '14036151917410308937317965891769', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403615191', '2014-06-24 21:06:31');
INSERT INTO `jk_cache` VALUES ('1728', '14036154670941808028069455589645', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403615467', '2014-06-24 21:11:07');
INSERT INTO `jk_cache` VALUES ('1729', '14036174042631001963589382581377', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403617404', '2014-06-24 21:43:24');
INSERT INTO `jk_cache` VALUES ('1730', '14036211369242222139131579053601', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403621136', '2014-06-24 22:45:36');
INSERT INTO `jk_cache` VALUES ('1731', '14036248389461867017980342895613', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403624838', '2014-06-24 23:47:18');
INSERT INTO `jk_cache` VALUES ('1732', '14036273603443698382855272322052', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403627360', '2014-06-25 00:29:20');
INSERT INTO `jk_cache` VALUES ('1733', '14036275700026344561652839329708', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403627570', '2014-06-25 00:32:50');
INSERT INTO `jk_cache` VALUES ('1734', '14036291853603957230288254589118', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403629185', '2014-06-25 00:59:45');
INSERT INTO `jk_cache` VALUES ('1735', '14036309933318508452062513136014', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403630993', '2014-06-25 01:29:53');
INSERT INTO `jk_cache` VALUES ('1736', '14036328050008952170753380028967', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403632805', '2014-06-25 02:00:05');
INSERT INTO `jk_cache` VALUES ('1737', '14036346612040083907159154520706', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403634661', '2014-06-25 02:31:01');
INSERT INTO `jk_cache` VALUES ('1738', '14036364814620822548951984894273', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403636481', '2014-06-25 03:01:21');
INSERT INTO `jk_cache` VALUES ('1739', '14036414473561263830320150450755', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403641447', '2014-06-25 04:24:07');
INSERT INTO `jk_cache` VALUES ('1740', '14036473961933556879492325522485', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403647396', '2014-06-25 06:03:16');
INSERT INTO `jk_cache` VALUES ('1741', '14036538452124088339638596322843', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403653845', '2014-06-25 07:50:45');
INSERT INTO `jk_cache` VALUES ('1742', '14036575428990109592622212415750', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403657542', '2014-06-25 08:52:22');
INSERT INTO `jk_cache` VALUES ('1743', '14036599024268230157234366207192', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403659902', '2014-06-25 09:31:42');
INSERT INTO `jk_cache` VALUES ('1744', '14036609696117117027805033722813', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403660969', '2014-06-25 09:49:29');
INSERT INTO `jk_cache` VALUES ('1745', '14036621812574937313087509775407', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403662181', '2014-06-25 10:09:41');
INSERT INTO `jk_cache` VALUES ('1746', '14036650977975454573516245933153', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403665097', '2014-06-25 10:58:17');
INSERT INTO `jk_cache` VALUES ('1747', '14036872604106664413695586738053', '{\"device_id\":\"734779b1-589b-4dd6-b3c3-1ebf06de7664\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403687260', '2014-06-25 17:07:40');
INSERT INTO `jk_cache` VALUES ('1748', '14037073624843564787159592777099', '{\"device_id\":\"29614985-4963-471e-95ed-32cc7cf1404a\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403707362', '2014-06-25 22:42:42');
INSERT INTO `jk_cache` VALUES ('1749', '14037408414289852371606350171841', '{\"device_id\":\"none\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403740841', '2014-06-26 08:00:41');
INSERT INTO `jk_cache` VALUES ('1750', '14037518651526068401095608419506', '{\"device_id\":\"6a8cfd95-9899-4f0b-8e00-34c5a54bc7e7\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403751865', '2014-06-26 11:04:25');
INSERT INTO `jk_cache` VALUES ('1751', '14037705165148021292314154090322', '{\"device_id\":\"734779b1-589b-4dd6-b3c3-1ebf06de7664\",\"is_login\":-1,\"is_credit\":-1,\"user_id\":-1}', '2', '604800', '1403770516', '2014-06-26 16:15:16');

-- ----------------------------
-- Table structure for `log_bill`
-- ----------------------------
DROP TABLE IF EXISTS `log_bill`;
CREATE TABLE `log_bill` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `customer_id` bigint(64) DEFAULT NULL COMMENT '客户ID',
  `delivery_address_id` bigint(20) DEFAULT NULL COMMENT '送货地址',
  `delivery_address_stamp` bigint(20) DEFAULT NULL COMMENT '配送地址版本',
  `pay_status` int(11) DEFAULT NULL COMMENT '支付状态',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付类型',
  `actual_pay_type` int(11) DEFAULT NULL COMMENT '实际支付类型',
  `actual_delivery_time` int(11) DEFAULT NULL COMMENT '实际送货时间',
  `reserved_delivery_time` bigint(20) DEFAULT NULL COMMENT '预约送货时间',
  `bill_status` int(11) DEFAULT NULL COMMENT '订单状态',
  `total_price` float DEFAULT NULL COMMENT '总价',
  `delivery_id` bigint(20) DEFAULT NULL COMMENT '配送员',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '下单时间',
  `lastupdatetime` timestamp NULL DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of log_bill
-- ----------------------------
INSERT INTO `log_bill` VALUES ('1', '3', '6', '1', '2', '321', '1', null, null, null, '0', '100', null, null, null, null, null, null, null);
INSERT INTO `log_bill` VALUES ('2', '3', '6', '1', '2', '321', '1', null, null, null, '0', '100', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_bill_items`
-- ----------------------------
DROP TABLE IF EXISTS `log_bill_items`;
CREATE TABLE `log_bill_items` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` bigint(20) NOT NULL,
  `bill` bigint(255) DEFAULT NULL COMMENT '订单ID',
  `product_id` bigint(16) DEFAULT NULL COMMENT '商品ID',
  `product_stamp` varchar(64) DEFAULT NULL COMMENT '商品版本号',
  `product_number` int(11) DEFAULT NULL COMMENT '商品数量',
  `createtime` timestamp NULL DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='订单详情';

-- ----------------------------
-- Records of log_bill_items
-- ----------------------------
INSERT INTO `log_bill_items` VALUES ('21', '1', '1', '1111111111111', '可乐', '10', null, null, null, null, null);
INSERT INTO `log_bill_items` VALUES ('22', '2', '1', '2222222222222', '橙汁', '20', null, null, null, null, null);
INSERT INTO `log_bill_items` VALUES ('23', '17', '3', '1', '1', '1', null, null, null, null, null);
INSERT INTO `log_bill_items` VALUES ('24', '18', '3', '2', '2', '2', null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_product`
-- ----------------------------
DROP TABLE IF EXISTS `log_product`;
CREATE TABLE `log_product` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `bar_code` bigint(16) DEFAULT NULL COMMENT '商品条形码',
  `product_version` int(11) DEFAULT NULL COMMENT '商品版本号',
  `product_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `product_category` int(11) DEFAULT NULL COMMENT '商品分类',
  `procuct_img` int(11) DEFAULT NULL COMMENT '商品图片',
  `procuct_price` float DEFAULT NULL COMMENT '商品价格',
  `procuct_brand` varchar(255) DEFAULT NULL COMMENT '商品品牌',
  `procuct_description` varchar(500) DEFAULT NULL COMMENT '商品详情',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of log_product
-- ----------------------------
INSERT INTO `log_product` VALUES ('1', '1111111111111', '1', '可乐', '2', null, '2', '北京', '我是可乐描述信息', null, null, null, null, null);
INSERT INTO `log_product` VALUES ('2', '2222222222222', '1', '橙汁', '2', null, '2', '湖南', '我是橙汁描述信息', null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_product_shortage`
-- ----------------------------
DROP TABLE IF EXISTS `log_product_shortage`;
CREATE TABLE `log_product_shortage` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `product_id` bigint(64) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  `shortage_time` bigint(20) DEFAULT NULL,
  `shortage_operate_admin` bigint(20) DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货商品日志记录表';

-- ----------------------------
-- Records of log_product_shortage
-- ----------------------------

-- ----------------------------
-- Table structure for `log_user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_admin`;
CREATE TABLE `log_user_admin` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理用户日志信息\r\n每次对管理用户的操作，都将会在此表留下一条记录';

-- ----------------------------
-- Records of log_user_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `log_user_customer`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_customer`;
CREATE TABLE `log_user_customer` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '是否激活',
  `email` varchar(64) DEFAULT NULL,
  `qq` varchar(16) DEFAULT NULL,
  `avartar` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL,
  `log_time` bigint(20) DEFAULT NULL,
  `log_operate_type` int(11) DEFAULT NULL,
  `log_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_user_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `log_user_customer_delivery_address`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_customer_delivery_address`;
CREATE TABLE `log_user_customer_delivery_address` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `contacts` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `area` int(10) unsigned DEFAULT NULL COMMENT '地区',
  `community` int(10) DEFAULT NULL COMMENT '小区',
  `shop` bigint(20) DEFAULT NULL,
  `is_default` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `stamp` bigint(20) DEFAULT NULL COMMENT '版本',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `log_user_id` bigint(20) DEFAULT NULL COMMENT '操作用户',
  `log_time` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `log_operate_type` int(11) DEFAULT NULL COMMENT '操作来源',
  `log_ip` varchar(32) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='客户收货地址信息\r\n一个客户有N个收货地址\r\n客户的收货地址与商店有绑定关系';

-- ----------------------------
-- Records of log_user_customer_delivery_address
-- ----------------------------
INSERT INTO `log_user_customer_delivery_address` VALUES ('1', '4', 'haha1', '18628128353', '5', '4', '0', '1', 'woshipeisongdizhi1', '1399998944', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('2', '4', 'haha1-update', '18628128353', '5', '4', '1', '1', 'woshipeisongdizhi1-update', '1399999483', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('3', '4', 'haha1-update', '18628128353', '5', '4', '1', '1', 'woshipeisongdizhi1-update', '1399999514', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('4', '4', 'haha1-update', '18628128353', '5', '4', '1', '1', 'woshipeisongdizhi2-update', '1399999563', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('5', '5', 'Ajtwmd', '15201351249', '2', '3', '0', '1', 'Ajtwmdhtwmjg.a', '1400062290', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('6', '5', 'haha', '15201351249', '5', '4', '0', '1', 'woshipeisongdizhi', '1400001372', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('7', '5', 'haha1', '15201351249', '5', '4', '0', '1', 'woshipeisongdizhi1', '1400001429', null, null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('8', '5', 'haha1-update', '15201351249', '5', '4', '0', '1', 'woshipeisongdizhi1', '1400001439', '2014-05-15 03:17:13', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('9', '5', 'ajtwmd', '15201351249', '2', '3', '0', '2', 'ajtwmd', '1400060210', '2014-05-18 00:49:00', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('10', '5', 'wzj', '12345678912', '3', '4', '0', '2', '??? ???[*#_JG_1]???????19#222', '1401356784', '2014-05-29 21:52:49', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('11', '5', 'jiang', '11111111111', '2', '3', '0', '2', 'GAMG', '1400072602', '2014-05-29 21:53:04', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('12', '5', 'www', '33332222111', '3', '3', '0', '1', '北京市 海淀区[*#_JK_1]学院南路15号院[*#_JK_2学院派[*#_JK_3]B座317', '1401374583', '2014-05-29 23:06:55', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('13', '5', 'linjian', '11111111111', '1', '6', '0', '2', 'linjiandedizhi', '1401269877', '2014-05-29 23:13:10', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('14', '5', 'ert', '15201351249', '1', '6', '0', '2', 'wertyuiop', '1401255989', '2014-05-29 23:13:16', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('15', '5', 'hefei[*#_JG_11]qqqqqq[*#_JG_2]  ', 'qqqqqq', '1', '4', '0', '2', '  [*#_wJG_1]????rrrrrrrrrrrrrrr', '1401347317', '2014-05-29 23:16:21', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('16', '5', 'linjian1', '2222222222222', '1', '6', '0', '2', 'sdfsd', '1401273160', '2014-05-29 23:16:26', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('17', '5', 'WZJ', '12345678975', '3', '4', '0', '2', ' [*#_2JG_1]????ERERERRE', '1401349036', '2014-05-29 23:16:32', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('18', '5', 'wzj', '12332123212', '3', '4', '0', '2', ' [*#_JG3_1]????18#401', '1401355828', '2014-05-29 23:16:37', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('19', '5', 'zj_w', '15655922107', '3', '4', '0', '2', '??? ???[*#_JG3_1]???????18#403', '1401356046', '2014-05-29 23:16:42', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('20', '5', 'linjian', '121212121212', '3', '3', '0', '2', '??? ???[*#_JG2_1]???????19#1012', '1401356405', '2014-05-29 23:16:47', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('21', '5', 'wzj', '12345678912', '3', '4', '0', '2', '北京市 海淀区[*#_JG2_1]牡丹园小区四号19#222', '1401356784', '2014-05-29 23:16:52', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('22', '5', 'wzj321', '11111111111', '3', '1', '0', '2', '??? ???[*#2_JG_1]????[*#_JG_2]????[*w#_JG_3]18#401', '1401372534', '2014-05-29 23:16:57', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('23', '5', 'wzj123', '13221341231', '3', '4', '0', '2', '??? ???[*#_J1G_1]???????18#212', '1401371257', '2014-05-29 23:17:03', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('24', '5', 'ppp', '1111111111', '3', '2', '0', '1', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#111', '1401377194', '2014-05-29 23:26:59', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('25', '5', 'ppp', '1111111111', '3', '2', '0', '2', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#111', '1401377194', '2014-05-29 23:27:49', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('26', '5', 'ppp', '1111111111', '3', '2', '0', '2', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#111', '1401377194', '2014-05-30 12:59:36', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('27', '5', 'www', '15201351249', '3', '2', '0', '1', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#123', '1401426072', '2014-05-30 15:10:26', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('28', '5', 'www', '15201351249', '3', '2', '0', '2', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#123', '1401426072', '2014-05-30 15:12:50', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('29', '5', 'www', '15201351249', '3', '2', '0', '2', '??? ???[*#_JK_1]????[*#_JK_2]???[*#_JK_3]qqq#123', '1401426072', '2014-05-30 15:16:21', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('30', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:20:00', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('31', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:24:04', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('32', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:25:38', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('33', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:25:57', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('34', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:26:13', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('35', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:26:36', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('36', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:28:07', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('37', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:28:40', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('38', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:28:48', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('39', '5', 'yyy', '15201351249', '3', '2', '1', '2', '??? ???[*#_JK_1]????[*#_JK_2]??[*#_JK_3]qqq#123', '1401434181', '2014-05-30 15:31:24', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('40', '5', 'sssdfas', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435084', '2014-05-30 15:34:26', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('41', '5', 'sssdfas', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435084', '2014-05-30 15:34:44', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('42', '5', 'sssdfas', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435084', '2014-05-30 15:35:07', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('43', '5', 'sssdfas', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435084', '2014-05-30 15:35:46', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('44', '5', 'sssdfas', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435346', '2014-05-30 15:36:02', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('45', '5', 'sdfawddddd', '3212123123123', '3', '2', '1', '2', '??? ???[*', '1401435362', '2014-05-30 15:36:45', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('46', '5', 'QQQ', '12345678911', '3', '4', '0', '2', '??? ???[*#_JK_1]???[*#_JK_2]???[*#_JK_3]QQQ#123', '1401434512', '2014-05-30 15:39:20', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('47', '5', 'PPP', '12345678911', '3', '4', '1', '2', '??? ???[*#_JK_1]???[*#_JK_2]??[*#_JK_3]QQQ#123', '1401435560', '2014-05-30 15:39:43', null, null, null, null);
INSERT INTO `log_user_customer_delivery_address` VALUES ('48', '5', 'PPP', '12345678911', '3', '4', '1', '2', '??? ???[*#_JK_1]???[*#_JK_2]?[*#_JK_3]QQQ#123', '1401435583', '2014-05-30 15:40:14', null, null, null, null);

-- ----------------------------
-- Table structure for `log_user_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `log_user_delivery`;
CREATE TABLE `log_user_delivery` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `shop_id` bigint(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `log_user_id` bigint(20) DEFAULT NULL,
  `log_time` bigint(20) DEFAULT NULL,
  `log_operate_type` int(11) DEFAULT NULL,
  `log_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_user_delivery
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `bar_code` varchar(50) DEFAULT NULL,
  `product_version` int(11) DEFAULT '0' COMMENT '商品版本号',
  `product_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `product_category` int(11) DEFAULT '0' COMMENT '商品分类',
  `product_img` varchar(200) NOT NULL,
  `product_price` varchar(20) DEFAULT NULL COMMENT '商品价格',
  `product_brand` varchar(255) DEFAULT NULL COMMENT '商品品牌',
  `product_description` varchar(500) DEFAULT NULL COMMENT '商品详情',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pvalume` varchar(50) DEFAULT NULL COMMENT '商品体积',
  `pbzq` varchar(50) DEFAULT NULL COMMENT '保质期',
  `pweight` varchar(50) DEFAULT NULL COMMENT '重量',
  `dosing` varchar(45) DEFAULT NULL COMMENT '配料',
  `protechnics` varchar(45) DEFAULT NULL COMMENT '生产工艺',
  `qualitylevel` varchar(45) DEFAULT NULL COMMENT '质量等级',
  `storerange` varchar(45) DEFAULT NULL COMMENT '存储条件',
  `feature` varchar(1000) NOT NULL,
  `ishas` int(10) NOT NULL DEFAULT '1' COMMENT '是否有货（1有货，0没货）',
  `ispromotion` int(1) NOT NULL DEFAULT '0' COMMENT '是否促销产品(0=不是促销 1=促销)',
  `promotionprice` varchar(10) DEFAULT NULL COMMENT '促销价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1031001 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1000506', '6920242102116', '1', '怡达山楂味饼138g', '1000076', 'http://pictures-of-goods.qiniudn.com/1000506.jpg', '5.5', '怡达', '山楂鲜果打碎搅拌，烘制成粉红色有人的怡达山楂，入口即化，是老少咸宜的开胃零食', '2014-12-23 17:09:35', '', '', '138g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000507', '6920242100396', '1', '怡达圆片180g', '1000076', 'http://pictures-of-goods.qiniudn.com/1000507.jpg', '4.9', '怡达', '山楂鲜果打碎搅拌，烘制成粉红色有人的怡达山楂，入口即化，是老少咸宜的开胃零食', '2014-12-23 17:09:35', '', '', '180g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1000511', '6958620700036', '1', '袋装友臣肉松饼208g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000511.jpg', '10', '友臣', '友臣 肉松饼 经典原味选用优质小麦粉、肉松、脱皮绿豆等原料，经科学生产工艺精心制作而成。<br/>松脆的金色外皮下，包裹着满满酥松的肉松，色泽纯正自然，馅料饱满充足，酥香美味，让您爱不释口。<br/>友臣肉松饼闽南特色，手工培制，皮薄馅多、入口绵软、松软香甜、香酥可口、营养搭配、健康美味。', '2014-12-23 17:09:35', '', '', '208g', '', '', '', '', '', '1', '0', '10.5');
INSERT INTO `product` VALUES ('1000514', '6911988011602', '1', '达利园法式香奶面包200g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000514.jpg', '6.5', '达利园', '忙碌的工作、快节奏的城市<br/>整个人总是处于紧绷状态<br/>忙了一天，该给自己一次放松的机会<br/>一杯浓咖啡或者一杯热牛奶<br/>搭配达利园法式软面包<br/>让您尽享美妙时刻<br/>生活更有乐趣', '2014-12-23 17:09:35', '', '', '200g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000515', '6920912353664', '1', '盼盼法式面包香橙200g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000515.jpg', '5.5', '盼盼', '本品经过精选上乘原材料，采用世界先进加工工艺精制而成。<br/>盼盼集团一直受到业界和消费者的一致认可，是中国食品行业中驰名品牌之一。<br/>薄薄的蛋糕，加上不同果酱和奶油，卷成卷装，让你时刻享受海绵质感的卷蛋糕。<br/>本品松软优质，弥漫不同水果味道的清香，作为居家、旅行或聚会的常备小食是不错的佳选之一。', '2014-12-23 17:09:35', '', '', '200g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000516', '6920912353657', '1', '奶香味法式软面包200g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000516.jpg', '5.5', '盼盼', '本品经过精选上乘原材料，采用世界先进加工工艺精制而成。<br/>盼盼集团一直受到业界和消费者的一致认可，是中国食品行业中驰名品牌之一。<br/>薄薄的蛋糕，加上不同果酱和奶油，卷成卷装，让你时刻享受海绵质感的卷蛋糕。<br/>本品松软优质，弥漫不同水果味道的清香，作为居家、旅行或聚会的常备小食是不错的佳选之一。', '2014-12-23 17:09:35', '', '', '200g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000519', '6911988014825', '1', '法式软面包香奶味360g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000519.jpg', '9.5', '达利园', '忙碌的工作、快节奏的城市<br/>整个人总是处于紧绷状态<br/>忙了一天，该给自己一次放松的机会<br/>一杯浓咖啡或者一杯热牛奶<br/>搭配达利园法式软面包<br/>让您尽享美妙时刻<br/>生活更有乐趣', '2014-12-23 17:09:35', '', '', '360g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1000521', '6920907803068', '1', '好丽友Q蒂摩卡巧克力蛋糕两块装56g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000521.jpg', '4', '好丽友', '精致独到的制作工艺，蛋糕加倍柔软，细腻润滑。<br/>精选好原料，好丽友在手，美味不离口。', '2014-12-23 17:09:35', '', '', '56g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000522', '6920907800913', '1', '好丽友巧克力派68g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000522.jpg', '3.8', '好丽友', '精致独到的制作工艺，蛋糕加倍柔软，细腻润滑。<br/>精选好原料，好丽友在手，美味不离口。', '2014-12-23 17:09:35', '', '', '68g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000523', '6920907800616', '1', '好丽友蛋黄派两块装46g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000523.jpg', '4', '好丽友', '精致独到的制作工艺，蛋糕加倍柔软，细腻润滑。<br/>精选好原料，好丽友在手，美味不离口。', '2014-12-23 17:09:35', '', '', '46g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000524', '6920731704302', '1', '康师傅妙芙欧式蛋糕96g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000524.jpg', '5.5', '康师傅', '堡垒杯装欧式蛋糕，用料丰富，采用欧式先进技术，精心烘培而成。<br/>每道香浓与绵密的幸福味道，都是康师傅妙芙蛋糕品质坚持的用心与诚意。<br/>口感柔细、松软、绵密尽化口中，律动出浓郁奶香的味觉体验。', '2014-12-23 17:09:35', '', '', '96g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000527', '6920907801323', '1', '好丽友提拉米苏138g', '1000009', 'http://pictures-of-goods.qiniudn.com/1000527.jpg', '12', '好丽友', '精致独到的制作工艺，蛋糕加倍柔软，细腻润滑。<br/>精选好原料，好丽友在手，美味不离口。', '2014-12-23 17:09:35', '', '', '138g', '', '', '', '', '', '1', '0', '12.5');
INSERT INTO `product` VALUES ('1000530', '6901845041606', '1', '百奇红茶牛奶味装饰饼干55g', '1000001', 'http://pictures-of-goods.qiniudn.com/1000530.jpg', '5.5', '百奇', '精选天然优质的小麦面粉，经现代科学加工工艺，配以严谨的制程结合独特的配方，保证产品的纯正口味，充分释放出小麦的天然香味。<br/>采用特殊工艺将两层不同口味完美组合而成的纤巧饼干棒，轻巧一根的两种不同美味享受，香味诱人，口味浓郁，微甜不腻的口味适宜一年四季享受，让你尽享无穷美味！<br/>精致可爱的包装，简洁大方，携带方便，时尚小巧的饼干棒更加让人爱不释手，食用方便，开袋即食，是外出旅行，朋友聚会，闲暇之余的休闲食品。随时随地，想吃 就吃！pocky不停，快乐不停！', '2014-12-23 17:09:35', '', '', '55g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000533', '6901845041491', '1', '百奇双重巧克力味50g', '1000001', 'http://pictures-of-goods.qiniudn.com/1000533.jpg', '5.5', '百奇', '精选天然优质的小麦面粉，经现代科学加工工艺，配以严谨的制程结合独特的配方，保证产品的纯正口味，充分释放出小麦的天然香味。<br/>采用特殊工艺将两层不同口味完美组合而成的纤巧饼干棒，轻巧一根的两种不同美味享受，香味诱人，口味浓郁，微甜不腻的口味适宜一年四季享受，让你尽享无穷美味！<br/>精致可爱的包装，简洁大方，携带方便，时尚小巧的饼干棒更加让人爱不释手，食用方便，开袋即食，是外出旅行，朋友聚会，闲暇之余的休闲食品。随时随地，想吃 就吃！pocky不停，快乐不停！', '2014-12-23 17:09:35', '', '', '50g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000537', '6952389210027', '1', '真巧鸳鸯芯曲奇（草莓味+香草味夹心饼干）120g', '1000001', 'http://pictures-of-goods.qiniudn.com/1000537.jpg', '5', '真巧', '真巧 酱芯曲奇草莓味+香草味夹心饼干采用优质的小麦粉和上等的可可粉为原料，充分保证了产品的优良口感。<br/>本品口味纯正，馥郁怡人，令人回味无穷。', '2014-12-23 17:09:35', '', '', '120g', '', '', '', '', '', '1', '0', '5.5');
INSERT INTO `product` VALUES ('1000539', '6919892990327', '1', '康师傅3+2苏打夹心饼干（果香蓝莓味）125g', '1000001', 'http://pictures-of-goods.qiniudn.com/1000539.jpg', '4.6', '康师傅', '3层饼干加2层夹心，多一层夹心，滋味更丰富，配以方形苏打饼干，香脆、不腻口。', '2014-12-23 17:09:35', '', '', '125g', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1000543', '6924743915824', '1', '乐事无限红烧肉味104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000543.jpg', '8.3', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '104g', '', '', '', '', '', '1', '0', '8.8');
INSERT INTO `product` VALUES ('1000548', '6926265301024', '1', '上好佳鲜虾条40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000548.jpg', '3.5', '上好佳', ' 1、清脆每一口，让您回味无穷<br/>2、休闲消遣，朋友聚会，常备食品', '2014-12-23 17:09:35', '', '', '40g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000549', '6909409040898', '1', '上好佳田园薯片烤肉口味50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000549.jpg', '3.5', '上好佳', ' 1、清脆每一口，让您回味无穷<br/>2、休闲消遣，朋友聚会，常备食品', '2014-12-23 17:09:35', '', '', '50g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000550', '6909409012024', '1', '上好佳鲜虾片40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000550.jpg', '3.5', '上好佳', ' 1、清脆每一口，让您回味无穷<br/>2、休闲消遣，朋友聚会，常备食品', '2014-12-23 17:09:35', '', '', '40g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000552', '6926265388124', '1', '上好佳空心薯笛（蓝莓味）45g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000552.jpg', '3.5', '上好佳', ' 1、清脆每一口，让您回味无穷<br/>2、休闲消遣，朋友聚会，常备食品', '2014-12-23 17:09:35', '', '', '45g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000553', '6920912359192', '1', '墨西哥鸡味卷60g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000553.jpg', '7.5', '盼盼', '打开包装，小麦粉的芬香扑鼻而来，勾起你无尽食欲，带你经历一场浪漫嗅觉之旅。', '2014-12-23 17:09:35', '', '', '60g', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1000554', '6920912342002', '1', '麦香鸡味块60g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000554.jpg', '7.5', '盼盼', '打开包装，小麦粉的芬香扑鼻而来，勾起你无尽食欲，带你经历一场浪漫嗅觉之旅。', '2014-12-23 17:09:35', '', '', '60g', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1000555', '6920907810165', '1', '好丽友薯愿烤鸡沙拉味104g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000555.jpg', '8.5', '好丽友', '源自精选的优质新鲜土豆，口味更纯正。<br/>恰好的2.6mm切片厚度，咔嚓酥脆，回味香浓。<br/>无疑是您休闲消遣，朋友聚会的必备食品。<br/>美观纸盒设计，内含独立2小袋，食用更方便。', '2014-12-23 17:09:35', '', '', '104g', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000556', '6920907809886', '1', '好丽友薯愿红酒牛排味104g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000556.jpg', '8.5', '好丽友', '源自精选的优质新鲜土豆，口味更纯正。<br/>恰好的2.6mm切片厚度，咔嚓酥脆，回味香浓。<br/>无疑是您休闲消遣，朋友聚会的必备食品。<br/>美观纸盒设计，内含独立2小袋，食用更方便。', '2014-12-23 17:09:35', '', '', '104g', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000557', '6920907809862', '1', '好丽友薯愿香烤原味薯片104g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000557.jpg', '8.5', '好丽友', '源自精选的优质新鲜土豆，口味更纯正。<br/>恰好的2.6mm切片厚度，咔嚓酥脆，回味香浓。<br/>无疑是您休闲消遣，朋友聚会的必备食品。<br/>美观纸盒设计，内含独立2小袋，食用更方便。', '2014-12-23 17:09:35', '', '', '104g', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000559', '6920616311113', '1', '旺旺仙贝52g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000559.jpg', '4.5', '旺旺', '旺旺秉承着“缘、自信、大团结”的经营理念，不断的前进着<br/>精心挑选温和的气候、肥沃的土壤、良好的生产条件孕育出的大米为主要原料<br/>加以世界先进的设备和精湛的制米技术，精碾而成美味的米果产品<br/>旺旺仙贝口感酥脆美味，营养丰富，老少皆宜，下午茶小点的好选择', '2014-12-23 17:09:35', '', '', '52g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1000560', '6920616312097', '1', '旺旺雪饼84g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000560.jpg', '4.5', '旺旺', '旺旺秉承着“缘、自信、大团结”的经营理念，不断的前进着<br/>精心挑选温和的气候、肥沃的土壤、良好的生产条件孕育出的大米为主要原料<br/>加以世界先进的设备和精湛的制米技术，精碾而成美味的米果产品<br/>旺旺雪饼口感酥脆美味，营养丰富，老少皆宜，下午茶小点的好选择', '2014-12-23 17:09:35', '', '', '84g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1000561', '6924743915428', '1', '乐事墨西哥鸡汁番茄味45g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000561.jpg', '4', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '45g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000562', '6924743915404', '1', '乐事德克萨斯烧烤味45g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000562.jpg', '4', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '45g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000564', '6924743915558', '1', '乐事意大利香浓红侩味75g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000564.jpg', '6.2', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '75g', '', '', '', '', '', '1', '0', '6.7');
INSERT INTO `product` VALUES ('1000566', '6924743915565', '1', '乐事墨西哥鸡汁番茄味75g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000566.jpg', '6.2', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '75g', '', '', '', '', '', '1', '0', '6.7');
INSERT INTO `product` VALUES ('1000567', '6924743915541', '1', '乐事德克萨斯烧烤味75g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000567.jpg', '6.2', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成,香脆美味，回味悠长，让你一片接一片，美味停不下！<br/>乐事始终致力于生产美味薯片,每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成。希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光,忘记压力、尽情享受。<br/>简单、自然，这就是乐事。', '2014-12-23 17:09:35', '', '', '75g', '', '', '', '', '', '1', '0', '6.7');
INSERT INTO `product` VALUES ('1000568', '6909995103687', '1', '旺旺小小酥葱香鸡肉味60g', '1000072', 'http://pictures-of-goods.qiniudn.com/1000568.jpg', '3.8', '旺旺', '粒粒香酥，品质精纯、香脆好吃<br/>经过现代化制作工艺，精选稻米，精制而成的大米制品<br/>零食盘里能有这样的小小酥，将会增添无限乐趣，身心的倍受享受<br/>本品包装皆为多层高阻隔材质，能长时间保持产品新鲜', '2014-12-23 17:09:35', '', '', '60g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000569', '6930799506282', '1', '乐吧薯片烧烤味50g', '1000002', 'http://pictures-of-goods.qiniudn.com/1000569.jpg', '2.5', '乐吧', '乐吧精选优质马铃薯为原材料，确保食品品质<br/>严格按照质量体系制造而成，确保产品口感<br/>乐吧小翠薯片，烧烤味，口感香脆美味<br/>乐吧可以让您在闲暇时刻尽情享受快乐时光', '2014-12-23 17:09:35', '', '', '50g', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000571', '6949352210016', '1', '雪花清爽啤酒330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1000571.jpg', '2.5', '雪花', '雪花 10度清爽啤酒 整箱装，精选酒花、大米、麦芽酿制，口味纯正，轻松享受！<br/>雪花 10度清爽啤酒 整箱装，品质超群，采用纯正地道的工艺酿造，纯正口味，轻松享受。', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000573', '6948960100429', '1', '哈尔滨啤酒小麦王330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1000573.jpg', '2.8', '哈尔滨', '哈尔滨 小麦王啤酒 ，采用独特的冰点酿造工艺造就出的哈尔滨小麦王啤酒，将成熟的啤酒液深度冷却至啤酒的冰点形成。<br/>纯净清爽、透彻甘冽、总能让您产生欲罢不能的爽冽、圆润口感。<br/>', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1000576', '6901035605328', '1', '青岛醇厚经典500ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1000576.jpg', '5.8', '青岛', '青岛 纯生啤酒，始终坚持用最好的原料来酿造啤酒，采用特殊工艺加工而成。<br/>采用现代罐法酿造工艺和独到的低温长时间后熟技术，同时通过国内领先的啤酒保鲜技术，保证啤酒口味的新鲜。<br/>风味纯净协调，落口爽净，具有淡淡的酒花和麦芽香气。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1000577', '6901035601870', '1', '青岛啤酒纯生8度500ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1000577.jpg', '7', '青岛', '青岛 纯生啤酒，始终坚持用最好的原料来酿造啤酒，采用特殊工艺加工而成。<br/>采用现代罐法酿造工艺和独到的低温长时间后熟技术，同时通过国内领先的啤酒保鲜技术，保证啤酒口味的新鲜。<br/>风味纯净协调，落口爽净，具有淡淡的酒花和麦芽香气。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '7.5');
INSERT INTO `product` VALUES ('1000578', '6906151606099', '1', '牛栏山二锅头100ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1000578.jpg', '3.6', '牛栏山', '牛栏山二锅头的发酵，仍沿 用古老的“地缸” 发酵法，恪守传统的“清蒸清烧”酿造工艺。从润料、糊化到入池发酵，十 多道传统工艺，下足 精致工夫。充分保证地道二锅头之清、香、爽、净。', '2014-12-23 17:09:35', '', '', '100ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1000579', '3946715230264', '1', '红星二锅头56度100ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1000579.jpg', '3.5', '红星', '红星开创了新中国二锅头酒业的辉煌。时间进入八十年代初，新的商标法出台，红星作为中国独家注册的“二锅头”酒类商标，完全可以独自垄断“二锅头“这一名称使用权，而将其它酒排除外。', '2014-12-23 17:09:35', '', '', '100ml', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000583', '6917878030623', '1', '雀巢咖啡瓶装丝滑拿铁咖啡饮料268ml', '1000019', 'http://pictures-of-goods.qiniudn.com/1000583.jpg', '5', '雀巢', '早晨一杯，美味香醇好开始，<br/>下午一杯，精力充沛好状态，<br/>休闲一杯，轻松惬意好享受。', '2014-12-23 17:09:35', '', '', '268ml', '', '', '', '', '', '1', '0', '5.5');
INSERT INTO `product` VALUES ('1000585', '6926892524063', '1', '银鹭花生牛奶复合蛋白饮料500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000585.jpg', '4.2', '银鹭', '精选上等花生研磨加香浓牛奶，松软甘甜，随时随地，为您解渴、解饿、解馋、解闷、正点美味！采用国外引进“PET无菌冷罐装”进行生产。', '2014-12-26 12:55:45', '', '', '500ml', '', '', '', '', '', '1', '0', '4.7');
INSERT INTO `product` VALUES ('1000586', '6902083894245', '1', '娃哈哈营养快线（水蜜桃味）500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000586.png', '4', '娃哈哈', '娃哈哈营养快线，是娃哈哈集团根据中国人独特膳食结构和营养状况，精心研制而成的一种全新的牛奶果昔饮品。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000587', '6902083904685', '1', '娃哈哈营养快线（红枣枸杞味）500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000587.jpg', '4', '娃哈哈', '纯正果汁与香浓牛奶的完美结合<br/>让营养快线不但拥有来自牛奶的丰富营养和钙质<br/>而且还有来自果汁的丰富维生素<br/>人体所需的维生素A、D、E、B3、B6、B12、钾、钙、钠、镁等15种营养素一步到位<br/>让你轻松承受压力，接受挑战！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000588', '6902083893842', '1', '娃哈哈营养快线（椰子味）500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000588.png', '4', '娃哈哈', '纯正果汁与香浓牛奶的完美结合<br/>让营养快线不但拥有来自牛奶的丰富营养和钙质<br/>而且还有来自果汁的丰富维生素<br/>人体所需的维生素A、D、E、B3、B6、B12、钾、钙、钠、镁等15种营养素一步到位<br/>让你轻松承受压力，接受挑战！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000589', '6902083886417', '1', '娃哈哈营养快线（菠萝味）500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000589.jpg', '4', '娃哈哈', '纯正果汁与香浓牛奶的完美结合<br/>让营养快线不但拥有来自牛奶的丰富营养和钙质<br/>而且还有来自果汁的丰富维生素<br/>人体所需的维生素A、D、E、B3、B6、B12、钾、钙、钠、镁等15种营养素一步到位<br/>让你轻松承受压力，接受挑战！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000590', '6902083891329', '1', '哇哈哈营养快线（香菜淇淋味）500ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000590.png', '4', '娃哈哈', '纯正果汁与香浓牛奶的完美结合<br/>让营养快线不但拥有来自牛奶的丰富营养和钙质<br/>而且还有来自果汁的丰富维生素<br/>人体所需的维生素A、D、E、B3、B6、B12、钾、钙、钠、镁等15种营养素一步到位<br/>让你轻松承受压力，接受挑战！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000592', '6925303750275', '1', '统一冰糖雪梨500ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1000592.jpg', '3', '统一', '精选上等新鲜雪梨 佐以单晶冰糖 精致加工 每一瓶都透着淡淡的梨花香', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1000593', '7921304754112', '1', '海之言柠檬口味500ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1000593.jpg', '4', '海之言', '海之言，源自地中海传统智慧降温良策<br/>在水中加入适量的地中海海盐与果汁<br/>及时补充流失的盐分及水分<br/>问你带来清爽味觉的体验！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000595', '6956416200067', '1', '美汁源果粒橙450ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1000595.jpg', '3', '美汁源', '100%橙汁风味口感俱佳，果肉营养更真实可见。<br/>每天清晨喝一杯100%橙汁甜可口的味道刺激食欲，让您胃口大开<br/>醇厚果汁中的水分携带水果营养渗透进身体里的每一个细胞，让你感觉一整天都干劲十足。<br/>两餐之间也别忘了喝一杯100%橙汁哦。<br/>每日3—5杯200毫升100%橙汁，伴你健康生活每一天。', '2014-12-23 17:09:35', '', '', '450ml', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1000596', '6921168550135', '1', '力量帝维他命水（西柚风味）500ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1000596.jpg', '4', '力量帝', '力量帝（添加维生素C+钙）20世纪20年代“维生素C之父”圣乔治成功地分离出维生素C。<br/>维生素C有抗氧化作用，维生素C有助于维持骨骼、牙龈的健康<br/>钙是人体骨骼和牙齿的主要组成成分，许多生理功能也需要钙的参与。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000599', '4891599338393', '1', '加多宝凉茶310ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1000599.jpg', '3.5', '加多宝', '怕上火，更多人喝加多宝！', '2014-12-23 17:09:35', '', '', '310ml', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000601', '4891599366808', '1', '加多宝凉茶500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1000601.jpg', '4', '加多宝', '怕上火，更多人喝加多宝！', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000603', '6921317905168', '1', '康师傅绿茶500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1000603.jpg', '3', '康师傅', '清新自然,怡神爽口，并含天然蜂蜜,滋养温润,让身心倍添健康,随时随地,享受绿色好心情! <br/>给自己一个放松的空间，让心灵来一次深呼吸--就像喝着绿茶，缕缕清香，袭鼻而至，清爽甘美入口而来，<br/>在那片晶莹剔透的绿意中，感受一份好心情。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1000609', '6921317996364', '1', '康师傅冰红茶1L', '1000018', 'http://pictures-of-goods.qiniudn.com/1000609.jpg', '4', '康师傅', '保质期:12个月<br/>成分:水、白砂糖、红茶粉、精制盐、食品添加剂（柠檬酸、柠檬酸钠、维生素C、焦糖色）、食用香精<br/>注意事项：避免阳光直晒，0°以上40°以下保存，如有少许沉淀为天然提取成分，喝前摇一摇，冷藏后口感更佳<br/>商品特色：康师傅冰红茶冰力十足！\n', '2014-12-23 17:09:35', '', '', '1L', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000610', '6925303721671', '1', '统一绿茶2L', '1000018', 'http://pictures-of-goods.qiniudn.com/1000610.jpg', '7', '统一', '严选有机绿茶，百分百无添加，经多道严格加工配比制成，含丰富茶多酚绿茶饮料，天然健康饮品<br/>茶味浓郁怡人，口感清爽纯正，时尚与健康完美融入到自然茶味之中，带来清新自然的全新享受<br/>采用独特精致加工制成，技术成熟，经过严格质量控制，高品质保证，口味纯正、经典<br/>简约、时尚的塑料瓶装设计，饮用简单，携带方便，是居家、旅行、馈赠亲友的上佳饮品', '2014-12-23 17:09:35', '', '', '2L', '', '', '', '', '', '1', '0', '7.5');
INSERT INTO `product` VALUES ('1000612', '6925303723910', '1', '统一冰红茶1L', '1000018', 'http://pictures-of-goods.qiniudn.com/1000612.jpg', '4', '统一', '引领风潮，不但突破自己！<br/>年轻无极限！', '2014-12-23 17:09:35', '', '', '1L', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000613', '6921168558032', '1', '东方树叶乌龙茶500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1000613.jpg', '4', '东方树叶', '农夫山泉的茶透亮透亮的，都是用农夫山泉泡制的，有乌龙、茉莉、红茶、绿茶四个口味。<br/>古人说水为茶之母，农夫山泉你也知道，我们的茶全用传统工艺，茶叶泡制，不加糖，所以是0卡路里。<br/>只有好水才能做出好茶来。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000614', '6921168558025', '1', '东方树叶红茶500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1000614.jpg', '4', '东方树叶', '农夫山泉的茶透亮透亮的，都是用农夫山泉泡制的，有乌龙、茉莉、红茶、绿茶四个口味。<br/>古人说水为茶之母，农夫山泉你也知道，我们的茶全用传统工艺，茶叶泡制，不加糖，所以是0卡路里。<br/>只有好水才能做出好茶来。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000615', '6942659301326', '1', '和其正凉茶1.5L', '1000018', 'http://pictures-of-goods.qiniudn.com/1000615.jpg', '7.8', '和其正', '和其正是福建达利园集团生产的一个凉茶名称，是中国凉茶行业的一支劲旅，是中国著名品牌之一<br/>和其正凉茶精选草本植物材料，口感更纯正，清甜爽口，老少皆宜，是您生活的必备饮品<br/>凉茶和其正根据民间传统配方，精选植物材料，传统萃取生产工艺结合科学方法精制而成<br/>本产品采用大瓶塑料瓶装，包装精致，时尚大方，是您与家人分享、赠送亲友的理想选择', '2014-12-23 17:09:35', '', '', '1.5L', '', '', '', '', '', '1', '0', '8.3');
INSERT INTO `product` VALUES ('1000618', '6901010101180', '1', '健力宝橙蜜味330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1000618.jpg', '2.8', '健力宝', '国家体育总局体育科学研究所二十年跟踪研究的经典配方，更适宜国人饮用<br/>含钾、钠矿物质，随时补充身体丢失盐分，调节身体中水分酸碱平衡，迅速恢复体能<br/>采集东北有\"蜂蜜品质翘楚\"之称的椴树蜜，滋润，营养丰富，易吸收<br/>保持体内钙质及水分平衡，保持神经系统的平衡和稳定，为运动提供持续动力', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1000621', '6906907101014', '1', '百事可乐330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1000621.jpg', '2.5', '百事可乐', '挡不住的畅快口感，给您前所未有的享受。<br/>无论是浪漫西餐还是传统中餐，均任意搭配。<br/>百事可乐伴您与家人朋友一起分享快乐时光。<br/>可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000622', '6954767422688', '1', '零度可乐330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1000622.jpg', '2.5', '零度可乐', '零度可乐，绝对可口。<br/>“零度”可口可乐用阿斯巴甜等取代糖分，使其虽然无糖却有甜味。', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000623', '6906907103018', '1', '百事美年达330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1000623.png', '2.5', '百事美年达', '美年达橙味酸甜橙味。<br/>活力快乐无限。', '2014-12-23 17:09:35', '', '', '330ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000627', '6902083881405', '1', '娃哈哈饮用水596ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1000627.jpg', '2', '娃哈哈', '15年不变的纯净，15年不变的爱，哇哈哈纯净水，品质一如既往。<br/>娃哈哈入市以来即得到新老客户长久以来的支持，以其超高的品质享誉业界。<br/>娃哈哈纯净水，以纯净、透明、自在的品质，得到了社会各界人士的青睐。<br/>娃哈哈纯净水，是家中常备的纯净水佳品，外出旅行，户外活动，都是您不错的选择。', '2014-12-23 17:09:35', '', '', '596ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000629', '6918976555599', '1', '雀巢优活饮用水550ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1000629.jpg', '2', '雀巢', '雀巢优活饮用水源自地下约240米深处的天然泉水，清冽爽口，天然纯净。是您健康饮水的上上之选，满足您随时、随地的补水需求；<br/>天然水源富含人体健康所需的天然矿物质成分，如钙、镁、钠、钾和碳酸氢盐等；<br/>采用深达约240米的不锈钢水井，充分保证了原水质在导出过程中不受任何污染。同时，采用世界尖端的生产工艺及设备生产，确保雀巢产品的高品质。', '2014-12-23 17:09:35', '', '', '550ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000630', '6901285991219', '1', '怡宝纯净水555ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1000630.jpg', '2', '怡宝', '采用世界上先进的二级反渗透方法精制而成，确保每一滴水水质纯净。<br/>不含有杂质或细菌，不含任何添加物，无色透明，可直接饮用。<br/>纯净水是以符合生活饮用水卫生标准的水为原水，密封于容器内。<br/>甘甜可口，即时补充人体流失水份，冷藏后饮用口感更佳。', '2014-12-23 17:09:35', '', '', '555ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000631', '6921317905038', '1', '康师傅矿物质水550ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1000631.jpg', '1', '康师傅', ' 饮水质量好坏对人体健康至关重要。康师傅矿物质水含钾镁，等游离态矿物质元素，补充人体所需，让身体保持健康与活力。喝的健康，生活更健康。', '2014-12-23 17:09:35', '', '', '550ml', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1000632', '6954767471976', '1', '冰露纯净水550ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1000632.jpg', '1', '冰露', '采用国际先进的净水设备，严格的水质检测和品质控制，确保了产品安全健康。<br/>全新流线型新瓶设计，简洁时尚，便于手握携带，随时随地即可畅饮。<br/>口感甘冽，清澈透明，冷藏后口感更佳，清凉解体渴。<br/>休闲旅游，运动，日常饮用均可。即时补充身体流失水分。', '2014-12-23 17:09:35', '', '', '550ml', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1000637', '6921168559176', '1', '农夫山泉天然水4L', '1000015', 'http://pictures-of-goods.qiniudn.com/1000637.jpg', '7.9', '农夫山泉', '农夫山泉选取天然的优质水源，仅对原水做最小限度的、必要的处理<br/>保存了原水中钾、钠、钙、镁、偏硅酸等对人体有益的矿物元素<br/>pH值为7.3±0.5，呈天然弱碱性，适于人体长期饮用。', '2014-12-23 17:09:35', '', '', '4L', '', '', '', '', '', '1', '0', '8.4');
INSERT INTO `product` VALUES ('1000639', '6920761215687', '1', '加加红烧酱油500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000639.jpg', '5.5', '加加', '加加 红烧酱油，充分晒制发酵而成，符合优质酱油对发酵工艺的严格要求。<br/>加加 红烧酱油 酱液呈褐色、清透纯净、上色久煮不变黑。<br/>加加 红烧酱油 ，营养丰富，自然鲜香，是您烹制健康美味菜肴的理想选择 。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000641', '6902902007122', '1', '厨邦酱油410ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000641.jpg', '8', '厨邦', '关键靠太阳晒，天然晒制、天然发酵。<br/>厨邦广东中山亚热带 沿江大晒场，位于阳光充足的北回归线附近，日照时间长，空气湿润！<br/>厨邦酱油就是在这沿江大晒场晒足180天，晒出美味，晒出鲜，晒出了原产广东、天然发酵、酱香浓郁、味道鲜美的酱油！<br/>厨邦老传统天然酿制方法，日晒夜露，天然发酵，色泽红润！', '2014-12-23 17:09:35', '', '', '410ml', '', '', '', '', '', '1', '0', '8.5');
INSERT INTO `product` VALUES ('1000642', '6922824075030', '1', '李锦记锦珍老抽500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000642.png', '6.5', '李锦记', '李锦记锦珍老抽 精选非基因大豆及小麦粉，以先进工艺精心酿造而成。生产过程层层把控、洁净生产环境、安全、健康、营养、给您带来美味享受！<br/>李锦记锦珍老抽 ，豉香自然而浓郁 。草菇精华、更添滋味 色泽红亮 易上色 适合用来红烧 炖。焖制各种菜肴，色香诱人 。<br/>寻常食材、经典的家常菜，做出好味道不寻常，李锦记锦珍老抽，是您和家人调配美味佳肴的健康选择！佐餐和烹调，特别适合于红烧、焖 、炖。', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000645', '6930628805913', '1', '老才臣料酒1.75l', '1000030', 'http://pictures-of-goods.qiniudn.com/1000645.jpg', '9', '老才臣', '以陈酿的黄酒为酒基配合多种香辛料，精制而成<br/>老才臣才臣料酒,可以解腥除膻、增香提鲜添味，专门适用于各种菜肴的烹饪', '2014-12-23 17:09:35', '', '', '1.75l', '', '', '', '', '', '1', '0', '9.5');
INSERT INTO `product` VALUES ('1000647', '6925436710191', '1', '精制料酒1.75l', '1000030', 'http://pictures-of-goods.qiniudn.com/1000647.jpg', '10.3', '王致和', '味道鲜美，具浓郁酒香气味！<br/>王致和精制料酒味道鲜美，具浓郁酒香气味，是凉拌和烹饪理想的调味佳品。', '2014-12-23 17:09:35', '', '', '1.75l', '', '', '', '', '', '1', '0', '10.8');
INSERT INTO `product` VALUES ('1000648', '6902007010775', '1', '恒顺香醋520ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000648.jpg', '5.2', '恒顺', '本品精选优质原材料，经发酵酿制而成。<br/>色泽呈玫瑰深红而剔透晶莹，香气纯正，酸味醇和，略带甘甜。<br/>恒顺 镇江香醋采用传统工艺与现代科技相结合，严苛酿制而成。<br/>本品制作工艺精良，取材考究，是家中必常备的餐饮佐料之一。', '2014-12-23 17:09:35', '', '', '520ml', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1000649', '6935599000312', '1', '陈世家五粮老陈醋500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000649.jpg', '6.5', '陈世家', '精选山西优质高粱，七蒸七酿，冬捞夏晒，五年陈酿<br/>色如紫琥珀，状似黑珍珠，纯粮精酿的香浓醇酸<br/>独特的“酸、浓、鲜、美”，令人久久回味', '2014-12-23 17:09:35', '', '', '500ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000651', '6921204802099', '1', '欣和六月香豆瓣酱800g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000651.jpg', '12.5', '欣和', '只做原酿酱，健康营养<br/>精选优质非转基因大豆精制而成<br/>90天以上足期发酵，不添加黄原胶及人工色素', '2014-12-23 17:09:35', '', '', '800g', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1000653', '6909689500006', '1', '六必居美味甜面酱150g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000653.jpg', '2.5', '六必居', '入口绵甜，口感风味独特<br/>咸甜适口，鲜香美味<br/>色泽鲜亮、酱香浓郁<br/>物美价廉，美味可口', '2014-12-23 17:09:35', '', '', '150g', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000654', '6909689600096', '1', '六必居芝麻酱300g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000654.jpg', '9.5', '六必居', '芝麻酱是群众非常喜爱的香味调味品之一。<br/>芝麻酱是采用优质白芝麻或黑芝麻等加工而成，成品为泥状，有浓郁的炒芝麻香味。<br/>它既是调味品，又有其独特的营养价值。可佐餐，可拌凉菜，亦可作为火锅的调味酱汁使用，全国各地均有生产。<br/>芝麻酱有黄色和黑色两种，以色正、味纯、无浮油、无杂质者为佳品。', '2014-12-23 17:09:35', '', '', '300g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1000655', '6930628800840', '1', '白腐乳290g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000655.jpg', '6.9', '老才臣', '方寸大小的腐乳，演绎四百年经典历程<br/>色泽基本一致、味道鲜美、咸淡适口、无异味、块形整齐、厚薄均匀、质地细腻、无杂质<br/>适合搭配各种菜肴，口味更佳', '2014-12-23 17:09:35', '', '', '290g', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1000656', '6907592000019', '1', '臭豆腐330g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000656.jpg', '6', '王致和', '百年传统秘制工艺制成，特有的硫脂气味。咸淡适口，滋味鲜美，臭中含香，风味诱人！', '2014-12-23 17:09:35', '', '', '330g', '', '', '', '', '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1000659', '6915249454641', '1', '潮盛橄榄菜170g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000659.jpg', '5.5', '潮盛', '潮盛 香港橄榄菜采用南国果“橄榄”及优质大芥菜精制而成，具有浓香可口、风味独特、回味无穷的特点，是白米粥的首选佐菜，有伴白米饭、伴面条、夹馒头、炒菜等多种食用方法，是美食之经典。<br/>橄榄菜是潮汕地区所特有的风味小菜，取橄榄甘醇之味，芥菜丰腴之叶煎制而成，具有“清、鲜、爽、嫩、滑”等特点，适合素食，可以说是名闻遐迩的潮州菜系中的一朵奇葩。', '2014-12-23 17:09:35', '', '', '170g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1000675', '6920010300218', '1', '糖业红糖500g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000675.jpg', '7', '糖业', '红糖按结晶颗粒不同，分为赤砂糖、红糖粉、碗糖等，因没有经过高度精练<br/>它们几乎保留了蔗汁中的全部成分，除了具备糖的功能外，还含有维生素和微量元素，如铁、锌、锰、铬等，营养成分比白砂糖高很多。', '2014-12-23 17:09:35', '', '', '500g', '', '', '', '', '', '1', '0', '7.5');
INSERT INTO `product` VALUES ('1000676', '6927109800437', '1', '小西瓜绵白糖400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000676.jpg', '6.5', '小西瓜', '白砂糖颗粒均匀整齐、晶莹亮白、松散干燥、无杂质，是食糖中含蔗糖多、纯度高的品种。<br/>产品洁白、松散、颗粒均匀、糖液溶于水清澈无沉淀，而且杂质少、色值低、水分少，具有蔗糖的自然香味，甜度足。', '2014-12-23 17:09:35', '', '', '400g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000677', '6900958883547', '1', '深井碘盐400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000677.jpg', '2', '中盐', '绿色低钠碘盐是以绿色食盐为原料，通过合理添加氯化钠精制而成。<br/>本产品严格执行中国绿色食品标准，理化指标和卫生指标均达到A级绿色食盐标准。<br/>吃好盐，选中盐，中盐 深井绿色低钠碘盐，点碘真情，健康中华。', '2014-12-23 17:09:35', '', '', '400g', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000678', '6917878002446', '1', '福临门玉米油900ml', '1000027', 'http://pictures-of-goods.qiniudn.com/1000678.jpg', '15.9', '福临门', '福临门 黄金产地非转基因玉米油，风味纯正、地道、香浓；福临门 黄金产地非转基因玉米油，少油烟、泡沫，煎、炒、煮、炸皆宜。<br/>福临门 黄金产地非转基因玉米油，经过精细筛选，颜色差异、表面存在缺陷或内部变质的不良玉米将被分拣出来，确保每颗玉米的优良品质。<br/>福临门 黄金产地非转基因玉米油，黄金品质，三分源自加工，七分来自原料。福临门黄金产地玉米油，精选北纬45°左右世界黄金玉米带非转基因玉米胚芽压榨而成。好胚芽，自然更爱心！', '2014-12-23 17:09:35', '', '', '900ml', '', '', '', '', '', '1', '0', '16.4');
INSERT INTO `product` VALUES ('1000679', '6941499100052', '1', '福临门非转基因压榨葵花籽油900ml', '1000027', 'http://pictures-of-goods.qiniudn.com/1000679.jpg', '18.9', '福临门', '福临门 非转基因压榨葵花籽油 原料经过严格筛选的玉米油等为原料，澄清透明、拌、炒、煎、炸均宜，橄榄油，自然爽口，色味诱 人，不油腻，口感特佳！<br/>福临门 非转基因压榨葵花籽油 是经压榨工艺精心制造而成,为非转基因产品，油体色泽金黄，香味浓郁,安全可靠，营养丰富，是烹制健康美味菜肴的理想选择!<br/>福临门 非转基因压榨葵花籽油 经过科学配比调和，在帮助人体达到饱和脂肪酸的同时，让炒菜没有油烟的困扰，超低油烟更健康！', '2014-12-23 17:09:35', '', '', '900ml', '', '', '', '', '', '1', '0', '19.4');
INSERT INTO `product` VALUES ('1000681', '6916766102114', '1', '福临门一级大豆油1.8L', '1000027', 'http://pictures-of-goods.qiniudn.com/1000681.jpg', '22.9', '福临门', '油品中大豆成分为转基因，精选优质原料，打造健康食用油，采用特殊工艺精炼而成，带有独特的大豆香味，色泽清透诱人，福临门是上海世博会唯一指定粮油产品品牌', '2014-12-23 17:09:35', '', '', '1.8L', '', '', '', '', '', '1', '0', '23.4');
INSERT INTO `product` VALUES ('1000683', '6926136766662', '1', '长寿花金胚玉米油5L', '1000027', 'http://pictures-of-goods.qiniudn.com/1000683.jpg', '75.9', '长寿花', '长寿花 金胚玉米油，选用非转基因玉米胚芽经压榨制成， 品质上乘，口味纯正。口味清淡而不腻，油色清透诱人，适宜煎、炒、煮、炸等用途，是调配美味佳肴的健康选择。<br/>长寿花金胚玉米油关爱家人，倡导3低健康膳食方式，合理膳食，降低过高的脂肪、热量及胆固醇的摄入水平，多吃清淡的、健康的、不油腻的食物，健康快乐生活。', '2014-12-23 17:09:35', '', '', '5L', '', '', '', '', '', '1', '0', '76.4');
INSERT INTO `product` VALUES ('1000684', '6941499100335', '1', '福临门大豆油一级5L', '1000027', 'http://pictures-of-goods.qiniudn.com/1000684.jpg', '49.9', '福临门', '油品中大豆成分为转基因，精选优质原料，打造健康食用油，采用特殊工艺精炼而成，带有独特的大豆香味，色泽清透诱人，福临门是上海世博会唯一指定粮油产品品牌', '2014-12-23 17:09:35', '', '', '5L', '', '', '', '', '', '1', '0', '50.4');
INSERT INTO `product` VALUES ('1000685', '6948195860273', '1', '香满园特选长粒香米5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1000685.jpg', '35', '香满园', '香满园长粒香米出生于粮油世家，是家族企业数十家，遍布中国和世界各地。于金龙鱼是同门兄弟。<br/>香满园长粒香米属于优秀的品种，清香柔韧，甘绵又富有弹性。<br/>香满园长粒香米成长受到精心的呵护--精选当年新米，烘干，储藏，生产全程低温，自然新鲜柔滑，香喷喷。<br/>香满园长粒香米管理非常严格，企业通过了ISO9001质量管理体系，HACCP食品安全管理体系，QS食品质量安全市场准入，8项关键品质指标都高于国家标准。', '2014-12-23 17:09:35', '', '', '5kg', '', '', '', '', '', '1', '0', '35.5');
INSERT INTO `product` VALUES ('1000687', '6925303714086', '1', '来一桶红烧牛肉面110g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000687.jpg', '4.1', '统一', '统一来一桶面一直以其多种丰富的口味，十足的份量，加上别有嚼劲的面身以及特别鲜浓的汤头，深受消费者喜爱。<br/>吃来一桶是一个享受的过程，让消费者在忙碌之余，在不需降低对生活品质的要求的同时，也能享受美味带来的满足。<br/>其不断带给消费者充电的满足感，更有助提升情绪，更好地迎接新挑战！', '2014-12-23 17:09:35', '', '', '110g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1000689', '6903252714210', '1', '康师傅老陈醋酸辣牛肉开心桶90g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000689.jpg', '3.8', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000690', '6903252014266', '1', '康师傅小鸡炖蘑菇开心桶90g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000690.jpg', '3.8', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000693', '6925303773106', '1', '来一桶老坛酸牛肉面132g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000693.jpg', '3.8', '统一', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '132g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000694', '6903252713930', '1', '康师傅葱烧排骨开心面90g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000694.jpg', '3.8', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1000697', '6903252033908', '1', '康师傅经典小鸡炖蘑菇面五包入85g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1000697.jpg', '12.5', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '85g*5', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1000698', '6903252715613', '1', '康师傅经典鲜虾鱼板面五包入85g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1000698.jpg', '12.5', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '85g*5', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1000699', '6903252074406', '1', '康师傅经典西红柿打卤面五包入85g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1000699.jpg', '12.5', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '85g*5', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1000701', '6903252022971', '1', '康师傅卤香牛肉面五包入', '1000033', 'http://pictures-of-goods.qiniudn.com/1000701.jpg', '13.5', '康师傅', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '14');
INSERT INTO `product` VALUES ('1000703', '6923644268480', '1', '真果粒牛奶饮品椰果果粒250ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000703.jpg', '3.6', '蒙牛', '蒙牛乳业建于1999年，作为国家农业产业化重点龙头企业，肩负着“百年蒙牛、强乳兴农”的使命<br/>奶源源自纯净的大草原上，零污染的牧场管理与奶源收集，致力于建立绿色、透明的乳制品产业链<br/>经过专职畜牧师和营养师精心挑选、养育的健康奶牛提供营养均衡的好奶，天然纯正好营养<br/>含多种维生素、矿物质和水果膳食纤维的水果粒，融合醇香牛奶，口感更爽滑，香甜好滋味', '2014-12-23 17:09:35', '', '', '250ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1000704', '6923644268503', '1', '真果粒牛奶饮品草莓果粒250ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1000704.jpg', '3.6', '蒙牛', '蒙牛乳业建于1999年，作为国家农业产业化重点龙头企业，肩负着“百年蒙牛、强乳兴农”的使命<br/>奶源源自纯净的大草原上，零污染的牧场管理与奶源收集，致力于建立绿色、透明的乳制品产业链<br/>经过专职畜牧师和营养师精心挑选、养育的健康奶牛提供营养均衡的好奶，天然纯正好营养<br/>含多种维生素、矿物质和水果膳食纤维的水果粒，融合醇香牛奶，口感更爽滑，香甜好滋味', '2014-12-23 17:09:35', '', '', '250ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1000705', '6923644275815', '1', '蒙牛百利纯牛奶200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1000705.jpg', '1.8', '蒙牛', '蒙牛纯牛奶纯正无添加，牛奶中的蛋白质、矿物质等营养成分，易被人体吸收<br/>滴滴好口味，带给您自然纯的好品质，让蒙牛牛奶伴您健康、快乐每一天。', '2014-12-23 17:09:35', '', '', '200ml', '', '', '', '', '', '1', '0', '2.3');
INSERT INTO `product` VALUES ('1000707', '6903148044933', '1', '飘柔家庭护理芦荟长效止痒滋润洗发露200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000707.jpg', '9.9', '飘柔', '产品功效：有效止痒滋润，持久清爽舒适。<br/>使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br/>注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。', '2014-12-23 17:09:35', '', '', '200ml', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1000708', '6903148094068', '1', '飘柔防掉发润发精华乳200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000708.jpg', '14.2', '飘柔', '产品功效：防掉发润发精华乳<br/>使用方法：洗发后，将适量产品均匀涂在湿发上，尽情享受轻柔的按摩，然后用清水冲洗。<br/>注意事项：避免入眼。若不慎入眼，即以清水彻底冲洗。', '2014-12-23 17:09:35', '', '', '200ml', '', '', '', '', '', '1', '0', '14.7');
INSERT INTO `product` VALUES ('1000710', '6902088311167', '1', '力士娇肤恒久嫩肤沐浴乳400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000710.jpg', '21.9', '力士', '全新LUX恒久嫩肤沐浴乳，特别添加莹润蚕丝精华和馥郁法国玫瑰，为肌肤注入轻盈水润，让你的肌肤丝般柔滑，散发清雅芬芳。<br/>升级配方令肌肤丝般柔嫩，革命性升级配方加倍呵护，每滴含百亿蚕丝精华，肌肤丝般柔滑感触非凡。<br/>蚕丝精华：迅速渗透肌肤，舒缓干燥角质，形成天然保护膜。<br/>法国玫瑰：高雅珍贵，浪漫迷人，馥郁芳香扑鼻而来，给人梦幻般的诱惑。', '2014-12-23 17:09:35', '', '', '400ml', '', '', '', '', '', '1', '0', '22.4');
INSERT INTO `product` VALUES ('1000711', '6902088310719', '1', '力士靓肤幻彩沐浴乳400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000711.jpg', '21.9', '力士', '全新LUX恒久嫩肤沐浴乳，特别添加莹润蚕丝精华和馥郁法国玫瑰，为肌肤注入轻盈水润，让你的肌肤丝般柔滑，散发清雅芬芳。<br/>升级配方令肌肤丝般柔嫩，革命性升级配方加倍呵护，每滴含百亿蚕丝精华，肌肤丝般柔滑感触非凡。<br/>蚕丝精华：迅速渗透肌肤，舒缓干燥角质，形成天然保护膜。<br/>法国玫瑰：高雅珍贵，浪漫迷人，馥郁芳香扑鼻而来，给人梦幻般的诱惑。', '2014-12-23 17:09:35', '', '', '400ml', '', '', '', '', '', '1', '0', '22.4');
INSERT INTO `product` VALUES ('1000712', '6902088701746', '1', '奥妙超效洗衣皂', '1000049', 'http://pictures-of-goods.qiniudn.com/1000712.jpg', '4.9', '奥妙', '请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗<br/>请认明衣物上的洗涤指示。先将要洗净部位用水泡湿，再使用洗衣皂洗净即可\n', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1000713', '6910019009755', '1', '雕牌透明皂232g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000713.jpg', '4', '雕牌', '阳光青柠香味，令洗衣全过程清新舒爽，幽香怡人。全家都喜欢！<br/>天然椰油配方，安全，泡沫丰富、去污迅速、经久耐用，有利衣物保持柔顺。<br/>泡沫丰富、易漂清，强力去污。<br/>易漂洗，省水省时省力。', '2014-12-23 17:09:35', '', '', '232g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000714', '6903148078945', '1', '汰渍净白去渍洗衣粉1.36kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1000714.jpg', '13.9', '汰渍', '有效成分充分溶于水，出众洁净不浪费<br/>特有优化泡沫配方设计，漂洗容易，省水省力<br/>清香怡人，给全家愉悦舒适的感受<br/>有效保持衣物颜色亮丽，适用全家各色衣物', '2014-12-23 17:09:35', '', '', '1.36kg', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1000715', '6903148078990', '1', '碧浪专业去渍无磷洗衣粉自然清新型1.7kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1000715.jpg', '23', '碧浪', '.超凡的洁净效果，甚至连干涸顽渍都可以去除<br/>让衣服焕出色彩 特有去陈亮彩科技更佳握感.<br/>含有纤维保护因子 防止污渍再沉积<br/>手洗温和 手洗机洗都出众', '2014-12-23 17:09:35', '', '', '1.7kg', '', '', '', '', '', '1', '0', '23.5');
INSERT INTO `product` VALUES ('1000716', '6902088701074', '1', '金纺清新柔顺瓶装1L', '1000050', 'http://pictures-of-goods.qiniudn.com/1000716.jpg', '15', '金纺', '请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗<br/>取适量本品，安装正确洗涤方法洗涤', '2014-12-23 17:09:35', '', '', '1L', '', '', '', '', '', '1', '0', '15.5');
INSERT INTO `product` VALUES ('1000717', '6902088701098', '1', '金纺怡神薰衣草1L', '1000050', 'http://pictures-of-goods.qiniudn.com/1000717.jpg', '14', '金纺', '请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗<br/>取适量本品，安装正确洗涤方法洗涤', '2014-12-23 17:09:35', '', '', '1L', '', '', '', '', '', '1', '0', '14.5');
INSERT INTO `product` VALUES ('1000718', '6902088704228', '1', '金纺衣物护理剂牛奶蝴蝶兰1L', '1000050', 'http://pictures-of-goods.qiniudn.com/1000718.jpg', '15', '金纺', '请置于幼儿不易拿到处。若不慎误食或误入眼中，请立即用大量清水冲洗<br/>取适量本品，安装正确洗涤方法洗涤', '2014-12-23 17:09:35', '', '', '1L', '', '', '', '', '', '1', '0', '15.5');
INSERT INTO `product` VALUES ('1000720', '6920354802331', '1', '高露洁草本牙膏90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000720.jpg', '4.5', '高露洁', '含草本精华，带给您健康清新口腔，高露洁和中华医药学会共同开展“草本健齿推广工程”，致力于口腔疾病的预防，增进全民口腔健康。要想牙齿清洁、健康。', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1000721', '4891338012577', '1', '黑人超白矿物盐牙膏90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000721.jpg', '9.5', '黑人', '含独特的HCS亮白因子，有助去除牙齿表面外源性色斑，令牙齿更亮白', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1000723', '6903148018194', '1', '佳洁士盐白牙膏清凉薄荷90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000723.jpg', '3.3', '佳洁士', '牙膏功能：美白/去牙渍/抗菌/健齿/口气清新<br/>适用对象：成人<br/>规格：单件装<br/>香味：薄荷香型', '2014-12-23 17:09:35', '', '', '90g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1000724', '6922868281114', '1', '心相印洁肤湿巾10片/包', '1000048', 'http://pictures-of-goods.qiniudn.com/1000724.jpg', '4', '心相印', '擦拭手、脸、皮肤等；避免用于眼睛、伤口及其他敏感部位', '2014-12-23 17:09:35', '', '', '10片/包', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000725', '6922868284283', '1', '心相印独立卫生湿巾10片/包', '1000048', 'http://pictures-of-goods.qiniudn.com/1000725.jpg', '4', '心相印', '擦拭手、脸、皮肤等；避免用于眼睛、伤口及其他敏感部位', '2014-12-23 17:09:35', '', '', '10片/包', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000726', '6922266443138', '1', '清风软抽面纸3包装/包', '1000046', 'http://pictures-of-goods.qiniudn.com/1000726.jpg', '14.9', '清风', '精选100%原生木浆精制而成，纸质天然洁净，细腻柔韧，擦拭更舒适<br/>纸质更柔软厚实，擦拭更舒适，吸水性好，沾水不易破裂；擦拭不易留纸屑，使用无尴尬', '2014-12-23 17:09:35', '', '', '3包装/包', '', '', '', '', '', '1', '0', '15.4');
INSERT INTO `product` VALUES ('1000727', '6901236373934', '1', '至有分量维达卫卷包', '1000045', 'http://pictures-of-goods.qiniudn.com/1000727.jpg', '25', '维达', '【产品名称】：至有分量系列140g有芯卫生卷纸<br/>【原材料】：100%原生木浆<br/>【产品规格】：140g/卷*10卷/提<br/>【纸张层数】：3层<br/>【纸张尺寸】：138mm*100mm/节<br/>【有无香味】：自然无香', '2014-12-23 17:09:35', '', '', '包', '', '', '', '', '', '1', '0', '25.5');
INSERT INTO `product` VALUES ('1000728', '6922266434174', '1', '清风超质感三层卷筒卫生纸3层10卷/提', '1000045', 'http://pictures-of-goods.qiniudn.com/1000728.jpg', '26', '清风', '100%原生木浆制成，450度高温度处理，产品全自动包装，避免二次污染，不添加荧光剂。', '2014-12-23 17:09:35', '', '', '3层10卷/提', '', '', '', '', '', '1', '0', '26.5');
INSERT INTO `product` VALUES ('1000729', '6923146102046', '1', '杜蕾斯3支装', '1000082', 'http://pictures-of-goods.qiniudn.com/1000729.jpg', '18', '杜蕾斯', '凸点超快感：表面密布凸点，全面增强摩擦，轻松找到兴奋点，快感不止多一点<br/>螺纹超刺激：独特螺纹设计，波浪式凸起，增加美女敢赌，给她更强烈的快感。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '18.5');
INSERT INTO `product` VALUES ('1000730', '6947849800399', '1', '华世银耳', '1000032', 'http://pictures-of-goods.qiniudn.com/1000730.png', '6.9', '华世', '银耳，又称白木耳、雪耳、银耳子等，有“菌中之冠”的美称。<br/>性平，味甘、淡、无毒，口感细腻绵纯。是大众所喜最喜爱的食材之一。<br/>采用环保包袋装。全部来自手工精选，饱满装袋。随用随取。<br/>自然美味更贴心，是日常食用家中必备的营养食品', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1000731', '6935420100211', '1', '古福木耳', '1000032', 'http://pictures-of-goods.qiniudn.com/1000731.jpg', '16.5', '古福', '木耳，别名黑木耳、白木耳、光木耳。<br/>色泽黑褐，质地柔软，味道鲜美，营养丰富。<br/>不但为中国菜肴大添风采，而且能养血驻颜，令人肌肤红润，容光焕发。<br/>被称为“中餐中的黑色瑰宝”！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '17');
INSERT INTO `product` VALUES ('1000732', '6926041899998', '1', '汇福一级大豆油5L', '1000027', 'http://pictures-of-goods.qiniudn.com/1000732.jpg', '47.9', '汇福', '采用国际先进工艺设备精炼而成，质优、色佳、油烟少，是我国最高质量等级的食用大豆油，煎、炸、炒、拌皆宜，是实惠型的食用油。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '48.4');
INSERT INTO `product` VALUES ('1000734', '6922507804087', '1', '陈克明高筋细园挂面1kg', '1000033', 'http://pictures-of-goods.qiniudn.com/1000734.jpg', '9.9', '陈克明', '陈克明面条，一面之交，终身难忘。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1000736', '6922507804377', '1', '陈克明长寿挂面1kg', '1000033', 'http://pictures-of-goods.qiniudn.com/1000736.jpg', '9.8', '陈克明', '陈克明面条，一面之交，终身难忘。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1000744', '6927242417011', '1', '国华武汉热干面武汉香辣味130g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000744.jpg', '6', '国华美食', '地道武汉风味！要得！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1000746', '6925303773915', '1', '统一100老坛酸菜牛肉面128g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000746.jpg', '2.5', '统一', '统一100 老坛酸菜牛肉面（香辣味）突破传统方便面制汤工艺，采用高汤浓缩技术。统一100 老坛酸菜牛肉面（香辣味）甄选上等食材，精心熬制，还原正宗好汤。本品浓而不腻，鲜香醇美，保留了最天然、纯正、鲜美的味道，吃法多样、操作便利。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000747', '6925303710187', '1', '统一红烧肉牛肉面103g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000747.jpg', '2.7', '统一', '顾名思义是吃起来方便的食品，是广大学生为了学习考试熬夜后的备战品，是上班族们，加班加点工作后的坚强后盾，是爱宅一族，避免出门，代步的亲密朋友……然而，事物总有两面性，总是吃一样的东西，难免会让人厌烦，下面就来教教大家方便面的多样吃法，操作方便，让你体验一次下方便面变身的奇幻旅程……', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3.2');
INSERT INTO `product` VALUES ('1000748', '6914790200332', '1', '光友酸辣粉丝65g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000748.jpg', '3', '光友', '采用红薯淀粉、木薯淀粉、玉米淀粉精致而成，口感丝滑。', '2015-01-15 18:02:36', '', '', '', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1000750', '6924671655151', '1', '萝卜条120g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000750.jpg', '2', '备德福', '色泽黄亮，清鲜爽嫩，可生食、争吵、煮汤、炖肉，皆香脆可口。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000752', '6926978209587', '1', '海明海带丝110g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000752.jpg', '2.5', '海明', '1、品牌保证，自产自销击穿价格底线！2、海带丝肉质嫩，厚实！3、色泽好，颜色率！4、实用便捷，面切丝，简单易操作！5、更适合老人和孩子！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000753', '6900230851707', '1', '红山方便低盐榨菜70g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000753.jpg', '1', '红山', '本产品采用驰名中外的中国四川榨菜为原料，加辅料后用传统工艺制作；真空包装，高温灭菌而成。其风味：鲜、香、嫩、脆。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1000754', '6911858203489', '1', '惠通黄花什锦菜180g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000754.jpg', '3.5', '惠通', '口味独特，回味无穷。佐酒、下饭的美味食品，是馈赠亲友之佳品。开袋即食。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000755', '6928257422564', '1', '久久红儿童蜂蜜榨菜128g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000755.jpg', '1.5', '久久红', '“久久红”榨菜等系列产品原料悉来自优质绿色食品示范基地，采用先进的脱盐加工工艺，经科学配方高温杀菌精制而成。绿色、健康、美味、营养、方便的“久久红”', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2');
INSERT INTO `product` VALUES ('1000757', '6928257423073', '1', '久久红榨菜丝158g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000757.jpg', '2.2', '久久红', '选用上等榨菜，加入食盐、菜籽油等原料制成， 入口鲜香脆嫩、风味独特。产品开袋即食，既可佐餐，又可拌炒，同时又是携带方便的休闲食品。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1000758', '6921015211240', '1', '老马涮羊肉调料香辣味160g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000758.jpg', '4', '老马', '老马清真产品经久不衰的成功与畅销，归功于对美味和高品质的专注，以及每一位员工对清洁与真诚的崇尚。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000759', '6921015211233', '1', '老马涮羊肉调料鲜香味160g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000759.jpg', '4', '老马', '老马清真产品经久不衰的成功与畅销，归功于对美味和高品质的专注，以及每一位员工对清洁与真诚的崇尚。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000762', '6928546000558', '1', '留香园碱面250g', '1000029', 'http://pictures-of-goods.qiniudn.com/1000762.jpg', '3.5', '留香园', '食用碱可在小麦粉制品及糕点中使用，通常用于制作馒头、面条、熬粥等，亦可作家庭清洗剂，制作馒头时适量添加于发酵面团中，以中和起酸性，制作面条时，加入面粉（小麦粉）中，则可使面条增加弹性和延展性，易煮熟，爽口，有独特的风味，其用量一般为0.1%-1.0%，熬粥时少量添加可增加沾稠度。用于清洗剂时，添加适量至温水中即可达到良好的效果', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000763', '6925212800214', '1', '鑫利牌姜粉20g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000763.jpg', '2', '鑫利', ' 精选优质生姜精心研磨制作而成，粉质细腻，浓香四溢，色泽淡黄，具有强烈的鲜香美味，安全健康，口味纯正，别有风味，让你生活有滋有味。不含防腐剂，运用“鲜味相乘”的原理，搭配出最佳效果，使菜肴更加美味，素菜清淡中不失鲜醇，荤菜浓郁中更添鲜香，让您尽享独特的舌尖美味。精致小巧，携带方便，是您尝鲜美食常备的绝妙佐料。少许即令菜肴鲜美无比，用于烹调各种荤素菜肴及面类，汤类食品，风味绝佳！是厨房、烹饪、尝鲜美食的好帮手。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000764', '6925212800023', '1', '鑫利30g炖肉王', '1000030', 'http://pictures-of-goods.qiniudn.com/1000764.jpg', '2', '鑫利', '炖出你想要的味道！炖出你爱的美味！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000765', '6925212800658', '1', '50g鑫利麻椒', '1000030', 'http://pictures-of-goods.qiniudn.com/1000765.jpg', '5.2', '鑫利', '麻椒可配置椒盐，做凉拌菜，更适用于炒、炖、酱、卤、煮汤等', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1000767', '6923424301543', '1', '古松辣椒粉30g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000767.jpg', '2.5', '古松', '研磨好的辣椒面要彻底晾凉以后才能装入密封袋保存 否则容易回潮变质。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1000768', '6935420100297', '1', '古福桂皮50g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000768.jpg', '2', '古福', '选用优质桂皮精心制作而成，生产过程层层把控、洁净生产环境、安全、健康、营养、给您带来美味享受！原料优质、洁净、浓香四溢、天然纯正，使菜肴更加美味，素菜清淡中不失鲜醇，荤菜浓郁中更添鲜香，让您尽享独特的舌尖美味，是您尝鲜美食常备的绝妙佐料！少许即令菜肴鲜美无比，用于烹调各种荤素菜肴及面类，熏腌制品、拌馅、卤汁和面拖，风味绝佳！是厨房、烹饪、尝鲜美食的好帮手。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000769', '6940545600836', '1', '嘉兴小茴香50g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000769.jpg', '2', '嘉兴', '选用上等的茴香为原料精心制作而成，品质天然，口味纯正。小茴香颗粒饱满，大小均匀，蕴含淡淡的清香味，做菜时放入，别具一番风味。经现代先进的工艺加工制作，使营养充分保留，美味更健康。塑料质地包装，简洁大方，食用简单，是您厨房的好帮手。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1000770', '6901377031007', '1', '莲花味精100g80%', '1000030', 'http://pictures-of-goods.qiniudn.com/1000770.jpg', '1.9', '莲花', '居家炒菜的好帮手！让您的菜肴变得更加美味！！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1000771', '6922130103038', '1', '太太乐增鲜味精100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000771.jpg', '3.3', '太太乐', '20年来，太太乐一直坚持采用鲜鸡作为风味鸡料，以保证每一罐太太乐鸡精的上等口感，最大限度还原鲜鸡风味。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1000772', '6922130101485', '1', '太太乐鸡精200g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000772.jpg', '9.5', '太太乐', '20年来，太太乐一直坚持采用鲜鸡作为风味鸡料，以保证每一罐太太乐鸡精的上等口感，最大限度还原鲜鸡风味。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1000773', '6902275456527', '1', '红梅80%味精400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000773.jpg', '6.8', '红梅', '居家炒菜的好帮手！让您的菜肴变得更加美味！！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1000777', '6927109808631', '1', '小西瓜精砂糖400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000777.jpg', '6.5', '小西瓜', '白砂糖颗粒均匀整齐、晶莹亮白、松散干燥、无杂质，是食糖中含蔗糖多、纯度高的品种。产品洁白、松散、颗粒均匀、糖液溶于水清澈无沉淀，而且杂质少、色值低、水分少，具有蔗糖的自然香味，甜度足。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000778', '8908938883301', '1', '中盐400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000778.jpg', '2.6', '中盐', '绿色低钠碘盐是以绿色食盐为原料，通过合理添加氯化钠精制而成。本产品严格执行中国绿色食品标准，理化指标和卫生指标均达到A级绿色食盐标准。吃好盐，选中盐，中盐 深井绿色低钠碘盐，点碘真情，健康中华。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1000779', '6954534200204', '1', '田人冰糖200g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000779.jpg', '4', '田人', '经先进生产工艺设备精制加工而成，使营养充分保留。从源头控制品质，质量检验，确保生产工序的质量。古松单晶冰糖颗粒均匀整齐、糖质坚硬、干燥无杂质。口感甘甜爽口，不添加任何食品添加剂，绿色安全。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000781', '6923775923821', '1', '香格里无沙紫菜30g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000781.jpg', '4.5', '香格里', '选用上等的紫菜为原料精心制作而成，品质上乘，天然健康。经现代先进的工艺加工制作，使营养充分保留，美味更独特。紫菜颜色暗绿，有浓浓的海的香气，做菜时放入别具一番风味。塑料质地包装，简洁大方，食用简单，是您厨房的好帮手。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1000782', '6935420100259', '1', '古福银耳38g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000782.jpg', '6', '古福', '银耳，又称白木耳、雪耳、银耳子等，有“菌中之冠”的美称。性平，味甘、淡、无毒，口感细腻绵纯。是大众所喜最喜爱的食材之一。采用环保包袋装。全部来自手工精选，饱满装袋。随用随取。自然美味更贴心，是日常食用家中必备的营养食品。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1000783', '6935420100549', '1', '古福黄花菜80g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000783.jpg', '5.3', '古福', '黄花菜含有丰富的卵磷脂，凉拌，炒食，作为配菜或主菜与鸡蛋、肉类、冬菇，等搭配做菜等等。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1000785', '6947849800764', '1', '华世峰源纯豆腐竹200g', '1000032', 'http://pictures-of-goods.qiniudn.com/1000785.jpg', '7', '华世', '本品是以大豆为原料，经先进工艺精制而成，本品不含吊白块，食用方便。色泽黄白油光透亮，豆香味浓郁，食之清香爽口，别有风味。食用方法：用清水浸泡3-5分钟即可发开。可荤、素、烧、炒、凉拌、汤食等。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7.5');
INSERT INTO `product` VALUES ('1000786', '6933414100919', '1', '双塔火锅炖粉300g', '1000030', 'http://pictures-of-goods.qiniudn.com/1000786.jpg', '8', '双塔', '腐竹又称腐皮或豆腐皮，是很受欢迎的一种汉族传统食品，也是华人地区常见的食物原料，具有浓郁的豆香味，同时还有着其他豆制品所不具备的独特口感。腐竹色泽黄白，油光透亮，含有丰富的蛋白质及多种营养成分，用清水浸泡（夏凉冬温）3～5小时即可发开。可荤、素、烧、炒、凉拌、汤食等，食之清香爽口，荤、素食别有风味。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '8.5');
INSERT INTO `product` VALUES ('1000787', '6954558866752', '1', '鑫盛隆龙口粉丝200g', '1000033', 'http://pictures-of-goods.qiniudn.com/1000787.jpg', '3.5', '鑫盛隆', '本品以优质绿豆为原料，优良的水源，充足的光照，经先进的封闭式流水线生产工艺和严格的品质管理精制而成。龙口粉丝传承古早制面手艺、配上现代化完善设备，保有传统风味，营养更健康。龙口粉丝条细透明、口感滑嫩、纯天然、绿色放心产品，易于保存、取食简单、可炖、炒、煮、凉拌等。', '2015-01-15 18:03:23', '', '', '', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000788', '6920354810107', '1', '高露洁冰凉薄荷牙膏90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000788.jpg', '8.5', '高露洁', '【商品名称】：高露洁全面防蛀清新香型牙膏，【规格】：250g，【香型】：清新香型，【使用方式】：每天至少刷牙2次或遵医嘱，【注意】：6岁及以下儿童每次使用豌豆大小的牙膏，并在成人指导下使用牙刷，以减少吞咽。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000789', '4891338005692', '1', '黑人双重薄荷牙膏90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000789.jpg', '7.5', '黑人', '清新口气，口感冰凉，味道怡人。有效洁齿，防蛀保护。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1000790', '6902591031033', '1', '蓝天六必治中草药牙膏120g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000790.jpg', '4.5', '蓝天', '六必治，是蓝天集团旗下的中药养护牙膏品牌，是中国驰名商标。该品牌传承了蓝天集团（始于1911年）的百年中药养护技术，专业预防及解决牙龈出血、肿痛、口腔溃疡、蛀牙、酸冷刺痛、口腔异味、牙菌斑和牙渍等常见的口腔问题，养护口腔健康。其广告语“刷六必治，牙好吃嘛嘛香”更是耳熟能详，深受消费者的喜爱。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1000791', '6901890126402', '1', '两面针强效精华牙膏105g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000791.jpg', '3.5', '两面针', '两面针牙膏是柳州两面针股份有限公司出品的主导产品，为中国名牌产品。两面针牙膏采用两面针等多种中草药活性成分、和天然草本精华，具有消除牙痛、清新口气、缓解牙龈红肿、改善口腔问题等功效，是行业内最早拥有临床数据证实有效减少牙龈出血的口腔保健类牙膏，连续20多年在国内产品中产销量第一。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000792', '6902132007060', '1', '冷酸灵抗过敏牙膏90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000792.jpg', '2.9', '冷酸灵', '56载“齿”之以恒，专研抗敏在升级！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1000793', '6908791002798', '1', '三全灌汤水饺素三鲜450g', '1000073', 'http://pictures-of-goods.qiniudn.com/1000793.jpg', '8.5', '三全', '在中华美食中，灌汤工艺可谓独树一帜，其美味精华尽在这神秘的“汤”。而以往的众多灌汤水饺却往往忽视了“汤”的重要性。三全发扬了灌汤工艺的精髓，用心于灌汤工艺的升华，为消费者奉献出又一款美味水饺——三全新装珍鲜灌汤水饺！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000794', '6908791008639', '1', '三全灌汤水饺猪肉荠菜450g', '1000073', 'http://pictures-of-goods.qiniudn.com/1000794.jpg', '8.5', '三全', '在中华美食中，灌汤工艺可谓独树一帜，其美味精华尽在这神秘的“汤”。而以往的众多灌汤水饺却往往忽视了“汤”的重要性。三全发扬了灌汤工艺的精髓，用心于灌汤工艺的升华，为消费者奉献出又一款美味水饺——三全新装珍鲜灌汤水饺！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000795', '6921665707940', '1', '三全灌汤水饺三鲜450g', '1000073', 'http://pictures-of-goods.qiniudn.com/1000795.jpg', '8.5', '三全', '在中华美食中，灌汤工艺可谓独树一帜，其美味精华尽在这神秘的“汤”。而以往的众多灌汤水饺却往往忽视了“汤”的重要性。三全发扬了灌汤工艺的精髓，用心于灌汤工艺的升华，为消费者奉献出又一款美味水饺——三全新装珍鲜灌汤水饺！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000796', '6908791002095', '1', '三全灌汤水饺猪肉芹菜450g', '1000073', 'http://pictures-of-goods.qiniudn.com/1000796.jpg', '8.5', '三全', '在中华美食中，灌汤工艺可谓独树一帜，其美味精华尽在这神秘的“汤”。而以往的众多灌汤水饺却往往忽视了“汤”的重要性。三全发扬了灌汤工艺的精髓，用心于灌汤工艺的升华，为消费者奉献出又一款美味水饺——三全新装珍鲜灌汤水饺！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000801', '6920564190013', '1', '水塔陈醋420ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000801.jpg', '6', '水塔', '酿制食醋因其原料在发酵过程中产生丰富的氨基酸和蛋白质，在摇晃醋瓶时，会产生丰富的泡沫，且持久不消。配制食醋由粮食、果实、酒类为原料酿制而成，配料大部分为高粱、大麦、糠皮等粮食谷物。秉“蒸、酵、熏、淋、陈”之传统工艺，手工酿制，醋香环塔，久而不散。精美玻璃瓶包装，易于储存保鲜，是厨房常备品的上佳选择。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1000802', '6933733600459', '1', '新泉老陈醋420ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000802.jpg', '4.8', '新泉', '老陈醋是山西省的汉族传统名产，属于中国四大名醋之一，它的生产至今已有3000余年的历史，素有“天下第一醋”的盛誉。山西老陈醋以色、香、醇、浓、酸五大特征著称于世。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1000803', '6930628801472', '1', '老才臣凉拌醋500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000803.jpg', '7.6', '老才臣', '老才臣食品集美食文化之精华，率先引进日、韩先进的生产工艺流程，结合国内外先进生产管理手段，运用现代企业管理理念创中华调味品及休闲食品之最。方寸大小的腐乳，演绎四百年经典历程；滴滴醇香酱油，浓缩不朽文化真情；口感细腻，具有特殊浓郁熏木香味的烤蛋，凝聚中、韩能工巧匠之精髓。老才臣人承诺：一流卫生、星级服务，把健康与美味送给千家万户。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '8.1');
INSERT INTO `product` VALUES ('1000804', '6902882050873', '1', '恒顺米醋500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1000804.jpg', '6.5', '恒顺', '色泽明亮，体态澄清、酸味醇浓，用途广泛。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1000805', '6908802433573', '1', '龙门米醋1L', '1000030', 'http://pictures-of-goods.qiniudn.com/1000805.jpg', '6.9', '龙门', '龙门米醋精选优质的原材料，结合传统工艺，以现代技术精制而成。米醋和陈醋的不同在于原材料。米醋是用谷子、高粱、糯米、大麦、玉米、红薯、酒糟、红枣、苹果、葡萄、柿子等粮食和果品为原料，经过发酵酿造而成的。米醋的特点是色泽玫瑰红色而透明，香气纯正，酸味醇和，略带甜味，适用于蘸食或炒菜。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1000808', '6924116120046', '1', '华群牛肉香辣三丁300g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000808.jpg', '8.4', '华群', '正宗川菜之所以有其特点，以味取胜，与其所用的调味品有着密切的关系，而我公司所生产的调味品具有此特点。我公司成立于1980年，是一家老子号调味品生产销售企业。我公司本着务实创新、诚信的精神，迅速发展成为四川调味品市场的带头企业之一。质量第一、信誉为本、平等互利、共同发展”是我公司一贯奉行的宗旨。我们愿与各界朋友和新老客户建立和发展良好的贸易和合作关系，共创美好的明天', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '8.9');
INSERT INTO `product` VALUES ('1000809', '6911858012296', '1', '惠通拌饭香210g', '1000031', 'http://pictures-of-goods.qiniudn.com/1000809.jpg', '7.5', '惠通', '营养健康，新鲜美味，安全高质。四川味道，食用方便，也可选择您喜爱的各类食材制作。用心做每一份产品，让顾客吃的放心。万千精彩滋味竟在其中。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1000810', '6927099400563', '1', '杰士邦爽滑倍润3支装', '1000082', 'http://pictures-of-goods.qiniudn.com/1000810.jpg', '9.9', '杰士邦', '原料品质优秀。“杰士邦”是拥有自营橡胶种植园的安全套专业公司，其在远东的橡胶基地——马来西亚橡胶种植园，保证了“杰士邦”产品原料的可靠供应。马来西亚有世界上质量最好的天然乳胶，并且四季恒温、环境清洁，极为适宜乳胶产品的生产和储运。橡胶的品质是决定安全套品质的关键因素。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1000812', '6932564410039', '1', '第六感螺纹12支装', '1000082', 'http://pictures-of-goods.qiniudn.com/1000812.jpg', '24.5', '第六感', '本品能够安全有效避孕。在正确使用方式下，可降低感染艾滋病和其他性病的机会，例如病原体、生殖道疱疹、淋病、梅毒等。使用时无任何异物感，能最充分的激发快感。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '25');
INSERT INTO `product` VALUES ('1000813', '6940756220106', '1', '云南白药创可贴2/片', '1000074', 'http://pictures-of-goods.qiniudn.com/1000813.jpg', '1', '云南白药', '止血、镇痛、消炎、愈创。用于小面积开放性外科创伤。清洁创面，从防粘胶纸上揭下云南白药创可贴，使药带贴于创面，松紧适当即可。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1000814', '6916999320019', '1', '邦迪透明防水创可贴5/片', '1000074', 'http://pictures-of-goods.qiniudn.com/1000814.jpg', '5', '邦迪', '温馨提示：需要了解更多有关邦迪 透明防水创可贴 上海强生 5片说明书、价格、效果、适应症、不良反应、以及邦迪透明防水创可贴疗效、厂家、用法用量、禁忌和注意事项等信息。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.5');
INSERT INTO `product` VALUES ('1000816', '6901236379790', '1', '维达喜洋洋手帕纸3层*10包', '1000047', 'http://pictures-of-goods.qiniudn.com/1000816.jpg', '8.5', '维达', '质感压花技术，无增白剂，自然柔白。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1000817', '6910019009885', '1', '雕牌超效加酶洗衣粉1.28kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1000817.jpg', '11.8', '雕牌', '适用于清洗棉、麻、化学纤维、混纺等质地的衣物与织品', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '12.3');
INSERT INTO `product` VALUES ('1000818', '6920174735697', '1', '立白无磷洗衣粉1.068kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1000818.jpg', '11.9', '立白', '立白超洁清新洗衣粉能使衣物亮白如新，不伤手。立白超洁清新洗衣粉特含清香田园花香，清新除异味。立白超洁清新洗衣粉能使衣物亮白如新。立白超洁清新洗衣粉低泡易漂用量少洁净快。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1000819', '6903148079386', '1', '碧浪清雅茉莉洗衣粉300g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000819.jpg', '4', '碧浪', '特有创新性ENZYMAX配方，七天顽渍轻松洗净；去陈亮彩，衣物色彩亮丽，特有碧浪“纤维护理酶技术”和“增艳因子”；保护纤维，柔护衣物，宝宝衣服和内衣也适用；馨香因子，淡淡自然清香，浓郁而不浓重，清新而持久。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1000820', '6903148153086', '1', '碧浪自然清新洗衣粉480g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000820.jpg', '6.9', '碧浪', '1.超凡的洁净效果，甚至连干涸顽渍都可以去除。2.让衣服焕出色彩 特有去陈亮彩科技更佳握感。3.含有纤维保护因子 防止污渍再沉积。4.手洗温和 手洗机洗都出众。5.散发淡淡清香。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1000821', '6903148078891', '1', '汰渍净白去渍清香洗衣粉508g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000821.jpg', '5.1', '汰渍', '有效成分充分溶于水，出众洁净不浪费。特有优化泡沫配方设计，漂洗容易，省水省力。清香怡人，给全家愉悦舒适的感受。有效保持衣物颜色亮丽，适用全家各色衣物。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.6');
INSERT INTO `product` VALUES ('1000822', '6920174736960', '1', '立白超洁清新洗衣粉245g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000822.jpg', '3.5', '立白', '立白超洁清新洗衣粉能使衣物亮白如新，不伤手。立白超洁清新洗衣粉特含清香田园花香，清新除异味。立白超洁清新洗衣粉能使衣物亮白如新。立白超洁清新洗衣粉低泡易漂用量少洁净快。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1000823', '6910019010027', '1', '雕牌冷水洗衣粉508g', '1000049', 'http://pictures-of-goods.qiniudn.com/1000823.jpg', '4.9', '雕牌', '铃兰清香宁洗衣全过程舒爽愉悦，衣物洗后清爽留香。全新配方，溶解更快，去污更强，用量更省。迅速深入衣物纤维，能有效去除污渍。泡沫适中，漂洗容易，省水省力。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1000824', '6903148093757', '1', '潘婷弹性卷发洗发水400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000824.jpg', '28', '潘婷', '弹性修护，重现丰盈灵动卷曲 PRO-V维他命原：神奇修护精华，深入渗透修护，滋养直至发芯，重塑秀发的健康强韧。 全球首创角蛋白损伤隔离因子：帮助隔离外界损伤对发丝蛋白的侵蚀，保护发芯结构，抑制损伤加重', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '28.5');
INSERT INTO `product` VALUES ('1000825', '6903148048955', '1', '飘柔焗油去屑洗发露400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000825.jpg', '25.5', '飘柔', '与西方消费者不同，在中国女性的心目中，美丽秀发的标准永远都是柔柔亮亮，顺滑易梳。潮流来来去去，惟独这点从未改变。这也正是飘柔十六年来一直致力带给中国女性的。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '26');
INSERT INTO `product` VALUES ('1000826', '6903148045084', '1', '海飞丝乌黑强韧洗发露400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000826.jpg', '36.8', '海飞丝', '特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '37.3');
INSERT INTO `product` VALUES ('1000827', '6903148045114', '1', '海飞丝海洋活力洗发露400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000827.jpg', '36', '海飞丝', '特有去屑滋润双效配方，帮助提升去屑及润发效果，润泽不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '36.5');
INSERT INTO `product` VALUES ('1000828', '6903148091463', '1', '采乐柔顺洗发露200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000828.jpg', '12', '采乐', '植物精油能迅速进入头皮内部，深入头发发根，将营养成分输送至发根，发根迅速吸收来自精油的营养成分', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '12.5');
INSERT INTO `product` VALUES ('1000829', '6903148047811', '1', '舒肤佳柠檬清香沐浴露400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000829.jpg', '19.5', '舒肤佳', '有效清洁肌肤表面杂质，保护肌肤健康，给家人全身的保护；天然柠檬清香，带给全家清新的沐浴体验，深度清洁，让肌肤爽洁健康。丰富泡沫，温和不刺激，适合全家每天使用。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '20');
INSERT INTO `product` VALUES ('1000830', '6903148217818', '1', '舒肤佳清爽特惠装400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000830.jpg', '38', '舒肤佳', '柠檬清新，如水般温和清洁，不含皂基，肌肤感觉柔滑不干燥，全新升级迪保肤+，持久保护全家健康。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '38.5');
INSERT INTO `product` VALUES ('1000831', '6903148170632', '1', '玉兰油沐浴露水嫩清爽400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1000831.jpg', '18.9', '玉兰油', '帮助维持肌肤水分；让你全身上下柔嫩细滑、水感清透；有效去除多余油脂污垢，易冲洗，不油腻；即使身处闷热夏天，也能感觉清爽冰透，体验弹、滑、嫩美肌。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '19.4');
INSERT INTO `product` VALUES ('1000832', '6902088304237', '1', '夏士莲粉瑰嫩白香皂', '1000060', 'http://pictures-of-goods.qiniudn.com/1000832.jpg', '3.6', '夏士莲', '蕴含牛奶精华和玫瑰香氛，嫩白养肤。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1000833', '6902088312812', '1', '力士恒久嫩肤香皂115g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000833.jpg', '4.8', '力士', '如凝脂般水润的娇嫩肌肤，令人心驰神往，不禁想要轻轻碰触。全新力士恒久嫩肤娇肤香皂，特有蚕丝精华，是一种天然护肤因子，提取于蚕丝中，能够保湿锁水。融入法国玫瑰精华和天然精粹樱桃籽油，沐浴时，缔造出持久香氛和丰润的柔肤泡沫，滋养肌肤，让肌肤享受樱桃般水润娇嫩，时刻沐浴艳羡目光！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1000834', '6902088312805', '1', '力士清香爽肤香皂115g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000834.jpg', '4.8', '力士', '如凝脂般水润的娇嫩肌肤，令人心驰神往，不禁想要轻轻碰触。全新力士恒久嫩肤娇肤香皂，特有蚕丝精华，是一种天然护肤因子，提取于蚕丝中，能够保湿锁水。融入法国玫瑰精华和天然精粹樱桃籽油，沐浴时，缔造出持久香氛和丰润的柔肤泡沫，滋养肌肤，让肌肤享受樱桃般水润娇嫩，时刻沐浴艳羡目光！', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1000835', '6903148144442', '1', '舒肤佳柠檬型115g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000835.jpg', '4.7', '舒肤佳', '有效清洁肌肤表面杂质，保护肌肤健康，给家人全身的保护；天然柠檬清香，带给全家清新的沐浴体验，深度清洁，让肌肤爽洁健康。丰富泡沫，温和不刺激，适合全家每天使用。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.2');
INSERT INTO `product` VALUES ('1000836', '6903148144459', '1', '舒肤佳芦荟护肤型香皂115g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000836.jpg', '4.7', '舒肤佳', '芦荟与甘油配方，肌肤每寸柔软光滑，保持肌肤自然润泽，高效除菌、长效抑菌，清洁肌肤表面杂质', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.2');
INSERT INTO `product` VALUES ('1000837', '6903148144541', '1', '舒肤佳纯白清香型香皂115g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000837.jpg', '4.7', '舒肤佳', '二十年经典呵护，亿万家庭沐浴之选；二十年经典清香；高效除菌 长效抑菌；清洁肌肤表层杂质。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.2');
INSERT INTO `product` VALUES ('1000839', '6901294171756', '1', '六神清凉香皂125g', '1000060', 'http://pictures-of-goods.qiniudn.com/1000839.jpg', '5', '六神', '天然草本成分-冰片，清新润泽不粘腻，令肌肤持久的冰凉畅快。含中草药精粹“六神原液”带给肌肤持久的爽滑体验，劲透冰爽香气。泡沫丰富细腻，有效祛除肌肤汗味；肌肤健康无忧，清凉型香皂。盒内更添加塑袋，好品质为您保留；清新润泽，全家共享。', '2014-12-23 17:09:35', '', '', '', '', '', '', '', '', '1', '0', '5.5');
INSERT INTO `product` VALUES ('1030001', '6921804700306', '1', '陶华碧 精制牛肉末豆豉油辣椒 210g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030001.jpg', '8.9', '陶华碧', '传统工艺精心酿造，具有优雅细腻，香辣突出，回味悠长等特点。优选上等优质辣椒，百分百手工制作，正宗农家风味黑豆豉，选用优质黄豆，传统工艺古法发酵，绝对不加防腐剂，健康卫生。', '2014-12-23 17:09:35', '', '120', '210g', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030002', '6902265210504', '1', '海天 草菇老抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030002.jpg', '8.5', '海天', '精选优质原料，味道鲜美醇厚', '2014-12-23 17:09:35', '', '548', '500ml', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1030003', '6902022137396', '1', '蓝月亮 自然亮白增艳洗衣液 1kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1030003.jpg', '17.5', '蓝月亮', '亮白增艳 独特亮白增艳技术，调理衣物颜色，令白衣更洁白，彩衣更鲜艳!深层洁净 突破性高效洁净因子，深入衣物纤维，轻松瓦解多种顽固污溃，令衣物从里到外洁净如新!低泡易漂 独特泡沫控制技术.只需1-2次即可漂请，易漂洗无残留，洗涤更节水!高浓度 高浓度液体配方，只需一点点，就可以洗净整筒衣物!', '2014-12-23 17:09:35', '', '1080', '1kg', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030004', '6925303754136', '1', '统一 白桃味绿茶 500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030004.jpg', '2.6', '统一', '选取新鲜嫩茶 富含茶多酚 天然健康好茶。口感纯正 将时尚与健康完美融入自然茶味之中口感纯正，清新怡人。精湛工艺 采用独特工艺精工而成，严格质量把，确保每口茶都是好茶.', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030007', '6926265313515', '1', '上好佳 洋葱圈特惠装 80g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030007.jpg', '5.5', '上好佳', '超大包装，更适于分享 开袋即食，方便卫生', '2014-12-23 17:09:35', '', '270', '80g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030008', '6943052100127', '1', '恒大冰泉 长白山天然矿泉水 1.25L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030008.jpg', '6.6', '恒大冰泉', '黄金水源，深层矿泉，呈天然弱碱性，均衡富含20多种人体所需的微量元素', '2014-12-23 17:09:35', '', '540', '1.25L', '', '', '', '', '', '1', '0', '7.1');
INSERT INTO `product` VALUES ('1030009', '6902022130885', '1', '蓝月亮 袋装洗手液 500g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030009.jpg', '9.6', '蓝月亮', '芦荟抑菌，滋润保湿，手部护理，好的洗手液，抑菌更滋润 ', '2014-12-23 17:09:35', '', '1080', '500g', '', '', '', '', '', '1', '0', '10.1');
INSERT INTO `product` VALUES ('1030010', '6903252023183', '1', '康师傅 卤香牛肉面 103g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1030010.jpg', '12.2', '康师傅', '康师傅坚持对质量的坚持、诚信、务实、创新，追求卓越；精心制作 精选卤料、黄金配比，秘制香菇、丰富营养；营养美昧 秘制香菇卤香牛肉面，香浓过瘾，妙不可言;卤香浓、菇营养；量贩装 5包入量贩装，食用更方便，给美味添乐趣', '2014-12-23 17:09:35', '', '180', '103g*5', '', '', '', '', '', '1', '0', '12.7');
INSERT INTO `product` VALUES ('1030011', '6923450605738', '1', '绿箭  35粒黑加仑子味薄荷糖 23.8g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030011.jpg', '9.3', '绿箭', '益达兄弟品牌 早上，饭后，烟后，携带方便，清新口气 更亲近更自信 箭牌糖果出品', '2014-12-23 17:09:35', '', '360', '23.8g', '', '', '', '', '', '1', '0', '9.8');
INSERT INTO `product` VALUES ('1030013', '6920731701202', '1', '康师傅 巧克力妙芙蛋糕 96g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030013.jpg', '6.5', '康师傅', '香浓松软，美妙享受~精选食材，地道工艺，无论何时，一枚妙芙蛋糕总给你甜蜜好心情!欧式蛋糕系列，金黄色堡垒状，绵密柔细，在口中融化出丰富味道，口味自然纯正完美呈现西式甜点的绵密细腻.法式蛋糕系列，更在绵密糕体中夹上丰富馅料，迷人味道变幻递增，体味多样美味，现在就让心情随美味起舞吧!', '2014-12-23 17:09:35', '', '270', '96g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030015', '6902083896959', '1', '娃哈哈 格瓦斯麦芽汁饮品 1.25L', '1000017', 'http://pictures-of-goods.qiniudn.com/1030015.jpg', '8.99', '娃哈哈', '格瓦斯，源自俄罗斯，距今有1000多年的历史，19世纪末传入中国。被称为“液体面包“。娃哈哈格瓦斯口感醇香微甜，呈琥珀颜色，气足泡多，有一种特有的面包焦香和麦乳芳香。娃哈哈格瓦斯麦芽汁发酵饮品，是家中常备的饮料佳品，外出旅行，户外活动，都是您不错的选择。', '2014-12-23 17:09:35', '', '360', '1.25L', '', '', '', '', '', '1', '0', '9.49');
INSERT INTO `product` VALUES ('1030016', '6923420030164', '1', '湾仔码头 黑芝麻香糯汤圆 320g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030016.jpg', '16.5', '湾仔码头', '湾仔码头选料上乘，制作精良，款款面点都堪称精品，选用生态糯米研磨成皮，将生态的黑芝麻精细研磨分出香，吃起来富有浓郁醇厚的香味，甜味在}L1头', '2014-12-23 17:09:35', '', '360', '320g', '', '', '', '', '', '1', '0', '17');
INSERT INTO `product` VALUES ('1030017', '6943052100110', '1', '恒大冰泉 长白山天然矿泉水 500ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030017.jpg', '4.2', '恒大冰泉', '黄金水源，深层矿泉，呈天然弱碱性，均衡富含20多种人体所需的微量元素', '2014-12-23 17:09:35', '', '540', '500ml', '', '', '', '', '', '1', '0', '4.7');
INSERT INTO `product` VALUES ('1030018', '6930799503533', '1', '乐吧 烧烤味薯片 50g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030018.jpg', '2.2', '乐吧', '乐吧精选优质马铃薯为原材料，确保食品品质。严格按照质量体系制造而成，确保产品口感。乐吧薯片，烧烤味，口感香脆美味。乐吧可以让您在闲暇时刻，尽情享受快乐时光。', '2014-12-23 17:09:35', '', '360', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030019', '6925303754112', '1', '统一 海之言果味饮料 500ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030019.jpg', '4.2', '统一', '海扫燥热，地中海海盐加柠檬及时补充水分和盐分。海之言，源自地中海传统智慧良策在水中加入适，地中海海盆与果汁不仅能及时补充流夫的盐分及水分，口感清爽.吏能让你的身心仿佛置身大海，将酷热一扫而光!', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.7');
INSERT INTO `product` VALUES ('1030020', '6954767410388', '1', '可口可乐 可乐 330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030020.jpg', '2.15', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '540', '330ml', '', '', '', '', '', '1', '0', '2.65');
INSERT INTO `product` VALUES ('1030022', '6905321390509', '1', '会稽山 陈年花雕 500ml', '1000011', 'http://pictures-of-goods.qiniudn.com/1030022.jpg', '8.8', '会稽山', '花雕酒是中国黄酒中的奇葩，选用上号糯米，优质麦曲，辅以江浙明净澄澈的湖水，用古法酿制，再贮以时日，产生独特的风味和丰富的营养。', '2014-12-23 17:09:35', '', '1080', '500ml', '', '', '', '', '', '1', '0', '9.3');
INSERT INTO `product` VALUES ('1030023', '6902538006100', '1', '脉动 芒果味维生素饮料 600ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030023.jpg', '3.7', '脉动', '本品不含碳酸气，不会引起胃部胀气和不适。蕴含多种营养元素，随时补充水分、保持动力。感觉不在状态时，一瓶脉动为你注入更多活力。具有天然清新的水果味，口感清爽，风味独特', '2014-12-23 17:09:35', '', '300', '600ml', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030024', '6902022137372', '1', '蓝月亮 薰衣草亮白增艳洗衣液 1kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1030024.jpg', '17.5', '蓝月亮', '亮白增艳 独特亮白增艳技术，调理衣物颜色，令白亮白增艳 独特亮白增艳技术，调理衣物颜色，令白衣更洁白，彩衣更鲜艳!深层洁净 突破性高效洁净因子，深入衣物纤维，轻松瓦解多种顽固污溃!低泡易漂 独特泡沫控制技术.只需1-2次即可漂请，易漂洗无残留，洗涤更节水!高浓度，只需一点点，就可以洗净整筒衣物!', '2014-12-23 17:09:35', '', '1080', '1kg', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030025', '6911316540309', '1', '阿尔卑斯 混合口味棒棒糖 10g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030025.jpg', '0.5', '阿尔卑斯', '源自欧洲的阿尔卑斯品牌，其本意Alpenliebe代表的就是爱，不一样的时刻给您带来不一样的爱的感觉。本品以高级牛奶味棒棒糖、草莓牛奶味棒棒糖、葡萄牛奶味棒棒糖、香橙牛奶味棒棒糖、荔枝牛奶味棒棒糖混装，丰富的口味选择。', '2014-12-23 17:09:35', '', '720', '10g', '', '', '', '', '', '1', '0', '1');
INSERT INTO `product` VALUES ('1030027', '6922145800137', '1', '有友 泡凤爪 130g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030027.jpg', '7.9', '有友', '泡凤爪精选优质鸡爪为原料 ，采用专利泡肉工艺与现代食品加工技术精制而成。生产过程层层把控、洁净生产环境、安全、健康、营养、给您带来美味享受！包装精美 ，防潮避光更严密， 保持鲜美。高温杀菌，食用时更加方便，卫生，快捷，让你的闲暇时光更加轻松自在！', '2014-12-23 17:09:35', '', '180', '130g', '', '', '', '', '', '1', '0', '8.4');
INSERT INTO `product` VALUES ('1030029', '6901672912636', '1', '嘉士伯  11.1°啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030029.JPG', '7.5', '嘉士伯', '采用全麦芽制作，配合原产地所拥有最优质的水源，结合之下酸造出纯正的欧洲品味深受世人喜爱的高档啤酒，酒质优良清爽，口感丰溯硕骨.酒液清亮，澄清透明，金黄光泽，醇厚爽快饮后留下柔和、舒适而愉快感受，啤酒花的芳香、麦芽的清香、洁白、细腻、丰富的啤酒泡沫，给你爽快畅达体验.', '2014-12-24 12:40:02', '', '365', '330ml', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030030', '6925303730574', '1', '统一 阿萨姆奶茶 500ml', '1000024', 'http://pictures-of-goods.qiniudn.com/1030030.jpg', '4.1', '统一', '阿萨姆奶茶精选喜马拉雅山红茶与新西兰奶源完美融合，给你带来从未有过的香滑顺口。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030031', '6910160312216', '1', '丘比 千岛酱 200g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030031.jpg', '9.8', '丘比', '丘比千岛酱以食用蛋黄以及优质植物油、食醋为主要原料颜色呈淡黄色，酱体细腻口味香甜、清爽。常用于寿司料理紫菜包饭，日常烹饪.蔬菜沙拉等。', '2014-12-23 17:09:35', '', '300', '200g', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030033', '6925303713003', '1', '统一 意大利红烩小浣熊干脆面 52g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030033.jpg', '1', '统一', '如今新一代小浣熊干脆面，沿袭了前代小浣熊的滋滋美味。取出调料，束紧包装袋的上口，把干脆面挂碎，m后倒入诱人的调料。上下摇动，使二t得到完美的触合。松开袋口。顿时，美味飘香。它麻醉你的神经，激活你的味蕾，加速你的心跳！然后迫不及待的将袋口对准嘴巴。一仰头，满嘴飘香，对，这就是记忆中的味道！', '2014-12-23 17:09:35', '', '180', '52g', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1030035', '6902088603569', '1', '中华 清香水果味中草药牙膏 140g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030035.jpg', '3.7', '中华', '有效预防上火引起的牙龈红肿出血，发炎、溃疡等口腔问题。防止蛀牙，清新口气。全面保障牙龈健康, 帮助你远离上火困扰。', '2014-12-23 17:09:35', '', '1080', '140g', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030039', '6911316100848', '1', '比巴卜 青苹果味棉花泡泡糖 11g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030039.JPG', '1.99', '比巴卜', '创新棉花糖外形，松松软软的口感，放进嘴里嚼一嚼，棉花糖变泡泡糖！', '2014-12-24 12:27:05', '', '720', '11g', '', '', '', '', '', '1', '0', '2.49');
INSERT INTO `product` VALUES ('1030040', '6901668053916', '1', '卡夫奥利奥  mini巧克力小饼干 55g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030040.JPG', '4.9', '卡夫', '娇小身躯，不减美味，经典原味，更多花样。Mini尺寸，更适合置入甜品，给美味加分。', '2014-12-24 12:13:27', '', '365', '55g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030044', '6919892111302', '1', '康师傅 香浓奶油口味蛋酥卷 90g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030044.jpg', '6.4', '康师傅', '康师傅蛋酥卷以鲜鸡蛋跟小麦粉为主要原料，营养又美味，酥脆又可口，健康又时尚。送亲访友，买给心爱的宝贝.或是贴补给自己当一份营养早舒都是不错的美味选择！', '2014-12-23 17:09:35', '', '270', '90g', '', '', '', '', '', '1', '0', '6.9');
INSERT INTO `product` VALUES ('1030045', '6908471004708', '1', '养元 香纯型六个核桃核桃乳 240ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030045.jpg', '3.8', '养元', '独有5.3.28核桃饮品生产工艺，领先的细胞破壁技术，充分保留的营养成分，营养好喝。养元核挑乳，植物蛋白饮料，新口味.新感觉，口香浓爽滑，经常用脑，多喝六个核桃。', '2014-12-23 17:09:35', '', '540', '240ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030046', '6922145800113', '1', '有友 山椒味竹笋 120g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030046.jpg', '4.9', '有友', '脆爽爽口，清爽舒展，微酸淡辣，回甜的独特风味，美轮美免。', '2014-12-23 17:09:35', '', '180', '120g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030047', '6901668053893', '1', '卡夫奥利奥  mini小饼干 55g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030047.jpg', '4.9', '卡夫', '娇小身躯，不减美味，经典原味，更多花样。Mini尺寸，更适合置入甜品，给美味加分。', '2014-12-23 17:09:35', '', '365', '55g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030048', '6901236390610', '1', '维达10卷蓝色经典卫生卷纸 ', '1000045', 'http://pictures-of-goods.qiniudn.com/1030048.jpg', '33.8', '维达', '100%原生木浆，超纤密，加倍柔韧；柔软细滑，手感舒适；拉伸坚韧，不掉纸屑；足量足分，品质保证！', '2014-12-24 17:41:16', '', '1095', '0', '', '', '', '', '', '1', '0', '34.3');
INSERT INTO `product` VALUES ('1030049', '6923420010999', '1', '湾仔码头 虾仁芦笋水饺 720g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030049.jpg', '39.9', '湾仔码头', '精选上等野生虾和鲜嫩芦笋，馅料中含有藏姑娘家传秘制酱汁，增加馅味风味，不须蘸酱即可品尝原汁原味。', '2014-12-23 17:09:35', '', '360', '720g', '', '', '', '', '', '1', '0', '40.4');
INSERT INTO `product` VALUES ('1030050', '6902447168708', '1', '统一 小浣熊烤肉干脆面 53g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030050.jpg', '1', '统一', '如今新一代小浣熊干脆面，沿袭了前代小浣熊的滋滋美味。取出调料，束紧包装袋的上口，把干脆面挂碎，m后倒入诱人的调料。上下摇动，使二t得到完美的触合。松开袋口。顿时，美味飘香。它麻醉你的神经，激活你的味蕾，加速你的心跳！然后迫不及待的将袋口对准嘴巴。一仰头，满嘴飘香，对，这就是记忆中的味道！', '2014-12-23 17:09:35', '', '180', '53g', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1030052', '6902265160502', '1', '海天 海鲜酱油 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030052.jpg', '10.5', '海天', '精选优质非转基因原料，充分晒制发酵而成。符合优质酱油对发酵工艺的严格要求制成。酱液呈浅褐色，清透纯净，并有浓郁的豉香。鲜味突出，口感醇厚，食用后令人回味无穷。', '2014-12-23 17:09:35', '', '548', '500ml', '', '', '', '', '', '1', '0', '11');
INSERT INTO `product` VALUES ('1030053', '6911316100817', '1', '比巴卜 草莓味棉花泡泡糖 11g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030053.JPG', '1.99', '比巴卜', '创新棉花糖外形，松松软软的口感，放进嘴里嚼一嚼，棉花糖变泡泡糖！', '2014-12-24 12:27:31', '', '720', '11g', '', '', '', '', '', '1', '0', '2.49');
INSERT INTO `product` VALUES ('1030054', '6930799503571', '1', '乐吧 海苔味薯片 50g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030054.JPG', '2.2', '乐吧', '乐吧精选优质马铃薯为原材料，确保食品品质。严格按照质量体系制造而成，确保产品口感。乐吧薯片，海苔味，口感香脆美味。乐吧可以让您在闲暇时刻，尽情享受快乐时光。', '2014-12-24 12:24:18', '', '360', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030056', '6903148045046', '1', '海飞丝 清爽去油去屑洗发露 400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030056.jpg', '46.5', '海飞丝', '含天然柠檬萃取物，适合多种发质使用。特有去屑滋润双效配方，帮助提升去肠及润发效果，润译不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。', '2014-12-23 17:09:35', '', '1080', '400ml', '', '', '', '', '', '1', '0', '47');
INSERT INTO `product` VALUES ('1030057', '6910019003630', '1', '纳爱斯 柠檬绿茶牙膏 90g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030057.jpg', '4.2', '纳爱斯', '采用高档软性硅磨料，减少对牙齿的磨损，清洁牙齿和有效护齿完美统一，令牙齿健康亮白；独创的柠檬冬表薄荷香型，将国际浒的柠檬薄荷与冬表薄荷完美结合，清新香甜、清爽怡人，保持口气清新', '2014-12-23 17:09:35', '', '1095', '90g', '', '', '', '', '', '1', '0', '4.7');
INSERT INTO `product` VALUES ('1030059', '6903252023282', '1', '康师傅 辣卤牛肉面 106g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1030059.jpg', '12.2', '康师傅', '每一袋康师傅面都是真材实料，现在加上丰富的配料，急火爆香，小火慢炖，汤头香浓，面粉多加鸡蛋并有精湛工艺生产出的面条，营养爽滑，新一代康师傅红烧牛肉面，让您满意。丰富的美味，延续康师傅口味的丰富配料与口碑。', '2014-12-23 17:09:35', '', '180', '106g*5', '', '', '', '', '', '1', '0', '12.7');
INSERT INTO `product` VALUES ('1030061', '6901236375075', '1', '维达 三层卫生卷纸 10卷', '1000045', 'http://pictures-of-goods.qiniudn.com/1030061.jpg', '38', '维达', '100%原生木浆，保证安心用纸，绿色造纸，健康安全。独特技术，长短纤维完美配比。', '2014-12-23 17:09:35', '', '1080', '10卷', '', '', '', '', '', '1', '0', '38.5');
INSERT INTO `product` VALUES ('1030064', '6903148045053', '1', '海飞丝 清爽去油去屑洗发露 200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030064.jpg', '23.9', '海飞丝', '含天然柠檬萃取物，适合多种发质使用。特有去屑滋润双效配方，帮助提升去肠及润发效果，润译不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。', '2014-12-23 17:09:35', '', '1080', '200ml', '', '', '', '', '', '1', '0', '24.4');
INSERT INTO `product` VALUES ('1030065', '6907992100418', '1', '伊利QQ星 原味儿童优酪乳 120g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030065.jpg', '3.9', '伊利', '精选优质奶源，含有9大基础营养精华。运用国际领先技术，经过科学配比研发的三重保护系统，成长配方，为成长期孩子提供科学专业营养，专注儿童身体、智力全面成长！', '2014-12-23 17:09:35', '', '21', '120g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030067', '6904800168646', '1', '龙门 米醋 2.1L', '1000030', 'http://pictures-of-goods.qiniudn.com/1030067.jpg', '15.5', '龙门', '采用酱油、醋、大蒜、辣椒及芝麻油精制而成，具有酱油的豉香和米醋的醇香，味道微辣，适用于凉拌及烹调炒菜。更适合饺子及点心，也可作拌食面条或烹调冷盘.', '2014-12-23 17:09:35', '', '365', '2.1L', '', '', '', '', '', '1', '0', '16');
INSERT INTO `product` VALUES ('1030070', '6930799503564', '1', '乐吧 鸡肉味薯片 50g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030070.JPG', '2.2', '乐吧', '乐吧精选优质马铃薯为原材料，确保食品品质。严格按照质量体系制造而成，确保产品口感。乐吧薯片，鸡肉味，口感香脆美味。乐吧可以让您在闲暇时刻，尽情享受快乐时光。', '2014-12-24 12:24:36', '', '360', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030071', '6903290190298', '1', '古越龙山 16.5%五年陈花雕酒 500ml', '1000011', 'http://pictures-of-goods.qiniudn.com/1030071.jpg', '27.5', '古越龙山', '汲鉴湖冬水为血脉，清冽冰纯;选上乘濡米为风骨，绿色健康。始酿于立冬，汇古越之灵气。一年只酿一季酒。精选传统陶坛，疏密相宜:陈年老坛韵味，融入老酒。', '2014-12-23 17:09:35', '', '730', '500ml', '', '', '', '', '', '1', '0', '28');
INSERT INTO `product` VALUES ('1030072', '6902131111676', '1', '梅林 火锅午餐肉 340g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030072.jpg', '12.8', '梅林', '独家配方秘制，香辣可口，肉质细腻，口感鲜嫩，即开即食。', '2014-12-23 17:09:35', '', '1080', '340g', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030073', '6907992100425', '1', '伊利QQ星 草莓果泥儿童优酪乳 120g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030073.jpg', '3.9', '伊利', '精选优质奶源，含有9大基础营养精华。运用国际领先技术，经过科学配比研发的三重保护系统，成长配方，为成长期孩子提供科学专业营养，专注儿童身体、智力全面成长！', '2014-12-23 17:09:35', '', '21', '120g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030074', '6903148045039', '1', '海飞丝 清爽控油洗发露 750ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030074.jpg', '76.8', '海飞丝', '适合多种发质使用，特有去屑滋润双效配方，帮助提升去肠及润发效果，润译不油腻，感受清爽活力。清润滋养秀发，让您时刻神采飞扬。', '2014-12-23 17:09:35', '', '1095', '750ml', '', '', '', '', '', '1', '0', '77.3');
INSERT INTO `product` VALUES ('1030075', '6926265313386', '1', '上好佳 鲜虾片共享装 80g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030075.jpg', '5.5', '上好佳', '这是上好佳独创的小吃。一直以来它们是供家庭和朋友享用的休闲食品。清脆每一口，让您回味无穷休闲消遣，朋友聚会，常备食品。', '2014-12-23 17:09:35', '', '270', '80g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030076', '6948195800446', '1', '金龙鱼 黄金比例食用调和油 900ml', '1000027', 'http://pictures-of-goods.qiniudn.com/1030076.jpg', '12.9', '金龙鱼', '金龙鱼食用调和油满足人体膳食脂肪酸1:1:1的科学配比，营养均衡.营养成份符台DRI标准。本品呈好看的金黄透明色，味香，营养丰富.可馏、炒、煎、炸或凉拌。精选8种原料，更比第一代调和油多出5种原料:原料纯正，按照独特配方调和而成。让您在享受美味的同时又摄入了营养健康元素，一举多得！', '2014-12-23 17:09:35', '', '540', '900ml', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030077', '6954767410173', '1', '可口可乐 汽水 300ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030077.JPG', '2', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-24 12:46:39', '', '270', '300ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030081', '6901035609265', '1', '青岛 11°啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030081.jpg', '3.9', '青岛', '采用现代罐法酿造工艺和独到的低温长时间后熟技术，同时通过国内领先的啤酒保鲜技术，保证啤酒口味的新鲜。风味纯净协调，落口爽净，具有淡淡的酒花和麦芽香气。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030083', '6922266443787', '1', '清风 原木纯品卷筒卫生纸 10+2卷', '1000045', 'http://pictures-of-goods.qiniudn.com/1030083.jpg', '25.9', '清风', '简洁流畅的包装设计，经济实惠的价格，享受‘清风“拂面的感觉。原木纯品，源于纯净，归于健康.全新升级，更厚实，更柔韧。', '2014-12-23 17:09:35', '', '1080', '10+2卷', '', '', '', '', '', '1', '0', '26.4');
INSERT INTO `product` VALUES ('1030084', '6921168592661', '1', '农夫山泉 天然水 1.5L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030084.JPG', '2.5', '农夫山泉', '农夫山泉一天然的弱碱性水。农夫山泉选取天然的优质水源，仅对原水做最小限度的、必要的处理，保存了原水中钾、钠、钙、镁、偏硅酸等对人体有益的矿物元素，pH值为7.3，呈天然弱碱性，适于人体长期饮用。', '2014-12-24 12:41:31', '', '365', '1.5L', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030085', '6920731701103', '1', '康师傅 妙芙奶油蛋糕 96g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030085.jpg', '6.5', '康师傅', '香浓松软，美妙享受~精选食材，地道工艺，无论何时，一枚妙芙蛋糕总给你甜蜜好心情!欧式蛋糕系列，金黄色堡垒状，绵密柔细，在口中融化出丰富味道，口味自然纯正完美呈现西式甜点的绵密细腻.法式蛋糕系列，更在绵密糕体中夹上丰富馅料，迷人味道变幻递增，体味多样美味，现在就让心情随美味起舞吧!', '2014-12-23 17:09:35', '', '270', '96g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030086', '6921804700757', '1', '陶华碧 老干妈豆豉油辣椒 280g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030086.jpg', '9.5', '陶华碧', '传统工艺精心酿造，具有优雅细腻，香辣突出，回味悠长等特点。优选上等优质辣椒，百分百手工制作，正宗农家风味黑豆豉，选用优质黄豆，传统工艺古法发酵，绝对不加防腐剂，健康卫生。', '2014-12-23 17:09:35', '', '540', '280g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030088', '6954767434674', '1', '可口可乐 雪碧汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030088.jpg', '2.6', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030090', '6948195800514', '1', '金龙鱼 黄金比例食用调和油 5L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030090.jpg', '67.9', '金龙鱼', '金龙鱼食用调和油满足人体膳食脂肪酸1:1:1的科学配比，营养均衡.营养成份符台DRI标准。本品呈好看的金黄透明色，味香，营养丰富.可馏、炒、煎、炸或凉拌。精选8种原料，更比第一代调和油多出5种原料:原料纯正，按照独特配方调和而成。让您在享受美味的同时又摄入了营养健康元素，一举多得！', '2014-12-23 17:09:35', '', '540', '5L', '', '', '', '', '', '1', '0', '68.4');
INSERT INTO `product` VALUES ('1030091', '6918598120014', '1', '波力 渔趣原味鳕柳丝 40g', '1000081', 'http://pictures-of-goods.qiniudn.com/1030091.jpg', '7.8', '波力', '现代科技与传统工艺高度糅合，造就了波力渔趣的优良品质，更添滑嫩之风味情趣，品波力渔趣，尽享海洋美味！波力渔趣富含优质蛋白质、维他命、钙、磷、钾等营养成分，尽显大海纯正品质......大海广漠、深邃、自由奔放，给人无穷的遐思和美妙的梦幻。波力渔趣作为一种零食，是老少皆宜可以放心食用的美味休闲零食。', '2014-12-23 17:09:35', '', '360', '40g', '', '', '', '', '', '1', '0', '8.3');
INSERT INTO `product` VALUES ('1030092', '6924743915848', '1', '乐事无限 清爽翡翠黄瓜薯片 104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030092.jpg', '7.98', '乐事', '香脆美味 回味悠长 休闲必备', '2014-12-23 17:09:35', '', '360', '104g', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030093', '6922145800021', '1', '有友 山椒凤爪 180g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030093.jpg', '11.9', '有友', '脆爽爽口，清爽舒展，微酸淡辣，回甜的独特风味，美轮美免。', '2014-12-23 17:09:35', '', '180', '180g', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1030094', '6904800168462', '1', '和田宽 龙门米醋 350ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030094.jpg', '2.2', '和田宽', '宽牌米醋采用传统工艺与现代科技相结合。严苛酿制而成。色泽呈玫瑰红色而剔透晶莹，香气纯正，酸味醇和，略带甘甜.本品制作工艺精良，取材考究，美味可口味道香醇，是家中必常备的餐饮佐料之一.', '2014-12-23 17:09:35', '', '365', '350ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030096', '6954767430928', '1', '可口可乐 雪碧汽水 330ml*8', '1000017', 'http://pictures-of-goods.qiniudn.com/1030096.jpg', '14.6', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '360', '330ml*8', '', '', '', '', '', '1', '0', '15.1');
INSERT INTO `product` VALUES ('1030097', '6909689300088', '1', '六必居 韭菜花 300g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030097.jpg', '3.9', '六必居', '老字号六必居韭菜花 火锅蘸料调料 烧烤蘸料 ', '2014-12-23 17:09:35', '', '730', '300g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030098', '6915936800072', '1', '升元 野山椒 160g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030098.jpg', '3.4', '升元', '酸甜劲辣 压桌小菜 火锅必备，炒菜调味料，酸甜可口 160g装野山椒', '2014-12-23 17:09:35', '', '300', '160g', '', '', '', '', '', '1', '0', '3.9');
INSERT INTO `product` VALUES ('1030101', '6924743915831', '1', '乐事无限 黑椒牛扒味薯片 104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030101.jpg', '7.98', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成香脆美味，回味悠长，让你美味停不下!乐事始终致力于生产美味薯片每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成.希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光忘记压力、尽情享受。', '2014-12-23 17:09:35', '', '360', '104g', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030102', '6924743915817', '1', '乐事无限 鲜浓番茄味薯片 104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030102.jpg', '7.98', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成香脆美味，回味悠长，让你美味停不下!乐事始终致力于生产美味薯片每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成.希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光忘记压力、尽情享受。', '2014-12-23 17:09:35', '', '360', '104g', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030105', '6912616000036', '1', '喜乐 乳酸菌饮料 95ml*4', '1000021', 'http://pictures-of-goods.qiniudn.com/1030105.jpg', '4.8', '喜乐', '奶香味浓郁、甜而不腻、口感爽滑.美味难挡，爱上这个味道', '2014-12-23 17:09:35', '', '180', '95ml*4', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1030106', '6934665081101', '1', '蒙牛 桑葚冠益乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030106.JPG', '13.9', '蒙牛', '冠益乳风昧发酵乳原料取自天然牧场的优质牛奶，由乳酸菌发酵酸奶制成，采用国内先法助口工工艺，保留了发酵乳的营养成分。更添加桑葚，口感独特。', '2014-12-24 12:58:46', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030108', '6907992102757', '1', '伊利 有机燕麦草莓畅轻发酵乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030108.jpg', '13.9', '伊利', '甄选有机燕麦。添加了新鲜草毒果粒，喝得到的颗粒，美味看得到，营养更美味，享受跃然于舌尖味衡的香滑美味.果粒和酸奶的融合带来更丰富饱满的口感。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030109', '6914973602908', '1', '德芙 脆香米巧克力 24g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030109.JPG', '3', '德芙', '浓郁香甜的牛奶味，香脆可口的脆米粒，独特的口感体验，老入孩子都喜欢。', '2014-12-24 12:26:20', '', '364', '24g', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1030110', '6948960102188', '1', '百威 啤酒 500ml*3', '1000014', 'http://pictures-of-goods.qiniudn.com/1030110.jpg', '22.9', '百威', '百威选用优质麦芽、大米酒花为主要原料。以严谨的工艺控制，通过自然发酵，低温储藏而酿成。采用山毛榉木陈酿工艺，确保了啤酒的天然口味。以其细腻清淡的口味，体现了百威啤酒的风格。', '2014-12-23 17:09:35', '', '360', '500ml*3', '', '', '', '', '', '1', '0', '23.4');
INSERT INTO `product` VALUES ('1030111', '6914973106956', '1', '德芙 醇黑巧克力 43g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030111.jpg', '9', '德芙', '德芙因爱而生。醇黑巧克力，66%可可含量，巧克力口感的最高境界。', '2014-12-23 17:09:35', '', '364', '43g', '', '', '', '', '', '1', '0', '9.5');
INSERT INTO `product` VALUES ('1030112', '6920202888838', '1', '红牛 维生素功能饮料 250ml*6', '1000075', 'http://pictures-of-goods.qiniudn.com/1030112.jpg', '35.4', '红牛', '累了困了喝红牛，全球著名的能量饮料，迅速补充体力和维生素，适合工作学习、会议培训、考试竞赛、熬夜加班、运动健身、长途驾车、户外旅行等场合饮用 。', '2014-12-23 17:09:35', '', '540', '250ml*6', '', '', '', '', '', '1', '0', '35.9');
INSERT INTO `product` VALUES ('1030113', '6909409040799', '1', '上好佳 洋葱圈 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030113.jpg', '2.9', '上好佳', '大包装，更适于分享 开袋即食，方便卫生', '2014-12-23 17:09:35', '', '365', '40g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030114', '6918598028563', '1', '波力 海苔鱼片夹心脆 12g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030114.jpg', '6.2', '波力', '本品是海苔与渔趣的完美组合，海苔富含多种生命活性物质，海苔浓缩了紫菜当中的各种B族维生素，海苔中含有15%左右的矿物质，有维持正常生理功能所必需的钾、钙、镁、磷、铁、锌、铜、锰等。渔趣鳍源自深层海域鱼类，富含蛋白质、维他命、钙、磷、钾等营养成分，尽显大海纯正品质。现代科技与传统工艺高度融合，造就了鱼片夹心脆的优良品质，更添香脆、滑嫩之风味.尽享海洋美味。', '2014-12-23 17:09:35', '', '360', '12g', '', '', '', '', '', '1', '0', '6.7');
INSERT INTO `product` VALUES ('1030115', '6923146198070', '1', '杜蕾斯螺纹装(小)  3只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030115.jpg', '16.9', '杜蕾斯', '杜茜斯螺纹装避孕套是由天然胶乳制成的，纹理设计，给您的性爱带来更强烈的感觉。', '2014-12-23 17:09:35', '', '1800', '3只', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030117', '6909409101223', '1', '上好佳 田园薯片优惠装 80g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030117.jpg', '4.8', '上好佳', '上好佳田园薯片优惠装，每袋5小包，精选口味。繁忙工作之余，欢乐的聚会时间，悠闲的郊游时光，随时分享美味。', '2014-12-23 17:09:35', '', '270', '80g', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1030119', '6903148181270', '1', '汰渍 洁净果香洗衣粉 508g', '1000049', 'http://pictures-of-goods.qiniudn.com/1030119.jpg', '6.3', '汰渍', '洗前释香，打开产品包装，阳光热带果香扑鼻而来。洗中溢香，产品的香味可在洗涤环节从始至终伴你左右，让你拥有阳光好心情。洗后凝香，宝洁独有凝香技术，能使果香因子有效，持久地沉淀在干燥的织物上', '2014-12-23 17:09:35', '', '1080', '508g', '', '', '', '', '', '1', '0', '6.8');
INSERT INTO `product` VALUES ('1030120', '6902890890096', '1', '双汇 网兜台式烤香肠 48g*5', '1000007', 'http://pictures-of-goods.qiniudn.com/1030120.jpg', '13.9', '双汇', '营养 安全 方便 肉质细嫩 口感清香', '2014-12-23 17:09:35', '', '90', '48g*5', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030121', '6903252715415', '1', '康师傅 香辣牛肉面 104g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1030121.jpg', '12.2', '康师傅', '每一袋康师傅面都是真材实料，现在加上丰富的配料，急火爆香，小火慢炖，汤头香浓，面粉多加鸡蛋并有精湛工艺生产出的面条，营养爽滑，新一代康师傅香辣牛肉面，让您满意。丰富的美味，延续康师傅口味的丰富配料与口碑。', '2014-12-23 17:09:35', '', '180', '104g*5', '', '', '', '', '', '1', '0', '12.7');
INSERT INTO `product` VALUES ('1030122', '6923146198063', '1', '杜蕾斯活力  12只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030122.jpg', '34.9', '杜蕾斯', '为性爱带来更自然舒适的感觉，直壁平面结构，粉红色，有香味，为润滑型，润滑剂未添加杀精剂，不杀伤精子', '2014-12-23 17:09:35', '', '1800', '12只', '', '', '', '', '', '1', '0', '35.4');
INSERT INTO `product` VALUES ('1030123', '6948960100078', '1', '百威 听啤 500ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030123.jpg', '7.6', '百威', '百威选用优质麦芽、大米酒花为主要原料。以严谨的工艺控制，通过自然发酵，低温储藏而酿成。采用山毛榉木陈酿工艺，确保了啤酒的天然口味。以其细腻清淡的口味，体现了百威啤酒的风格。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '8.1');
INSERT INTO `product` VALUES ('1030124', '6924743915763', '1', '乐事无限 忠于原味薯片 104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030124.jpg', '7.98', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成香脆美味，回味悠长，让你美味停不下!乐事始终致力于生产美味薯片每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成.希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光忘记压力、尽情享受。', '2014-12-23 17:09:35', '', '360', '104g', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030125', '6921355240672', '1', '三元 百利包大红枣牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030125.jpg', '2.2', '三元', '红枣被誉为“百果之王，.含有丰富的维生索、矿物质和氨基酸，民间有“夭天吃红枣，一生不显老”的说法。添加红枣精华，清香馥郁，助你焕发自然活力，全天精力充沛。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030126', '6913189536731', '1', '同享 九制杨梅 125g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030126.jpg', '6.99', '同享', '手工制作杨梅，选自清新可口的特级杨梅！从小吃到大，百吃不厌，口味经典', '2014-12-23 17:09:35', '', '360', '125g', '', '', '', '', '', '1', '0', '7.49');
INSERT INTO `product` VALUES ('1030127', '6901844592123', '1', '味好美 鱼香肉丝调料 35g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030127.jpg', '3', '味好美', '味好美 鱼香肉丝调料 精选进口天然配料精心研磨制作而成，粉质细腻，浓香四溢，色泽淡黄，具有强烈的鲜香美味，口味纯正，别有风味，让你生活有滋有味。味好美 鱼香肉丝调料，不含防腐剂，由多种营养、鲜味成分复合在一起，搭配出最佳效果，素菜清淡中不失鲜醇，荤菜浓郁中更添鲜香，让您尽享独特的舌尖美味。', '2014-12-23 17:09:35', '', '730', '35g', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1030128', '6903148202890', '1', '飘柔 滋润去屑洗发优惠装 700ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030128.jpg', '34.2', '飘柔', '针对头屑头痒问题、干枯毛躁，去屑去痒的同时充分滋润秀发。配方特含ZPT去屑因子及胶白蛋白组成因子。产品配方比上一代滋润去屑洗发露更浓稠.令秀发远离头屑头痒，享受充足滋润！', '2014-12-23 17:09:35', '', '1080', '700ml', '', '', '', '', '', '1', '0', '34.7');
INSERT INTO `product` VALUES ('1030130', '6906785230264', '1', '红星 56°二锅头白酒 100ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030130.jpg', '3.9', '红星', '红星二锅头酒是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。', '2014-12-23 17:09:35', '', '0', '100ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030131', '6924743915770', '1', '乐事无限 嗞嗞烤肉味薯片 104g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030131.jpg', '7.98', '乐事', '乐事薯片精选优质马铃薯，严格质量体系下加工而成香脆美味，回味悠长，让你美味停不下!乐事始终致力于生产美味薯片每一片乐事薯片都选用精心培育的土豆，采用精制植物油烹制而成.希望每一包乐事薯片都可以为忙碌工作的人带来一刻休闲时光忘记压力、尽情享受。', '2014-12-23 17:09:35', '', '360', '104g', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030133', '6928497820038', '1', '品品 清爽山椒味泡椒凤爪 168g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030133.jpg', '14.5', '品品', '野山椒凤爪是精选肉鸡爪先煮制、后泡制而成。此产吕的最大特点1:酸辣开胃解馒减压，没有胃口或心情不佳，吃上一包.胃口大振，精神爽快.2:富含大量胶原蛋白，不用担心长肉还有美容之功效。', '2014-12-23 17:09:35', '', '270', '168g', '', '', '', '', '', '1', '0', '15');
INSERT INTO `product` VALUES ('1030134', '6955887900032', '1', '川崎 海鲜火锅调料 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030134.jpg', '3.5', '川崎', '川崎火锅调料以天然优质川崎合酱及天然植物油、香辛料经科学配方精制而成！该调料具有去腥、提味、开胃等作用、除用于火锅调味，又可用于涂抹面包、馒头或作汤面、菜肴调料！即食即用，卫生方便，营养丰富，品味极佳！', '2014-12-23 17:09:35', '', '548', '100g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030135', '6907592001948', '1', '王致和 葱姜料酒 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030135.jpg', '5.5', '王致和', '王致和葱姜料酒精选优质原料，经过多道生产工艺精心制造而成。王致和葱姜料酒中添加了葱姜成分，融合了葱姜特有的香气和料酒的调味作用。王致和葱姜料酒不仅具有调味料酒的去腥解腻的作用，更突出葱姜的清香和营养。', '2014-12-23 17:09:35', '', '540', '500ml', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030136', '6923589461199', '1', '高洁丝 护翼迷你卫生巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030136.jpg', '4.9', '高洁丝', '精准瞬吸，全线防漏，释放女性内在美，吸收速率提高1倍，精准瞬吸至深层，定格潮涌，前后左右都不漏。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030138', '6926892501033', '1', '银鹭 好粥道紫薯紫米粥 280g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030138.jpg', '4', '银鹭', '精选上乘天然谷物在原料上下足功夫，才能保证粥的风味，粥体晶莹诱人，口感细腻润滑，清甜不腻，让你一口接一口，好喝停不下来，无尽回味', '2014-12-23 17:09:35', '', '720', '280g', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1030139', '6902088709650', '1', '奥妙 净蓝全效无磷粉优惠装 1.1kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1030139.jpg', '10.5', '奥妙', '多层纤维去污系统，增加50%洁净力，具有清洁软刷般的高效洁净力，能层层深入纤维内部，击破污渍附着，瓦解死角污渍。无需费力搓洗，轻松清除10大死角!3重活力功效：强效去污、安全呵护、自然清新。', '2014-12-23 17:09:35', '', '1080', '1.1kg', '', '', '', '', '', '1', '0', '11');
INSERT INTO `product` VALUES ('1030140', '6913189536762', '1', '同享 九制乌梅 125g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030140.jpg', '6.99', '同享', '手工制作乌梅，选自清新可口的特级乌梅！从小吃到大，百吃不厌，口味经典', '2014-12-23 17:09:35', '', '360', '125g', '', '', '', '', '', '1', '0', '7.49');
INSERT INTO `product` VALUES ('1030141', '6907992508344', '1', '伊利 金典有机奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030141.jpg', '76', '伊利', '每一滴金典牛奶，都经过57道层层珍选。纯粹如金的品质，只给你最爱的人。奶质纯正，口感香醇！丰富乳蛋白≥3.5%，蛋白质含量超出国家标准18.6%，为您提供更丰富的营养！', '2014-12-23 17:09:35', '', '210', '250ml*12', '', '', '', '', '', '1', '0', '76.5');
INSERT INTO `product` VALUES ('1030142', '6934235600060', '1', '新家园 咖喱牛肉烤馍锅巴 75g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030142.JPG', '2.2', '新家园', '内蒙古特产绿色食品 烤馍片 馒头片 早餐下午茶牛奶伴侣 课间加班补充能量休闲零食', '2014-12-24 12:14:29', '', '240', '75g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030144', '6923644267070', '1', '蒙牛 香草味奶特 243ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030144.jpg', '4.9', '蒙牛', '蒙牛乳业是中国领先的乳制品供应商，专注于研发并生产适合国人的乳制品。核心奶源基地处在“黄金奶道”，拥有无污染的土壤、水源和空气，绿色健康。蒙牛对于出厂产品，每批均经过生产自检、过程检验和产品检验，确保安全。香草的淡雅风味邂逅浓香牛奶，香草的芬芳味道融入牛奶的丝滑，散发浪漫滋味。', '2014-12-23 17:09:35', '', '150', '243ml', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030145', '6920202888883', '1', '红牛 维生素功能饮料 250ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030145.jpg', '5.98', '红牛', '累了困了喝红牛，全球著名的能量饮料，迅速补充体力和维生素，适合工作学习、会议培训、考试竞赛、熬夜加班、运动健身、长途驾车、户外旅行等场合饮用 ', '2014-12-23 17:09:35', '', '548', '250ml', '', '', '', '', '', '1', '0', '6.48');
INSERT INTO `product` VALUES ('1030148', '6923146198025', '1', '杜蕾斯 装情迷安全套 12只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030148.jpg', '49.9', '杜蕾斯', '杜蕾斯情迷装避孕套是由天然胶乳制成.超薄敏感，给您带来舒适和美妙的性爱享受。', '2014-12-23 17:09:35', '', '1800', '12只', '', '', '', '', '', '1', '0', '50.4');
INSERT INTO `product` VALUES ('1030150', '6924187822337', '1', '洽洽 奶油味小而香西瓜子 12g*15', '1000003', 'http://pictures-of-goods.qiniudn.com/1030150.jpg', '9.9', '洽洽', '洽洽小而香西瓜子(奶油味)坚持精选原料，配方严格，注重食品口感，口味新颖独特，为您奉上各种美味零食，请您静心品尝生活的滋味!洽洽小而香西瓜子(奶油味)取食简单，食用放心，更加营养美味独特的口感风味，品质优佳、香甜适口，沁香人味，味道十足，余味绵绵，是诱人美昧的健康零食，让您生活有滋有味!', '2014-12-23 17:09:35', '', '365', '12g*15', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030151', '6954434300851', '1', '猴姑 15天装饼干 720g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030151.jpg', '105', '猴姑', '无菌弱酸环境培植的猴头菇，健习洁净、营养丰沛.提供丰富的氨基酸和多糖、多肽。胃不好就选猴姑饼干，美味饼干糕点。', '2014-12-23 17:09:35', '', '360', '720g', '', '', '', '', '', '1', '0', '105.5');
INSERT INTO `product` VALUES ('1030152', '6923146198018', '1', '杜蕾斯挚爱 装安全套 12片', '1000082', 'http://pictures-of-goods.qiniudn.com/1030152.jpg', '36.8', '杜蕾斯', '杜蕾斯避孕套，品质可靠，体感舒适，橡胶的柔软性及传热性与人体相当，可以为您营造更完美的体验', '2014-12-23 17:09:35', '', '1080', '12片', '', '', '', '', '', '1', '0', '37.3');
INSERT INTO `product` VALUES ('1030153', '6906151615794', '1', '百年牛栏山  35°6年白酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030153.jpg', '48', '牛栏山', '牛栏山酒，精选优质高粱和小麦等为原料，以豌豆、大麦等制成大曲为发酵剂，纯粮酿造绿色自然。从原料粉碎到成品酒灌装，历经糊化、发酵、蒸馏等十多道关键工序，悉心传统工艺酿造。婚宴祝福，团圆小酌，节日送礼，商务宴请必备良品！', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '48.5');
INSERT INTO `product` VALUES ('1030154', '6920242100020', '1', '怡达牌 袋装山楂酪 200g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030154.jpg', '8.8', '怡达', '精心挑选承德优质山楂为原料，天然绿色食品，品味纯正。采用科学配方，传统工艺精制而成，口感细腻香甜， 老少皆宜 。独立小包装，携带方便；味道酸甜可口，是您平常休闲的零食佳品。', '2014-12-23 17:09:35', '', '360', '200g', '', '', '', '', '', '1', '0', '9.3');
INSERT INTO `product` VALUES ('1030156', '6919892633309', '1', '康师傅 3+2柠檬苏打夹心饼干 125g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030156.jpg', '5.3', '康师傅', '3层饼干加2层夹心，多一层夹心，滋味更丰富，配以方形苏打饼干，香脆、不腻口。', '2014-12-23 17:09:35', '', '365', '125g', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1030158', '6925843403297', '1', '欣和六月鲜 特级酱油 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030158.jpg', '12.6', '欣和', '精选东北优质非转基因脱脂大豆，精心发酵酿制而成。采用传统的原始工艺，天然酿造，自然鲜美。酱香浓郁，滴滴鲜美，食用让菜肴更加鲜香味美。', '2014-12-23 17:09:35', '', '540', '500ml', '', '', '', '', '', '1', '0', '13.1');
INSERT INTO `product` VALUES ('1030159', '6921355221671', '1', '三元 百利包纯牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030159.jpg', '2', '三元', '天然无污染的绿色风光孕育了新鲜优质的奶源。口感醇厚，香浓顺滑乐享浓郁纯正牛奶滋味。高温灭菌，无菌严密包装，无需冷藏，饮用安全。富含丰富的能量，保持每天充足的活力。', '2014-12-23 17:09:35', '', '45', '200ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030160', '6901754050195', '1', '乌江 微辣榨菜 80g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030160.jpg', '2.3', '乌江', '腌菜佳品，其做工独特，配料讲究。脆嫩爽口，味咸且鲜，并带有特殊的酸味，可直接用于佐餐也可用于炒菜，做汤。先经晾晒脱水然后腌制，工序严谨。有光泽，菜体嫩爽，气昧鲜香且无异昧，营养丰富。', '2014-12-23 17:09:35', '', '480', '80g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030162', '6903148092248', '1', '舒肤佳 纯白清香型香皂 115g*3', '1000060', 'http://pictures-of-goods.qiniudn.com/1030162.jpg', '14.5', '舒肤佳', '金质健康保护 亿万家庭沐浴之选。含有健康配方，有效去除皮肤接触到的常见细菌、灰尘等有害物质。泡沫丰富，清香怡人，是理想的家庭用香皂。', '2014-12-23 17:09:35', '', '1080', '115g*3', '', '', '', '', '', '1', '0', '15');
INSERT INTO `product` VALUES ('1030164', '6955887900049', '1', '川崎 美味火锅调料 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030164.jpg', '3.5', '川崎', '川崎火锅调料以天然优质川崎合酱及天然植物油、香辛料经科学配方精制而成！该调料具有去腥、提味、开胃等作用、除用于火锅调味，又可用于涂抹面包、馒头或作汤面、菜肴调料！即食即用，卫生方便，营养丰富，品味极佳！', '2014-12-23 17:09:35', '', '540', '100g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030165', '6923644240998', '1', '蒙牛 高钙低脂调制奶利乐枕 240ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030165.jpg', '2.65', '蒙牛', '蒙牛高钙牛奶.专为人体骨骼设计，持别添加维生素D3和乳矿物益，给予骨韶更多呵护.让身体时刻充满活力。适台所有人群(婴幼儿除外）钙含量高出普通午奶平均值25%，活力健康因子—维生素D3.', '2014-12-23 17:09:35', '', '45', '240ml', '', '', '', '', '', '1', '0', '3.15');
INSERT INTO `product` VALUES ('1030167', '6955887900025', '1', '川崎 鲜辣火锅调料 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030167.jpg', '3.5', '川崎', '川崎火锅调料以天然优质川崎合酱及天然植物油、香辛料经科学配方精制而成！该调料具有去腥、提味、开胃等作用、除用于火锅调味，又可用于涂抹面包、馒头或作汤面、菜肴调料！即食即用，卫生方便，营养丰富，品味极佳！', '2014-12-23 17:09:35', '', '548', '100g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030168', '6920083002880', '1', '得其利是 内衣专用洗衣皂 240g', '1000049', 'http://pictures-of-goods.qiniudn.com/1030168.jpg', '8.5', '得其利是', '专门根据各种贴身衣物的污渍特点研制，能有效防抑细菌滋生及交叉感染，全面守护身体健康。添加梦幻薰衣草精华，天然温和配方不刺激皮肤。特别适合各种内衣及贴身衣物的洗涤。', '2014-12-23 17:09:35', '', '1080', '240g', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1030169', '6934235600091', '1', '新家园 烧烤烤馍锅巴 75g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030169.JPG', '2.2', '新家园', '内蒙古特产绿色食品 烤馍片 馒头片 早餐下午茶牛奶伴侣 课间加班补充能量休闲零食', '2014-12-24 12:15:12', '', '240', '75g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030170', '6940471600542', '1', '生和堂 原味吸吸龟苓膏 253g', '1000084', 'http://pictures-of-goods.qiniudn.com/1030170.jpg', '3.75', '生和堂', '龟苓膏适合各年龄段的人食用。龟苓膏采用鹰嘴鬼和土茯苓为原料，再配生地等药物精制而成，营养价值非常高。打开直接食用，方便快捷美味有营养！', '2014-12-23 17:09:35', '', '360', '253g', '', '', '', '', '', '1', '0', '4.25');
INSERT INTO `product` VALUES ('1030171', '6906151624758', '1', '牛栏山  39°百年珍品陈酿 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030171.jpg', '34.8', '牛栏山', '珍品陈酿 共享百年牛栏山：百年牛栏山珍品陈酿是一款由京师酿酒师精选优质高粱、小麦等原料纯手工酿造而成的佳品，酒体净爽甘冽，芳香醇厚，入口醇和浓郁。饮后甘爽味长，口留余香。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '35.3');
INSERT INTO `product` VALUES ('1030172', '6921355221688', '1', '三元 百利包早餐奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030172.jpg', '2.2', '三元', '天然无污染的绿色风光孕育了新鲜优质的奶源。口感醇厚，香浓顺滑乐享浓郁纯正牛奶滋味。高温灭菌，无菌严密包装，无需冷藏，饮用安全。富含丰富的能量，保持每天充足的活力。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030173', '6926892566087', '1', '银鹭 好粥道黑米粥 280g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030173.jpg', '3.9', '银鹭', '精选上乘天然谷物在原料上下足功夫，才能保证粥的风味，粥体晶莹诱人，口感细腻润滑，清甜不腻，让你一口接一口，好喝停不下来，无尽回味', '2014-12-23 17:09:35', '', '720', '280g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030174', '6934235600084', '1', '新家园 孜然烤馍锅巴 75g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030174.jpg', '2.2', '新家园', '内蒙古特产绿色食品 烤馍片 馒头片 早餐下午茶牛奶伴侣 课间加班补充能量休闲零食', '2014-12-23 17:09:35', '', '240', '75g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030175', '6955887900018', '1', '川崎 麻辣火锅调料 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030175.jpg', '3.5', '川崎', '川崎火锅调料以天然优质川崎合酱及天然植物油、香辛料经科学配方精制而成！该调料具有去腥、提味、开胃等作用、除用于火锅调味，又可用于涂抹面包、馒头或作汤面、菜肴调料！即食即用，卫生方便，营养丰富，品味极佳！', '2014-12-23 17:09:35', '', '548', '100g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030176', '6902265120506', '1', '海天 金标生抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030176.jpg', '7.6', '海天', '精选优质非转基因原料，充分晒制发酵而成。符合优质酱油对发酵工艺的严格要求制成。是中国专业调味品生产和营销的知名企业。酱香浓郁，滴滴鲜美，食用后令人回味无穷。', '2014-12-23 17:09:35', '', '548', '500ml', '', '', '', '', '', '1', '0', '8.1');
INSERT INTO `product` VALUES ('1030177', '6906151615831', '1', '牛栏山  38°红色8年酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030177.jpg', '63', '牛栏山', '精致的包装，吉祥高雅的色泽，体现出酒液的祥和寓意是一款节庆与亲友相聚。新人百年同欢之必备佳酿', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '63.5');
INSERT INTO `product` VALUES ('1030178', '6924187829886', '1', '洽洽 椒盐味香花生 130g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030178.jpg', '4.99', '洽洽', '洽洽（椒盐味香花生）坚持精选原料，配方严格，注重食品口感，口味新颖独特，为您奉上各种美味零食，请您静心品尝生活的滋味!洽洽（椒盐味香花生）取食简单，食用放心，更加营养美味独特的口感风味，品质优佳、香甜适口，沁香人味，味道十足，余味绵绵，是诱人美昧的健康零食，让您生活有滋有味!', '2014-12-23 17:09:35', '', '240', '130g', '', '', '', '', '', '1', '0', '5.49');
INSERT INTO `product` VALUES ('1030181', '6948195862192', '1', '金龙鱼 盘锦大米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030181.jpg', '37.7', '金龙鱼', '金龙鱼 盘锦大米精选盘锦大米为原料，四季分明，雨热同季，干冷同期，所种植香米品质上乘。金龙鱼 盘锦大米米粒粒粒饱满，晶莹如玉，味道醇香。金龙鱼 盘锦大米经过”低温烘干“”低温加工“等工序，保证了金龙鱼大米的安全、优质、美味。金龙鱼 盘锦大米采用独立包装，是居家，馈赠亲友的上佳选择。', '2014-12-23 17:09:35', '', '540', '5kg', '', '', '', '', '', '1', '0', '38.2');
INSERT INTO `product` VALUES ('1030183', '6920616312073', '1', '旺旺 雪饼经济包 618g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030183.jpg', '24.9', '旺旺', '旺旺雪饼口感香脆，自然。采用精选大米制成，老少皆宜，食用方便的休闲食品，非油炸，低油脂。', '2014-12-23 17:09:35', '', '270', '618g', '', '', '', '', '', '1', '0', '25.4');
INSERT INTO `product` VALUES ('1030184', '6902088304862', '1', '多芬 深层营润沐浴乳 720ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030184.jpg', '39.9', '多芬', 'Dove多芬深层营润滋养美肤沐浴乳，针对缺水、粗糙的紧绷皮肤。锁水保湿，与肌肤的天然滋养成分相似，能够与肌肤完美匹配。', '2014-12-23 17:09:35', '', '1080', '720ml', '', '', '', '', '', '1', '0', '40.4');
INSERT INTO `product` VALUES ('1030187', '6909409012116', '1', '上好佳 玉米味 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030187.jpg', '2.9', '上好佳', '清脆每一口，让您回味无穷，休闲消遣，朋友聚会，常备食品。', '2014-12-23 17:09:35', '', '270', '40g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030188', '6923146198094', '1', '杜蕾斯激情装(小)  3只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030188.jpg', '12.9', '杜蕾斯', '杜蕾斯避孕套，品质可靠，体感舒适，橡胶的柔软性及传热性与人体相当，可以为您营造更完美的体验', '2014-12-23 17:09:35', '', '1800', '3只', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030189', '6902890218715', '1', '双汇 海鲜肠 40g*10', '1000007', 'http://pictures-of-goods.qiniudn.com/1030189.jpg', '11.5', '双汇', '双汇 海鲜风味肠，精选优质鱼肉、猪肉为原料，加以其他辅料精制而成。本品口味独特、包装新颖、携带方便，深受消费者喜爱。', '2014-12-23 17:09:35', '', '180', '40g*10', '', '', '', '', '', '1', '0', '12');
INSERT INTO `product` VALUES ('1030190', '6902890225010', '1', '双汇 香卤蛋 30g*4', '1000031', 'http://pictures-of-goods.qiniudn.com/1030190.jpg', '7.5', '双汇', 'Q韧有劲，爽滑可口，细腻滑润，卤香四溢。', '2014-12-23 17:09:35', '', '150', '30g*4', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030191', '6923146105016', '1', '杜蕾斯Love  安全套 10只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030191.jpg', '24.8', '杜蕾斯', '杜蕾斯避孕套，品质可靠，体感舒适，橡胶的柔软性及传热性与人体相当，可以为您营造更完美的体验', '2014-12-23 17:09:35', '', '1800', '10只', '', '', '', '', '', '1', '0', '25.3');
INSERT INTO `product` VALUES ('1030192', '6906151615879', '1', '牛栏山  38°红色10年酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030192.jpg', '92', '牛栏山', '精致的包装，吉祥高雅的色泽，体现出酒液的祥和寓意是一款节庆与亲友相聚。新人百年同欢之必备佳酿', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '92.5');
INSERT INTO `product` VALUES ('1030193', '6913189335655', '1', '同享 九制话梅 120g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030193.jpg', '6.99', '同享', '手工制作话梅，选自清新可口的特级话梅！从小吃到大，百吃不厌，口味经典', '2014-12-23 17:09:35', '', '548', '120g', '', '', '', '', '', '1', '0', '7.49');
INSERT INTO `product` VALUES ('1030196', '6924743915626', '1', '乐事 清新清爽黄瓜味薯片 75g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030196.jpg', '5.8', '乐事', '乐事薯片的金黄剔透。来自它优秀的美国土豆种苗基因;来自它美国专业生产技术的保鲜处理;清脆声响，来自它全球统一的品质管理。乐事薯片，口味丰富，香脆美味，老少皆宜，是居家旅行、聚会派对的上佳之选，共同分享快乐心情。', '2014-12-23 17:09:35', '', '270', '75g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030198', '6944978700859', '1', '有友 山椒味猪皮晶 60g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030198.jpg', '4.6', '有友', '“有友”野山椒水晶猪脆风味独特，口味纯正，卫生营养，食用方便，是佐餐伴酒，休闲旅游之佳品。', '2014-12-23 17:09:35', '', '180', '60g', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030199', '6921317996869', '1', '康师傅 劲凉冰绿茶 600ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030199.jpg', '2.5', '康师傅', '康师傅劲凉冰绿茶的口味的确是清凉超爽的感觉，其带有不是很浓的薄荷味道，甜味较淡，绿茶味比较明显。感觉这款产品很解渴，淡淡的绿茶和薄荷混在一起的清香也能萦绕在口中久久不散。', '2014-12-23 17:09:35', '', '360', '600ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030200', '6901073800723', '1', '古龙 茄汁沙丁鱼 425g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030200.jpg', '12.8', '古龙', '沙丁鱼，在香港被人们称沙甸鱼，又称萨丁鱼、鳁和鰯。小者长二寸，大者尺许，背苍腹白，肉美，多用来制为罐头食品。古龙茄汁沙丁鱼选优质沙丁鱼经多道工序精心制作而成，肉质松软、鲜味难挡、营养丰富。开罐即食、留住每一分美味，居家烹调、馈赠亲友之佳品。', '2014-12-23 17:09:35', '', '1080', '425g', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030204', '6921317600711', '1', '味好美 番茄沙司挤挤装 330g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030204.jpg', '6.8', '味好美', '精选出品与全球番茄种子专家，源自非转基因优质红熟番茄，安全，质优，营养！', '2014-12-23 17:09:35', '', '480', '330g', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030207', '6909409012093', '1', '上好佳 玉米卷 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030207.jpg', '2.9', '上好佳', '清脆每一口，让您回味无穷。休闲消遣，朋友聚会，常备食品。这是上好佳独创的小吃，一直以来它们是供家庭和朋友享用的休闲食品.', '2014-12-23 17:09:35', '', '270', '40g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030208', '6922175185242', '1', '古船 富强粉 5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030208.jpg', '21.5', '古船', '古船面粉，高标准制作，富强粉是一种比较精细、面筋含量高、杂质少、较白类似于精粉的高筋面粉，是小麦最核心的部分磨出的面粉口感好。加工精度高，色泽洁白，筋力强，品质稳定，具有良好的拉伸性和烘焙性能。以进口和国产优质小麦为原料。', '2014-12-23 17:09:35', '', '240', '5kg', '', '', '', '', '', '1', '0', '22');
INSERT INTO `product` VALUES ('1030210', '6907592001825', '1', '王致和 老北京豆豉 180g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030210.jpg', '3.4', '王致和', '老北京豆豉采用优质黄豆和多种配料发酵而成，其配方精良，工艺精湛，是您理想的调味佳品。', '2014-12-23 17:09:35', '', '720', '180g', '', '', '', '', '', '1', '0', '3.9');
INSERT INTO `product` VALUES ('1030211', '6919892633101', '1', '康师傅 3+2奶油苏打夹心饼干 125g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030211.jpg', '5.3', '康师傅', '3层饼干加2层夹心，多一层夹心，滋味更丰富，配以方形苏打饼干，香脆、不腻口。', '2014-12-23 17:09:35', '', '365', '125g', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1030213', '6916168616226', '1', '鲁花  5S压榨一级花生油 1.8L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030213.jpg', '49.9', '鲁花', '精选山东优质大花生，独创5S纯物理压榨工艺，靠物理压力而非转基因手段将油脂直接从原料中分离出来，全过程无任何化学添加剂，保证产品安全、卫生、无污染，天然营养不受破坏，只榨取第一道花生原汁，纯天然营养，富含油酸、亚油酸，维生素E、锌、钙等多种人体需要的营养元素。', '2014-12-23 17:09:35', '', '548', '1.8L', '', '', '', '', '', '1', '0', '50.4');
INSERT INTO `product` VALUES ('1030214', '6919892880109', '1', '康师傅 点点葱香美味酥饼干 85g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030214.jpg', '3.39', '康师傅', '表面撒有颗粒、饼体酥松、色泽金黄、味道丰富、口感独特的饼干', '2014-12-23 17:09:35', '', '365', '85g', '', '', '', '', '', '1', '0', '3.89');
INSERT INTO `product` VALUES ('1030215', '6903148064863', '1', '佳洁士 茶爽柠檬牙膏 120g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030215.jpg', '10.8', '佳洁士', '柠檬茶的独特香气.源自柠檬果香与清新茶香的激情碰撞。畅爽的活力清新体验让您绽放持久的健康美丽笑容。享受持久的茉莉花茶香清新体脸的同时让您的牙齿自然亮白.', '2014-12-23 17:09:35', '', '720', '120g', '', '', '', '', '', '1', '0', '11.3');
INSERT INTO `product` VALUES ('1030216', '6901754050171', '1', '乌江 清淡榨菜 80g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030216.jpg', '2.3', '乌江', '涪陵的独特气候及土壤尤其适合种植青菜头，以之为原料做出的涪陵榨菜鲜香脆嫩，因此备受欢迎。乌江是涪陵榨菜中领先品牌，它于1984年开创了小包装榨菜，从此畅销全国。巴国古都涪陵，因乌江（古称涪水）而得名。涪陵榨菜，名冠世界三大明腌菜之一。乌江榨菜色暖如玉，其味鲜、香、嫩、脆，更成为涪陵榨菜之佳品。', '2014-12-23 17:09:35', '', '480', '80g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030217', '6907992512020', '1', '伊利 味可滋巧克力奶昔乳饮 240ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030217.jpg', '3.8', '伊利', '奶昔饮品源自美国芝加哥，是全世界年轻人热衷的时尚之选。沿袭奶昔的浓稠口感，伊利味可滋品质优越的科特迪瓦可可粉，与纯正牛奶完美搭配，呈现出浓郁柔滑的迷人魅力。将牛奶中脂肪颗粒细化，与内容物高度融合，让营养不易流失，更带来恰到好处的细腻口感。带来100%浓醇口感，随时随地享受专属于我的惬意时光。', '2014-12-23 17:09:35', '', '180', '240ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030218', '6926445855552', '1', '古船 长粒香米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030218.jpg', '64.9', '古船', '古船东北米粒细长，做出的米饭食味清淡略甜，绵软略甜，芳香爽口，饭粒表面油光艳丽，是百姓餐桌上的首选。', '2014-12-23 17:09:35', '', '360', '5kg', '', '', '', '', '', '1', '0', '65.4');
INSERT INTO `product` VALUES ('1030220', '6920601711652', '1', '棒棒娃 烧烤牛肉粒 60g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030220.jpg', '18.3', '棒棒娃', '来自川西红原优质牧场的精选午后腿肉，天然草场长大，不受雾霾，工业污水侵袭，安全放心！', '2014-12-23 17:09:35', '', '360', '60g', '', '', '', '', '', '1', '0', '18.8');
INSERT INTO `product` VALUES ('1030221', '6902890237938', '1', '双汇 老北京白蒜肠 230g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030221.jpg', '11.8', '双汇', '双汇老北京蒜肠精选优质黑猪猪肉为主料以天然肠衣、山东优质白皮蒜为辅料。采用传统调馅工艺纯手工蒸煮而成', '2014-12-23 17:09:35', '', '90', '230g', '', '', '', '', '', '1', '0', '12.3');
INSERT INTO `product` VALUES ('1030222', '6907992512013', '1', '伊利 味可滋木瓜奶昔乳饮 240ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030222.jpg', '3.8', '伊利', '伊利味可滋精选营养丰富的木瓜浓浆，和品质优越的科特迪瓦可可粉，与纯正牛奶完美搭配，呈现出浓郁柔滑的迷人魅力。独特的“均质”工艺，将牛奶中脂肪颗粒细化，与内容物高度融合，让营养不易流失，更带来恰到好处的细腻口感。常温即可贮存，带来100%浓醇口感，随时随地享受专属于我的惬意时光', '2014-12-23 17:09:35', '', '180', '240ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030223', '6919892113306', '1', '康师傅 醇香芝麻口味蛋酥卷 90g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030223.jpg', '6.5', '康师傅', '康师傅蛋酥卷以鲜鸡蛋跟小麦粉为主要原料，营养又美味，酥脆又可口，健康又时尚。送亲访友，买给心爱的宝贝，或是贴补给自己当一份营养早餐都是不错为美味选择。', '2014-12-23 17:09:35', '', '365', '90g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030224', '6902890218722', '1', '双汇 王中王优级火腿肠 38g*10', '1000007', 'http://pictures-of-goods.qiniudn.com/1030224.jpg', '15.9', '双汇', '双汇王中王香肠，精选优质鸡肉、猪肉，辅以大豆蛋白等精制而成。', '2014-12-23 17:09:35', '', '180', '38g*10', '', '', '', '', '', '1', '0', '16.4');
INSERT INTO `product` VALUES ('1030225', '6909409012048', '1', '上好佳 芝士条 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030225.jpg', '2.9', '上好佳', '选用香浓醇厚的芝士加上精选的优质小麦粉及木薯粉，通过先进的物理膨化技术烘焙而成。每一根芝士条都香脆无比，非油炸。富含14种营养元素，零反式脂肪，美味又健康。打开包装浓浓芝士的清香上好芝士条，深受大小朋友的喜爱，休闲娱乐必备休闲零食!', '2014-12-23 17:09:35', '', '360', '40g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030226', '6940471600511', '1', '生和堂 金银花吸吸龟苓膏 253g', '1000084', 'http://pictures-of-goods.qiniudn.com/1030226.jpg', '3.75', '生和堂', '龟苓膏适合各年龄段的人食用。龟苓膏采用鹰嘴鬼和土茯苓为原料，再配生地等药物精制而成，营养价值非常高。打开直接食用，方便快捷美味有营养！', '2014-12-23 17:09:35', '', '360', '253g', '', '', '', '', '', '1', '0', '4.25');
INSERT INTO `product` VALUES ('1030227', '6921168500970', '1', '水溶C100  西柚汁 445ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030227.jpg', '4.4', '水溶C100', '配方新颖，酸冽爽口，风味独特。营养丰富——《中国居民膳食营养素参考摄入量》指出普通大众每日所需维生素C 100mg，“水溶C”果汁饮料每瓶所含100mg维生素C。包装时尚——瓶型独特，玻璃质感；透明标签，时尚感。', '2014-12-23 17:09:35', '', '360', '445ml', '', '', '', '', '', '1', '0', '4.9');
INSERT INTO `product` VALUES ('1030228', '6902088603217', '1', '中华 魔丽迅白牙膏 100g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030228.jpg', '9.5', '中华', '双重膏体.内层蓝光炫白科技配方，温和作用于牙釉质，迅速提升牙齿的美白程度;外层的晶莹啫喱膏体能在持续使用后有效美白牙齿。', '2014-12-23 17:09:35', '', '1080', '100g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030231', '6906151617217', '1', '牛栏山  45°特制八年二锅头 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030231.jpg', '25.9', '牛栏山', '牛栏山二锅头酒，精选优质高粱和小麦等为原料，以豌豆、大麦等制成大曲为发酵剂，纯粮酿造绿色自然。从原料粉碎到成品酒灌装，历经糊化、发酵、蒸馏等十多道关键工序，悉心传统工艺酿造。婚宴祝福，团圆小酌，节日送礼，商务宴请必备良品！', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '26.4');
INSERT INTO `product` VALUES ('1030232', '6935145303034', '1', '锐澳 白桃+白兰地鸡尾酒 330ml', '1000012', 'http://pictures-of-goods.qiniudn.com/1030232.jpg', '6.5', '锐澳', '酒感平滑爽快 水果味浓郁 清爽可口的灌装设计 让你忍不住想咪上一口 ', '2014-12-23 17:09:35', '', '540', '330ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030234', '6901668053510', '1', '卡夫 奥利奥巧脆卷香草威化饼 55g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030234.jpg', '4.6', '卡夫', '美味尝鲜，随身享受，独立小包装，随时随地享受美味。', '2014-12-23 17:09:35', '', '360', '55g', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030236', '6902088307139', '1', '力士 恒久嫩肤娇肤香皂 115g*3', '1000060', 'http://pictures-of-goods.qiniudn.com/1030236.jpg', '12.9', '力士', '如凝脂般水润的娇嫩肌肤，令为心驰神往，不禁想要轻轻碰触。全新力士恒久嫩肤娇肤香皂，含有蚕丝精华，是一种天然的护肤因子，提取与蚕丝中，能够保湿锁水.融入法国玫瑰精华和天然精粹樱桃籽油。', '2014-12-23 17:09:35', '', '1080', '115g*3', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030237', '6909409012031', '1', '上好佳 荷兰豆 55g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030237.jpg', '2.9', '上好佳', '非油炸，烘焙而成，天然的道路，严格的质量控制过程。清脆每一口，让您回味无穷，休闲消遣，朋友聚会，常备食品', '2014-12-23 17:09:35', '', '270', '55g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030238', '6901808288802', '1', '露露 无糖杏仁露 240ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030238.jpg', '3.6', '露露', '露露杏仁露是以野生杏仁为原料，采用特殊工艺精制而成的植物蛋白饮料.露露洁白如奶，细腻如玉，香味独特，回味悠长，冷饮清暑，老幼皆宜.具有调节功止旨、调节非特异性免疫和美容等保健功能。', '2014-12-23 17:09:35', '', '365', '240ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030239', '6903148054215', '1', '佳洁士 双效炫白牙膏 120g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030239.jpg', '10.8', '佳洁士', '全新升级的佳洁士双效炫白牙膏，含MCA美白浓稠配方，只要1天，就可以帮助您美白牙齿，而且保持持久光泽。美白效果更好更', '2014-12-23 17:09:35', '', '720', '120g', '', '', '', '', '', '1', '0', '11.3');
INSERT INTO `product` VALUES ('1030242', '6921355221558', '1', '三元 无蔗糖酸奶 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030242.jpg', '2.4', '三元', '三元酸奶，新鲜爽口，回味悠长，尽显浓醇、美味。', '2014-12-23 17:09:35', '', '14', '180g', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030243', '6914973601017', '1', '士力架 花生夹心巧克力 70g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030243.jpg', '5.1', '士力架', '士力架花生夹心巧克力独特的甜中带咸的口味使它与众不同，香浓的牛奶巧克力，包裹着柔软的焦糖和牛轧，还有酥脆的烤花生，可以随时随地消除饥饿，快速补充能量，带给您无与伦比的满足！', '2014-12-23 17:09:35', '', '294', '70g', '', '', '', '', '', '1', '0', '5.6');
INSERT INTO `product` VALUES ('1030244', '6948960100849', '1', 'HAPI哈尔滨 小麦王啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030244.jpg', '2.75', 'HAPI', '精选优质麦芽，无污染矿泉水，纯正优质啤酒花，现代化工艺加工制作而成。哈尔滨啤酒，坚持低温生产，密封灌装，确保纯正鲜活，给您自然舒服的放松感受。口味醇厚，入口清凉口感，顺滑可口，冷藏后饮用风味更佳。哈尔滨啤酒是聚会时的必备佳品，品味哈尔滨啤酒，享受美好生活。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '3.25');
INSERT INTO `product` VALUES ('1030245', '6924743915534', '1', '乐事 美国经典原味薯片 75g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030245.jpg', '5.8', '乐事', '乐事薯片香脆美味的秘密来自不一样的马铃薯，精选优质马铃薯为主要原材料精制而成。乐事坚持一贯的品质要求，在中国精选了阳光、温度、湿度和土壤条件适宜的地方，栽种下特选种薯。每一口都香脆劲薄的乐事薯片，为您带来轻松好心情，打开包装，美味享受即刻拥有。为忙碌工作的人带来一刻休闲时光,忘记压力,尽情享受。简单、自然,这就是乐事', '2014-12-23 17:09:35', '', '270', '75g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030246', '6901584065826', '1', '张裕 特酿干白 750ml', '1000010', 'http://pictures-of-goods.qiniudn.com/1030246.jpg', '49', '张裕', '张裕特酿干白葡萄酒系选用张裕葡萄园的顶级葡萄为原料，采用先进的工艺技术精心酿制而成。本品果香浓郁、风格高雅，具有微酸爽口悦怡的特色。', '2014-12-23 17:09:35', '', '2880', '750ml', '', '', '', '', '', '1', '0', '49.5');
INSERT INTO `product` VALUES ('1030247', '6901672912698', '1', '嘉士伯 冰纯啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030247.jpg', '7.6', '嘉士伯', '冰纯嘉士伯是嘉士伯公司最新的品牌，并与2004年8月上市，冰纯嘉士伯味道冰爽清纯、极易人喉，配以极富时代感的流线型瓶身，极受年轻人所喜爱。', '2014-12-23 17:09:35', '', '270', '330ml', '', '', '', '', '', '1', '0', '8.1');
INSERT INTO `product` VALUES ('1030248', '6921355240467', '1', '三元 特品纯牛奶 227ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030248.jpg', '2.9', '三元', '天然无污染的绿色风光孕育了新鲜优质的奶源。口感醇厚，香浓顺滑乐享浓郁纯正牛奶滋味。高温灭菌，无菌严密包装，无需冷藏，饮用安全。富含丰富的能量，保持每天充足的活力。', '2014-12-23 17:09:35', '', '45', '227ml', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030249', '6916168616301', '1', '鲁花  5S压榨一级花生油 1L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030249.jpg', '29.9', '鲁花', '精选山东优质大花生，独创5S纯物理压榨工艺，靠物理压力而非转基因手段将油脂直接从原料中分离出来，全过程无任何化学添加剂，保证产品安全、卫生、无污染，天然营养不受破坏，只榨取第一道花生原汁，纯天然营养，富含油酸、亚油酸，维生素E、锌、钙等多种人体需要的营养元素。', '2014-12-23 17:09:35', '', '548', '1L', '', '', '', '', '', '1', '0', '30.4');
INSERT INTO `product` VALUES ('1030250', '6934660529158', '1', '苏菲 日用棉柔迷你卫生巾 14片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030250.jpg', '9.9', '苏菲', '小尺寸+快渗吸收层.给你量少日大大的安心感，回潮也不怕!摆脱普通卫生巾厚重负担。', '2014-12-23 17:09:35', '', '1080', '14片', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030251', '6907992510453', '1', '伊利 全聪儿童成长奶 190ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030251.jpg', '3.53', '伊利', '伊利QQ星儿童成长牛奶，针对孩子成长期特殊营养解求，精选优质奶源.量身打造“三重保护系统”成长配方，特含维生素D，益生元、DHA +ARA益智组合，专注儿童身体、智力全面成长!', '2014-12-23 17:09:35', '', '210', '190ml', '', '', '', '', '', '1', '0', '4.03');
INSERT INTO `product` VALUES ('1030252', '6913102210816', '1', '家乐 西湖牛肉羹 37g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030252.jpg', '2.6', '家乐', '家乐西湖牛肉羹精选优质原料，将西湖牛肉羹的美味发挥到极致。绝对刺激你的味蕾。', '2014-12-23 17:09:35', '', '450', '37g', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030255', '6922175185211', '1', '古船 饺子粉 1.5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030255.jpg', '8.9', '古船', '精选优质小麦，是制作饺子、馄饨等食品的一种专用面粉，面筋含量高，质量好，色泽洁白，爽口有嚼劲，不糟、不粘、不浑汤', '2014-12-23 17:09:35', '', '240', '1.5kg', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030256', '6921168500956', '1', '水溶C100  柠檬汁饮料 445ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030256.jpg', '4.3', '水溶C100', '柠檬含有宝贵的天然维生素P和丰富的维生素C以及可溶性纤维素，是含糖分较少的水果。维生素P可以增强皮肤及毛孔的功能，有利于皮肤保健和美容。维生素C可参与人体胶原蛋白合成，促进抗体的生成。一个，两个，三个，四个，五个，五个半柠檬C，满足每日所需维生素C，瓶身设计时尚，老品牌，口感更纯正！', '2014-12-23 17:09:35', '', '360', '445ml', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030257', '6920601733364', '1', '棒棒娃 五香味卤汁牛肉 80g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030257.jpg', '19.8', '棒棒娃', '来自川西红原优质牧场的精选午后腿肉，天然草场长大，不受雾霾，工业污水侵袭，安全放心！', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '20.3');
INSERT INTO `product` VALUES ('1030260', '6902088709827', '1', '金纺2L清新柔顺护理剂促装 2L+240ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030260.jpg', '23.8', '金纺', '清新柔顺一一金纺经典产品，连续15年畅销产品，强烈推荐!味道清新怡人，适用于各种衣物，加倍柔软舒适。金纺衣物护理剂含天然丝蛋白配方，浓浓的乳液深入滋养衣物受损纤维，使衣物柔软舒适，气味清新，去除静电，亮丽如新，不易变形，平整服帖，中和碱性残留。', '2014-12-23 17:09:35', '', '1080', '2L+240ml', '', '', '', '', '', '1', '0', '24.3');
INSERT INTO `product` VALUES ('1030263', '6922175185204', '1', '古船 自发粉 1.5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030263.jpg', '8.9', '古船', '古船牌生物营养型自发面粉由优质面粉和生物营养型疏松剂配制而制。含有多种人体所需的氮基酸B族维生素。用于制作包子、馒头、花卷、发面饼等发醉食品。方便快捷，营养丰富。制品香甜细腻、松软可口、具有醇香口味.', '2014-12-23 17:09:35', '', '180', '1.5kg', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030264', '6907592000026', '1', '王致和 大块腐乳 340g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030264.jpg', '6.7', '王致和', '王致和大块腐乳，优质选材，特殊工艺，健康美食，口感细腻、柔软、鲜美，让人回味无穷。', '2014-12-23 17:09:35', '', '0', '340g', '', '', '', '', '', '1', '0', '7.2');
INSERT INTO `product` VALUES ('1030266', '6934665081811', '1', '蒙牛 草莓味冠益乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030266.jpg', '13.9', '蒙牛', '蒙牛冠益乳原料取自天然牧场的优质牛奶，由乳酸菌发酵酸奶制成。采用国内先进加工工艺，保留了发酵乳的营养成分。蒙牛冠益乳风味发酵乳(草莓果粒)香甜风味邂逅浓香牛奶，草莓芬芳融入牛奶的丝滑，清新爽滑，散发甜蜜滋味。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030267', '6920354812118', '1', '高露洁纤柔双效旋白牙刷', '1000060', 'http://pictures-of-goods.qiniudn.com/1030267.jpg', '14.9', '高露洁', '深入牙缝及难刷部位，并温和清洁牙齿。横截面呈六角形，经科学实验证明。与高露洁细丝刷毛相比。清洁能力更强，有效去除牙齿表面牙渍。', '2014-12-23 17:09:35', '', '0', '/', '', '', '', '', '', '1', '0', '15.4');
INSERT INTO `product` VALUES ('1030269', '6947012800010', '1', '昆仑山 雪山矿泉水 510ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030269.jpg', '4.8', '昆仑山', '中国高端矿泉水，源自海拔6000多米青海省昆仑山玉珠峰，2010年亚运会官方唯一指定饮用水。', '2014-12-23 17:09:35', '', '720', '510ml', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1030273', '6901668062086', '1', '卡夫 趣多多巧克力饼干 95g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030273.jpg', '5.2', '卡夫', '酥脆曲奇，香浓巧克力味。抵不住的丰富口感.乐翻无穷的美味体验。独立小包装，美观大方，携带方便，休闲，充饥的上好选择', '2014-12-23 17:09:35', '', '365', '95g', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1030275', '6903148048788', '1', '飘柔 局油护理洗发露 200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030275.jpg', '14.5', '飘柔', '一瓶价钱等于5瓶焗油效果，5倍精纯焗油精华滋润至发梢，对抗秀发毛躁、无光泽感、干枯。', '2014-12-23 17:09:35', '', '1080', '200ml', '', '', '', '', '', '1', '0', '15');
INSERT INTO `product` VALUES ('1030277', '6934665081804', '1', '蒙牛 椰果果粒冠益乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030277.jpg', '13.9', '蒙牛', '蒙牛冠益乳原料取自天然牧场的优质牛奶，由乳酸菌发酵酸奶制成。采用国内先进加工工艺，保留了发酵乳的营养成分。蒙牛冠益乳风味发酵乳(椰果果粒)香甜风味邂逅浓香牛奶，椰果芬芳融入牛奶的丝滑，清新爽滑，散发独特滋味。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030278', '6901668200013', '1', '太平 奶盐梳打饼 100g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030278.jpg', '3.15', '太平', '纯正的美味，总能让人回味。太平梳打精选优质小麦烘焙而成。淡淡的天然麦香融合梳打特有的烘焙香在嘴里散开，就像阳光下麦田的纯净自然味道。独立小包装，美观大方，携带方便.休闲.充饥的上好选择', '2014-12-23 17:09:35', '', '365', '100g', '', '', '', '', '', '1', '0', '3.65');
INSERT INTO `product` VALUES ('1030281', '6917878037103', '1', '雀巢 脆脆鲨巧克力夹心威化 480g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030281.jpg', '28.5', '雀巢', '雀巢精选优质小麦，运用先进工艺技术拱培成五层威化.口感丰富香脆，回味无穷。牛奶成分，美味又健康。层层威化外面包裹着浓郁牛奶巧克力，细腻甜美。巧克力美味，香浓可口，含人体所需的蛋白质及维生素，层层威化中均匀涂抹着美味巧克力夹心，香气浓郁。独立包装，方便随时随地享用美味', '2014-12-23 17:09:35', '', '365', '480g', '', '', '', '', '', '1', '0', '29');
INSERT INTO `product` VALUES ('1030285', '6921355221473', '1', '三元 百利包巧克力奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030285.jpg', '2.2', '三元', '天然无污染的绿色风光孕育了新鲜优质的奶源。口感醇厚，与巧克力完美结合，香浓顺滑乐享浓郁滋味。高温灭菌，无菌严密包装，无需冷藏，饮用安全。富含丰富的能量，保持每天充足的活力。', '2014-12-23 17:09:35', '', '45', '200ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030286', '6904800168110', '1', '和田宽 龙门白醋 480ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030286.jpg', '7.3', '和田宽', '这种白醋以优质大米为主要原料，采用目前国际上比较先进的液态深层发酵工艺精酿而成.理化、感官、卫生指标全部达到国际先进水平。', '2014-12-23 17:09:35', '', '365', '480ml', '', '', '', '', '', '1', '0', '7.8');
INSERT INTO `product` VALUES ('1030287', '6903252714630', '1', '康师傅 鲜虾鱼板桶面 102g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030287.jpg', '4.1', '康师傅', '康师傅鲜虾鱼板面，优选美味虾仁、Q滑鱼板佐以丰富海带芽，精心烹饪、带来清爽鲜滋味.\n打开一碗鲜虾鱼板面，扑面而来的鲜滋味令人神情气爽，心情立刻嘀起来!', '2014-12-23 17:09:35', '', '180', '102g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030288', '6909689600201', '1', '六必居 纯芝麻酱 200g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030288.jpg', '9', '六必居', '浓香芝麻味 吃火锅必备调料 浓稠芝麻酱；六必居涵义：黍稻必齐，曲赎必实，湛之必洁，陶瓷必良，火候必得，水泉必香。', '2014-12-23 17:09:35', '', '360', '200g', '', '', '', '', '', '1', '0', '9.5');
INSERT INTO `product` VALUES ('1030289', '6942659301319', '1', '达利园 和其正凉茶 600ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030289.jpg', '3.9', '达利园', '和其正凉茶根据民间传统配方，精选草本植物材料，采用现代科学方法精制而成，清火气、养元气、老少皆宜。', '2014-12-23 17:09:35', '', '360', '600ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030291', '6954767447476', '1', '芬达 水蜜桃味汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030291.jpg', '2.6', '芬达', '芬达是世界上最畅销的果味汽水，其名字源于”Fantasy“一字，取其“开怀.有趣“的含义。活力色彩，美味口感.鲜果美味，获利更多。吸引人的色彩及令人振奋的水果口味，把你从每日规范的生活中解脱出来，令你的开心脉搏加快。', '2014-12-23 17:09:35', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030292', '6907592000033', '1', '王致和 玫瑰腐乳 340g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030292.jpg', '6.8', '王致和', '王致和的豆腐乳素有细、软、鲜、香的特点!经检测，100克王致和腐乳中的氨基酸含量可满足成年人一日的需要最。钙、铁、锌含盆高于一般食品，还含有1B1,VB2，具有极高的营养价值.', '2014-12-23 17:09:35', '', '0', '340g', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030293', '6939209518020', '1', '九龙斋 酸梅汤 400ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030293.jpg', '3.8', '九龙斋', '九龙斋酸梅汤不添加柠檬酸、焦糖、山梨酸钾(防腐剂).选用优质乌梅、山植、桂花等原李风味独特。九龙斋酸梅汤由冰糖熬制而成，富含的营养成分。', '2014-12-23 17:09:35', '', '360', '400ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030294', '6902123300040', '1', '钱江 萧山罗卜干 68g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030294.jpg', '1.35', '钱江', '以萝卜为原料、配以食盐、白砂糖、生姜等辅料、经削皮、盐腌、翻池、兑酱、调味等工序制成！入口芳香脆嫩、咸淡适口、回味绵甜！独特的风味、爽脆可口、咸中带着甘甜、富有弹性、有嚼劲又美味！来自浙江、承载着历史悠久的文化传统、带着江南风情席卷你的味蕾！', '2014-12-23 17:09:35', '', '360', '68g', '', '', '', '', '', '1', '0', '1.85');
INSERT INTO `product` VALUES ('1030296', '6907992511962', '1', '伊利 香蕉味QQ星果汁酸奶 200ml*4', '1000022', 'http://pictures-of-goods.qiniudn.com/1030296.jpg', '12', '伊利', '伊利QQ星营养果汁酸奶，益生菌发酵、特别添加益生元和10%果汁，促进孩子肠胃消化吸收，让成长更通畅。更有专门针对孩子健康成长过程中所需的营养元素，铁、锌、钙，助力孩子健康成长。特别推出孩子喜欢的香蕉、草莓口味，口感浓厚爽滑。更有国内首创的3D立体维尼卡通瓶型，好喝又好玩。', '2014-12-23 17:09:35', '', '180', '200ml*4', '', '', '', '', '', '1', '0', '12.5');
INSERT INTO `product` VALUES ('1030297', '6916296970030', '1', '乐天 巧克力注心小熊饼 49g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030297.JPG', '3.8', '乐天', '可爱的考拉形象，全新改良小熊饼干更香脆，更香浓的夹心松脆细腻，慢慢融入口中，香甜润滑，滋味无穷！', '2014-12-24 12:16:25', '', '455', '49g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030304', '6903102103485', '1', '燕京  10°啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030304.jpg', '2.38', '燕京', '燕京啤酒采用纯天然矿泉水酿造，饮后回味有泉水般的甘甜；现代化啤酒制作装备、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平；优质酵母菌种；鲜期长达4个月:保存4个月的酒和刚下线的一样新鲜，到国际最高水平；通过中国绿色食品发展中心审核、符合绿色食品A级标准。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '2.88');
INSERT INTO `product` VALUES ('1030305', '6921355221381', '1', '三元 利乐枕奶 227ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030305.jpg', '2.5', '三元', '纯牛奶、价格实惠、营养健康；三元：安全、极致、品质', '2014-12-23 17:09:35', '', '45', '227ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030307', '6902890022961', '1', '双汇 鱼肠(袋) 50g*5', '1000007', 'http://pictures-of-goods.qiniudn.com/1030307.jpg', '8.8', '双汇', '优质原料：双汇鱼肉香肠，精选优质鸡肉、猪肉，辅以大豆蛋白等精制而成；精致肉感：双汇鱼肉香肠，精致肉感，泡面加香肠，美味不可档；多样食用：双汇鱼肉香肠，可用于即食、爆炒、油炸、烧烤等；精美包装：双汇鱼肉香肠，采用简易包装，适合出郊游携带，方便好吃', '2014-12-23 17:09:35', '', '180', '50g*5', '', '', '', '', '', '1', '0', '9.3');
INSERT INTO `product` VALUES ('1030311', '6913221010304', '1', '立顿 S100黄牌精选红茶 200g', '1000026', 'http://pictures-of-goods.qiniudn.com/1030311.jpg', '39.9', '立顿', '精选全球优质茶叶，以确保最上乘的品质，手工新鲜采摘，加上百年制茶经验，保证茶品品质始终如一；独特双室茶包，茶味更加迅速渗透，茶香怡人', '2014-12-23 17:09:35', '', '720', '200g', '', '', '', '', '', '1', '0', '40.4');
INSERT INTO `product` VALUES ('1030312', '6916296970047', '1', '乐天 草莓注心小熊饼 49g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030312.jpg', '3.8', '乐天', ' 可爱的考拉形象，全新改良的小熊饼干更香脆，更香浓的夹心松脆细腻，慢慢融入口中，香甜润滑，滋味无穷！草莓奶油夹心，草莓口味，回味无穷。', '2014-12-23 17:09:35', '', '455', '49g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030313', '6907992511955', '1', '伊利 草莓味QQ星果汁酸奶 200ml*4', '1000022', 'http://pictures-of-goods.qiniudn.com/1030313.jpg', '12', '伊利', '伊利QQ星营养果汁酸奶，益生菌发酵、特别添加益生元和10%果汁，促进孩子肠胃消化吸收，让成长更通畅。更有专门针对孩子健康成长过程中所需的营养元素，铁、锌、钙，助力孩子健康成长。特别推出孩子喜欢的香蕉、草莓口味，口感浓厚爽滑。更有国内首创的3D立体维尼卡通瓶型，好喝又好玩。', '2014-12-23 17:09:35', '', '180', '200ml*4', '', '', '', '', '', '1', '0', '12.5');
INSERT INTO `product` VALUES ('1030315', '6954767441481', '1', '可口可乐 芬达橙味汽水 330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030315.jpg', '2.15', '可口可乐', '芬达隶属与可口可乐公司，著名的饮料生产商，其产品占全球大多数的市场份额；橙味爽口好喝，橙味十足，伴随气泡在口中欢乐跳动，美妙感受在口中玩不停；古老而经典的瓶身设计，精美大方，辨识度高，易拉罐设计，密封性好，保持产品优越品质', '2014-12-23 17:09:35', '', '540', '330ml', '', '', '', '', '', '1', '0', '2.65');
INSERT INTO `product` VALUES ('1030317', '6922255451427', '1', '景田 百岁山矿泉水 570ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030317.jpg', '2.3', '景田', '精选水质：百岁山饮用天然矿泉水源自地下岩石层160米以下水源，富含偏硅酸、钙、钾等  多种有益于人体健康的微量元素；纯正口感：百岁山饮用天然矿泉水纯正口感，高品质安全可靠，解渴产品，让身体充满活力；健康解渴：运动完后需要补充水分，聚餐时菜的口味太重，来一瓶百岁山饮用天然矿泉水解渴吧。', '2014-12-23 17:09:35', '', '360', '570ml', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030318', '6902083881085', '1', '娃哈哈 AD钙奶 220g*4', '1000021', 'http://pictures-of-goods.qiniudn.com/1030318.jpg', '7.8', '娃哈哈', '娃哈哈AD钙奶饮品，采用钙质吸收的上佳载体——牛奶为基础，又辅以维生素A和维生素D，促进钙质吸收，达到真正补钙。娃哈哈AD钙奶饮品　　——好喝又补钙　', '2014-12-23 17:09:35', '', '180', '220g*4', '', '', '', '', '', '1', '0', '8.3');
INSERT INTO `product` VALUES ('1030319', '6921299762070', '1', '旺旺 葡萄味QQ糖 70g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030319.jpg', '3', '旺旺', '2002年上市，产品添加果汁(还原最.5%)及维生索，强化营养同时，使风味更加纯正自然，深受各年龄层消费者喜爱，销量稳居市场首位，并于07年g月获得“中国名牌产品”称号。旺仔QQ糖口味纯正自然，颗粒晶莹剔透，结合独特咬感，Q到刚刚好。', '2014-12-23 17:09:35', '', '360', '70g', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1030320', '6921355221411', '1', '三元 特品纯鲜牛奶 243ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030320.jpg', '2.2', '三元', '三元特品牛奶精选优质生牛乳为主要原料，经标准化、均质、超高温灭菌和无菌灌装等工艺制成。三元特品纯牛奶243ml纯牛，不外加任何添加剂、防腐剂、香精及人工色素，纯正原味。', '2014-12-23 17:09:35', '', '4', '243ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030322', '6901845041705', '1', '格力高 百醇草莓香草味饼干 48g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030322.jpg', '6.6', '格力高', '经典香脆的麦芽风味饼干棒，百醇将美味酱倾注在香脆的饼干棒中，不仅不沾手而且食用起来也不受季节的影响，以“美味与健康”为公司理念的格力高集团为世界不同消费者提供相同的优质服务。经典的巧克力系列，加上红酒巧克力的绝妙组合，美味精彩瞬间，心情悠闲一刻。', '2014-12-23 17:09:35', '', '360', '48g', '', '', '', '', '', '1', '0', '7.1');
INSERT INTO `product` VALUES ('1030323', '6923450657935', '1', '益达 沁香蓝莓味木糖醇口香糖 56g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030323.jpg', '9.5', '益达', '口香糖中含有比其他木糖醇口香糖中更多的木糖醇，木糖醇含量占甜味料的50%以上，木糖醇是产自天然的甜味料，她与蔗糖一样甜，但食用后不会产生引起蛀牙的酸性物质，可以有效帮助牙齿防蛀。', '2014-12-23 17:09:35', '', '360', '56g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030324', '6923589463858', '1', '高洁丝 纤巧棉柔超熟睡夜翼巾 3片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030324.jpg', '6.5', '高洁丝', '创新瞬吸漏斗，精准瞬吸，蜂窝锁水，夜用系列产品采用“真扇尾”。两侧尾冀加长加宽:吸收体加宽延伸至尾部两侧边缘吸收多2倍，最舒适棉柔奖—高洁丝纤巧柔肤超长夜用。得奖原因:细腻如棉的表层，触感温和柔软，几乎感觉不到摩擦，较具他产品更为舒适。', '2014-12-23 17:09:35', '', '1080', '3片', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030325', '6926892527088', '1', '银鹭 桂圆八宝粥 360g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030325.jpg', '3.9', '银鹭', '五谷生活好滋味！精选天然五谷原料椰果、麦仁、糯米、红豆、花生仁、绿豆、薏仁、桂圆、腰豆，用银鹭特有技术“生料装罐 滚动杀菌”进行生产，100%保留原有美味和营养！银鹭八宝粥倡导健康两步走：第一步，每日走6000步；第二步，每天50g粗粮。', '2014-12-23 17:09:35', '', '360', '360g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030329', '6932850200023', '1', '太古 白砂糖 454g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030329.jpg', '8.85', '太古', '太古糖业有限公司，著名白砂糖品牌，糖类市场领导者，秉承市场先驱的百年传统。每颗方糖均选用精选白砂糖，加入过撼水，在密封自动搅拌器混合后充压成形，最后经远红外线高温干操杀菌。其大小一致，每粒分量等于一茶匙白砂糖:是为饮品添加甜味的方便优雅之选，家居和办公室不可不备。', '2014-12-23 17:09:35', '', '540', '454g', '', '', '', '', '', '1', '0', '9.35');
INSERT INTO `product` VALUES ('1030333', '6936749501123', '1', '好侍百梦多 辣味咖喱 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030333.jpg', '9.9', '好侍', '口味醇厚，香味更浓郁。口感稳定操作简单。无熏复杂的调味工作，省时省力、方便快捷、味美价廉好实惠、营养去热。', '2014-12-23 17:09:35', '', '730', '100g', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030337', '6948960101129', '1', '哈尔滨 小麦王啤酒 500ml*3', '1000014', 'http://pictures-of-goods.qiniudn.com/1030337.jpg', '12.8', '哈尔滨', '一缕麦香，回味悠长，开瓶即饮，冰镇更佳，价格实惠，品质保障。', '2014-12-23 17:09:35', '', '360', '500ml*3', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030339', '6918598020307', '1', '波力 原味海苔 30g', '1000081', 'http://pictures-of-goods.qiniudn.com/1030339.jpg', '19.8', '波力', '低热量，高纤维含量，富含多种维生素。海苔搭配五谷杂粮，更香更美味。独立小包设计，吃起来更方便\n。', '2014-12-23 17:09:35', '', '365', '30g', '', '', '', '', '', '1', '0', '20.3');
INSERT INTO `product` VALUES ('1030340', '6921355221312', '1', '三元 加钙鲜牛奶 243ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030340.jpg', '2.1', '三元', '三元高钙牛奶选用优质生牛乳为主要原料，强化了钙和维生素D，经标准化、均质、超高温灭菌和无菌灌装等工艺制成。其中钙含量比普通牛奶的平均钙含量高30%以上。强化了维生素D3更能促进钙的吸收。', '2014-12-23 17:09:35', '', '4', '243ml', '', '', '', '', '', '1', '0', '2.6');
INSERT INTO `product` VALUES ('1030341', '6903102101474', '1', '燕京  10°本生啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030341.jpg', '2.4', '燕京', '燕京啤酒采用纯天然矿泉水酿造，饮后回味有泉水般的甘甜；现代化啤酒制作装备、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平；优质酵母菌种；鲜期长达4个月:保存4个月的酒和刚下线的一样新鲜，到国际最高水平；通过中国绿色食品发展中心审核、符合绿色食品A级标准。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030342', '6921956637109', '1', '亨氏 番茄酱 300g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030342.jpg', '8.66', '亨氏', '美味无添加绿色健康：不添加防腐剂。3优锁鲜包装锁住营养：采用科学3优锁鲜包装，保质优、保护优、保存优。精选食材放心食用：摘选出品于全球蛋茄种子专家。源自非专基因优质红熟蛋茄，加工过程.严格按朋国家绿色食品要求进行品质管理。安全、优质、营养。', '2014-12-23 17:09:35', '', '540', '300g', '', '', '', '', '', '1', '0', '9.16');
INSERT INTO `product` VALUES ('1030343', '6913102210113', '1', '家乐 鸡茸玉米羹 38g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030343.jpg', '2.58', '家乐', '家乐快熟汤共有7种不同的口味，款款都是家乐厨师以其丰富厨世，专业创新精神，烹制而成，满足您不同需求。只要将家乐快熟汤加入三碗水煮3-4分钟后，加个蛋搅拦，就可以做出美味汤羹了。', '2014-12-23 17:09:35', '', '450', '38g', '', '', '', '', '', '1', '0', '3.08');
INSERT INTO `product` VALUES ('1030344', '6919892110626', '1', '康师傅 醇香芝麻家庭装蛋酥卷 384g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030344.jpg', '31.5', '康师傅', '一层层精心卷制，营养丰富，口感香酥，色泽金黄，更有多种美味任您享用 。', '2014-12-23 17:09:35', '', '365', '384g', '', '', '', '', '', '1', '0', '32');
INSERT INTO `product` VALUES ('1030345', '6921168559084', '1', '农夫山泉 打奶茶抹茶奶茶 320g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030345.jpg', '6.1', '农夫山泉', '清新、自然、顺滑 .带有点点花香和海苔香、抹茶珠突出，带有爽口的茶苦，整体口感香浓协调，无\n茶叶的苦溉感.', '2014-12-23 17:09:35', '', '270', '320g', '', '', '', '', '', '1', '0', '6.6');
INSERT INTO `product` VALUES ('1030346', '6922731800770', '1', 'ABC  纤薄棉柔排湿表层夜巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030346.jpg', '11.7', 'ABC', '吸收速度快、反渗透力强、吸收体量大。纤薄纯棉.超吸舒适。适合夜间最一般或较少的人群。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '12.2');
INSERT INTO `product` VALUES ('1030348', '6921168559077', '1', '农夫山泉 打奶茶红茶奶茶 320g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030348.jpg', '6.1', '农夫山泉', '顺滑、柔滑、柔和、饱满、浓郁、厚实、厚重、有料感、有层次、立体感强、茶香足、奶味真实、茶香与奶香和谐、风味浓郁、香味纯正、回味佳。', '2014-12-23 17:09:35', '', '270', '320g', '', '', '', '', '', '1', '0', '6.6');
INSERT INTO `product` VALUES ('1030349', '6947012800164', '1', '昆仑山 矿泉水 510ml*12', '1000015', 'http://pictures-of-goods.qiniudn.com/1030349.jpg', '56', '昆仑山', '青藏高原海拔6000米昆仑雪山，积雪慢慢融化，渗入岩层，经过50年的过滤和矿化，成为珍贵的雪山矿泉水。', '2014-12-23 17:09:35', '', '720', '510ml*12', '', '', '', '', '', '1', '0', '56.5');
INSERT INTO `product` VALUES ('1030350', '6901844505215', '1', '味好美 咖喱粉 30g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030350.jpg', '7.1', '味好美', '色泽嫩滑、鲜咸微辣、油而不腻。带给肉类、海鲜、蔬菜独特的咖喱风味。经现代先进的工艺加工制作，使营养充分保留，风味更加独特。简约的瓶装，取食方便，又易携带，是居家生活的上乘之选。', '2014-12-23 17:09:35', '', '730', '30g', '', '', '', '', '', '1', '0', '7.6');
INSERT INTO `product` VALUES ('1030351', '6918678423035', '1', '李锦记 蒸鱼豉油 410ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030351.jpg', '11.9', '李锦记', '李锦记蒸鱼鼓油，豉香浓郁，味道鲜甜，使用简单方便，可轻易带出蒸鱼的鲜美本质，也可用于蒸畜呀口烹饪海鲜，味道媲美酒家出品。食用澎去:青蒸鱼或其他蒸的菜式，亦可用于烹饪海鲜、炒饭、剁椒鱼头等菜式。', '2014-12-23 17:09:35', '', '730', '410ml', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1030353', '6909409012321', '1', '上好佳 玉米花 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030353.jpg', '2.9', '上好佳', '精选原料精心研制：精选颗粒饱满的玉米粒，经过杀菌处理，严格品控；入口咔吃咔吃响不停：清新的玉米上涂了一层怡糖，在你打开包装瞬间，周围的朋友都会被爆米花的香气吸引来哦；', '2014-12-23 17:09:35', '', '270', '50g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030355', '6901844702218', '1', '味好美 孜然粉 10g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030355.jpg', '1.73', '味好美', '味好美中国调味品界的著名品牌，中国驰名商标、用于调陷、腌制肉类食品，在妙菜或烧菜时加入适盆可调味增香。可用来作为烹调、烧烤中的调味料，风味独特。独创超低温粉碎工艺，保留原始色、香、味，纯正健康。', '2014-12-23 17:09:35', '', '720', '10g', '', '', '', '', '', '1', '0', '2.23');
INSERT INTO `product` VALUES ('1030358', '6920354814518', '1', '高露洁 360备长炭深洁牙膏 180g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030358.jpg', '15.9', '高露洁', '经科学验证，直达牙缝深层清洁备长炭是经过超高温炭化后所成的精华，微细众多，吸附力强。360备长炭深洁牙，有效减少细菌滋生，含超微细备长炭粒子，深人渗透到牙缝间难刷部位。给你卓越深层清洁。', '2014-12-23 17:09:35', '', '1080', '180g', '', '', '', '', '', '1', '0', '16.4');
INSERT INTO `product` VALUES ('1030360', '6931429201041', '1', '伊利 味浓原味袋装酸乳 150g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030360.jpg', '2', '伊利', '奶源纯正：来自伊利优质奶源带特别选育良种奶牛，带来自然的“浓香纯“。品质上乘：全球领先的生产工艺，很好的保留了牛奶中的基础营养成分。值得信赖：营养丰富，为全家人的健康添活力。', '2014-12-23 17:09:35', '', '14', '150g', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030361', '6920031806027', '1', '乐德 0602棉球棒 220支', '1000059', 'http://pictures-of-goods.qiniudn.com/1030361.jpg', '5.9', '乐德', '100%纯棉，100%健康。采用医用脱脂棉，颜色为乳白色，棉头小、细，使用方便舒畅。使用新型环保材质，安全卫生，棒杆采用PP材质，有韧性不易拆断。乐德牌20年清洁护理专家。', '2014-12-23 17:09:35', '', '1080', '220支', '', '', '', '', '', '1', '0', '6.4');
INSERT INTO `product` VALUES ('1030362', '6901668200082', '1', '太平 芝麻梳打 100g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030362.jpg', '3.15', '太平', '太平梳打饼干，精选上乘小麦粉烘焙而成，松脆可口，散发四溢的葱香，它低糖，鲜香而不油腻，采用严格的发酵工艺，营养好吸收。精选上乘小麦粉烘制而成，鲜香松脆的口感，散发出淡淡秤香，更含有强化钙和强化铁，美味又有益。', '2014-12-23 17:09:35', '', '365', '100g', '', '', '', '', '', '1', '0', '3.65');
INSERT INTO `product` VALUES ('1030363', '6920180240581', '1', '屈臣氏 苏打水 330ml*4', '1000015', 'http://pictures-of-goods.qiniudn.com/1030363.jpg', '16.6', '屈臣氏', '0千焦，不含糖，营养健康，外型轻便，适合外出行走等。屈臣氏调酒系列以优质超值著称，适台调制各种鸡尾酒和饮料，可为其发挥别树一格的美味，可谓双得益彰.富含硼、锌、硒、铬等离子矿物和微盆元素，这些微量元素呈离子状态，更易被人体吸收。', '2014-12-23 17:09:35', '', '360', '330ml*4', '', '', '', '', '', '1', '0', '17.1');
INSERT INTO `product` VALUES ('1030364', '6917878006918', '1', '雀巢 可可味滋早餐 150g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030364.jpg', '16.9', '雀巢', '雀巢营养谷物早餐系列，四大优势为焕发活力的你，开启一天好神采！营养均衡：雀巢营养谷物早餐是多种营养谷物制成的粗粮早餐，特别添加9种维生素和钙等矿物质，搭配牛奶食用，含维生素包括C、B12，矿物质例如钙、铁、叶酸等，帮助你开启美好的早晨。', '2014-12-23 17:09:35', '', '365', '150g', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030366', '6925303721039', '1', '统一 鲜橙多 450ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030366.jpg', '2.8', '统一', '优质选材、富含每日所需维生素C和膳食纤维、采用独特精致加工制成、简约时尚的塑料装设计，饮用简单，携带方便，是居家、旅行、馈赠亲友的上佳饮品。', '2014-12-23 17:09:35', '', '365', '450ml', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1030367', '6922731800695', '1', 'ABC  纤薄棉柔排湿表层日巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030367.jpg', '9.8', 'ABC', '超吸纯棉、立围防侧露、适合量多、担心侧露的人群。革新科技—蓝芯2迅爽迅速吸收、KMS健康配方健康舒适、天然纯棉。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030368', '6901845041804', '1', '格力高 百奇抹茶味装饰饼干 50g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030368.jpg', '5.5', '格力高', '在很多OTAKU的心里，POCKY也近乎是神一般的存在。是因为Pocky经常地出现在许多动画/漫画中促成了该零食的名声。本品为麦芽风味的香脆饼干棒，裹以爽滑抹茶酱的纤巧美味，就是一支时尚愉快的抹茶味百奇。随时随地，分享Pocky，共享快乐.', '2014-12-23 17:09:35', '', '360', '50g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030369', '6921168504015', '1', '农夫山泉 尖叫运动饮料 550ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030369.jpg', '3.8', '农夫山泉', '农夫尖叫系列口味较为清淡，热量较低，符合现代消费者对饮料低热量的要求，同时适当补充了多种维生素和矿物质，产品既能解渴，又达到了补充多种营养成分的目的。可以提神醒脑，提高机体抵抗疾病的能力。', '2014-12-23 17:09:35', '', '360', '550ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030370', '6916168616554', '1', '鲁花  5S压榨一级花生油 5L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030370.jpg', '139.9', '鲁花', '中国目前最大的花生油专业生产企业、本土优质大花生[非转基因]、5S物理压榨专利技术、只榨取第一道花生原汁油、全程无任何化学添加剂', '2014-12-23 17:09:35', '', '540', '5L', '', '', '', '', '', '1', '0', '140.4');
INSERT INTO `product` VALUES ('1030371', '6901844305211', '1', '味好美 花椒粉 24g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030371.jpg', '9.6', '味好美', '味好美中国调味品界的著名品牌，中国驰名商标、用于调陷、腌制肉类食品，在炒菜或烧菜时加入适盆可调味增香。可用于盐制肉类食品、在蔬菜中加入可增香添味。独创超低温粉碎工艺，保留原始色、香、味\n纯正健康。', '2014-12-23 17:09:35', '', '1095', '24g', '', '', '', '', '', '1', '0', '10.1');
INSERT INTO `product` VALUES ('1030372', '6902088603002', '1', '中华 健齿白清新薄荷味牙膏 200g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030372.jpg', '6.8', '中华', '配方：晶元矿物质，亮白珍珠岩成分，氟钙配方，高效洁齿颗粒。作用：柔和英白牙齿表面，不损伤珐琅质，去除牙垢及牙菌斑。功效：晶元矿物质，珍珠岩。四周美白。', '2014-12-23 17:09:35', '', '1080', '200g', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030375', '6911316600454', '1', '阿尔卑斯 四支混合棒糖 40g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030375.JPG', '1.9', '阿尔卑斯', '阿尔卑斯--4支装混合味硬糖棒棒糖。口味：高级牛奶/草莓/香橙/葡萄', '2014-12-24 12:28:04', '', '730', '40g', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1030376', '6910019008369', '1', '超能 内衣专用皂 162g', '1000049', 'http://pictures-of-goods.qiniudn.com/1030376.jpg', '3.95', '超能', '以天然椰子油为原料，不含荧光增白剂，不含漂白剂，特别适合清洗文胸、内裤、睡衣、毛巾等各种贴身织物，洗后衣物柔软舒适，贴近肌肤更安全。有效祛异味，清新爽洁。洁净力强，泡沫细腻丰富易漂清。', '2014-12-23 17:09:35', '', '1080', '162g', '', '', '', '', '', '1', '0', '4.45');
INSERT INTO `product` VALUES ('1030377', '6920595902937', '1', '百乐麦 糕点用低筋粉 1.5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030377.jpg', '19.5', '百乐麦', '百乐麦糕点用低筋粉甄选多种进口优质小麦合理搭配和研磨。本品采用全套引进设备和麦芯提取的领先技\n术，提取每粒小麦种的麦芯部分，精心的加工。该产品适合制作各式糕点，其制品组织细腻、口感松软，由于加工制作特性稳定，特别适合家庭DIY。', '2014-12-23 17:09:35', '', '360', '1.5kg', '', '', '', '', '', '1', '0', '20');
INSERT INTO `product` VALUES ('1030378', '6907992511849', '1', '伊利 均膳型儿童成长奶 125ml*4', '1000020', 'http://pictures-of-goods.qiniudn.com/1030378.jpg', '10.8', '伊利', '专门针对容易偏食、挑食的成长期孩子，从《中国居民膳食指南》提倡的儿童平衡膳食、均衡营养出发，以全新升级的“三重保护系统”成长配方为基础，涵盖儿童成长每日必须的6大类营养物质，富含50种天然食物的营养精华，营养均衡一步到位，专助儿童全面成长！', '2014-12-23 17:09:35', '', '180', '125ml*4', '', '', '', '', '', '1', '0', '11.3');
INSERT INTO `product` VALUES ('1030380', '6920584471017', '1', '旺旺 旺仔原味牛奶 245ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030380.jpg', '5.3', '旺旺', '富含人体每日必须的多种氨基酸、钙、脂肪、维生素等营养成份；大红色的包装设计，醒目的旺仔LOGO,高端的品质，定价合理，是家庭送礼的理想选择。', '2014-12-23 17:09:35', '', '450', '245ml', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1030381', '6936749501116', '1', '好侍百梦多 微辣咖喱 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030381.jpg', '9.9', '好侍', '方便快捷，味美价廉好实惠，一盒好侍咖睡可供3-5人享用，价格也相当实惠一盒便可满足一家人的份量，实在是便宜味美，不愧为主妇们的明智选择!微辣，营养去热。', '2014-12-23 17:09:35', '', '730', '100g', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030384', '6936749501109', '1', '好侍百梦多 原味咖喱 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030384.jpg', '9.9', '好侍', '方便快捷，味美价廉好实惠，一盒好侍咖睡可供3-5人享用，价格也相当实惠一盒便可满足一家人的份量，实在是便宜味美，不愧为主妇们的明智选择!原味，营养去湿。', '2014-12-23 17:09:35', '', '730', '100g', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030387', '6938309700526', '1', '名仁 苏打水 360ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030387.jpg', '2.9', '名仁', '名仁，专注苏打水5大保障，值得信赖。586米发育深度、10亿年前秘藏珍稀原生活水、国家GMP标准生产车间。时尚达人、都市白领、商务人士、水灵女人更需要。', '2014-12-23 17:09:35', '', '360', '360ml', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030388', '6904546110091', '1', '百花 荆花蜂蜜 450g', '1000025', 'http://pictures-of-goods.qiniudn.com/1030388.jpg', '16.9', '百花', 'MM们钟爱的这款蜂蜜采集生长在北方深山区荆花的花蜜酿造而成。味道醉厚，口感甜润，富含易于人体吸收的多种有益成分。直接食用或涂抹食品、调入温水、牛奶、豆桨、果汁中饮用，口味极佳。用于凉拌蔬菜、水果和坚果。', '2014-12-23 17:09:35', '', '0', '450g', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030390', '6938309700168', '1', '名仁 蓝苏打水 360ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030390.jpg', '3.5', '名仁', '名仁苏打水来自于世界地质公园云台山地域深层水质，是无污染的深层地下水。经过离子交换，27膜虑二级反渗透等先进设备制得优质纯净水为基质。名仁苏打水无糖、无色素、无碳酸化合物。添加有机锌，能调节和维持体液酸碱平衡，被称为“健康之水”。', '2014-12-23 17:09:35', '', '360', '360ml', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030391', '6925303721367', '1', '统一 绿茶 500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030391.jpg', '2.4', '统一', '特选茶叶：精心特选绿茶茶叶，含有茶多酚，舒放新鲜嫩茶叶；口感纯正：将时尚与健康完融放自然茶味之中口感纯正，清新怡人；精湛工艺：采用独特工艺精工面成，严格质量把控，确保每一口茶都是好茶。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030392', '6922848641037', '1', '立顿 S25绿茶 50g', '1000026', 'http://pictures-of-goods.qiniudn.com/1030392.jpg', '11.9', '立顿', '色泽鲜亮，茶香宜人，口味鲜爽甘醇。本品选用来自天然无污染的著名茶产区，精挑细选，手工采摘的茶叶。立顿绿茶，像阳光般，焕发您的活力，照亮您生活的每一天。', '2014-12-23 17:09:35', '', '720', '50g', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1030393', '6902538005844', '1', '乐百氏 菠萝味脉动 600ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030393.jpg', '3.7', '乐百氏', '本品不含碳酸气，不会引起胃部胀气。蕴含多种营养元素，随时补充水分、能量。感觉不在状态时，一瓶脉动为你注入能量。具有天然清新的水果味，口感清爽，风味独特。乐百氏脉动维生素饮料，运用先进的现代技术、独特配方，充分保证了脉动的品质和口感。', '2014-12-23 17:09:35', '', '300', '600ml', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030394', '6904546110107', '1', '百花 洋槐蜂蜜 450g', '1000025', 'http://pictures-of-goods.qiniudn.com/1030394.jpg', '24.2', '百花', '本品不含碳酸气，不会引起胃部胀气。蕴含多种营养元素，随时补充水分、能量。感觉不在状态时，一瓶脉动为你注入能量。具有天然清新的水果味，口感清爽，风味独特。乐百氏脉动维生素饮料，运用先进的现代技术、独特配方，充分保证了脉动的品质和口感。', '2014-12-23 17:09:35', '', '0', '450g', '', '', '', '', '', '1', '0', '24.7');
INSERT INTO `product` VALUES ('1030396', '6954767430386', '1', '可口可乐 清爽柠檬雪碧 330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030396.jpg', '2.15', '可口可乐', '“雪碧”一词，音译自英语Sprite，原意为妖怪、精灵。作为一种饮料，把它译为“雪碧”可谓是煞费苦心。在汉语中，雪碧有纯洁、清凉的含义，使人在炎热的夏季里联想到一片纷飞的白雪，一潭清澈的碧水，顿时有一种清凉之感，产生“挡不住的诱惑”。这样的饮料名，听着就想喝。', '2014-12-23 17:09:35', '', '540', '330ml', '', '', '', '', '', '1', '0', '2.65');
INSERT INTO `product` VALUES ('1030397', '6901844706117', '1', '味好美 白胡椒粉 10g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030397.jpg', '2.6', '味好美', '白胡椒近似黑胡椒，但偏多泥土味、白胡椒是在完全成熟时采摘的，去掉果实外皮，留下灰白色的干核！在几乎所有国家的烹饪中都大有用武之地、各种肉类的烹饪、多种蔬菜的烹调、尤其是加在鱼或浅色酱汁菜式中！适用于禽类、畜类、水产类、各种汤羹、汁水及蔬菜类食品的烹饪、可增香去异味！ ', '2014-12-23 17:09:35', '', '1095', '10g', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030399', '6922130101034', '1', '太太乐 鸡精 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030399.JPG', '4.5', '太太乐', '新配方新包装，3鲜营养新提升。以独特的三大优势：新鲜，优鲜，倍鲜，得到广大消费者的喜爱和认可。采用国际食品安全管理体系，独特的鲜鸡深层分解科技，鲜美指数由原来的180度升级到200度，令鲜美程度提至2倍。而且决不添加任何防腐剂和人工色素，确保每包鸡精的优良品质。', '2014-12-24 13:03:19', '', '600', '100g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030400', '6902890233244', '1', '双汇 蒜香烤肠 105g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030400.jpg', '3.9', '双汇', '不断完善加工工艺、优化配方、改进流程，更新包装，产品品质及口感味道没有进行过大的调整，一直保持着独特的肉感强、香味纯正的风格。正是这些因素促成了该产品的持续发展，成为双汇品牌叫的最响、规模最大、在消费者心目中接受度最高的产品。', '2014-12-23 17:09:35', '', '90', '105g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030403', '6925303721398', '1', '统一 冰红茶 500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030403.jpg', '2.4', '统一', '双重柠檬风味、丰富酸甜口感、清凉畅快，一口到底。', '2014-12-23 17:09:35', '', '365', '500ml', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030405', '6903148091654', '1', '舒肤佳 纯白型香皂 125g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030405.jpg', '5.6', '舒肤佳', '10倍抑菌能力：比普通沐浴产品抑菌力高出10倍；10全保护全家人健康：有效对抗3大类中的10种细菌威胁；温和配方经典清香：用后不紧绷，全家适用。', '2014-12-23 17:09:35', '', '1080', '125g', '', '', '', '', '', '1', '0', '6.1');
INSERT INTO `product` VALUES ('1030406', '6909409033739', '1', '上好佳 膨化综合装 80g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030406.jpg', '4.8', '上好佳', '上好佳（中国）有限公司是菲律宾LIWAYWAY公司于1993年在华投资的以食品工业为主的企业集团。至今几年时间内，已开发了100多种品味，以优良的品质、中等价位和优秀的服务，使\"上好佳\"系列休闲食品畅销全国各大中心城市，深受消费者的青睐。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '5.3');
INSERT INTO `product` VALUES ('1030407', '6907992500942', '1', '伊利 纯牛奶利乐枕 240ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030407.jpg', '2.5', '伊利', '源自呼仑贝尔大草原等国际公认的优质奶牛饲养基地带;有经过专职畜牧师和营养师精心挑选、养育的健康奶牛提供营养均衡的好奶;117项严格的原奶检测，全程不添加任何防腐剂，更有严格的质量管理体系。伊利纯牛奶 绿色 天然 纯正，富含九大基础营养，给予全家每日健康活力！', '2014-12-23 17:09:35', '', '45', '240ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030408', '6920001158187', '1', '郁美净 高级儿童霜 30g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030408.jpg', '2.7', '郁美净', '白色霜状质地，高级儿童霜营养比5连包儿童霜营养更丰富 滋润保湿，白嫩肌肤，令肌肤远离干燥，保持丰润、细致、柔滑，保湿 滋润 面霜 抗敏感 温和', '2014-12-23 17:09:35', '', '1095', '30g', '', '', '', '', '', '1', '0', '3.2');
INSERT INTO `product` VALUES ('1030409', '6920907800944', '1', '好丽友  6枚巧克力派 204g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030409.jpg', '9.2', '好丽友', '在两片柔软的饼干之间放入松软的，含有果冻成分的夹心，然后再以巧克力包裹的可口、美味的好丽友派自从在中国上市以来，受到各个不同年龄阶段的消费者欢迎。好丽友派最外层为纯正香浓的巧克力（代可可脂），外层下面是松软的蛋糕，最里层为麦淇酪（不含脂肪哦，不用担心发胖）。', '2014-12-23 17:09:35', '', '300', '204g', '', '', '', '', '', '1', '0', '9.7');
INSERT INTO `product` VALUES ('1030411', '6911316400016', '1', '阿尔卑斯 高级牛奶硬糖 31g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030411.jpg', '2', '阿尔卑斯', '商品特色：纯真的味道细如初恋阿尔卑斯经典口味。主要成份：白砂糖、葡萄糖浆、乳清粉、氢化植物油、奶油,炼乳,葡萄糖,麦芽糊精,食用盐,香兰素焦糖色,磷脂(大豆磷脂)', '2014-12-23 17:09:35', '', '720', '31g', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030414', '6906785230806', '1', '红星  65°二锅头酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030414.jpg', '15.9', '红星', '传承八百年烧酒精艺，1949年红星收编了北京12家著名烧锅老字号，集京城传统酿酒工艺和文化于一身，成为北京二锅头传统酿制技艺的正宗摘传者。“二锅头”就是原材料在经过第二锅烧制时的“锅头”酒，这酒最为纯正，无异味，浓度虽高却不烈，真正的醇厚绵香.', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '16.4');
INSERT INTO `product` VALUES ('1030415', '6907992510576', '1', '伊利 百利包草莓优酸乳 195ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030415.jpg', '1.3', '伊利', '伊利大品牌信得过，百利包，方便易携带，方便、美味、健康。', '2014-12-23 17:09:35', '', '45', '195ml', '', '', '', '', '', '1', '0', '1.8');
INSERT INTO `product` VALUES ('1030416', '6901584170001', '1', '张裕 加气葡萄酒 1.5L', '1000010', 'http://pictures-of-goods.qiniudn.com/1030416.jpg', '36', '张裕', '本品果香怡人、酸甜爽口、开瓶声音清脆、泡沫洁白持久。是节庆、宴会的必备佳品。 ', '2014-12-23 17:09:35', '', '730', '1.5L', '', '', '', '', '', '1', '0', '36.5');
INSERT INTO `product` VALUES ('1030418', '6924187833708', '1', '洽洽 奶油味小而香西瓜子 128g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030418.jpg', '5.2', '洽洽', '洽洽食品股份是国内坚果炒货领域的知名品牌。瓜子口中放，横立磨牙间，顺着缝隙嗑，一磕两半开，舌尖取果仁，香留唇齿间。粒粒香脆,让人回味,一两口酒乡美酒,三四粒洽洽花生,五六人家中小聚,七八载难舍真情!西瓜子有清肺化痰的作用，对咳嗽痰多和咯血等症有辅助疗效。', '2014-12-23 17:09:35', '', '240', '128g', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1030419', '6903102105052', '1', '燕京  10°鲜啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030419.jpg', '3.9', '燕京', '燕京啤酒采用纯天然矿泉水酿造(国家四部委认证)，锶含量高，饮后回味有泉水般的甘甜。现代化啤酒制作装备:溶解氧控制最好、PO值控制最好、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030420', '6901668200235', '1', '太平 香葱梳打 100g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030420.jpg', '3.15', '太平', '葱花味发酵饼干：酥脆可口浓香奶味；可爱量身小包装：分量尽量做到一次吃完；午后、抵饿饼干：酥脆鲜香一包怎够吃；小麦成分，健康营养添活力；丰富蛋白质，增加好营养；牛奶鲜香，更增钙营养。', '2014-12-23 17:09:35', '', '365', '100g', '', '', '', '', '', '1', '0', '3.65');
INSERT INTO `product` VALUES ('1030421', '6922646102921', '1', '公牛  GN314插座 1.8M', '1000061', 'http://pictures-of-goods.qiniudn.com/1030421.jpg', '45.8', '公牛', '独立开关排插板 1.8/3米电源接线板排插拖线板GN314蓝白色1.8米；弹性强劲，5000次不松动；超粗铜线；内芯750度高温不燃烧；一体式插头。', '2014-12-23 17:09:35', '', '0', '1.8M', '', '', '', '', '', '1', '0', '46.3');
INSERT INTO `product` VALUES ('1030422', '6923644270957', '1', '蒙牛 特仑苏有机奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030422.jpg', '76', '蒙牛', '金牌营养：蛋白质含量比国家标准高出13.8%；金牌产地：来自黄金奶源纬度带，特仑苏专属牧场；金牌牧草：多国优质牧草品种，全天候自由滋养；金牌乳牛：特仑苏专属牧场，汇集各国良种乳牛；金牌管理：金牌牛奶车间，指纹认证管理。', '2014-12-23 17:09:35', '', '180', '250ml*12', '', '', '', '', '', '1', '0', '76.5');
INSERT INTO `product` VALUES ('1030423', '6920242105155', '1', '怡达 山楂羹 300g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030423.jpg', '9.6', '怡达', '怡达山楂，绿色食品；开胃，让生活更舒心；分享美味，分享心情；不倒牙的酸甜，不嗯牙的劲道，不粘牙的口感，吃了还想吃，想吃就要吃；质量保障。', '2014-12-23 17:09:35', '', '540', '300g', '', '', '', '', '', '1', '0', '10.1');
INSERT INTO `product` VALUES ('1030424', '6925303774165', '1', '统一 小浣熊奇奇怪怪干脆面 55g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030424.jpg', '1', '统一', '酥脆面身；十足料包；独一无二的小浣熊；现的品质包装；快乐调性；旅行、加班、学习、娱乐之必备。', '2014-12-23 17:09:35', '', '180', '55g', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1030425', '6927849460588', '1', '好巴食 山椒味豆腐干 95g', '1000008', 'http://pictures-of-goods.qiniudn.com/1030425.jpg', '4.3', '好巴食', '好巴食 豆腐干 四种口味 山椒味，五香味，麻辣味，烧烤味。多种选择，劲道爽口，地道川味。 ', '2014-12-23 17:09:35', '', '270', '95g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030426', '6901844710114', '1', '味好美 椒盐 20g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030426.jpg', '2.2', '味好美', '椒盐排条曾经是平民的宠儿，是很受大众喜爱的家常菜之一。虽然很平常，但也是上台面的菜。从前在宴请宾客的宴席上经常可以看到它。改革开放以后，各路菜肴纷纷抢占上海滩，一时间川菜湘菜贵州菜红红火火，粤菜京菜杭州菜此起彼伏。香辣蟹小龙虾盛行一时。', '2014-12-23 17:09:35', '', '1095', '20g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030427', '6906785005015', '1', '红星 52°红星二锅头酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030427.jpg', '9.2', '红星', '红星二锅头源于北京烧酒已有800年历史了。1949年根据政府命令，由红星全面接收老北京12家老字号酒坊，独家传承北京二锅头酒酿制技艺！北京酿酒在开放、兼容的文化氛围中，完成了从古酒向烧酒的转变，当时酒坊“ 古代酿酒灶火如屋，突烟腾上，数里外皆见之。”可见其规模之大。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '9.7');
INSERT INTO `product` VALUES ('1030429', '6910019006372', '1', '雕牌 透明皂 252g*2', '1000049', 'http://pictures-of-goods.qiniudn.com/1030429.jpg', '9.3', '雕牌', '产品特性:天然椰子油配方、泡沫丰富、去污迅速、经久耐用、强力去污、易滚节水、洁净亮丽、阳光清泞、清香怡人。', '2014-12-23 17:09:35', '', '1080', '252g*2', '', '', '', '', '', '1', '0', '9.8');
INSERT INTO `product` VALUES ('1030430', '6927849460601', '1', '好巴食 烧烤味豆腐干 95g', '1000008', 'http://pictures-of-goods.qiniudn.com/1030430.jpg', '4.3', '好巴食', '好巴食 豆腐干 四种口味 山椒味，五香味，麻辣味，烧烤味。多种选择，劲道爽口，地道川味', '2014-12-23 17:09:35', '', '270', '95g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030431', '6902083896775', '1', '娃哈哈 格瓦斯麦芽汁饮品 330ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030431.jpg', '2.99', '娃哈哈', '格瓦斯，源自俄罗斯，距今有1000多年的历史，19世界末传入中国。被称为“液体面包”。美味口感，娃哈哈格瓦斯口感醇香微甜，呈琥珀颜色，气足泡多，有一种特有的面包焦香和麦乳芳香。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '3.49');
INSERT INTO `product` VALUES ('1030432', '6903290190502', '1', '古越龙山 三年陈陈年花雕酒 600ml', '1000011', 'http://pictures-of-goods.qiniudn.com/1030432.jpg', '10', '古越龙山', '中国最大的黄酒，生产经营出口企业；国家优质产品，多次荣获国际国内金奖；中国首批原产，地域保护产品；“古越龙山”绍兴酒的独特品质；保真年份，足年库藏。', '2014-12-23 17:09:35', '', '548', '600ml', '', '', '', '', '', '1', '0', '10.5');
INSERT INTO `product` VALUES ('1030433', '6927849460595', '1', '好巴食 五香味豆腐干 95g', '1000008', 'http://pictures-of-goods.qiniudn.com/1030433.jpg', '4.3', '好巴食', '好巴食 豆腐干 四种口味 山椒味，五香味，麻辣味，烧烤味。多种选择，劲道爽口，地道川味。 ', '2014-12-23 17:09:35', '', '270', '95g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030434', '6920907800210', '1', '好丽友 蛋黄派 138g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030434.jpg', '9.8', '好丽友', '精选优质的鸡蛋（新鲜鸡蛋含量为22%）、牛奶和小麦，小小的蛋黄派中富含多多的蛋白质松软香甜的蛋糕裹住新鲜的蛋黄夹心，口感柔软细腻。营养多多、美味多多、钙质多多、健康多多，好丽友·蛋黄派，大家一起来分享！', '2014-12-23 17:09:35', '', '300', '138g', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030435', '6922430913399', '1', '金熊 上等泰国香米 2.5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030435.jpg', '47', '金熊', '纯正泰国东北部盛产的香米，米粒细长整齐，晶莹如玉，直接可闻到一股香味，选用泰国东北部盛产的香米，有韧性，口感好，清香，煮粥，做米饭用作其他食品辅料，特别是制作寿司等上等原料。', '2014-12-23 17:09:35', '', '720', '2.5kg', '', '', '', '', '', '1', '0', '47.5');
INSERT INTO `product` VALUES ('1030436', '6913102210410', '1', '家乐 酸辣汤 42g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030436.jpg', '2.58', '家乐', '家乐快熟汤共有7种不同口味，款款都是家乐厨师以其丰富厨艺，专业创新的精神，烹制而成，满足您不同需求。只要将家乐快熟汤加入三碗水煮3-4分钟后，加个蛋搅拌，就可以做出美味汤羹了。', '2014-12-23 17:09:35', '', '450', '42g', '', '', '', '', '', '1', '0', '3.08');
INSERT INTO `product` VALUES ('1030437', '6925303774202', '1', '统一 小浣熊奥尔良烤翅干脆面 55g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030437.jpg', '1', '统一', '如今新一代小济熊千脆面，沿袭了前带小济熊的滋滋奖味。取出调料，束紧包装袋的上D，把干脆面捏碎，然后倒入诱人的调料。上下摇动，使二t得到完美的胜合。松开袋，顿时，奖味叭香。它麻醉你的神经，激活你的味蕾 .加速你的心跳!', '2014-12-23 17:09:35', '', '180', '55g', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1030439', '6955381400182', '1', '捞派 麻辣味海底捞火锅蘸料 140g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030439.jpg', '5.8', '捞派', '麻辣口味火锅蘸料，采用国内最先进的无菌灌装技术。安全、方便、更卫生；海底捞蘸料融汇巴蜀餐饮文化“蜀地,蜀风”浓郁的优质火锅品牌,选用精练植物油、优质豆瓣、辣椒、香辛料等精致而成 。', '2014-12-23 17:09:35', '', '360', '140g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030440', '6927849460571', '1', '好巴食 麻辣味豆腐干 95g', '1000008', 'http://pictures-of-goods.qiniudn.com/1030440.jpg', '4.3', '好巴食', '好巴食 豆腐干 四种口味 山椒味，五香味，麻辣味，烧烤味。多种选择，劲道爽口，地道川味。', '2014-12-23 17:09:35', '', '270', '95g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030441', '6955381400168', '1', '捞派 鲜香味海底捞火锅蘸料 140g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030441.jpg', '5.8', '捞派', '麻辣口味火锅蘸料，采用国内最先进的无菌灌装技术。安全、方便、更卫生；海底捞蘸料融汇巴蜀餐饮文化“蜀地,蜀风”浓郁的优质火锅品牌,选用精练植物油、优质豆瓣、辣椒、香辛料等精致而成 。', '2014-12-23 17:09:35', '', '360', '140g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030442', '6917878009193', '1', '雀巢 谷多多脆谷乐早餐 150g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030442.jpg', '16.9', '雀巢', '保持营养均衡至关重要，对成长期儿童来说尤为重要。营养谷物早餐，让全家开启活力充沛的一天！它由精选的5种健康营养谷物－燕麦、玉米、大麦、小麦和大米制成，并添加重要的维生素和矿物质。有助全家获得均衡营养。现在更加上全谷物配方！！全谷物食品保留了营养成分，使我们身体更健康！ ', '2014-12-23 17:09:35', '', '270', '150g', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030443', '6920907800968', '1', '好丽友  12枚巧克力派 408g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030443.jpg', '17.5', '好丽友', '好丽友官方旗舰店正品保证，日期新鲜。营养早餐：搭配牛奶麦片，营养健康； 惬意下午茶：搭配红茶，咖啡，提神醒脑恢复精力； 自助DIY：搭配蜂蜜、果酱、水果，丰富有趣； 出游随身：派对野餐随身携带，一起分享快乐美味 ！ ', '2014-12-23 17:09:35', '', '300', '408g', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030444', '6913102210427', '1', '家乐 黑椒酸辣汤 36g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030444.jpg', '2.58', '家乐', '家乐快熟汤共有7种不同口味，款款都是家乐厨师以其丰富厨艺，专业创新的精神，烹制而成，满足您不同需求。只要将家乐快熟汤加入三碗水煮3-4分钟后，加个蛋搅拌，就可以做出美味汤羹了。', '2014-12-23 17:09:35', '', '450', '36g', '', '', '', '', '', '1', '0', '3.08');
INSERT INTO `product` VALUES ('1030445', '6920354812286', '1', '高露洁纤柔先端深洁牙刷 /', '1000060', 'http://pictures-of-goods.qiniudn.com/1030445.jpg', '11.9', '高露洁', '超细软毛，深入抵达后牙，减少对牙龈的压力，橡胶刷柄，握感舒适。', '2014-12-23 17:09:35', '', '0', '/', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1030446', '6923450656181', '1', '益达 木糖醇无糖薄荷口香糖 56g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030446.jpg', '9.5', '益达', '清晨：嚼两粒薄荷味，清新一天！午后：嚼两粒香浓蜜瓜，饭后水果！晚上：嚼两粒爽洁微粒，你我更亲近！ ', '2014-12-23 17:09:35', '', '360', '56g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030447', '6904700201238', '1', '义利 精品果子 200g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030447.jpg', '9.6', '义利', '“义利”创建于一九零六年，是食品行业中著名的优秀老字号企业，享有“面包王”的美誉。“义利”商标曾多次荣获北京市著名商标的称号。', '2014-12-23 17:09:35', '', '4', '200g', '', '', '', '', '', '1', '0', '10.1');
INSERT INTO `product` VALUES ('1030448', '6954767447674', '1', '芬达 苹果汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030448.jpg', '2.6', '芬达', '芬达汽水（fanta）是1940年代在欧洲开始风行的饮料，1960年被可口可乐公司所并购。芬达橘子汽水最主要的核心口味，占有70%的销售量,但其它的水果口味也有众多爱好者。明亮的包装色彩、鲜明的水果口味、富含气泡等特色是芬达汽水广受欢迎的原因。', '2014-12-23 17:09:35', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030449', '6904800168264', '1', '和田宽 饺子醋 340ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030449.jpg', '6.5', '和田宽', '产品不含任何化学原料，具有酸味柔和，风味独特。宽牌龙门醋是纯粮酿造，产品感官呈现出的色泽吹瑰红色而透明，香气纯正，酸味醇和，略带甜味，适用于蘸食或炒菜。', '2014-12-23 17:09:35', '', '365', '340ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030451', '6921317998825', '1', '康师傅 柠檬冰红茶 2L', '1000018', 'http://pictures-of-goods.qiniudn.com/1030451.jpg', '6.8', '康师傅', '新潮、冰酷的时尚饮品，红茶的香醇加上柠檬的清爽，喝上一口，那种清凉冰爽的感觉如同爱琴海边的夏日清风，令你全身舒畅，冰后饮用更能体验“冰力十足，无可替代”的畅快，让你从头到脚一爽到底，体味无限冰酷乐趣。精选上等红茶，加入柠檬酸制成，冰冻后口感更佳。', '2014-12-23 17:09:35', '', '365', '2L', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030453', '6902083896706', '1', '娃哈哈 爽歪歪加锌酸奶饮 125g*4', '1000022', 'http://pictures-of-goods.qiniudn.com/1030453.jpg', '6.7', '娃哈哈', '娃哈哈锌爽歪歪中即含有丰富的蛋白质，又含有人体所需的纳、钙、磷、钾、锌等矿物质元素，更营养更美味！加入葡萄糖酸锌，在体内解离成锌离子和葡萄糖酸，促进生长，促进体内含锌酶功能！', '2014-12-23 17:09:35', '', '180', '125g*4', '', '', '', '', '', '1', '0', '7.2');
INSERT INTO `product` VALUES ('1030455', '6920180270038', '1', '屈臣氏 矿物质饮用水 600ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030455.jpg', '2.8', '屈臣氏', '屈臣氏饮用矿物质水是经105度超高温气化蒸馏而成，融合适量对人体有益的矿物质而成。是任何人士补充身体水份的健康选择。经过多层严密过滤、确保滴滴清纯的同时，加入对人体有益的矿物质', '2014-12-23 17:09:35', '', '720', '600ml', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1030457', '6907992511566', '1', '伊利 无乳糖乳铁蛋白舒化奶 250ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030457.jpg', '4.83', '伊利', '伊利营养舒化奶乳铁蛋白型,特别添加来自乳铁蛋白。乳铁蛋白型产品是首家将乳铁蛋白加入牛奶的产品,是继LHT乳糖水技术外的另一科技突破。采用创新LHT乳糖水解技术，将牛奶中不易吸收的乳糖营养细化分解，让吸收更加完整高效。营养好吸收，身体随时展现健康活力。', '2014-12-23 17:09:35', '', '180', '250ml', '', '', '', '', '', '1', '0', '5.33');
INSERT INTO `product` VALUES ('1030459', '6911316375161', '1', '阿尔卑斯 双享棒棒糖 16g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030459.jpg', '1', '阿尔卑斯', '阿尔卑斯双享棒棒糖，品尝着阿尔卑斯那独特味道的时候，也在品味着生活的甜蜜和浪漫，甚至品尝\"阿尔卑斯\"已不仅仅是品尝一种糖果的味道了……“阿尔卑斯棒棒糖,见证幸福每一刻。”“浓浓糖果情,甜蜜如拥抱” ', '2014-12-23 17:09:35', '', '720', '16g', '', '', '', '', '', '1', '0', '1.5');
INSERT INTO `product` VALUES ('1030460', '6901844501002', '1', '味好美 红烧肉调料 40g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030460.jpg', '2.95', '味好美', '味好美中国调味品界的著名品牌，中国驰名商标、用于调陷、腌制肉类食品，在炒菜或烧菜时加入适量可调味增香。味好美红烧肉调料红亮香浓、十分入味。专业调配，混和腌渍、加热即可.无需锅铲、翻一翻、拌一拌.微波最好、明火也可.', '2014-12-23 17:09:35', '', '720', '40g', '', '', '', '', '', '1', '0', '3.45');
INSERT INTO `product` VALUES ('1030462', '6931429201324', '1', '伊利 每益添原味活性乳酸菌 350ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030462.jpg', '6.5', '伊利', '口感:伊利每益添原味活性乳酸菌饮料，每百毫升富含300亿活性乳酸菌，并特别添加膳食纤维，形成消化快动力，让消化化更快速，肠胃更轻松。营养:每益添让你轻盈迎接每一天。酸奶是由纯奶牛发酵制成，富含的乳酸菌和膳食纤维，多喝酸奶能促进肠道蠕动。每天喝一杯，让你健康多一点!', '2014-12-23 17:09:35', '', '21', '350ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030463', '6934660515298', '1', '苏菲 动感丝薄日用洁翼卫生巾 20片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030463.jpg', '19.8', '苏菲', '吸收后洁净清爽的干爽网面，紧锁经血不回渗的立体深层吸收体，对比动感丝薄原产品变薄20%，三重阻漏压边+两侧灵动护围，能三次阻断经血的侧流和后流，渗漏不再！', '2014-12-23 17:09:35', '', '1095', '20片', '', '', '', '', '', '1', '0', '20.3');
INSERT INTO `product` VALUES ('1030464', '6919892311009', '1', '康师傅 蛋黄也酥酥 80g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030464.jpg', '3.4', '康师傅', '用新鲜蛋黄液精心烘焙而成，富含丰富卵磷脂和青少年成长必须的营养元素，更营养，更健康；饼体金黄、口感酥松，入口即化，回味悠长。', '2014-12-23 17:09:35', '', '365', '80g', '', '', '', '', '', '1', '0', '3.9');
INSERT INTO `product` VALUES ('1030465', '6907868583000', '1', '八喜 四合一 65g*4', '1000078', 'http://pictures-of-goods.qiniudn.com/1030465.jpg', '24', '八喜', '用鲜牛奶、鲜奶油及马达加斯加上好的天然香草精华配制的冰淇淋。世界上最流行的风味物质被“八喜”冰淇淋采用，使它诱人的芬芳并和谐着幽雅、温馨、丰满的香韵完美地体现在“八喜”香草冰淇淋中，令人永久回味，润爽细腻，口齿留香。', '2014-12-23 17:09:35', '', '540', '65g*4', '', '', '', '', '', '1', '0', '24.5');
INSERT INTO `product` VALUES ('1030467', '6904546110060', '1', '百花 枣花蜂蜜 450g', '1000025', 'http://pictures-of-goods.qiniudn.com/1030467.jpg', '21.6', '百花', '本品是蜜蜂采集生长在北方深山区荆花的花蜜酿造而成。味道醇厚，口感甜润，富含多种营养物质，有益于人体健康。', '2014-12-23 17:09:35', '', '0', '450g', '', '', '', '', '', '1', '0', '22.1');
INSERT INTO `product` VALUES ('1030468', '6954767411828', '1', '可口可乐 饮料 330ml*8', '1000017', 'http://pictures-of-goods.qiniudn.com/1030468.JPG', '14.6', '可口可乐', '可口可乐(英文名称:Coca-Cola,也称Coke),是由美国可口可乐公司出品的一种含有咖啡因的碳酸饮料。可口可乐早期在中国的译名作“蝌蝌啃蜡”,但因销路不佳,后改名为“可口可乐”。目前可口可乐在世界各地市场皆处领导地位,其销量远远超越其主要竞争对手百事可乐,被列入吉尼斯世界纪录。', '2014-12-24 12:44:59', '', '360', '330ml*8', '', '', '', '', '', '1', '0', '15.1');
INSERT INTO `product` VALUES ('1030469', '6921987380036', '1', '力保健 饮料 100ml*2', '1000084', 'http://pictures-of-goods.qiniudn.com/1030469.jpg', '12.8', '力保健', '一天来一瓶，有力更有为。抗疲劳、调节血脂、增强免疫力。不适宜少年儿童及孕妇。', '2014-12-23 17:09:35', '', '720', '100ml*2', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030473', '6902538005936', '1', '乐百氏 脉动蓝莓维生素饮料 500ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030473.jpg', '3.8', '乐百氏', '工艺先进：优质矿泉水带，引入国际先进的生产设备和技术进行严格制作。清新口昧：具有天然清新的蓝莓果味。营养丰富：蕴含多种营养元素和维生素，随时补充水分、保持动力。充盈活力：感觉生活单调沉闷时，来一瓶脉动回复生活的活力多彩!', '2014-12-23 17:09:35', '', '300', '500ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030475', '6920595902685', '1', '百乐麦 高筋面包粉 1.5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030475.jpg', '16.9', '百乐麦', '百乐麦高筋面包粉甄选多种进口高筋小麦和国产优良品种小麦合理搭配，采用全套引进设备和多级加工剥刮的领先工艺，经过科学搭配形成面筋含量高、延伸性好的高筋面包粉。', '2014-12-23 17:09:35', '', '360', '1.5kg', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030476', '6902890022558', '1', '双汇60g*10王中王 600g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030476.jpg', '22.5', '双汇', '双汇品质  值得信赖。烤着吃，炸着吃，煮着吃，泡面吃，样样都好吃哟！', '2014-12-23 17:09:35', '', '180', '600g', '', '', '', '', '', '1', '0', '23');
INSERT INTO `product` VALUES ('1030477', '6921317997712', '1', '康师傅 低糖茉莉清茶 2L', '1000018', 'http://pictures-of-goods.qiniudn.com/1030477.jpg', '6.8', '康师傅', '康师傅茉莉清茶,采撷午后接近傍晚时含苞双瓣茉莉,待微微绽开吐香之际与上等茶叶反复窨制五次, 以汲取全效的花香精萃。如此制得的茉莉清茶,经净水冲泡舒展,可将花香与茶香精华尽释而出,花清香,茶新味 ,非茶中俗物了。', '2014-12-23 17:09:35', '', '360', '2L', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030479', '6948960100924', '1', '百威 啤酒 330ml*6', '1000014', 'http://pictures-of-goods.qiniudn.com/1030479.jpg', '41.8', '百威', '百威啤酒格外清澈、格外清爽、格外清醇！百威啤酒采用质量最佳的纯天然 材料，以严谨的工艺控制，通过自然发酵，低温储藏而酿成。整个生产流程中不使用任何人造成份、添加剂或防腐剂。百年发展中一直以其纯正的口感，过硬的质量赢得了全世界消费者的青睐，长久以来被誉为是“啤酒之王”！', '2014-12-23 17:09:35', '', '360', '330ml*6', '', '', '', '', '', '1', '0', '42.3');
INSERT INTO `product` VALUES ('1030480', '6922646101825', '1', '公牛 GN612插座 1.8米', '1000061', 'http://pictures-of-goods.qiniudn.com/1030480.jpg', '30.5', '公牛', '插座转换器孔型国家标准全面更新，新国标的独特设计可以让插座与插座接触面积更大，接触更紧密，能有效防止发热；防触电性能更好。新国标大大提升插座产品的安全性能，使消费者的用电安全实现跨越式升级，让更安全的插座产品走进消费者世界。 ', '2014-12-23 17:09:35', '', '0', '1.8米', '', '', '', '', '', '1', '0', '31');
INSERT INTO `product` VALUES ('1030481', '6920001128210', '1', '郁美净 浴后乳液 220g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030481.jpg', '15.3', '郁美净', '“郁美净浴后乳液”以特制配方、独特工艺、领先技术，添加SOD及多种天然保湿营养成分、自由基清除剂等，采用水溶性乳剂，独特的保湿平衡系统不仅能将水分锁住，还可以给干渴的肌肤补水。SOD是防止人体细胞损伤和衰老的生物酶，能够缓解皮肤干燥，促进皮肤新陈代谢。', '2014-12-23 17:09:35', '', '1095', '220g', '', '', '', '', '', '1', '0', '15.8');
INSERT INTO `product` VALUES ('1030482', '6934665087653', '1', '蒙牛 优益C活菌型原味饮品 340ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030482.jpg', '6.6', '蒙牛', '产品特点：活性好菌，每100毫升富含300亿个活性副干酪。0脂肪。温馨提示：开启后一次性饮完为佳，如发生异味、涨瓶等现象，请勿食用。', '2014-12-23 17:09:35', '', '21', '340ml', '', '', '', '', '', '1', '0', '7.1');
INSERT INTO `product` VALUES ('1030484', '6917878024189', '1', '雀巢  1+2特浓咖啡 130g', '1000077', 'http://pictures-of-goods.qiniudn.com/1030484.jpg', '16.5', '雀巢', '喝起来又香又浓，让人回味无穷。咖啡中添加甜炼乳调味，饮用时富有印度支那的柔婉，又含法国的浪漫风情。比同品牌的国内产品的价格低,而分量却更多,味道更香浓,口感更爽滑! ', '2014-12-23 17:09:35', '', '720', '130g', '', '', '', '', '', '1', '0', '17');
INSERT INTO `product` VALUES ('1030486', '6907376203087', '1', '强生 婴儿润肤油 200ml', '1000062', 'http://pictures-of-goods.qiniudn.com/1030486.jpg', '32.9', '强生', '成分/功效：具有10倍于强生婴儿普通润肤露的滋润效果，软化和清洁初生婴儿的胎脂和头垢。使用效果：专为婴儿设计的配方、纯净温和、易被吸收、给皮肤表面留下滋润保护膜。', '2014-12-23 17:09:35', '', '1095', '200ml', '', '', '', '', '', '1', '0', '33.4');
INSERT INTO `product` VALUES ('1030487', '6925843404577', '1', '黄飞红 香脆椒 100g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030487.jpg', '7.2', '黄飞红', '山东落花生配上天府之国的花椒和火红小辣椒。山东大花生，产自胶东半岛，受海洋的影响，气候温和，阳光充足， 弱碱性砂质土壤，适宜花生生长，180天的生长期，使得这里的花生粒大、皮薄、美味可口、营养丰富。', '2014-12-23 17:09:35', '', '240', '100g', '', '', '', '', '', '1', '0', '7.7');
INSERT INTO `product` VALUES ('1030488', '6910019006952', '1', '纳爱斯 抱抱芒果儿童牙膏 40g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030488.jpg', '6.9', '纳爱斯', '选用温和的高档软性硅磨料,保持牙齿健康亮白，芒果口味，采用热带水果香味,有营养,好味道,小朋友好喜欢，富含维生素，添加维生素C、水溶性矿物盐等营养成分,帮助儿童牙齿健康成长，自然健康，成分材料温和不刺激,适合儿童选用,给口腔全面的呵护。', '2014-12-23 17:09:35', '', '1080', '40g', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1030491', '6921204896098', '1', '葱伴侣 甜面酱 180g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030491.jpg', '1.9', '葱伴侣', '甜面酱，又称甜酱，是以面粉为主要原料，经制曲和保温发酵制成的一种酱状调味品，湖南一带又称为京酱。成品成粥状，红揭色有光泽，其味甜中带咸，同时有酱香和酷香。可供葫食，用于干炸、酥炸、香炸、煎、烙烤制品(菜点)的佐餐，也是酱爆系列菜肴不可或缺的领衔调味品。', '2014-12-23 17:09:35', '', '360', '180g', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1030494', '6922130101355', '1', '太太乐 鸡精(袋) 454g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030494.jpg', '18.3', '太太乐', '20年来太太乐一直坚持采用鲜鸡作为风味原料配以鸡蛋等辅料，运用高科技和新工艺生产优质鸡精。不添加任何防腐剂和人工色素，太太乐鸡精得到我们大厨一致认可。', '2014-12-23 17:09:35', '', '600', '454g', '', '', '', '', '', '1', '0', '18.8');
INSERT INTO `product` VALUES ('1030496', '6923450605332', '1', '绿箭 冰柠薄荷无糖薄荷糖 23.8g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030496.jpg', '9.3', '绿箭', '清凉爽口、清新口气、清洁口腔、有效祛除烟味及各种口腔异味。工作，饭后，闲时来一片绿箭，口气好，心情好，当然工作好。', '2014-12-23 17:09:35', '', '365', '23.8g', '', '', '', '', '', '1', '0', '9.8');
INSERT INTO `product` VALUES ('1030497', '6910019006938', '1', '纳爱斯 溜溜蓝莓儿童牙膏 40g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030497.jpg', '6.9', '纳爱斯', '优质选料：选用温和的高档软性硅磨料，保持牙齿健康亮白。蓝莓口味：采用蓝莓香味，有营养，好味道小朋友好喜欢。富含维生素：添加维生素C,维生素E和水溶性矿物盐等营养成分，帮助儿童牙齿健康成长。自然健康：成分材料温和不刺激，适合儿童选用，给口腔全面的呵护。', '2014-12-23 17:09:35', '', '1080', '40g', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1030499', '6903252039207', '1', '康师傅 经典陈坛酸菜牛肉面 119g*5', '1000033', 'http://pictures-of-goods.qiniudn.com/1030499.jpg', '12.2', '康师傅', '风味独特：精选上好食材，地道烹调手艺风味独特，美味层出不穷。上等食材：精选上等优质食材，经过丰富炖煮保留食材的鲜美原味。汤鲜味美：秘制配方熬制上等汤料，配以精制面饼，汤汁鲜香感佳。', '2014-12-23 17:09:35', '', '180', '119g*5', '', '', '', '', '', '1', '0', '12.7');
INSERT INTO `product` VALUES ('1030501', '6920180219327', '1', '屈臣氏 蒸馏水 4.5L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030501.jpg', '12.6', '屈臣氏', '清纯完美：屈臣氏蒸馏水经过106摄氏度高温气化蒸馏而成，滴滴清纯完美。 品质保证：是和记黄埔有限公司旗下屈臣氏集团之保健及美容品牌，品质有保障。', '2014-12-23 17:09:35', '', '540', '4.5L', '', '', '', '', '', '1', '0', '13.1');
INSERT INTO `product` VALUES ('1030502', '6906303888908', '1', '王守义 包子饺子调料 45g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030502.jpg', '4.5', '王守义', '王守义包子饺子调料本品选用多种植物香辛料，经传统工艺炮制，现代技术精制而成。风味独特，用途广泛，是制做包子、饺子、馄饨、馅饼、丸子等馅类食品的理想调料。亦可用于烧炒荤素菜肴，调制风味小吃及腌制酱、泡类食品。', '2014-12-23 17:09:35', '', '180', '45g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030503', '6924187827554', '1', '洽洽 香花生 88g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030503.jpg', '3.48', '洽洽', '洽洽品牌传递轻松休闲，在人们的欢声笑语中洽洽品牌神奇地滋生、成长。 一身古朴装束，一股浓郁的文化气息，走进了人们的视野，凸显产品营销向品牌营销变革。', '2014-12-23 17:09:35', '', '240', '88g', '', '', '', '', '', '1', '0', '3.98');
INSERT INTO `product` VALUES ('1030504', '6921355282597', '1', '三元 原味酸牛奶 100g*8', '1000022', 'http://pictures-of-goods.qiniudn.com/1030504.jpg', '11.5', '三元', '意犹未尽的美味：原味酸牛奶，口感细腻爽滑。奶香纯正温和，特别添加A, B, L, S四种益生菌，让肠道动起来，绽放好状态。比牛奶的好处多一点：发酵过程中，除了使纯牛奶的乳糖大部分转化为乳酸外，其它营养与牛奶没什么不同。', '2014-12-23 17:09:35', '', '14', '100g*8', '', '', '', '', '', '1', '0', '12');
INSERT INTO `product` VALUES ('1030505', '6917790974081', '1', '安琪 高活性干酵母 5g*10', '1000029', 'http://pictures-of-goods.qiniudn.com/1030505.jpg', '4.98', '安琪', '安琪，高活性干酵母采用遗传工程以及现代的干燥技术，制成即发活性干酵母又称高活性干酵母，与活性干酵母相比，颗粒小，发酵速度快，使用时不需要预先水化，可直接使用。安琪活性干酵母工业化生产运用高科技生物技术生产的纯生物制品，有着天然、营养、高效、快捷、卫生的特点。', '2014-12-23 17:09:35', '', '365', '5g*10', '', '', '', '', '', '1', '0', '5.48');
INSERT INTO `product` VALUES ('1030506', '6923450605318', '1', '绿箭 茉莉花茶无糖薄荷糖 23.8g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030506.jpg', '9.3', '绿箭', '清凉爽口、清新口气、清洁口腔、有效祛除烟味及各种口腔异味。工作，饭后，闲时来一片绿箭，口气好，心情好，当然工作好。', '2014-12-23 17:09:35', '', '365', '23.8g', '', '', '', '', '', '1', '0', '9.8');
INSERT INTO `product` VALUES ('1030508', '6917878029948', '1', '雀巢 优活饮用水 550ml*12', '1000015', 'http://pictures-of-goods.qiniudn.com/1030508.jpg', '13.8', '雀巢', '“雀巢优活”是雀巢水业集团的核心。作为知名国际品牌，雀巢优活始终致力于为您和您的家人提供安全,健康的饮用水。 雀巢优活饮用水源自天然深层地下水。清冽爽口，天然纯净。是您的健康饮水之选，满足您随时，随地的补水需求。 ', '2014-12-23 17:09:35', '', '360', '550ml*12', '', '', '', '', '', '1', '0', '14.3');
INSERT INTO `product` VALUES ('1030509', '6901347880390', '1', '椰树 利乐装椰汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030509.JPG', '12.5', '椰树', '椰树椰汁椰树牌天然椰子汁是以海南盛产的椰子为原料，采用先进的加工技术及科学配方精制而成。它是一种不加香精、糖精、防腐剂不含胆固醇的天然植物蛋白饮料，其汁液均匀乳白、清醇，具有浓郁的天然椰香味，口感柔和、甜度适中、含有脂肪、蛋白质、十七种氨基酸和锌、铁、钙、锰等元素。', '2014-12-24 12:42:17', '', '360', '1L', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030511', '6941837101109', '1', '塞翁福 茶树菇 150g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030511.jpg', '23.5', '塞翁福', '茶树菇营养丰富，蛋白质含量高达19.55%。所含蛋白质中有18种氨基酸，其中含量最高的是蛋氨酸占2.49%，其次为谷氨酸、天门冬氨酸、异亮氨酸、甘氨酸和丙氨酸。总氨基酸含量为16.86%。人体必需的8种氨基酸含量齐全，并且有丰富的B族维生素和钾、钠、钙、镁、铁、锌等矿质元素。', '2014-12-23 17:09:35', '', '360', '150g', '', '', '', '', '', '1', '0', '24');
INSERT INTO `product` VALUES ('1030512', '6901306665358', '1', '太阳 孜然豆香锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030512.jpg', '2.2', '太阳', '锅巴含有碳水化合物、脂肪、蛋白质、维生素A、B族维生素及钙、钾、铁、镁等矿物质，营养丰富、香脆可口。适宜人群，胃弱者及慢性胃炎、不思饮食者宜食；脾虚、消化不良、久泻不愈的老人、小儿宜食；病后消化力弱、食积腹痛者宜食。', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030513', '6914973600010', '1', '德芙 丝滑牛奶巧克力 43g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030513.jpg', '7.2', '德芙', '进口原料：进口可可豆加上进口奶源让你纵享美味丝滑；完美配比：纯可可脂和牛奶与蔗糖的完美配比使德芙享有特口味；世界先进生产线：先进的技术工艺和严格的监管体系，让全世界的德芙都保持相同的味道。', '2014-12-23 17:09:35', '', '364', '43g', '', '', '', '', '', '1', '0', '7.7');
INSERT INTO `product` VALUES ('1030514', '6920180210577', '1', '屈臣氏 苏打水 330ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030514.jpg', '4.2', '屈臣氏', '苏打水是经过纯化的饮用水中压入二氧化碳的饮料，清爽消暑。我们每天吃很多肉类、鱼类等酸性食物。饮用苏打水可以将人体内环境进行酸碱平衡。', '2014-12-23 17:09:35', '', '548', '330ml', '', '', '', '', '', '1', '0', '4.7');
INSERT INTO `product` VALUES ('1030515', '6957735788861', '1', 'i', '1000016', 'http://pictures-of-goods.qiniudn.com/1030515.jpg', '3.8', '椰树', '椰树牌天然椰子汁是以海南盛产的椰子为原料，采用先进的加工技术及科学配方精制而成。浓郁的椰香味，口感柔和!其汁液均匀乳白、清醇，具有浓郁的天然椰香味，口感柔和、甜度适中、含有脂肪、蛋白质、十七种氨基酸和锌、铁、钙、锰等元素。', '2014-12-23 17:09:35', '', '365', '245ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030516', '6908180991399', '1', '茹梦 橙汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030516.jpg', '12.5', '茹梦', '清雅鲜橙：口感柔滑，浓郁的水果香气，富有层次的口感，尽享鲜橙美味；营养丰富：富含维生素，美味更健康；科学工艺：采用先进的水果打浆工艺，经灭菌后灌装，保存原始风味； 精美包装本产品采用精致塑料罐装，包装时尚大方，是与家人分享与赠礼之优选。', '2014-12-23 17:09:35', '', '365', '1L', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030517', '6921168502066', '1', '农夫山泉 天然饮用水 550ml*12', '1000015', 'http://pictures-of-goods.qiniudn.com/1030517.jpg', '15.8', '农夫山泉', '农夫水源地：浙江千岛湖，吉林长白山，广东万绿湖，陕西太白山，新疆天山玛纳斯，湖北丹江口，四川峨眉山。农夫山泉选取天然优质水源，仅对水做最小限度的、必要的物理处理，保存了水中钾、钙、钠、镁、偏硅酸等对人体有益的天然矿物元素，pH值呈弱碱性，有利于人体长期饮用。', '2014-12-23 17:09:35', '', '730', '550ml*12', '', '', '', '', '', '1', '0', '16.3');
INSERT INTO `product` VALUES ('1030518', '6901306665372', '1', '太阳 小米五香锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030518.JPG', '2.2', '太阳', '小米太阳锅巴五香太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。', '2014-12-24 12:34:08', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030519', '6954767423579', '1', '可口可乐 零度无糖汽水 500ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030519.jpg', '2.6', '可口可乐', '零度可乐，绝对可口。“零度”可口可乐用阿斯巴甜等取代糖分，使其虽然无糖却有甜味。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030520', '6921168550128', '1', '农夫山泉 柠檬味维他命水 500ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030520.JPG', '3.6', '农夫山泉', '用轻松的方式，补充日常所需维他命！针对不同人群补充特定的维他命和矿物元素！添加12种维生素矿物质和氨基酸人体需要能量来维持生命运动，机体的生长发育和一切活动都需要能量，适当的能量可以保持良好的健康状况。全能王添加了钙、锌、镁、维生素B6、牛磺酸等12种矿物质、维生素和氨基酸。', '2014-12-24 12:51:09', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030521', '6921168550142', '1', '农夫山泉 柑橘味维他命水 500ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030521.jpg', '3.6', '农夫山泉', '用轻松的方式，补充日常所需维他命！针对不同人群补充特定的维他命和矿物元素！添加12种维生素矿物质和氨基酸人体需要能量来维持生命运动，机体的生长发育和一切活动都需要能量，适当的能量可以保持良好的健康状况。全能王添加了钙、锌、镁、维生素B6、牛磺酸等12种矿物质、维生素和氨基酸。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030522', '6901306665365', '1', '太阳 小米牛肉锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030522.jpg', '2.2', '太阳', '小米锅巴含有碳水化合物、脂肪、蛋白质、维生素A、B族维生素及钙、钾、铁、镁等矿物质,营养丰富、香脆可口。 太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。 ', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030523', '6904432800198', '1', '维维 维他豆奶粉 560g', '1000023', 'http://pictures-of-goods.qiniudn.com/1030523.jpg', '20.1', '维维', '本品以大豆，牛奶为主要原料精制而成，高钙，高蛋白质，含膳食纤维。得味浓郁。是现代家庭的营养饮品和送礼佳品。', '2014-12-23 17:09:35', '', '360', '560g', '', '', '', '', '', '1', '0', '20.6');
INSERT INTO `product` VALUES ('1030524', '6901306665389', '1', '太阳 小米孜然锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030524.jpg', '2.2', '太阳', '小米锅巴含有碳水化合物、脂肪、蛋白质、维生素A、B族维生素及钙、钾、铁、镁等矿物质,营养丰富、香脆可口。 太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。 ', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030525', '6922824075016', '1', '李锦记 精选老抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030525.jpg', '7.89', '李锦记', '选用非转基因大豆及小麦粉，以先进工艺精酿造而成色泽红亮，浓稠适中，酱香味浓，适合用来红烧、炖各种菜肴，色香诱人。佐餐和烹调，特别适合于红烧、焖、炖。', '2014-12-23 17:09:35', '', '540', '500ml', '', '', '', '', '', '1', '0', '8.39');
INSERT INTO `product` VALUES ('1030528', '6914973600041', '1', '德芙 香浓黑巧克力 43g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030528.jpg', '7.2', '德芙', '进口原料：进口可可豆加上进口奶源让你纵享美味丝滑；完美配比：纯可可脂和牛奶与蔗糖的完美配比使德芙享有特口味；世界先进生产线：先进的技术工艺和严格的监管体系，让全世界的德芙都保持相同的味道。', '2014-12-23 17:09:35', '', '364', '43g', '', '', '', '', '', '1', '0', '7.7');
INSERT INTO `product` VALUES ('1030529', '6908180991375', '1', '茹梦 桃汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030529.jpg', '12.5', '茹梦', '茹梦系列果汁采用先进的水果打浆工艺，富含果肉，营养丰富，味道鲜美。水果香气浓郁，丰富的果肉带来无限的口感。', '2014-12-23 17:09:35', '', '365', '1L', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030530', '6920010301093', '1', '京糖 精制绵白糖 500g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030530.JPG', '6.5', '京糖', '晶粒细小、均匀，颜色洁白，质地绵软、细腻，糖分含量足，晶体及其水溶液味甜、无异味。', '2014-12-24 13:05:14', '', '360', '500g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030533', '6953063462886', '1', '加多宝 凉茶 500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030533.jpg', '4.6', '加多宝', '怕上火，就喝加多宝！凉茶是广东、广西地区的一种由中草药熬制，具有清热去湿等高效的“药茶”；在众多老字号凉茶中，加多宝是最为著名的，其发明于清道光年间，被公认为凉茶始祖，并有“药茶王”美誉；由多种天然中药植物精心熬制而成，让你不受夏日炎炎的烦躁困扰。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030534', '6944910320084', '1', '福临门 黄金圆粒全稻原米 1.5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030534.jpg', '29.8', '福临门', '全稻旅米B族维生素的含量是普通白米的3-5倍。B族维生素可有效促进糖、蛋白质和脂肪代谢，有益推动机体代谢；全稻原米独特HPT工艺，物理原理全面留住了稻谷原生的维生素、矿物质及大量的膳食纤维，均衡主食营养；全稻原米出饭率高，且富含膳食纤维，食用后饱腹感强。', '2014-12-23 17:09:35', '', '540', '1.5kg', '', '', '', '', '', '1', '0', '30.3');
INSERT INTO `product` VALUES ('1030536', '6934665082313', '1', '蒙牛 优益C原味活菌乳酸菌 100ml*5', '1000021', 'http://pictures-of-goods.qiniudn.com/1030536.jpg', '11', '蒙牛', '优益C不是酸奶，是乳酸菌。主要成分是脱脂奶粉，所以不含有脂肪。但是不含有脂肪不等于有助于减肥，要知道糖在人体内也会转化成脂肪的。优益C是一款含糖比较高的饮料。相对于其他酸牛奶或纯牛奶来说，营养物质少了很多，确实有一定的助减肥功效。', '2014-12-23 17:09:35', '', '21', '100ml*5', '', '', '', '', '', '1', '0', '11.5');
INSERT INTO `product` VALUES ('1030537', '6954767413877', '1', '可口可乐  2L', '1000017', 'http://pictures-of-goods.qiniudn.com/1030537.jpg', '5.8', '可口可乐', '畅爽四溢、3摄氏度饮用最佳、美食好搭档。可口可乐产品造型时尚，阳光的设计，丰富的种类，多彩的个性，让我们的产品点缀您缤纷的心。', '2014-12-23 17:09:35', '', '365', '2L', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030538', '6917878018324', '1', '雀巢 麦脆片 150g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030538.jpg', '8.9', '雀巢', '雀巢麦脆片由小麦、玉米、燕麦三种粗粮谷物精制而成，特别添加了10种重要的维生素和矿物质 ，富含膳食纤维。保持营养均衡至关重要，对成长期儿童来说尤为重要。全谷物食品保留了所有营养成分，使我们身体更健康！', '2014-12-23 17:09:35', '', '360', '150g', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030539', '6901584030305', '1', '张裕 三星白兰地 700ml', '1000012', 'http://pictures-of-goods.qiniudn.com/1030539.jpg', '39.8', '张裕', '采用优质葡萄经压榨、发酵、蒸馏而得的原白兰地为主，加入部分葡萄皮、用甘蔗红糖发酵蒸馏的白兰地和该公司特制的白兰地香料，再加入蒸馏水和糖色等配制而成。酒液色泽金黄，晶莹透明，具有独特的芳香和优雅柔协的酯香，饮时口味醇浓微苦，爽口，回味绵长，还有浓郁的橡木香味。', '2014-12-23 17:09:35', '', '0', '700ml', '', '', '', '', '', '1', '0', '40.3');
INSERT INTO `product` VALUES ('1030541', '6922477400616', '1', '百吉福 棒棒纯鲜奶酪 20g*6', '1000005', 'http://pictures-of-goods.qiniudn.com/1030541.jpg', '17.6', '百吉福', '原味奶味香浓，奶酪味道温和，口感爽滑。混和水果味酸甜可口，口感清新爽口，水果味道浓郁。新上市的玉米味在浓郁奶香中体验香甜玉米味道，口感爽滑细腻。', '2014-12-23 17:09:35', '', '270', '20g*6', '', '', '', '', '', '1', '0', '18.1');
INSERT INTO `product` VALUES ('1030543', '6921168550104', '1', '农夫山泉 石榴蓝莓维他命水 500ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030543.jpg', '3.6', '农夫山泉', '用轻松的方式，补充日常所需维他命！针对不同人群补充特定的维他命和矿物元素！美丽速度（添加维生素E）维生素E早在上世纪20年代就被科学家Evans发现，在1936年分离出结晶体。维生素E有抗氧化作用，人体自身不能合成，需要从无能饮食中摄取。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030544', '6921355230550', '1', '三元 原味酸牛奶 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030544.jpg', '2.4', '三元', '经典原味，无尽享受！产品采用新型环保包装，倡导绿色消费。持久保鲜，无异味，易消化，饮用更方便。', '2014-12-23 17:09:35', '', '14', '180g', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030547', '6903252714074', '1', '康师傅 酸菜牛肉面桶面 125g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030547.jpg', '4.1', '康师傅', '品质保障：康师傅让广大的顾客群众享受到物美质优、价钱公道的方便面；科学工艺：经现代加工艺和设备加工而成使营养充分保留，美味健康；弹嫩爽口：爽口的面条和浓郁的汤汁，细嫩味美，醇厚十足，美味又营养；方便快捷：将面条和调料放入水中搅拌均匀煮沸，即可享受美味风情，放便快捷。', '2014-12-23 17:09:35', '', '180', '125g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030548', '6923644266318', '1', '蒙牛 特仑苏牛奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030548.jpg', '65', '蒙牛', '蒙牛特仑苏牛奶，产自中国乳都核心区,来自特仑苏的专属牧场。每一滴原生奶在几小时内，通过全程保鲜的现代化运输链。不是所有的牛奶都可以叫做特仑苏，蒙语中有金牌牛奶之意。精选12国高质牧草，配上优选良种乳牛，为您带来最优质的奶源。', '2014-12-23 17:09:35', '', '180', '250ml*12', '', '', '', '', '', '1', '0', '65.5');
INSERT INTO `product` VALUES ('1030549', '6922477400791', '1', '百吉福 酸奶+果粒棒棒奶酪 120g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030549.jpg', '16.5', '百吉福', '棒棒奶酪每支都采用先进的独立包装，包装上更有可爱的百吉福小k的新卡通形象和有趣的智力问题，带你周游世界！产品口味原味奶味香浓，奶酪味道温和，口感爽滑，美味营养吃不够！混和水果味酸甜可口，口感清新爽口，水果味道浓郁，美味营养吃不够！', '2014-12-23 17:09:35', '', '270', '120g', '', '', '', '', '', '1', '0', '17');
INSERT INTO `product` VALUES ('1030550', '6906151618498', '1', '百年牛栏山  52°红盒10年酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030550.jpg', '99', '牛栏山', '正宗佳酿：传承龙脉，牛栏山距紫禁城尚不足百里；地道好酒：山水灵犀，巍巍燕山，曲曲潮白，得天地之灵犀，传统工艺，恪守传统工艺精髓，精酿地道好酒，荣誉认证，集各种 认证于一身，荣耀神州，品质典范。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '99.5');
INSERT INTO `product` VALUES ('1030552', '6904700200620', '1', '义利 果子双联包 490g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030552.jpg', '8.9', '义利', '“义利”创建于一九零六年，是食品行业中著名的优秀老字号企业，享有“面包王”的美誉。“义利”商标曾多次荣获北京市著名商标的称号。', '2014-12-23 17:09:35', '', '5', '490g', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030555', '6922330911129', '1', '桃李 豆沙起酥面包 100g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030555.jpg', '3.25', '桃李', '桃李集团创建于1995年，是一家致力于烘焙食品的生产、力江、销售的集团性企业。其主要经营:面包、月拼、粽子、鲜食，四大类百余种产品。企业尤为注重产品技术研发，引进国内外先进的设备、专业的生产技术、一流的生产工艺，符合国际标准的生产流程。', '2014-12-23 17:09:35', '', '5', '100g', '', '', '', '', '', '1', '0', '3.75');
INSERT INTO `product` VALUES ('1030557', '6902538005141', '1', '乐百氏 脉动蜜桃维生素饮料 600ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030557.jpg', '3.7', '乐百氏', '无碳酸气：本品不含碳酸气，不会引起胃部胀气和不适；清新口味：本品具有天然清新的水果味、口感清爽，风味独特；多种营养：蕴含多种营养元素，随时保持动力；充盈活力：感觉不在状态时，一瓶脉为你注入更多活力。', '2014-12-23 17:09:35', '', '300', '600ml', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030558', '6922330913086', '1', '桃李 醇熟切片面包 130g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030558.jpg', '2.6', '桃李', '桃李集团创建于1995年，是一家致力于烘焙食品的生产、力江、销售的集团性企业。其主要经营:面包、月拼、粽子、鲜食，四大类百余种产品。企业尤为注重产品技术研发，引进国内外先进的设备、专业的生产技术、一流的生产工艺，符合国际标准的生产流程。', '2014-12-23 17:09:35', '', '4', '130g', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030559', '6903102006694', '1', '燕京 菠萝啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030559.jpg', '2.5', '燕京', '燕京啤酒采用纯天然矿泉水酿造，锶含量高，饮后回味有泉水般的甘甜；现代化啤酒制作装备：溶解氧控制最好、PO值控制最好、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平；优质酵母菌种：典型高发酵度、苦味代谢柔和，1990、1995行业评酒标准。', '2014-12-23 17:09:35', '', '365', '330ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030562', '6920999701730', '1', '大宝 SOD蜜 100ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030562.jpg', '10.9', '大宝', '大宝SOD蛋白蜜内含SOD 活性物质，并加入人参、黄芪等天然植物成分，辅以胶原蛋白等多种润肤营养基质，易于被皮肤吸收，且吸收快，不油腻。可增加皮肤营养，使肌肤细腻紧致，富有健康光泽；补充皮肤水分，令皮肤水润饱满有弹性。', '2014-12-23 17:09:35', '', '1080', '100ml', '', '', '', '', '', '1', '0', '11.4');
INSERT INTO `product` VALUES ('1030564', '6907992101736', '1', '伊利 QQ星芒果果泥优酪乳酸奶 120g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030564.jpg', '3.9', '伊利', 'QQ星儿童优酪乳酸牛奶为满足宝宝的生长发育量身定作，产品添加“钙/铁/锌/维生素A/维生素D、AB益生菌”等元素，有利于孩子的健康成长，其中特别添加能促进钙质的吸收的维生素D;及AB活性益生菌，有效提高孩子的免疫力和抵抗力。新颖的包装新式和卡通设计便于吸引孩子的注意力。  ', '2014-12-23 17:09:35', '', '21', '120g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030565', '6901306665334', '1', '太阳 牛肉豆香锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030565.jpg', '2.2', '太阳', '豆香太阳锅巴牛肉太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030566', '6906151618535', '1', '百年牛栏山  52°红盒8年酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030566.jpg', '65', '牛栏山', '正宗佳酿：传承龙脉，牛栏山距紫禁城尚不足百里；地道好酒：山水灵犀，巍巍燕山，曲曲潮白，得天地之灵犀，传统工艺，恪守传统工艺精髓，精酿地道好酒，荣誉认证，集各种 认证于一身，荣耀神州，品质典范。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '65.5');
INSERT INTO `product` VALUES ('1030567', '6901845040968', '1', '格力高百醇 抹茶慕斯休闲饼干 48g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030567.jpg', '6.5', '格力高', '欧风蛋糕口味的百醇系列，将蛋糕中醇厚的鲜奶油部分注入香脆的讲干棒中，绝妙的配合是整体口感好的秘诀。纤巧香脆的身材卷起各种经典欧风蛋糕口味，让您随时随地享受欧式精点!', '2014-12-23 17:09:35', '', '365', '48g', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030569', '6901306665341', '1', '太阳 五香豆香锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030569.JPG', '2.2', '太阳', '豆香太阳锅巴五香太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。', '2014-12-24 12:34:28', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030571', '6934249500325', '1', '中蓝  20只休闲碗 400ml', '1000058', 'http://pictures-of-goods.qiniudn.com/1030571.jpg', '7.6', '中蓝', '不破不漏，安全无毒、卫生可靠。可家用也可以做为野餐用具。', '2014-12-23 17:09:35', '', '1800', '400ml', '', '', '', '', '', '1', '0', '8.1');
INSERT INTO `product` VALUES ('1030573', '6922330911174', '1', '桃李 轻乳酪蒸蛋糕 90g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030573.jpg', '4.6', '桃李', '桃李轻乳酪蒸蛋糕独特工艺，采用水蒸制作而成，松软有弹性。适合上班、休闲、旅游之方便食用佳品。', '2014-12-23 17:09:35', '', '3', '90g', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030574', '6917878039534', '1', '雀巢 香浓咖啡饮料 180ml', '1000019', 'http://pictures-of-goods.qiniudn.com/1030574.jpg', '3.3', '雀巢', '速溶咖啡：精选上等速溶咖啡,并搭配水、白砂糖、乳粉等制成；香浓幼滑：雀巢咖啡,未入口已有浓香弥漫，香浓幼滑,更香、更醇、更顺滑；萃取技术：雀巢独有的专利萃取技术,造出优质香浓雀巢咖啡，优质食品，美好生活。', '2014-12-23 17:09:35', '', '365', '180ml', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030576', '6923644279066', '1', '蒙牛 香蕉大眼萌快乐牛奶 190ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030576.jpg', '4', '蒙牛', '品牌卓越：蒙牛乳业是中国领先的乳制品供应商；优质奶源：奶源源自纯净的大草原上，严格的牧场管理和奶源收集；香醇美味：奶味香浓，滴滴诱人，搞怪的同时体验牛奶的香醇美味；浪漫风情：香蕉的清香口味邂逅浓香牛奶，香蕉的芬芳味道融入牛奶的丝滑，散发迷人浪漫滋味。', '2014-12-23 17:09:35', '', '180', '190ml', '', '', '', '', '', '1', '0', '4.5');
INSERT INTO `product` VALUES ('1030577', '6920031801053', '1', '乐德 罐装牙签 520支', '1000059', 'http://pictures-of-goods.qiniudn.com/1030577.jpg', '6', '乐德', '乐德牌牙签选用优质原木制成。色泽统一、软硬适中、在不间断水源下漫泡24小时以上、多道工序杀菌消毒，卫生健康，是您保护牙龈，呵护口腔健康的理想选择！', '2014-12-23 17:09:35', '', '0', '520支', '', '', '', '', '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1030578', '6922477400722', '1', '百吉福 儿童水果味棒棒奶酪 20g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030578.jpg', '18.8', '百吉福', '美味多多：原滋原味纯正奶酪，还有各种各种新鲜水果，香蕉、草莓、橙子等任您挑选。每一种口味都会给您不一样的味觉体验。健康多多：精巧包装，打开方便；还有特色卡通手柄，吃起来更安全，更健康。营养多多：由新鲜优质奶提炼后发酵制成，富含蛋白质外。', '2014-12-23 17:09:35', '', '240', '20g', '', '', '', '', '', '1', '0', '19.3');
INSERT INTO `product` VALUES ('1030580', '6901844500104', '1', '味好美 宫保鸡丁调料 35g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030580.jpg', '3.1', '味好美', '正统川菜风味，色、香、味俱佳，犹以味道丰富见长。不经历蜀道之难，何需去天府之国？调一调，炒一炒，简简单单，一桌川菜。', '2014-12-23 17:09:35', '', '730', '35g', '', '', '', '', '', '1', '0', '3.6');
INSERT INTO `product` VALUES ('1030583', '6954767413273', '1', '可口可乐  1.25L', '1000017', 'http://pictures-of-goods.qiniudn.com/1030583.jpg', '4.6', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '365', '1.25L', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030584', '6938888888868', '1', '香飘飘 椰果草莓奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030584.jpg', '3.3', '香飘飘', '采用先进工艺，多道筛选工艺保证原料的高品质，几道研磨工序，颗粒均匀。易溶解。100%新鲜椰子水为原料，以高科技工艺制成，含有丰富的优质纤维素，能帮助人体消化，增加肠胃蟋动。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030587', '6922330911204', '1', '桃李 手撕面包 160g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030587.jpg', '5.6', '桃李', '天然手撕面包,使用天然酵母，降低了产品的PH值和水活度，从而使保质期得到延长。包装袋内放置了酒精保鲜剂（对酒精过敏者请勿食用），起到杀菌和抑制细菌生长的作用，延长了保质期，美味更长久呢！', '2014-12-23 17:09:35', '', '6', '160g', '', '', '', '', '', '1', '0', '6.1');
INSERT INTO `product` VALUES ('1030588', '6944910318210', '1', '福临门 金典特选长粒米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030588.jpg', '42.9', '福临门', '福临门金典特选长粒香，原粮产自三江平原优质稻米产区，肥沃的黑土种植，天然的江水滋养，让稻米具备先天优良的好品质。生米米粒优雅细长，粒粒细腻润泽、精致剔透，熟米清香四溢，兼具谊专统东北大米的软韧口感，美味让人难以抗拒。', '2014-12-23 17:09:35', '', '540', '5kg', '', '', '', '', '', '1', '0', '43.4');
INSERT INTO `product` VALUES ('1030589', '6938888888851', '1', '香飘飘 椰果咖啡奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030589.jpg', '3.3', '香飘飘', '采用先进工艺，多道筛选工艺保证原料的高品质，几道研磨工序，颗粒均匀。易溶解。100%新鲜椰子水为原料，以高科技工艺制成，含有丰富的优质纤维素，能帮助人体消化，增加肠胃蟋动。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030590', '6920907808513', '1', '好丽友 呀土豆蕃茄酱味薯条 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030590.jpg', '3.5', '好丽友', '呀!土豆搭配了师傅精选的香脆薯条与番茄酱酸甜风昧的绝美搭配让您尽情专享美味!', '2014-12-23 17:09:35', '', '270', '40g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030591', '6902022136474', '1', '蓝月亮 深层洁净薰衣草洗衣液 1kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1030591.jpg', '17.5', '蓝月亮', '中性温和配方，手洗或接触时皮肤不发烫，保护衣物原色和纤维，让衣物持久鲜艳如新、柔软顺滑更舒适!薰衣草香，让您的衣物洁净更清香！\n', '2014-12-23 17:09:35', '', '1080', '1kg', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030592', '6903252114171', '1', '康师傅 开心桶香辣牛肉面 110g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030592.jpg', '4.1', '康师傅', '康师傅香辣牛肉面优选真材实料，辅以红辣椒、花椒等辛香佐料，以传统烹调技艺使之辣味尽处、辛香诱人。康师傅面，香喷喷，好吃看得见。', '2014-12-23 17:09:35', '', '180', '110g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030595', '6909409012802', '1', '上好佳 草莓粟米条 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030595.jpg', '2.9', '上好佳', '上好佳栗米条是精选优质玉米经过物理膨化而成，非油炸，保留了天然谷物的原有营养成分。', '2014-12-23 17:09:35', '', '365', '40g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030596', '6902890234487', '1', '双汇 玉米热狗肠 160g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030596.jpg', '5.2', '双汇', '肉馅和甜玉米相互搭配，营养美味的好伴侣。甜玉米是特用玉米的一种。甜玉米富含蛋白质、多种维生素、膳食纤维、胡萝卜素、亚油酸等营养成分，集中了水果和谷物的优质特性。 甜玉米具有独特的营养价值、良好的口感和加工性能，和肉馅搭配后相得益彰,营养更全面，尤其是青少年休闲食品的一个好选择。', '2014-12-23 17:09:35', '', '90', '160g', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1030597', '6938888888844', '1', '香飘飘 椰果麦香奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030597.jpg', '3.3', '香飘飘', '经久不散的麦香味，配上香甜的椰果，那种浓浓的麦香味与椰果颗粒的香味，热气交融在一起，更好的品味奶茶。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030598', '6923644278786', '1', '蒙牛 百利包麦香早餐牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030598.jpg', '1.75', '蒙牛', '原麦早份奶，阳光活力从早餐开始，蒙牛原麦早餐奶，麦芽精华融入纯正牛奶，焕发自然活力，全天自信开始!', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.25');
INSERT INTO `product` VALUES ('1030599', '6904700200644', '1', '义利 维生素双联包 270g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030599.JPG', '4.5', '义利', '义利维生素面包是由北京义利面包食品有限公司生产的饼干糕点专属产品，北京义利面包食品有限公司采用国内外先进的工艺加工技术，并经专家精心调制，其口味独特营养丰富适合中国人体质和饮食习惯', '2014-12-24 12:30:39', '', '5', '270g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030600', '6920907808537', '1', '好丽友 呀土豆蕃茄酱味薯条 70g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030600.jpg', '5.8', '好丽友', '呀!土豆搭配了师傅精选的香脆薯条与番茄酱酸甜风昧的绝美搭配让您尽情专享美味!', '2014-12-23 17:09:35', '', '270', '70g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030602', '6902890022497', '1', '双汇 王中王 40g*10', '1000007', 'http://pictures-of-goods.qiniudn.com/1030602.jpg', '16.6', '双汇', '双汇王中王香肠，精选优质鸡肉、猪肉，辅以大豆蛋白等精制而成。', '2014-12-23 17:09:35', '', '120', '40g*10', '', '', '', '', '', '1', '0', '17.1');
INSERT INTO `product` VALUES ('1030603', '6920753635523', '1', '国泰 张二嘎兰花豆 130g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030603.jpg', '3.4', '国泰', '张二嘎兰花豆以蚕豆为原料，在传统工艺基础上，按照现代生产技术，精挑细选、 严格配料，口味独特。', '2014-12-23 17:09:35', '', '300', '130g', '', '', '', '', '', '1', '0', '3.9');
INSERT INTO `product` VALUES ('1030604', '6922731881267', '1', 'ABC 亲柔立围日用超极薄棉柔巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030604.jpg', '10.9', 'ABC', '易拉贴包装:方便又卫生，0.1cm超极薄，仿如无物。独有KWS健康配方，清爽、凉快、舒适招受。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '11.4');
INSERT INTO `product` VALUES ('1030605', '6938888888837', '1', '香飘飘 椰果原味奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030605.jpg', '3.3', '香飘飘', '采用先进工艺，多道筛选工艺保证原料的高品质，几道研磨工序，颗粒均匀。易溶解。100%新鲜椰子水为原料，以高科技工艺制成，含有丰富的优质纤维素，能帮助人体消化，增加肠胃蟋动。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030606', '6920616311083', '1', '旺旺 仙贝经济包 618g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030606.jpg', '24.9', '旺旺', '旺旺仙贝口感鲜香、自然，采用精选大米制成，经多道工艺，精心制成.非油炸、低油脂，是老少皆宜，食用方便的休闲食品。', '2014-12-24 12:30:44', '', '270', '618g', '', '', '', '', '', '1', '0', '0.4');
INSERT INTO `product` VALUES ('1030607', '6925303722562', '1', '统一 冰红茶 250ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030607.jpg', '1.4', '统一', '采用合适的糖酸配比，拥有独特清爽、顺畅的柠檬口感', '2014-12-23 17:09:35', '', '360', '250ml', '', '', '', '', '', '1', '0', '1.9');
INSERT INTO `product` VALUES ('1030611', '6948960101600', '1', '哈尔滨 冰爽听啤 330ml*6', '1000014', 'http://pictures-of-goods.qiniudn.com/1030611.jpg', '14.15', '哈尔滨', '甄选优质东北麦芽，经过9度低温发酵，-1度3天以上低温贮存，冷却器冷却至-2度过滤处理，将独特的麦香与啤酒的清爽口感完美结合，成就哈尔滨啤酒麦道独到的麦香浓郁，酒花醇香。秉承历史精华，传统百年工艺。哈尔滨啤酒，麦道最知你的口味，世界顶级酿酒工艺的传承与光大。', '2014-12-23 17:09:35', '', '365', '330ml*6', '', '', '', '', '', '1', '0', '14.65');
INSERT INTO `product` VALUES ('1030614', '6948195860136', '1', '金龙鱼 清香稻 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030614.jpg', '49.9', '金龙鱼', '金龙鱼大米口感粘而不腻，味道醇香，绵软有弹性。低氧保鲜，低温烘干，低温储藏，低温加工安全水分。来自黑龙江的天然香稻，世间罕有的寒地黑土、丰富的水资源，优秀的香稻品种。', '2014-12-23 17:09:35', '', '540', '5kg', '', '', '', '', '', '1', '0', '50.4');
INSERT INTO `product` VALUES ('1030616', '6926265388100', '1', '上好佳 蟹味逸族 40g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030616.jpg', '3.2', '上好佳', '清脆每一口，让您回味无穷。休闲消遣，朋友聚会，常备食品。这是上好佳独创的小吃，一直以来它们是供家庭和朋友享用的休闲食品.', '2014-12-23 17:09:35', '', '270', '40g', '', '', '', '', '', '1', '0', '3.7');
INSERT INTO `product` VALUES ('1030617', '6921355231939', '1', '三元 芦荟柠檬小心晴优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030617.jpg', '3.6', '三元', '选用全球优质菌种供应商美国丹尼斯克优质专利复合菌种NCFM。超过100年的菌种生产历史，健康、放心，芦荟与柠檬的组合，让营养更出众，给您带来独特的口味和更优质的酸奶。', '2014-12-23 17:09:35', '', '21', '180g', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030618', '6954767415772', '1', '可口可乐 汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030618.jpg', '2.6', '可口可乐', '挡不住的畅快口感，给您前所未有的享受。无论是浪漫西餐还是传统中餐，均任意塔配。可口司乐伴您与家人朋友一起分享快乐时光。可直接加冰饮用，或搭配调制鸡尾酒，风味独特。', '2014-12-23 17:09:35', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030619', '6941837101383', '1', '塞翁福 八角 50g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030619.jpg', '5.5', '塞翁福', '塞翁福，八角颗粒均匀、质地饱满。适用于炖、卤味、煮汤，是家庭、宾馆、餐厅不错佐料。', '2014-12-23 17:09:35', '', '360', '50g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030620', '6904700200712', '1', '义利 水果面包 250g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030620.JPG', '4.6', '义利', '义利维生素面包是由北京义利面包食品有限公司生产的饼干糕点专属产品，北京义利面包食品有限公司采用国内外先进的工艺加工技术，并经专家精心调制，其口味独特营养丰富适合中国人体质和饮食习惯', '2014-12-24 12:30:55', '', '5', '250g', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030623', '6923146100011', '1', '杜蕾斯超薄装(小)  3只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030623.jpg', '16.9', '杜蕾斯', '杜蕾斯超薄避孕套是由天然胶乳制成.超薄敏感，给您带来舒适和美妙的性爱享受。', '2014-12-23 17:09:35', '', '1800', '3只', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030624', '6921168511280', '1', '农夫山泉 天然饮用水 380ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030624.jpg', '1.3', '农夫山泉', '农夫山泉一天然的弱碱性水。农夫山泉选取天然的优质水源，仅对原水做最小限度的、必要的处理，保存了原水中钾、钠、钙、镁、偏硅酸等对人体有益的矿物元素，pH值为7.3，呈天然弱碱性，适于人体长期饮用。', '2014-12-23 17:09:35', '', '720', '380ml', '', '', '', '', '', '1', '0', '1.8');
INSERT INTO `product` VALUES ('1030626', '6907992507385', '1', '伊利 金典纯牛奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030626.jpg', '65', '伊利', '每一滴金典牛奶，都经过57道层层珍选。纯粹如金的品质，只给你最爱的人。奶质纯正，口感香醇！丰富乳蛋白≥3.5%，蛋白质含量超出国家标准18.6%，为您提供更丰富的营养！', '2014-12-23 17:09:35', '', '210', '250ml*12', '', '', '', '', '', '1', '0', '65.5');
INSERT INTO `product` VALUES ('1030627', '6923146100028', '1', '杜蕾斯超薄装  12只', '1000082', 'http://pictures-of-goods.qiniudn.com/1030627.jpg', '56.8', '杜蕾斯', '杜蕾斯超薄避孕套是由天然胶乳制成.超薄敏感，给您带来舒适和美妙的性爱享受。', '2014-12-23 17:09:35', '', '1800', '12只', '', '', '', '', '', '1', '0', '57.3');
INSERT INTO `product` VALUES ('1030628', '6902890215349', '1', '双汇 维也纳香肠 135g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030628.jpg', '8.3', '双汇', '营养 安全 方便 肉质细嫩 口感清香', '2014-12-23 17:09:35', '', '60', '135g', '', '', '', '', '', '1', '0', '8.8');
INSERT INTO `product` VALUES ('1030630', '6901754071152', '1', '乌江 涪陵榨菜原味菜片 60g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030630.jpg', '1.5', '乌江', '腌菜佳品，其做工独特，配料讲究。脆嫩爽口，味咸且鲜，并带有特殊的酸味，可直接用于佐餐也可用于炒菜，做汤。先经晾晒脱水然后腌制，工序严谨。有光泽，菜体嫩爽，气昧鲜香且无异昧，营养丰富。', '2014-12-23 17:09:35', '', '360', '60g', '', '', '', '', '', '1', '0', '2');
INSERT INTO `product` VALUES ('1030631', '6931429200662', '1', '伊利 芒果+黄桃大果粒发酵乳 260g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030631.jpg', '7.3', '伊利', '精选100%纯鲜牛乳，添加各种口感爽甜、粒径超大的新鲜水果果粒，经LABS四种益生菌发酵而成，酸甜清香，带给您更多美味享受。', '2014-12-23 17:09:35', '', '21', '260g', '', '', '', '', '', '1', '0', '7.8');
INSERT INTO `product` VALUES ('1030632', '6907992501468', '1', '伊利 百利包纯牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030632.jpg', '1.9', '伊利', '天然无污染的绿色风光孕育了新鲜优质的奶源。口感醇厚，香浓顺滑乐享浓郁纯正牛奶滋味。高温灭菌，无菌严密包装，无需冷藏，饮用安全。富含丰富的能量，保持每天充足的活力。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1030633', '6921510972011', '1', '旺旺 旺仔果汁牛奶 245ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030633.jpg', '5.3', '旺旺', '富含人体每日必须的多种氨基酸、钙、脂肪、维生素等营养成份，包装设计体面大方，定价合理。专为成长中的儿童设计的风味乳品，更是馈赠亲友的理想选择。', '2014-12-23 17:09:35', '', '450', '245ml', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1030634', '6943924100019', '1', '加多宝 凉茶 310ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030634.jpg', '3.9', '加多宝', '凉茶是中华传统养生文化的瑰宝，起源于广东。加多宝集团为弘扬凉茶文化，采用入选国家首批非物质文化遗产的凉茶配方和上等的本草材料，来承传统的蒸煮工艺，运用现代科技，确保凉茶的单一性和纯粹性，被称为“正宗凉茶”。', '2014-12-23 17:09:35', '', '730', '310ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030635', '6901844704113', '1', '味好美 五香粉 10g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030635.jpg', '2.2', '味好美', '精心挑选上等的大茴香为原材料制作而成，品质纯正天然，充分保留营养，健康美味！在几乎所有国家的烹饪中都大有用武之地、各种肉类的烹饪、多种蔬菜的烹调、欧洲人特别喜欢用白胡椒、尤其是加在鱼或浅色酱汁菜式中！全封闭包装，食用简单，易于取用，是厨房常备品的上佳选择！', '2014-12-23 17:09:35', '', '1095', '10g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030638', '6915249222288', '1', '潮盛 橄榄菜 450g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030638.jpg', '13.95', '潮盛', '潮盛 香港橄榄菜采用南国果“橄榄”及优质大芥菜精制而成，具有浓香可口、风味独特、回味无穷的特点，是白米粥的首选佐菜，有伴白米饭、伴面条、夹馒头、炒菜等多种食用方法，是美食之经典。', '2014-12-23 17:09:35', '', '450', '450g', '', '', '', '', '', '1', '0', '14.45');
INSERT INTO `product` VALUES ('1030640', '6906785230868', '1', '红星 56°普通二锅头酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030640.jpg', '7.9', '红星', '红星二锅头为“大众的好酒”的代名词;红星二头酒是传统酿酒工艺与现代微生物技术相结台的结晶，以优质红高梁、纯水为原料，清蒸清烧，老五甄工艺蒸溜，掐头去尾截取中段，长年窖存;质清撤透明，气昧香醇、醇厚甘冽、清香纯正、回昧悠长。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '8.4');
INSERT INTO `product` VALUES ('1030641', '6955150400054', '1', '圣牧 有机儿童奶 190ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030641.jpg', '5.7', '圣牧', '为进一步改善儿童肠胃消化、吸收功能，增进营养利用率，圣牧全程有机儿童奶科学配方全新升级：益 生元（低聚果糖+低聚半乳糖）活力元素，天然调节儿童肠道菌群，营养吸收更充分，抗龋齿功效更牢固。有机生牛乳仍为基本原料，美味营养，醇厚依旧。好营养，好吸收。健益品质，升级活力。', '2014-12-23 17:09:35', '', '180', '190ml', '', '', '', '', '', '1', '0', '6.2');
INSERT INTO `product` VALUES ('1030642', '6901333100518', '1', '南方 黑芝麻糊 480g', '1000080', 'http://pictures-of-goods.qiniudn.com/1030642.jpg', '18.4', '南方', '开水冲泡，搅拌均匀即可使用，营养丰富，适合各种人群。', '2014-12-23 17:09:35', '', '365', '480g', '', '', '', '', '', '1', '0', '18.9');
INSERT INTO `product` VALUES ('1030644', '6921510972028', '1', '旺旺 旺仔苹果牛奶 245ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030644.jpg', '5.3', '旺旺', ' 富含人体每日必须的多种氨基酸、钙、脂肪、维生素等营养成份，包装设计体面大方，定价合理。专为成长中的儿童设计的风味乳品，更是馈赠亲友的理想选择。', '2014-12-23 17:09:35', '', '450', '245ml', '', '', '', '', '', '1', '0', '5.8');
INSERT INTO `product` VALUES ('1030646', '6922130119015', '1', '太太乐 蔬之鲜调味料 100g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030646.jpg', '3.4', '太太乐', '蔬之鲜味晶健康美味从细节开始！优质生活不容忽略任何一个细节，哪怕是鲜味料也不放过！蔬之鲜汲取天然鲜蔬精华，采用国际鲜味技术制造，健康纯素，清香自然，适合于烹饪所有菜肴，味道更鲜美！来一匙蔬之鲜，享受浓浓的春天鲜味！', '2014-12-23 17:09:35', '', '450', '100g', '', '', '', '', '', '1', '0', '3.9');
INSERT INTO `product` VALUES ('1030647', '6934660524542', '1', '苏菲 超熟睡290超薄随心翻夜巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030647.jpg', '10.2', '苏菲', '轻盈舒适的超薄巾身，触感轻柔的棉柔表层。高分子锁水粒，迅速吸引不回渗。表面开孔加大加深，保持长久洁净感。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '10.7');
INSERT INTO `product` VALUES ('1030648', '6948195860181', '1', '金龙鱼 生态稻 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030648.jpg', '44.9', '金龙鱼', '来自黑龙江的天然香稻，世间罕有的寒地黑土、丰富的水资源， 优秀的香稻品种， 口感粘而不腻， 味道醇香， 绵软有弹性', '2014-12-23 17:09:35', '', '540', '5kg', '', '', '', '', '', '1', '0', '45.4');
INSERT INTO `product` VALUES ('1030649', '6948195861232', '1', '金龙鱼 优质东北大米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030649.JPG', '34.5', '金龙鱼', '汇集天地精华.孕育非凡美味，每一颗大米都是科技与自然的触合;每一粒米饭都能带来无与伦比的美味。香、软、弹、滑，是美味米饭的全新定义.更是极致享受的至真诉求。', '2014-12-24 13:00:26', '', '545', '5kg', '', '', '', '', '', '1', '0', '35');
INSERT INTO `product` VALUES ('1030650', '6917878006604', '1', '雀巢 蛋奶星星早餐 150g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030650.jpg', '16.9', '雀巢', '蛋奶口味，星星月亮造型，美味又有趣，全谷物制造', '2014-12-23 17:09:35', '', '365', '150g', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030652', '6907476600809', '1', '广乐 酸辣海带丝 80g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030652.jpg', '2.2', '广乐', '精选优质的原材料制造，确保产品品质风味。采用乳酸发酵，产品酸脆香味，口感爽口开味。风味独特，亦可佐食米饭、面条、烹饪调味。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030653', '6921355231922', '1', '三元 蔓越莓石榴小心晴优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030653.jpg', '3.6', '三元', '选用全球优质菌种供应商美国丹尼斯克优质专利复合菌种NCFM。超过100年的菌种生产历史，健康、放心，蔓越莓和石榴的组合，让营养更出众，给您带来独特的口味和更优质的酸奶。', '2014-12-23 17:09:35', '', '21', '180g', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030654', '6941837101321', '1', '塞翁福 黄花菜 150g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030654.jpg', '18.5', '塞翁福', '专用环保食品包装，真空包装设计，保证塞翁福产品足够新鲜。塞翁福黄花菜外观，色泽浅黄，根根分明，塞翁福黄花菜全部为天然晒干而成，无添加，颜色天然浅黄。', '2014-12-23 17:09:35', '', '360', '150g', '', '', '', '', '', '1', '0', '19');
INSERT INTO `product` VALUES ('1030656', '6922477400883', '1', '百吉福 草莓味奶酪布丁 80g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030656.jpg', '4.9', '百吉福', '来自法国的品质，轻柔口感，轻松享受。入口细腻柔滑，酸甜水果口味伴着纯正的奶香，带给你轻柔口感，轻松享受!', '2014-12-23 17:09:35', '', '180', '80g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030658', '6957735788892', '1', '椰树 无糖椰汁 245ml', '1000016', 'http://pictures-of-goods.qiniudn.com/1030658.jpg', '3.8', '椰树', '椰树牌天然椰子汁是以海南盛产的椰子为原料，采用先进的加工技术及科学配方精制而成。是一种不加香精、糖精、防腐剂不含胆固醇的天然植物蛋白饮料，其汁液均匀乳白、清醇，具有浓郁的天然椰香味。口感柔和、甜度适中、含有脂肪、蛋白质、十七种氨基酸和锌、铁、钙、锰等元素。', '2014-12-23 17:09:35', '', '360', '245ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030659', '6921317905014', '1', '康师傅 柠檬味冰红茶 500ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030659.jpg', '2.6', '康师傅', '一种新潮、冰酷的时尚饮品，红茶的香醇加上柠檬的清爽，喝上一口，那种清凉冰爽的感觉如同爱琴海边的夏日清风，令你全身舒畅，冰后饮用更能体验“冰力十足，无可替代”的畅快，让你从头到脚一爽到底，体味无限冰酷乐趣。 精选上等红茶，加入柠檬酸制成，冰冻后口感更佳。', '2014-12-23 17:09:35', '', '365', '500ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030660', '6917878033532', '1', '雀巢 饮用水 5L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030660.jpg', '9.1', '雀巢', '雀巢优活饮用水源自地下约240米深处的天然泉水，清冽爽口，天然纯净，是您健康饮水的上上之选，满足您随时、随地的补水需求；天然水源富含人体健康所需的天然矿物质成分，如钙、镁、钠、钾和碳酸氢盐等;采用深达约240米的不锈钢水并，充分保证了原水质在导出过程中不受任何污染。', '2014-12-23 17:09:35', '', '360', '5L', '', '', '', '', '', '1', '0', '9.6');
INSERT INTO `product` VALUES ('1030663', '6921355220667', '1', '三元 极致ESL高品质鲜牛乳 490ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030663.jpg', '11.6', '三元', '严格限定GPA认证的现代化牧场，奶源符合欧盟标注黄金乳牛，奶源更优质;采用国际领先的72度低温杀菌，陶瓷膜过滤技术，净化牛奶确保完美品质;最大程度保留活性的免疫球蛋白、乳铁蛋白，提高人体免疫力，新鲜品质和完美营养带来每日最佳状态，和您一起品味成功的精彩。', '2014-12-23 17:09:35', '', '9', '490ml', '', '', '', '', '', '1', '0', '12.1');
INSERT INTO `product` VALUES ('1030665', '6922877745492', '1', '四季宝 柔滑花生酱 340g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030665.jpg', '17.8', '四季宝', '逐粒精选新鲜花生，口感细腻味道醇正顺滑易抹咸甜均衡，富含人体所需营养0添加，0反式脂肪酸，0胆固醇！', '2014-12-23 17:09:35', '', '450', '340g', '', '', '', '', '', '1', '0', '18.3');
INSERT INTO `product` VALUES ('1030666', '6923644240127', '1', '蒙牛 百利包纯牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030666.jpg', '1.9', '蒙牛', '蒙牛纯牛奶纯正无添加，牛奶中的蛋白质、矿物质等营养成分，易被人体吸收。滴滴好口味，带给您自然纯的好品质，让蒙牛牛奶伴您健康、快乐每一天。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1030667', '6906151890160', '1', '牛栏山 46°二锅头 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030667.jpg', '5.8', '牛栏山', '包装精美的典藏牛栏山二锅头十二年陈酿，是一款选用了优质五谷，配以甘例好水，精心酸制而成的佳品，酒液瓶体造型恬静优雅，线条凹凸有致，适台于礼宴相聚，亲友共享。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030668', '6941837101536', '1', '塞翁福 桂皮 50g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030668.jpg', '3', '塞翁福', '精选肉桂，浓香醇香，烹饪必备，调料首选。', '2014-12-23 17:09:35', '', '360', '50g', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1030669', '6920354811524', '1', '高露洁小小动物世界牙刷 /', '1000060', 'http://pictures-of-goods.qiniudn.com/1030669.jpg', '6.5', '高露洁', '良好口腔卫生离不开你日常的精心护理，为此高露洁口腔专家建议每一消费者采用口腔护理4部曲，共同呵护口腔卫生，实现口腔健康0问题!', '2014-12-23 17:09:35', '', '0', '/', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030670', '6916296990076', '1', '乐天  B+W注心小熊饼 49g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030670.jpg', '3.8', '乐天', '小熊饼是家庭、好友聚会的好伴侣，更是一个人宅在家里的宅神利器，更松脆的饼干、更香浓的夹心、更妙曼的滋味，饼干与可可、白巧克力夹心的完美结合，赶快喊上家人、好友、同学、闺蜜与您一同分享吧。', '2014-12-23 17:09:35', '', '365', '49g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030671', '6907992511085', '1', '伊利 黑谷谷粒多牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030671.jpg', '1.6', '伊利', '精选黑豆、黑米、黑芝麻等天然黑色谷物，用现代工艺萃取精华与伊利纯正好奶融合带来平衡营养，每一口都喝得到实谷物和浓浓谷香，让你时刻拥有更多充沛精力。产品更添加多维营养素（维生素E，维生素B1,维生素B2,烟酸（维生素B3）），营养全面更均衡。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.1');
INSERT INTO `product` VALUES ('1030673', '6907992511078', '1', '伊利 红谷谷粒多牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030673.jpg', '1.6', '伊利', '精选红豆、红米、红皮花生等天然红色谷物，用现代工艺萃取精华与伊利纯正好奶融合带来平衡营养，每一口都喝得到真实谷物和浓浓谷香，为身体注入充盈活力。产品更添加多维营养素（维生素E，维生素B1,维生素B2,烟酸（维生素B3）），营养全面更均衡。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.1');
INSERT INTO `product` VALUES ('1030674', '6902083894443', '1', '娃哈哈 苏打水 350ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030674.jpg', '2.5', '娃哈哈', '帮助舒缓精神，远离亚健康；帮助身体迅速恢复酸碱平衡，娃哈哈苏打水，是家中常备的纯净水佳品，外出旅行，户外活动，都是您不错的选择。', '2014-12-23 17:09:35', '', '360', '350ml', '', '', '', '', '', '1', '0', '3');
INSERT INTO `product` VALUES ('1030675', '6948960101440', '1', '哈尔滨 小麦王啤酒 330ml*6', '1000014', 'http://pictures-of-goods.qiniudn.com/1030675.jpg', '17.9', '哈尔滨', '哈尔滨 小麦王啤酒 整箱装，采用独特的冰点酿造工艺造就出的哈尔滨小麦王啤酒，将成熟的啤酒液深度冷却至啤酒的冰点形成。纯净清爽、透彻甘冽、总能让您产生欲罢不能的爽冽、圆润口感。', '2014-12-23 17:09:35', '', '360', '330ml*6', '', '', '', '', '', '1', '0', '18.4');
INSERT INTO `product` VALUES ('1030676', '6920354813702', '1', '高露洁360备长炭牙刷双支装 /', '1000060', 'http://pictures-of-goods.qiniudn.com/1030676.jpg', '19.9', '高露洁', '精选备长炭经过>1000度高温处理，备长炭有助保持刷毛干爽，可减少导致细菌滋生的湿气。刷毛含备长炭，高达17倍更细，深入清洁牙齿和牙缝。有效清洁后牙。', '2014-12-23 17:09:35', '', '0', '/', '', '', '', '', '', '1', '0', '20.4');
INSERT INTO `product` VALUES ('1030678', '6943052110027', '1', '恒大冰泉 长白山天然矿泉水 350ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030678.jpg', '3.8', '恒大冰泉', '黄金水源，深层矿泉，呈天然弱碱性，均衡富含20多种人体所需的微量元素', '2014-12-23 17:09:35', '', '540', '350ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030680', '6902538005387', '1', '乐百氏 荔枝脉动维生素饮料 600ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030680.jpg', '3.7', '乐百氏', '蕴含多种营养元素，随时补充水分、活力。感觉不在状态时，一瓶脉动为你注活力。具有天然清新的水果味，口感清爽，风味独特。', '2014-12-23 17:09:35', '', '300', '600ml', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030681', '6915936900260', '1', '升元 辣白菜 100g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030681.jpg', '2.85', '升元', '韩式辣白菜，妈妈的味道，餐桌下饭菜，吃不够的美味。严格选料，精制加工，醇香清辣，适合烹饪各种菜肴。', '2014-12-23 17:09:35', '', '90', '100g', '', '', '', '', '', '1', '0', '3.35');
INSERT INTO `product` VALUES ('1030682', '6948195875314', '1', '金龙鱼 荞麦多麦芯挂面 1kg', '1000033', 'http://pictures-of-goods.qiniudn.com/1030682.jpg', '11.5', '金龙鱼', '精选优质小麦粉，采用传统技术，净化水和面和最新的设备，精心制造的面条，弹性很好，面条滑溜溜。金龙鱼麦芯挂面用水煮熟，含大量能量，蛋白质，钠，营养美味，光滑，韧性弹性十足，口感顺滑，容易消化，营养丰富', '2014-12-23 17:09:35', '', '365', '1kg', '', '', '', '', '', '1', '0', '12');
INSERT INTO `product` VALUES ('1030684', '6902083880781', '1', '娃哈哈 桂圆莲子粥 360g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030684.jpg', '4.1', '娃哈哈', '娃哈哈桂圆莲子营养八宝粥，精选桂圆、莲子、孺米、米仁等八种上等原料，根据传统食补原理，科学配伍，经现代工艺精制而成.产品色、香、味俱佳，营养丰富，深受消费者亲睐.', '2014-12-23 17:09:35', '', '730', '360g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030685', '6909825011472', '1', '雀巢美极 鲜味汁 200ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030685.jpg', '17.3', '雀巢', '精选小麦自然发酵，只需几滴，带出食材本来的鲜味，为菜肴平添独特的诱人香味。', '2014-12-23 17:09:35', '', '730', '200ml', '', '', '', '', '', '1', '0', '17.8');
INSERT INTO `product` VALUES ('1030687', '6926265301130', '1', '上好佳 海苔味日本鱼果 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030687.jpg', '2.9', '上好佳', '精选优质小麦粉和新鲜海苔原料.口味咸不腻，浓醇香脆的顶级享受~', '2014-12-23 17:09:35', '', '270', '50g', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030689', '6918976150022', '1', '雀巢 饮用水 1.5L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030689.jpg', '2.9', '雀巢', '雀巢优活饮用水源自地下约240米深处的天然泉水，清冽爽口，天然纯净，是您健康饮水的上上之选，满足您随时、随地的补水需求；天然水源富含人体健康所需的天然矿物质成分，如钙、镁、钠、钾和碳酸氢盐等;采用深达约240米的不锈钢水并，充分保证了原水质在导出过程中不受任何污染。', '2014-12-23 17:09:35', '', '360', '1.5L', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030690', '6902083890636', '1', '娃哈哈 爽歪歪益生菌酸奶 200g*4', '1000022', 'http://pictures-of-goods.qiniudn.com/1030690.jpg', '8.95', '娃哈哈', '选用优质原料，再添加上等辅料精制而成的，娃哈哈爽娃娃，营养丰富，口味独特。', '2014-12-23 17:09:35', '', '180', '200g*4', '', '', '', '', '', '1', '0', '9.45');
INSERT INTO `product` VALUES ('1030691', '6920354804182', '1', '高露洁 草本牙膏 200g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030691.jpg', '5.6', '高露洁', '独特配方结合高露洁现金口腔科技和天然活性盐成分，能抑菌消炎，舒缓并预防牙龈问题独特的氟钙配方，防止蛀牙，让牙齿更坚固', '2014-12-23 17:09:35', '', '1080', '200g', '', '', '', '', '', '1', '0', '6.1');
INSERT INTO `product` VALUES ('1030692', '6917878033631', '1', '雀巢 饮用水 330ml*12', '1000015', 'http://pictures-of-goods.qiniudn.com/1030692.jpg', '14.8', '雀巢', '雀巢优活饮用水源自地下约240米深处的天然泉水，清冽爽口，天然纯净，是您健康饮水的上上之选，满足您随时、随地的补水需求；天然水源富含人体健康所需的天然矿物质成分，如钙、镁、钠、钾和碳酸氢盐等;采用深达约240米的不锈钢水并，充分保证了原水质在导出过程中不受任何污染。', '2014-12-23 17:09:35', '', '360', '330ml*12', '', '', '', '', '', '1', '0', '15.3');
INSERT INTO `product` VALUES ('1030694', '6901844593120', '1', '味好美 麻婆豆腐调料 35g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030694.jpg', '3', '味好美', '味好美麻婆豆腐调味料做出的麻婆豆腐色泽淡黄，豆腐嫩白而有光泽.经现代先进的工艺加工制作，使营养充分保留，风味更加独特.简约的袋装，取食方便，又易携带，是居家生活的上乘之选。', '2014-12-23 17:09:35', '', '730', '35g', '', '', '', '', '', '1', '0', '3.5');
INSERT INTO `product` VALUES ('1030697', '6923450657638', '1', '益达 木糖醇清爽西瓜口香糖 56g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030697.jpg', '9.5', '益达', '清爽西瓜味，清新口气，精致瓶口，轻巧灌装，简单大方。', '2014-12-23 17:09:35', '', '360', '56g', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030698', '6914782201576', '1', '徐福记 蛋黄沙琪玛 470g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030698.jpg', '16.9', '徐福记', '口感酥软而柔软，浓郁的鸡蛋香。精选上等原料，香味扑鼻，休闲解馋，最佳选择。', '2014-12-23 17:09:35', '', '300', '470g', '', '', '', '', '', '1', '0', '17.4');
INSERT INTO `product` VALUES ('1030700', '6926892567084', '1', '银鹭 好粥道薏仁红豆粥 280g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030700.jpg', '3.9', '银鹭', '选用上等的红豆和薏仁为主要原料，配以水等精制而成，品质卓越。口感醇厚细滑，香甜红豆融合薏仁清香，美妙滋味，回味无穷。精美礼盒包装，内置独立罐装，食用方便，是休闲时刻的好伙伴', '2014-12-23 17:09:35', '', '720', '280g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030701', '6948195860037', '1', '金龙鱼 原香稻 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030701.jpg', '79.9', '金龙鱼', '口感与香味完美结合，香软弹滑，安全好米。柔韧软绵，口感上佳，充满弹性，筋道十足。', '2014-12-23 17:09:35', '', '540', '5kg', '', '', '', '', '', '1', '0', '80.4');
INSERT INTO `product` VALUES ('1030702', '6901584197077', '1', '张裕 三星干红 750ml', '1000010', 'http://pictures-of-goods.qiniudn.com/1030702.jpg', '88', '张裕', '果香浓郁，酒香优雅，口感柔和，结构完整，典型性好。', '2014-12-23 17:09:35', '', '2880', '750ml', '', '', '', '', '', '1', '0', '88.5');
INSERT INTO `product` VALUES ('1030703', '6901844521116', '1', '味好美 香酥炸鸡配料 45g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030703.jpg', '3.1', '味好美', '面包粉，小麦粉，玉米粉绝佳的混合比例，使得油炸的食品外脆内嫩，别具特色。', '2014-12-23 17:09:35', '', '730', '45g', '', '', '', '', '', '1', '0', '3.6');
INSERT INTO `product` VALUES ('1030707', '6921355220674', '1', '三元 极致ESL低温杀菌鲜乳 950ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030707.jpg', '21.9', '三元', '严格限定GPA认证的现代化牧场，奶源符合欧盟标注黄金乳牛，奶源更优质;采用国际领先的72度低温杀菌，陶瓷膜过滤技术，净化牛奶确保完美品质;最大程度保留活性的免疫球蛋白、乳铁蛋白，提高人体免疫力，新鲜品质和完美营养带来每日最佳状态，和您一起品味成功的精彩。', '2014-12-23 17:09:35', '', '9', '950ml', '', '', '', '', '', '1', '0', '22.4');
INSERT INTO `product` VALUES ('1030708', '6902265350750', '1', '海天 蚝油皇 705g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030708.jpg', '8.5', '海天', '精选优质原料精心制作，保证产品品质。严格按照制作工艺制成，确保口感纯正.色泽匀净鲜艳，耗香浓郁醇厚，风味独特。', '2014-12-23 17:09:35', '', '720', '705g', '', '', '', '', '', '1', '0', '9');
INSERT INTO `product` VALUES ('1030709', '6921355231786', '1', '三元 原味儿童成长优酪乳 100g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030709.jpg', '3.3', '三元', '全脂酸奶，营养全面，含有可以在肠道定殖的益生菌：乳杆菌，双歧杆菌，优质原奶，无添加剂', '2014-12-23 17:09:35', '', '21', '100g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030710', '6917878033648', '1', '雀巢  1+2奶香即溶咖啡 143g', '1000077', 'http://pictures-of-goods.qiniudn.com/1030710.jpg', '16.3', '雀巢', '雀巢咖啡精选优质、新鲜、上等的咖啡豆。以雀巢专利低温萃取技术，提取精华、更大程度保留咖啡豆原有风味和馥郁香气。精心调配咖啡伴侣和糖，方便携带，冲调简单，随时随地给您香醇感受。', '2014-12-23 17:09:35', '', '720', '143g', '', '', '', '', '', '1', '0', '16.8');
INSERT INTO `product` VALUES ('1030712', '6923644265960', '1', '蒙牛 骨力型未来星儿童奶 190ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030712.jpg', '3.75', '蒙牛', '萃取蒙牛绿色天然牧场奶源精华，确保奶源品质，带给孩子更好的呵护，绿色健康。口感细腻醇厚，富含浓郁奶香，特别添加DHA藻油、VA、VD，守护健康，茁壮成长。便携式纸盒装，简洁大方，内置独立小盒，饮用简单，是居家、馈赠亲友之佳品。', '2014-12-23 17:09:35', '', '180', '190ml', '', '', '', '', '', '1', '0', '4.25');
INSERT INTO `product` VALUES ('1030714', '6900958883813', '1', '中盐 京晶腌制盐 800g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030714.jpg', '2.8', '中盐', '吃好盐，选中盐，中盐 深井绿色低钠碘盐，点碘真情，健康中华。', '2014-12-23 17:09:35', '', '0', '800g', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1030715', '6948195800460', '1', '金龙鱼 黄金比例食用调和油 1.8L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030715.jpg', '25.3', '金龙鱼', '金龙鱼食用调和油满足人体膳食脂肪酸1:1:1的科学配比，营养均衡.营养成份符台DRI标准。本品呈好看的金黄透明色，味香，营养丰富.可馏、炒、煎、炸或凉拌。精选8种原料，更比第一代调和油多出5种原料:原料纯正，按照独特配方调和而成。让您在享受美味的同时又摄入了营养健康元素，一举多得！', '2014-12-23 17:09:35', '', '540', '1.8L', '', '', '', '', '', '1', '0', '25.8');
INSERT INTO `product` VALUES ('1030716', '6923644265977', '1', '蒙牛 未来星佳智儿童奶 190ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030716.jpg', '3.83', '蒙牛', '奶源源自纯净的大草原上，零污染的牧场管理与奶源收集，致力于建立绿色、透明的乳制品产业链。用闪蒸技术，在不破坏牛奶营养价值的前提下，低温蒸发部分水分，香浓口味多一些。特别添加DHA藻油、维生素E，提供了有针对性的营养补充，帮助孩子健康卓越成长。', '2014-12-23 17:09:35', '', '180', '190ml', '', '', '', '', '', '1', '0', '4.33');
INSERT INTO `product` VALUES ('1030717', '6942980800390', '1', '娃哈哈 呦呦蜂蜜柚子茶 500g', '1000018', 'http://pictures-of-goods.qiniudn.com/1030717.jpg', '2.65', '娃哈哈', '天堂水沏的龙井茶，槐花蜜调的西柚汁，运用黄金比例特别调制，并创造性地在低温条件下采用“冷杀菌”技术，杀菌同时有效保留了果汁、蜂蜜中营养，把营养统统装进了一瓶瓶的呦呦茶中，给你更多每日所需的维生素和矿物质。', '2014-12-23 17:09:35', '', '360', '500g', '', '', '', '', '', '1', '0', '3.15');
INSERT INTO `product` VALUES ('1030718', '6902265114345', '1', '海天 特级一品鲜酱油 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030718.jpg', '9.6', '海天', '精选优质非转基因原料，充分晒制发酵而成。符合优质酱油对发酵工艺的严格要求制成。酱液呈褐色，清透纯净，并有浓郁的豉香。鲜味突出，口感醇厚，食用后令人回味无穷。', '2014-12-23 17:09:35', '', '720', '500ml', '', '', '', '', '', '1', '0', '10.1');
INSERT INTO `product` VALUES ('1030719', '6901844306218', '1', '味好美 白胡椒粉 30g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030719.jpg', '9.8', '味好美', '本品中的胡椒碱成分可以去腥，解油腻的作用。有药用价值，可散寒，健胃，增进食欲，促发汗。', '2014-12-23 17:09:35', '', '1095', '30g', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030720', '6922824055063', '1', '李锦记 锦珍生抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030720.jpg', '4.9', '李锦记', '李锦记锦珍老抽 精选非基因大豆及小麦粉，以先进工艺精心酿造而成。生产过程层层把控、洁净生产环境、安全、健康、营养、给您带来美味享受！', '2014-12-23 17:09:35', '', '540', '500ml', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030721', '6940211889602', '1', '养乐多 活性乳酸菌饮品 100ml*5', '1000021', 'http://pictures-of-goods.qiniudn.com/1030721.jpg', '11', '养乐多', '每天饮用一瓶“养乐多’可以有效增加人体肠道中益生菌的数量，帮您维持肠道生态平衡，提高免疫力，营造健康生活。', '2014-12-23 17:09:35', '', '30', '100ml*5', '', '', '', '', '', '1', '0', '11.5');
INSERT INTO `product` VALUES ('1030722', '6910269503294', '1', '美涛 润发喷射者喱 240ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030722.jpg', '28.3', '美涛', '持久定型，清爽+保湿，具有良好的保湿护发效果。压取适量产品于掌心搓匀，均匀涂抹在发丝上。尽量不要碰到头皮，按照发型流向整理发束，使造型清晰自然吹干或自然风干均可.清爽易涂抹、不粘手，特别适合自然卷和各类烫卷造型。', '2014-12-23 17:09:35', '', '1080', '240ml', '', '', '', '', '', '1', '0', '28.8');
INSERT INTO `product` VALUES ('1030723', '6907592001092', '1', '王致和 特制料酒 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030723.jpg', '5.5', '王致和', '王致和特质料酒，祛腥解腻，味道鲜美！', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030724', '6920753635851', '1', '张二嘎 小粒香南瓜子 240g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030724.jpg', '15.9', '张二嘎', '张二嘎小粒香南瓜子个头小，但饱满且表面盐粒特别少。本品易嗑且脆，香脆可口、唇齿留香，属于高档的休闲食品，也是旅游休闲的佳品。', '2014-12-23 17:09:35', '', '300', '240g', '', '', '', '', '', '1', '0', '16.4');
INSERT INTO `product` VALUES ('1030727', '6902265114321', '1', '海天 特级金标生抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030727.jpg', '8.8', '海天', '传统工艺发酵，酱香浓郁；原料上乘，精细调味，储存长久；食用方便，品牌悠久。', '2014-12-23 17:09:35', '', '720', '500ml', '', '', '', '', '', '1', '0', '9.3');
INSERT INTO `product` VALUES ('1030729', '6913189535574', '1', '同享 九制梅肉 110g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030729.jpg', '6.99', '同享', '颗颗鲜嫩润滑，肉厚，酸甜可口，梅子中含儿茶酸能促进肠蠕动，因此便秘之人宜食之。含多种有机酸，有改善肝脏机能的作用,梅子中的梅酸可软化血管，推迟血管硬化，具有防老抗衰作用。备受宠爱，甜蜜好滋味；休闲时光自然好滋味；健身Keep-fit，活力好滋味；酒吧唱K，享受好滋味！', '2014-12-23 17:09:35', '', '365', '110g', '', '', '', '', '', '1', '0', '7.49');
INSERT INTO `product` VALUES ('1030730', '6921355231687', '1', '三元 老北京无蔗糖酸牛奶 160g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030730.jpg', '3.8', '三元', '新鲜爽口，营养美味。三元食品产品涵盖屋型包装鲜奶系列、超高温灭菌奶系列、酸奶系列、袋装鲜奶系列、奶粉系列、干酪系列及各种乳饮料、冷食、宫廷乳制品等。', '2014-12-23 17:09:35', '', '21', '160g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030732', '6923555212749', '1', '汇源 100%鲜桃汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030732.jpg', '13.9', '汇源', '水果的季节性，固化了我们的选择，非应季水果售价、口感、营养都大打折扣。水果残留农药不易清洗，同时不易随身携带，很多场合不适宜吃水果。喝果汁较吃水果营养更全面且更容易吸收，吃水果无法摄取水果的皮、籽中大量的营养，所以喝果汁是更睿智的选择。', '2014-12-24 12:43:04', '', '360', '1L', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030733', '6921355283099', '1', '三元 低脂极致高品质牛奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030733.jpg', '66', '三元', '每一滴极致牛扔，都是大自然的杰作，每100mL极致牛奶蛋白质含量不少于3.3g，含有高于国家标准13.8%的优质蛋白。每一片牧场，沐浴大自然的阳光，经过GAP认证的绿色生态牧场，保证牛奶中的乳蛋白等营养成分自然充足。', '2014-12-23 17:09:35', '', '240', '250ml*12', '', '', '', '', '', '1', '0', '66.5');
INSERT INTO `product` VALUES ('1030734', '6922731800121', '1', 'ABC 超吸柔棉护垫 22片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030734.jpg', '9.5', 'ABC', '本品含KMS健康配方，KMS健康配方专为幼嫩肌肤而设，天然花香、清新怡人、健康、清爽、凉快、舒适感受。该护垫为超量吸收护垫，适合经期前后及分泌物多时使用。', '2014-12-23 17:09:35', '', '1080', '22片', '', '', '', '', '', '1', '0', '10');
INSERT INTO `product` VALUES ('1030735', '6906785013645', '1', '红星  39°五年陈酿 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030735.jpg', '10.8', '红星', '大众名酒 倍受青睐。红星精制五年陈酿，是红星系列中难得的平民系列酒，其酒质清澈透明，气味香馥、醇厚甘冽、浓香纯正、回味悠长；深受大家的喜好，被誉为“大众名酒”！无论是日常饮酒还是街边小吃，他都是一款备受大众青睐的一款平价之酒！', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '11.3');
INSERT INTO `product` VALUES ('1030736', '6900958883806', '1', '中盐 绿色低钠碘盐 400g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030736.jpg', '2.8', '中盐', '绿色低钠碘盐是以绿色食盐为原料，通过合理添加氯化钾精制而成。本品严格执行中国绿色食品发展中心颁布的绿色食品标准，所有理化指标和卫生指标均达到A级绿色食盐标准。吃好盐，选中盐。食用方法：待食品熟后加入。', '2014-12-23 17:09:35', '', '0', '400g', '', '', '', '', '', '1', '0', '3.3');
INSERT INTO `product` VALUES ('1030737', '6911316372054', '1', '珍宝珠 棒棒糖 10.5g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030737.jpg', '0.5', '珍宝珠', '大约在1950年, Enric Bernat先生在美丽的西班牙巴塞罗那成立。Enric Bernat的祖父Josep Bernat是西班牙制造糖果的第一人。当时Bernat先生发现西班牙吃糖果最大的问题是糖太大了,无法在短时间内吃完，所以Bernat先生灵机一动，想到为何不加上根棒子呢?方便又有趣。', '2014-12-23 17:09:35', '', '720', '10.5g', '', '', '', '', '', '1', '0', '1');
INSERT INTO `product` VALUES ('1030738', '6954767447278', '1', '芬达 橙味汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030738.JPG', '2.6', '芬达', '它清爽的味道唤醒你的好奇心；活力十足的气爽，带动你的脉膊把潜能激发出来。芬达让你突破常规，带动你身边的朋友体验发掘的乐趣。', '2014-12-24 12:48:36', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030739', '6943924100026', '1', '加多宝310ml凉茶六连包 310ml*6', '1000018', 'http://pictures-of-goods.qiniudn.com/1030739.jpg', '23', '加多宝', '凉茶是广东、广西地区的一种由中草药熬制。到了近代，加多宝凉茶随着华人的足迹遍及世界各地。加多宝就是的一种广东凉茶，是夏天必备饮料，尤其是吃了火锅，麻辣油炸等刺激性食品后不可缺少之物。', '2014-12-23 17:09:35', '', '365', '310ml*6', '', '', '', '', '', '1', '0', '23.5');
INSERT INTO `product` VALUES ('1030740', '6921355240375', '1', '三元 高钙原味纯牛奶 227ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030740.jpg', '2.9', '三元', '富含丰富的钙、钠、能量等，保持每天充足的生命活力。超高温灭菌，全封闭密封包装。严谨制作的工艺加上超高安全性的配送方式。保证品质，盒装包装。保证品质。崇尚自然的包装设计风格，充分展示牛奶的天然与纯正。', '2014-12-23 17:09:35', '', '45', '227ml', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030741', '6920907808254', '1', '好丽友 好多鱼组合装 33g*3', '1000072', 'http://pictures-of-goods.qiniudn.com/1030741.jpg', '12.3', '好丽友', '海洋动物形状松脆小饼干，口味丰富。特别添加卵磷脂不添加防腐剂、人工色素、味精。带给你视觉和味觉的双重享受。哇！好多鱼!鱼儿仿佛在嘴里跳跃呢！', '2014-12-23 17:09:35', '', '275', '33g*3', '', '', '', '', '', '1', '0', '12.8');
INSERT INTO `product` VALUES ('1030742', '6921355220285', '1', '三元 果之养原味酸牛奶 480g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030742.jpg', '7.9', '三元', '选用三元高品质鲜奶为原料发酵而成，不添加任何防腐剂、增稠剂，口感清爽、营养丰富、保持肠道菌群平衡，深受消费者多年的青睐！', '2014-12-23 17:09:35', '', '7', '480g', '', '', '', '', '', '1', '0', '8.4');
INSERT INTO `product` VALUES ('1030743', '6910269505670', '1', '美涛 盈润恒卷弹力素 180g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030743.jpg', '33.5', '美涛', '产品功效：添加恒卷定型因子，在发丝表面形成轻盈透气保护膜，帮助发卷回复柔韧和弹性，持久保持如沙龙般初烫的卷曲造型。丰富的水解胶原蛋白和角蛋白质，营养滋润发丝，有效对付干涩蓬乱，抵抗热吹风伤害。爽滑拉丝乳液，易涂抹，不粘手。', '2014-12-23 17:09:35', '', '1080', '180g', '', '', '', '', '', '1', '0', '34');
INSERT INTO `product` VALUES ('1030744', '6921355283082', '1', '三元 极致高品质牛奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030744.jpg', '65', '三元', '精心选取优质生态牧场，选取纯种荷斯坦乳牛的优质奶源，经28项指标严格检测，确保每一滴牛奶的纯正品质。每一滴极致牛奶，都是大自然的杰作，每100g极致牛奶蛋白质含量不少于3.3g，含有高于国家标准13.88%的优质蛋白。', '2014-12-23 17:09:35', '', '240', '250ml*12', '', '', '', '', '', '1', '0', '65.5');
INSERT INTO `product` VALUES ('1030747', '6903102100330', '1', '燕京 无醇啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030747.jpg', '3.5', '燕京', '燕京啤酒采用纯天然矿泉水酿造(国家四部委认证)锶含量高，饮后回味有泉水般的甘甜。现代化啤酒制作装备：溶解氧控制最好、PO值控制最好、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平。优质酵母菌种：典型高发酵度、苦味代谢柔和，1990, 1995行业评酒标准。', '2014-12-23 17:09:35', '', '365', '330ml', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030748', '6948235701535', '1', '塞翁福 笋干 228g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030748.jpg', '26.8', '塞翁福', '取自浙江杭州深山竹笋，新鲜采取，新鲜加工，新鲜上市。色泽金黄，肉厚嫩脆，香气郁郁，索有“寒士山珍”，“素菜中第一品”等美誉。肉厚嫩脆，香气浓郁，炖煮炒拌，味道鲜美，难以忘怀。', '2014-12-23 17:09:35', '', '450', '228g', '', '', '', '', '', '1', '0', '27.3');
INSERT INTO `product` VALUES ('1030749', '6907992101293', '1', '伊利 红枣酸牛奶 150g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030749.jpg', '2.3', '伊利', '红枣，含有矿物质营养元素，其味美甘甜、滋养宜人。伊利红枣酸牛奶，将红枣的滋与酸奶的营养完美融合，让您尽享美味。', '2014-12-23 17:09:35', '', '21', '150g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030750', '6918976333388', '1', '雀巢 饮用水 330ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030750.jpg', '1.35', '雀巢', '雀巢优活饮用水源自地下约240米深处的天然泉水，清冽爽口，天然纯净。是您健康饮水的上上之选，满足您随时、随地的补水需求；天然水源富含人体健康所需的天然矿物质成分，如钙、镁、钠、钾和碳酸氢盐等；采用深达约240米的不锈钢水井，充分保证了原水质在导出过程中不受任何污染。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '1.85');
INSERT INTO `product` VALUES ('1030751', '6923644265908', '1', '蒙牛 奶特朱古力牛奶 243ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030751.jpg', '4.9', '蒙牛', '蒙牛乳业是中国领先的乳制品供应商，专注于研发并生产适合国人的乳制品。核心奶源基地处在“黄金奶道”，拥有无污染的土壤、水源和空气，绿色健康。朱古力的香醇风味邂逅浓香牛奶，浓郁的朱古力味道融入牛奶的丝滑，热情似火。', '2014-12-23 17:09:35', '', '150', '243ml', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030752', '6940486020526', '1', '浪奇 寿司烤紫菜 24g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030752.jpg', '13.9', '浪奇', '精选原料，科技加工；口感细嫩，香味浓；味道鲜美,含碘量丰富；多种食用方法，美味方便；佐餐佳品，厨房必备。', '2014-12-23 17:09:35', '', '540', '24g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030753', '6907992103181', '1', '伊利 原味畅轻发酵乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030753.jpg', '12.9', '伊利', 'A+BB菌来自享誉全球的菌种公司科汉森与丹尼斯克；从奶源到生产都经过严格控制，造就安全放心好品质；包装采用先进的一步开盖方式，方便饮用更环保；6类配料，享受轻生活。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030754', '6903102100316', '1', '燕京  11°纯生啤酒 330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030754.jpg', '4.6', '燕京', '燕京啤酒采用纯天然矿泉水酿造（国家四部委认证），锶含量高，饮后回味有泉水般的甘甜；现代化啤酒制作装备：溶解氧控制最好、PO值控制最 好、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平；优质酵母菌种：典型高发酵度、苦味代谢柔和，1990、1995行业评酒标准。', '2014-12-23 17:09:35', '', '360', '330ml', '', '', '', '', '', '1', '0', '5.1');
INSERT INTO `product` VALUES ('1030755', '6903252042719', '1', '康师傅 香菇炖鸡面 105g', '1000033', 'http://pictures-of-goods.qiniudn.com/1030755.jpg', '4.1', '康师傅', '康师傅香菇炖鸡面，甄选上等鸡肉和优质香菇，再配上枸祀子，加以小火慢炖，香菇美尽出，香嫩的鸡肉，与甘甜的香菇完美交融，温暖感觉油然而生!再配上爽滑面条，实在是美味极了！', '2014-12-23 17:09:35', '', '180', '105g', '', '', '', '', '', '1', '0', '4.6');
INSERT INTO `product` VALUES ('1030758', '6907376500308', '1', '强生 婴儿牛奶润肤皂 125g', '1000062', 'http://pictures-of-goods.qiniudn.com/1030758.jpg', '4.9', '强生', '纯正温和，绝少刺激宝宝娇嫩的肌肤。蕴含天然牛奶精华,每天使用,深入滋养宝宝娇嫩的肌肤,令肌肤倍感柔滑嫩白。', '2014-12-23 17:09:35', '', '1095', '125g', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030759', '6902131110020', '1', '梅林 午餐肉 340g', '1000073', 'http://pictures-of-goods.qiniudn.com/1030759.jpg', '15.1', '梅林', '梅林午餐肉罐头包装精美,携带方便,即开即食,安全卫生,实为居家旅行之佐餐佳品。精选优质原料,严格质量体系加工。肉质细腻,口感鲜嫩,风味清香，快捷方便地享受美味生活。开启即食、加热后食用更佳。', '2014-12-23 17:09:35', '', '730', '340g', '', '', '', '', '', '1', '0', '15.6');
INSERT INTO `product` VALUES ('1030760', '6907868006110', '1', '八喜60g六合一冰淇淋 60g*6', '1000078', 'http://pictures-of-goods.qiniudn.com/1030760.JPG', '30.3', '八喜', '八喜六合一冰淇淋，甄选优质原料，独特工艺精制而成，八喜六合一冰淇淋，6种口味，香浓顺滑，美妙滋味，值得品尝。', '2014-12-24 12:38:03', '', '540', '60g*6', '', '', '', '', '', '1', '0', '30.8');
INSERT INTO `product` VALUES ('1030761', '6907992103198', '1', '伊利 燕麦黄桃畅轻发酵乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030761.jpg', '13.9', '伊利', '燕麦与黄桃的绝配组合，营养双倍，美味加倍自然难挡。畅轻风味发酌乳，带给你“轻生活一身轻“的独特体验。燕麦富含膳食纤维，能促进肠胃蠕动，热量低富含大量人体所需的纤维素和矿物质，帮你一起抵抗自由基。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030762', '6909493200284', '1', '和路雪 梦龙香草味冰淇淋 64g*5', '1000078', 'http://pictures-of-goods.qiniudn.com/1030762.jpg', '34.8', '和路雪', '馥郁香草浓醇香滑.爱不释口；口感香脆醇正，美味诱人清凉夏日带来阵阵清爽。', '2014-12-23 17:09:35', '', '720', '64g*5', '', '', '', '', '', '1', '0', '35.3');
INSERT INTO `product` VALUES ('1030763', '6921355240443', '1', '三元 利乐枕核桃花生牛奶 227ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030763.jpg', '2.9', '三元', '经典美味，无尽享受！产品采用新型环保包装，倡导绿色消费。持久保鲜，无异味，易消化，饮用更方便。', '2014-12-23 17:09:35', '', '45', '227ml', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030765', '6920907808179', '1', '好丽友 脆香烧烤味好多鱼 33g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030765.jpg', '3.98', '好丽友', '好多鱼＝美妙丰富的口味+海洋探险的乐趣；好多鱼不断推出多种全新、独特的口味，给你带来一个又一个意想不到的惊喜；可爱的卡通海洋动物，精彩的海洋探险故事和妙趣横生的海洋探宝游戏，让你在打开每一盒好多鱼之后都能体会到不同的海洋探险乐趣。', '2014-12-23 17:09:35', '', '275', '33g', '', '', '', '', '', '1', '0', '4.48');
INSERT INTO `product` VALUES ('1030768', '6901035604321', '1', '青岛 啤酒 330ml*6', '1000014', 'http://pictures-of-goods.qiniudn.com/1030768.jpg', '23.4', '青岛', '一滴醇厚 经历百年：青岛啤酒百年品质代表，始于1903年，传承德国啤酒酿造工艺，酝酿百年金色荣誉。三分钟泡沫细语：酒液清澈透明，富有光泽，酒中二氧化碳充足，泡沫细腻洁白，持久而厚实。', '2014-12-23 17:09:35', '', '360', '330ml*6', '', '', '', '', '', '1', '0', '23.9');
INSERT INTO `product` VALUES ('1030769', '6935145301078', '1', '锐澳 紫葡萄味白兰地鸡尾酒 275ml', '1000012', 'http://pictures-of-goods.qiniudn.com/1030769.jpg', '12.5', '锐澳', '由各种烈酒和果汁饮料混合而成，浓烈中散放优雅，纯正享受。葡萄果香+白兰地，醇美饱含口中，丰富的果味与爽冽的酒精给您带来极品般的享受。口感千变万化，受到年轻人追捧，引燃激情百分百，激发活力百分百。', '2014-12-23 17:09:35', '', '540', '275ml', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030770', '6903148082119', '1', '舒肤佳 纯白清香健康沐浴露 400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030770.jpg', '21.9', '舒肤佳', '洁净肤质健康：比普通沐浴产品抑菌力高出10倍，10全保护全家人健康，有效对坑3大类中的10种细菌威胁洁净肤质健康肌肤。享受清爽夏日：温和配方经典清香低泡易冲洗用后不紧绷全家适用。清凉配方，清热解毒，有效帮助全家远离汗味、瘙痒、炎热等常见肌肤问题烦恼，让家人享受清爽夏日。', '2014-12-23 17:09:35', '', '1080', '400ml', '', '', '', '', '', '1', '0', '22.4');
INSERT INTO `product` VALUES ('1030772', '6906785015038', '1', '红星 53°八年陈酿蓝瓶酒 250ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030772.jpg', '15.2', '红星', '红星蓝瓶高级二锅头酒，拥有瓶型和特有蓝色的国家专利，选用优等品质的陈年老酒，独具绵甜净爽的清香风格。举杯畅饮使享用者增添特别的荣耀与尊重；细品其酒给人以无尽的遐想和回味。瓶以蓝为特，酒以清为本，红星蓝瓶高级二锅头，十足京味，十足京派，一张首都的新名片。', '2014-12-23 17:09:35', '', '0', '250ml', '', '', '', '', '', '1', '0', '15.7');
INSERT INTO `product` VALUES ('1030774', '6901333110524', '1', '南方 精装黑芝麻糊 600g', '1000080', 'http://pictures-of-goods.qiniudn.com/1030774.jpg', '21.9', '南方', '南方黑芝麻糊为黑色食品，是中国传统美食，选用优质的大米、黑芝庥、花生仁等为主要原料精制而成，具有芝麻浓郁的香味，润滑可口。本品即冲即食，是您家居、旅游、馈赠选择之佳品。', '2014-12-23 17:09:35', '', '360', '600g', '', '', '', '', '', '1', '0', '22.4');
INSERT INTO `product` VALUES ('1030775', '6918598028013', '1', '波力 原味海苔 4.5g', '1000081', 'http://pictures-of-goods.qiniudn.com/1030775.jpg', '3.9', '波力', '海苔浓缩了紫菜当中的各种B族维生素，特别是核黄素和尼克酸的含量十分丰富，还有不少维生素A和维生素E，以及少量的维生素C.海苔中含有30%左右的矿物质，其中有维持正常生理功能所必需的钾、钙、镁、磷、铁、锌、铜、锰等，其中含硒和碘尤其丰富。', '2014-12-23 17:09:35', '', '365', '4.5g', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030776', '6923644278908', '1', '蒙牛 核桃味早餐枕奶 230ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030776.jpg', '2.4', '蒙牛', '在精选优质牛奶中，特别溶入核桃粉中含有的营养物质，保证了早餐所需的各种营养，也为香滑的牛奶带来更佳风味和口感。', '2014-12-23 17:09:35', '', '45', '230ml', '', '', '', '', '', '1', '0', '2.9');
INSERT INTO `product` VALUES ('1030777', '6907592001245', '1', '王致和 精制料酒 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030777.jpg', '4.4', '王致和', '王致和精制料酒味道鲜美，具浓郁酒香气味，是凉拌和烹饪理想的调味佳品。本品允许有少量沉淀，不影响食用。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.9');
INSERT INTO `product` VALUES ('1030778', '6954767441276', '1', '芬达 橙味汽水 300ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030778.jpg', '2', '芬达', '它清爽的味道唤醒你的好奇心；活力十足的气爽，带动你的脉膊把潜能激发出来。芬达 让你突破常规带动你身边的朋友体验发掘的乐趣。', '2014-12-23 17:09:35', '', '270', '300ml', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030779', '6920907808070', '1', '好丽友 红豆精灵蘑古力饼干 48g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030779.jpg', '3.98', '好丽友', '香浓巧克力的丰富口感，加上独特的蘑菇形状的松脆小饼干，给你一口一个的简单享受。蘑古力不仅仅是巧克力饼干…蘑古力就是…独特+乐趣。好丽友品牌下又一美味、高品质，给你带来趣味和娱乐的产品产生了。', '2014-12-23 17:09:35', '', '365', '48g', '', '', '', '', '', '1', '0', '4.48');
INSERT INTO `product` VALUES ('1030781', '6924743915398', '1', '乐事 美国经典原味薯片 45g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030781.jpg', '3.6', '乐事', '温火瓣成金黄色洋芋片酌上美国经典原味的香味就是绝妙好味道，天然轻脆，一口不过瘾！轻轻一咬，满口脆响，香味浓郁，让你停不了口。赶快买点试一试吧!百事公司的许多品牌名称有100年以上的历史。', '2014-12-23 17:09:35', '', '270', '45g', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030782', '6954767461373', '1', '怡泉  +C柠檬味汽水 500ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030782.jpg', '3.8', '怡泉', 'Schweppes怡泉来自英国，拥有230年历史，在世界各地拥有许多忠实的消费者；柠檬味汽水，富含维生素C，营养丰富，口感清冽纯净，每一口都在加分；经现代先进的工艺加工制作，使营养充分保留，风味更加独特；金黄罐子简约精致，饮用方便，24罐装经济实惠，畅饮欢乐。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030783', '6920354812934', '1', '高露洁 光感白牙膏 70g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030783.jpg', '8.9', '高露洁', '它拥有独特“美白加速科技”能轻柔抛光牙釉质，有效去除表面牙渍，给你显著的牙齿亮白（针对外源性色斑）效果，笑容更闪耀动人。', '2014-12-23 17:09:35', '', '720', '70g', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030784', '6907868582256', '1', '八喜 果霜三合一冰淇淋 300g', '1000078', 'http://pictures-of-goods.qiniudn.com/1030784.jpg', '23', '八喜', '猕猴桃果霜冰淇淋产品由大约70%冰淇淋和30%果霜组成。冰淇淋部分是传统八喜香草冰淇淋，果霜使用经典冰霜添加了天然猕猴桃果酱。酸酸的自然的猕猴桃口味配合冰淇淋很有感觉。蔓越莓果霜冰淇淋产品由大约70%冰淇淋和30%果霜组成。', '2014-12-23 17:09:35', '', '540', '300g', '', '', '', '', '', '1', '0', '23.5');
INSERT INTO `product` VALUES ('1030785', '6914973105379', '1', 'M&Ms 牛奶巧克力豆 40g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030785.jpg', '4.5', 'M&Ms', '玛氏公司第一个里程碑是给巧克力豆穿上糖衣，延续48年的金句“只溶在口，不溶在手”（melts in your mouth ,not in your hand）至今萦绕于心，成为M&M’s品牌不可舍弃的一部分。推荐语M&M\'s给巧克力豆穿上糖衣，延续48年的金句“只溶在口，不溶在手”。', '2014-12-23 17:09:35', '', '540', '40g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030786', '6931429200013', '1', '伊利 SABL益消原味酸乳 100g*8', '1000022', 'http://pictures-of-goods.qiniudn.com/1030786.jpg', '10.9', '伊利', '伊利，作为一个同时服务过奥运和世博的中国品牌，坚信好品质必须从源头抓起。清新的牧场，洁净的干草，是伊利奶牛的天堂；优质奶牛饲养基地中有精心选育键康奶牛的专职畜牧师及营养师；严格的原奶检测与密闭生产工艺，让您放心更安心；伊利纯牛奶健康纯正。给您全家每天增添健康活力!', '2014-12-23 17:09:35', '', '14', '100g*8', '', '', '', '', '', '1', '0', '11.4');
INSERT INTO `product` VALUES ('1030787', '6906785015014', '1', '红星 53°八年陈酿蓝瓶酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030787.jpg', '25.9', '红星', '红星二锅头酒是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆、纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。 ', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '26.4');
INSERT INTO `product` VALUES ('1030788', '6914973105386', '1', 'M&Ms 花生牛奶巧克力豆 40g', '1000004', 'http://pictures-of-goods.qiniudn.com/1030788.jpg', '4.5', 'M&Ms', '“牛奶香浓，丝般感受”成为德芙的经典广告语。浪漫喜庆的季节，德芙巧克力传递我的心意。香纯浓郁、柔滑细腻的口感，余香飘缈。浓情蜜意的感觉使德芙巧克力成为喜庆的节日和浪漫的日子里人们最喜爱的礼物。由于美味和健康的价值被揭示，德芙巧克力的魅力与日俱增。', '2014-12-23 17:09:35', '', '360', '40g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030789', '6924187821644', '1', '洽洽 香瓜子 260g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030789.jpg', '9.9', '洽洽', '洽洽香瓜子在产品工艺上有重大突破，洽洽瓜子采用煮制工艺更入味、不上火、神秘配方，让人吃后不禁拍案叫绝。', '2014-12-23 17:09:35', '', '240', '260g', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030791', '6921168509270', '1', '农夫山泉 饮用天然水 4L', '1000015', 'http://pictures-of-goods.qiniudn.com/1030791.jpg', '7.98', '农夫山泉', '农夫水源地：浙江千岛湖，吉林长白山，广东万绿湖，陕西太白山，新疆天山玛纳斯，湖北丹江口，四川峨眉山。农夫山泉选取天然优质水源，仅对水做最小限度的、必要的物理处理，保存了水中钾、钙、钠、镁、偏硅酸等对人体有益的天然矿物元素，pH值呈弱碱性，有利于人体长期饮用。', '2014-12-23 17:09:35', '', '365', '4L', '', '', '', '', '', '1', '0', '8.48');
INSERT INTO `product` VALUES ('1030795', '6920242100297', '1', '怡达 铁山楂 300g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030795.jpg', '12.3', '怡达', '怡达之名出自清乾隆年间，乾隆到承德避暑期间，巧食了这里的山楂，觉此果清爽适口，还有消食清火之功效，便称赞道“怡色怡味，达心达情”，当即赐名曰“怡达红”，而其产地便就此被称为“怡达山”，一时间“怡达红”成为宫廷贡礼之上选。', '2014-12-23 17:09:35', '', '540', '300g', '', '', '', '', '', '1', '0', '12.8');
INSERT INTO `product` VALUES ('1030796', '6907592001269', '1', '王致和 韭花酱 320g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030796.jpg', '3.45', '王致和', '方民间自制的一种酱，因为北方只有夏秋两季才能买到价廉物美的韭菜。 于是，人们便在寒冬来临前的秋季把韭菜花磨成酱，常年食用。当入冬时节时，天寒地冻，草木皆枯哪家要能端出一小碗香味浓郁的韭菜花酱来，让客人们拌面条、夹烙饼，准会迎得客人们的交口称赞。', '2014-12-23 17:09:35', '', '360', '320g', '', '', '', '', '', '1', '0', '3.95');
INSERT INTO `product` VALUES ('1030798', '6906785014994', '1', '红星  53°蓝瓶八年陈酿酒 750ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030798.jpg', '34.5', '红星', '红星二锅头酒是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆、纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。 ', '2014-12-23 17:09:35', '', '0', '750ml', '', '', '', '', '', '1', '0', '35');
INSERT INTO `product` VALUES ('1030799', '6921804700764', '1', '陶华碧 老干妈油辣椒 275g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030799.jpg', '10.8', '陶华碧', '陶华碧老干妈牌香辣脆油辣椒是贵州的风味食品，几十年来一直沿用传统工艺精制咖工而成，具有优雅细\n腻、香辣突出、回味悠长等特点。', '2014-12-23 17:09:35', '', '560', '275g', '', '', '', '', '', '1', '0', '11.3');
INSERT INTO `product` VALUES ('1030800', '6921355240245', '1', '三元 特品纯牛奶 250ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030800.jpg', '3.8', '三元', '三元特品方白纯牛奶选用生鲜牛乳为原料，经标准化、均质、超高温灭菌和无菌灌装工艺制成。三元纯牛奶，可直接饮用，香浓口感。', '2014-12-23 17:09:35', '', '240', '250ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030802', '6923589460772', '1', '高洁丝 小Q包丝薄无香护垫 40片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030802.jpg', '7.5', '高洁丝', '小Q包丝薄无香护垫，随时清爽随身Q！内含5片独立包装，携带更方便！5道背胶全面覆盖，服帖不移位！温馨提示：页面图片的产品保质期不能代表发货商品的保质期，请您在收货时注意检查商品的保质期。', '2014-12-23 17:09:35', '', '1080', '40片', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030803', '6902088700534', '1', '金纺 怡神薰衣草护理剂(袋) 500ml', '1000050', 'http://pictures-of-goods.qiniudn.com/1030803.jpg', '7.2', '金纺', '含天然丝蛋白配方，浓浓的乳液深入滋养衣物受损纤维，使衣物柔软舒适，气味清新，亮丽如新；怡神薰衣草——怡神舒缓之选，舒缓、放松，怡神幽香；适用于床单、以及各种衣物；淡淡的薰衣草芳香让你感觉放松。', '2014-12-23 17:09:35', '', '1080', '500ml', '', '', '', '', '', '1', '0', '7.7');
INSERT INTO `product` VALUES ('1030804', '6909493200215', '1', '和路雪 杏仁松露巧克力梦龙 65g*5', '1000078', 'http://pictures-of-goods.qiniudn.com/1030804.jpg', '34.8', '和路雪', '柔滑松露巧克力缠绕在巧克力冰淇淋里，外层是醇正比利时风味的巧克力和香脆杏仁粒。', '2014-12-23 17:09:35', '', '720', '65g*5', '', '', '', '', '', '1', '0', '35.3');
INSERT INTO `product` VALUES ('1030805', '6922175101143', '1', '古船 标准粉 5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030805.JPG', '19.5', '古船', '加工精度较高。色泽洁白，筋力强，品质稳定，具有良好的拉伸和烘焙性能。以进口和国产优质小麦为原料。采用先进的设备和工艺精制而成，适合家庭制作各种面点。', '2014-12-24 13:00:58', '', '240', '5kg', '', '', '', '', '', '1', '0', '20');
INSERT INTO `product` VALUES ('1030806', '6920907808117', '1', '好丽友 浓香茄汁味好多鱼 33g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030806.jpg', '3.98', '好丽友', '好多鱼=美妙丰宫的口味+海洋探脸的乐趣；好多鱼将不断推出多种全新、独特的口味，给你带来一个又一个意想不到的惊喜；可爱的卡通海洋动物，精彩的海洋探险故事和妙趣横生的海洋探宝游戏，让你在打开每一盒好多鱼之后都能体会到不同的海洋探险乐趣。', '2014-12-23 17:09:35', '', '275', '33g', '', '', '', '', '', '1', '0', '4.48');
INSERT INTO `product` VALUES ('1030807', '6925303722432', '1', '统一 绿茶 250ml', '1000018', 'http://pictures-of-goods.qiniudn.com/1030807.jpg', '1.4', '统一', '统一绿茶含丰富茶多酚、氨基酸和维生素，可消除身体中多余的氧自由基，延缓细胞老化，促进新陈代谢，增强免疫力。', '2014-12-23 17:09:35', '', '360', '250ml', '', '', '', '', '', '1', '0', '1.9');
INSERT INTO `product` VALUES ('1030809', '6920907803716', '1', '好丽友 巧克力熊猫派派 125g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030809.jpg', '8.9', '好丽友', '好丽友熊猫派派，巧克力味注心蛋糕，好丽友采用先进的糕点加工工艺，选用优质小麦粉制成夹心，健康营养，搭配完美，带来美味享受！在洋溢的午后，泡上一杯咖啡，配上少许草莓派，补充足够营养和能量同时享受美味，使工作和学习精力充沛！', '2014-12-23 17:09:35', '', '243', '125g', '', '', '', '', '', '1', '0', '9.4');
INSERT INTO `product` VALUES ('1030810', '6902890234135', '1', '双汇 香辣香脆肠 35g*8', '1000007', 'http://pictures-of-goods.qiniudn.com/1030810.jpg', '10.6', '双汇', '口感清爽、风味清香。双汇集团是以肉类加工为主的大型食品集团，双汇集团始终坚持围绕“农”字做文章，围绕肉类加工上项目，依靠“优质、高效、拼搏、创新、敬业、诚信”的企业精神，不断进行管理创新、技术创新、市场创新，企业实现了持续、快速、健康发展。 ', '2014-12-23 17:09:35', '', '90', '35g*8', '', '', '', '', '', '1', '0', '11.1');
INSERT INTO `product` VALUES ('1030811', '6921168509256', '1', '农夫山泉 饮用天然水 550ml', '1000015', 'http://pictures-of-goods.qiniudn.com/1030811.jpg', '1.5', '农夫山泉', '农夫水源地：浙江千岛湖，吉林长白山，广东万绿湖，陕西太白山，新疆天山玛纳斯，湖北丹江口，四川峨眉山。农夫山泉选取天然优质水源，仅对水做最小限度的、必要的物理处理，保存了水中钾、钙、钠、镁、偏硅酸等对人体有益的天然矿物元素，pH值呈弱碱性，有利于人体长期饮用。', '2014-12-23 17:09:35', '', '365', '550ml', '', '', '', '', '', '1', '0', '2');
INSERT INTO `product` VALUES ('1030812', '6902088708127', '1', '奥妙 超效柠檬洗衣皂促装 206g*2', '1000049', 'http://pictures-of-goods.qiniudn.com/1030812.jpg', '5.5', '奥妙', '奥妙清新柠檬超效洗衣皂，强效配方，针对99种顽固污渍，能深入渗透衣物纤维内部，去除包括领口、袖口等难洗部位的污渍，尽情体验仿佛天然柠檬带来的清新、爽洁和愉悦感受。其不含磷，自然环保；含有天然芦荟精华，温和洁净，不伤衣物，不伤手，让你和家人领略大自然纯净的愉悦香氛。', '2014-12-23 17:09:35', '', '1080', '206g*2', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030816', '6920601711409', '1', '棒棒娃 五香味手撕牛肉 46g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030816.jpg', '20.5', '棒棒娃', '棒棒娃挖掘传统配方，传承川蜀百味精髓，在行业率先推出手撕牛肉，顺着牛肉自然纤维方向食用，就能体验“撕丝如丝”的极致美味；精选海拔3500米以上麦洼有机牦牛肉源，肉质鲜美，天然无污染，自然健康.行业率行推出牛皮纸袋和布袋包装，获得国家专利。环保、精美外观新颖，实用性强。', '2014-12-23 17:09:35', '', '360', '46g', '', '', '', '', '', '1', '0', '21');
INSERT INTO `product` VALUES ('1030817', '6948195875499', '1', '金龙鱼 高筋龙须麦芯挂面 1kg', '1000033', 'http://pictures-of-goods.qiniudn.com/1030817.jpg', '9.8', '金龙鱼', '金龙鱼鸡蛋龙须麦芯挂面，原料面粉源自麦芯精华，为您带来高品质的挂面体验。净水和面，坚持自建面粉工厂，不含增白剂。越靠近小麦胚乳的中心部位就意味着越低的灰分、越高的面筋质量。意味着更自然纯净的挂面色泽，更爽滑筋道的口感。', '2014-12-23 17:09:35', '', '365', '1kg', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030818', '6923644269586', '1', '蒙牛 特伦苏低脂牛奶 250ml*12', '1000020', 'http://pictures-of-goods.qiniudn.com/1030818.jpg', '68', '蒙牛', '高营养、低热量，脂肪含量比全脂灭菌纯牛乳减少50%以上，每100克牛奶仅含脂肪1.0-1.5克，蛋白质含量每100克牛奶中，天然优蛋白含量高达3.3克，比国家标准高出13.8%。并荣获IDF新产品创新奖。', '2014-12-23 17:09:35', '', '45', '250ml*12', '', '', '', '', '', '1', '0', '68.5');
INSERT INTO `product` VALUES ('1030819', '6920601711416', '1', '棒棒娃 麻辣味手撕牛肉 46g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030819.jpg', '20.5', '棒棒娃', '棒棒娃挖掘传统配方，传承川蜀百味精髓，在行业率先推出手撕牛肉，顺着牛肉自然纤维方向食用，就能体验“撕丝如丝”的极致美味；精选海拔3500米以上麦洼有机牦牛肉源，肉质鲜美，天然无污染，自然健康.行业率行推出牛皮纸袋和布袋包装，获得国家专利。环保、精美外观新颖，实用性强。', '2014-12-23 17:09:35', '', '360', '46g', '', '', '', '', '', '1', '0', '21');
INSERT INTO `product` VALUES ('1030820', '6935145301016', '1', '锐澳 青柠+朗姆鸡尾酒 275ml', '1000012', 'http://pictures-of-goods.qiniudn.com/1030820.jpg', '12.5', '锐澳', '朗姆酒迷倒众生，青柠也不例外！朗姆的悠扬淡雅.魅力难挡，青柠甘愿在润口的醉意中，化为一丝幽酸。或淡或浓的酒感，仿若除去了一身的疲惫.整个人都活了来。', '2014-12-23 17:09:35', '', '540', '275ml', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030821', '6925843404249', '1', '黄飞红 麻辣花生 110g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030821.jpg', '6.9', '黄飞红', '山东落花生配上天府之国的花椒和火红小辣椒，山东大花生，产自胶东半岛，受海洋的影响，气候温和，V 阳光充足，弱碱性砂质土壤，适宜花生生长，V 180天的生长期，使得这里的花生粒大、皮薄、美味可口、营养丰富。', '2014-12-23 17:09:35', '', '360', '110g', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1030822', '6903148028155', '1', '佳洁士 草本水晶牙膏 140g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030822.jpg', '4.3', '佳洁士', 'Crest佳洁士草本水晶牙膏140g*6 1.显著减少牙龈出血和红肿 2.帮助预防牙龈问题，保持牙龈健康 3.有效去除口腔细菌，清新口气 4.含金银花、薄荷等天然草本精华 5.独特氟泰配方，防蛀又固齿。', '2014-12-23 17:09:35', '', '720', '140g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030823', '6904700200156', '1', '义利 维生素面包 135g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030823.jpg', '2.3', '义利', '义利果子面包和义利维生素面包是目前市场上少有的几款不含氢化植物油、反式脂肪酸的传统面包，相比之下，不够松软，油性小，味道平和，口感几乎和70年代的义利面包一模一样。义利是本地老牌企业，从1906年至今，期间几度涅槃重生，至今义利不倒。', '2014-12-23 17:09:35', '', '0', '135g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030824', '6925843406151', '1', '欣和 六月鲜红烧酱油 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030824.jpg', '11.5', '欣和', '以基因脱脂大豆、小麦为主要原料；经6个月微生物发酵，产生丰富的醇酯类物质，形成多种氨基酸等营养成份，是具有特殊色香味的液体调味品。', '2014-12-23 17:09:35', '', '720', '500ml', '', '', '', '', '', '1', '0', '12');
INSERT INTO `product` VALUES ('1030825', '6925843404225', '1', '黄飞红 麻辣花生 210g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030825.jpg', '12.8', '黄飞红', '黄飞红麻辣花生是黄飞红产品的又一力作，她是餐桌的新宠，是巧厨的首选，可以用来制作很多的麻辣味菜品，又是普通百姓的休闲好食品、佐餐好伴侣。黄飞红麻辣花生，三分麻辣，十分香脆。山东落花生，又称长生果，享誉已久。', '2014-12-23 17:09:35', '', '360', '210g', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030826', '6924743915480', '1', '乐事 清新清爽黄瓜味薯片 45g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030826.jpg', '3.6', '乐事', '乐事坚持一贯的品质要求，在中国精选了阳光、温度、湿度和土壤条件适宜的地方，栽种下特选种薯，以国际先进的农业技术悉心培育，确保马铃薯固形物含量适中，品质优良。每一口都香脆的乐事薯片，为你带来轻松好心情。打开包装，美味享受即刻拥有，片片刻刻有乐事。 ', '2014-12-23 17:09:35', '', '270', '45g', '', '', '', '', '', '1', '0', '4.1');
INSERT INTO `product` VALUES ('1030827', '6901844593373', '1', '味好美 新奥尔良烤翅调料 35g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030827.jpg', '3.5', '味好美', '选用优质辣椒，洋葱等原料，按照经典新奥尔良风味调配；适合烤箱腌制烹饪，也适合用作炒菜调料；小小一包，轻松变身多国大厨。', '2014-12-23 17:09:35', '', '540', '35g', '', '', '', '', '', '1', '0', '4');
INSERT INTO `product` VALUES ('1030829', '6903148160527', '1', '飘柔 滋润去屑二合一洗发露 5ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030829.jpg', '0.5', '飘柔', '飘柔滋润去屑洗发露 针对头屑头痒问题，干枯毛躁去屑止痒的同时充分滋润秀发。配方特含ZPT去屑因子及胶原蛋白组成因子，产品配方比上一代滋润去屑洗发露更浓稠。令秀发远离头屑头痒，享受充足滋润。', '2014-12-23 17:09:35', '', '720', '5ml', '', '', '', '', '', '1', '0', '1');
INSERT INTO `product` VALUES ('1030830', '6920907808018', '1', '好丽友 蘑古力巧克力味饼干 48g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030830.jpg', '3.98', '好丽友', '蘑古力为蘑菇形状的巧克力小饼干。香浓巧克力的丰富口感，加上独特的蘑菇形状的松脆小饼干，给你一口一个的简单享受。蘑古力不仅仅是巧克力饼干，蘑古力就是独特和乐趣。在好丽友品牌下又一美味、高品质，给你带来趣味和娱乐的产品诞生了！巧克力和饼干组合成的小蘑菇造型饼干特别可爱！', '2014-12-23 17:09:35', '', '365', '48g', '', '', '', '', '', '1', '0', '4.48');
INSERT INTO `product` VALUES ('1030832', '6910269501009', '1', '美涛 亮发喷射者喱 240ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030832.jpg', '28.8', '美涛', '产品功效：亮发因子，提升发丝光泽度；水溶性定型配方，清爽不粘腻，自然不僵硬，造型持久一整天。适合发质/发型:适合暗哑无光发质使用。', '2014-12-23 17:09:35', '', '1095', '240ml', '', '', '', '', '', '1', '0', '29.3');
INSERT INTO `product` VALUES ('1030834', '6923644277642', '1', '蒙牛 香蕉慕斯味奶特牛奶 243ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030834.jpg', '4.9', '蒙牛', '蒙牛乳业是中国领先的乳制品供应商，专注于研发并生产适合国人的乳制品。核心奶源基地处在“黄金奶道”，拥有无污染的土壤、水源和空气，在全国合作、参股建设多座现代牧场。蒙牛对于出厂产品，每批均经过生产自检、过程检验和产品检验，确保安全。', '2014-12-23 17:09:35', '', '180', '243ml', '', '', '', '', '', '1', '0', '5.4');
INSERT INTO `product` VALUES ('1030835', '6907376500438', '1', '强生 开心食刻婴儿口手湿巾 10片', '1000065', 'http://pictures-of-goods.qiniudn.com/1030835.jpg', '2.9', '强生', '柔软的无纺布含有强生耍儿洁肤祖、结合纯水及退和的洁净成份.性质沮和清爽。低过敬性，能安全又有效地瀚洁宝宝娇嫩的肌肤。特别适台清洁宝宝的小脸和双手.使用后感觉肌肤洁净又清新。好象刚洗完澡，让您真正放心。', '2014-12-23 17:09:35', '', '1095', '10片', '', '', '', '', '', '1', '0', '3.4');
INSERT INTO `product` VALUES ('1030836', '6920907808032', '1', '好丽友 海苔味好多鱼脆饼 33g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030836.JPG', '3.98', '好丽友', '好丽友 好多鱼浓香鲜香海苔味 焙烤型马铃薯膨化食品；海洋动物形状的松脆小饼干，可爱又美味；好丽友好多鱼不添加防腐剂、人工色素、味精；本品特别添加海苔味，给饼干增添了鲜活感；可爱精致的外包装，给您带来视觉享受。', '2014-12-24 12:35:38', '', '275', '33g', '', '', '', '', '', '1', '0', '4.48');
INSERT INTO `product` VALUES ('1030838', '6921355231496', '1', '三元 老北京凝固型原味酸牛奶 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030838.jpg', '3.8', '三元', '经典原味，无尽享受！产品采用新型环保包装，倡导绿色消费。持久保鲜，无异味，易消化，饮用更方便。', '2014-12-23 17:09:35', '', '21', '180g', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030840', '6902088308358', '1', '多芬 舒活水润沐浴乳 400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030840.jpg', '25.9', '多芬', '清爽水润、天然滋养、洗出细致弹润、平衡之选。全新衡悦水润配方，蕴含纯净香氛，突破性Nutrium MoistureTM亲肤滋养因子。', '2014-12-23 17:09:35', '', '1080', '400ml', '', '', '', '', '', '1', '0', '26.4');
INSERT INTO `product` VALUES ('1030841', '6926265313010', '1', '上好佳 鲜虾条共享装 90g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030841.jpg', '5.5', '上好佳', '这是上好佳独创的小吃。一直以来它们是供家庭和朋友享用的休闲食品。清脆每一口，让您回味无穷。休闲消遣，朋友聚会，常备食品。', '2014-12-23 17:09:35', '', '270', '90g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030843', '6901808188881', '1', '露露 杏仁露 240ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030843.jpg', '3.5', '露露', '露露杏仁露，是以天然野生杏仁为原料 配纯净水制成的植物蛋白饮料 洁白如奶 细腻如玉 香味独特。 杏仁：富含蛋白质，脂肪、糖类、胡萝卜、B族维生素、维生素C、维生素P以及钙 磷、铁等营养成分。 其中胡萝卜的含量在果品中是最丰富的 人们称它为“抗癌之果”。', '2015-01-10 19:17:12', '', '730', '240ml', '', '', '', '', '', '1', '0', '3.6');
INSERT INTO `product` VALUES ('1030844', '6902890234166', '1', '双汇 网兜小玉米热狗肠 360g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030844.jpg', '12.9', '双汇', '肉质感觉很细，淀粉也不多，里面的小玉米豆豆也很好吃，而且独立的小包装便于携带，双汇精制玉米热狗肠的主要原料是肉和甜玉米，而且玉米还有降脂美容效果，好吃不上火哦！', '2014-12-23 17:09:35', '', '90', '360g', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030845', '6935145301030', '1', '锐澳 水蜜桃+白兰地鸡尾酒 275ml', '1000012', 'http://pictures-of-goods.qiniudn.com/1030845.jpg', '12.5', '锐澳', '水蜜桃+白兰地水蜜桃的甜言蜜语，总算对白兰地起作用了！甜蜜攻势——在水蜜桃甜蜜分子的层层包围下，白兰地终于被浪漫俘获；甜美的组合带来独特的细腻滋味，桃子的蜜香和白兰地的醇美常留口中，让人们在美味中享受健康，在高贵中体验醇美，在不经意间来个French kiss。 ', '2014-12-23 17:09:35', '', '540', '275ml', '', '', '', '', '', '1', '0', '13');
INSERT INTO `product` VALUES ('1030847', '6906151600462', '1', '牛栏山42°  陈酿酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030847.jpg', '10.6', '牛栏山', '浓香经典，陈酿牛栏山。当您与好友同游高峰，团坐于山顶之时，随饮一杯牛栏山陈酿，其甘爽之味将带给您不同的感觉，当您与家人同欢，齐庆佳节之刻，共饮一杯牛栏山陈酿，其美味之态将带给您异样的色彩，不一样的感觉，不一样的色彩尽在牛栏山浓香陈酿。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '11.1');
INSERT INTO `product` VALUES ('1030848', '6944910320503', '1', '福临门 金粳稻东北米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030848.jpg', '35.9', '福临门', '寒地黑土出好米，福临门金粳稻，原粮产自世界三大黑土带之一的中国东北黑土区，阳光充沛、水源丰富，自然条件得天独厚，有机质丰富的寒地黑土种植，赋予稻米不凡品质。生米颗粒圆润、色泽剔透，熟米香软富有胶质、美味持久。', '2014-12-23 17:09:35', '', '360', '5kg', '', '', '', '', '', '1', '0', '36.4');
INSERT INTO `product` VALUES ('1030849', '6904700200170', '1', '义利 果子面包 245g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030849.jpg', '4.5', '义利', '义利面包精道耐嚼，香而不艳，甜而不腻，营养均衡，加上独特的烤制，回味无穷。义利面包开发出的果子面包，软硬适中，咬一口满口果香，果脯，干果货真价实，绝对真材实料。', '2014-12-23 17:09:35', '', '0', '245g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030850', '6948195875475', '1', '金龙鱼 高筋宽心麦芯挂面 1kg', '1000033', 'http://pictures-of-goods.qiniudn.com/1030850.jpg', '9.8', '金龙鱼', '精选食材，营养丰富。金龙鱼高筋系列麦芯挂面，运用精湛的筋道工艺技法，多角度拉伸面筋，力促面筋生成，使挂面弹性十足，根根筋道，口感爽滑，丝丝柔韧。', '2014-12-23 17:09:35', '', '365', '1kg', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030851', '6901845040333', '1', '格力高 百力滋微辣虾棒饼 65g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030851.jpg', '4.3', '格力高', '在独特的棒状造型上，喷洒各种风味的调料烘焙而成的香脆百力滋。浓郁清脆口感的经典百力滋，自上市以来一直深受消费者青睐。松脆的口感是百力滋独具的特点，咬下一根百力滋，每一口都能听到清脆的“咔嗒、咔嗒”的声音。', '2014-12-23 17:09:35', '', '360', '65g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030853', '6907992512587', '1', '伊利 味可滋香蕉牛奶 240ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030853.jpg', '5', '伊利', '来自伊利天然有机牧场，凝结天地精华，采用上好食材，甄选纯正好奶巧妙融台优质进口香蕉汁，成就自然好牛奶。细腻柔滑的牛奶因清甜香蕉的沁入，得到完美升华，高达80%的牛奶含里，带来更加浓郁难舍的味觉休验。每滴香蕉牛奶都经过57道工艺层层甄选。确保牛奶的营养和口感，让你安享浓摘每一刻。', '2014-12-23 17:09:35', '', '180', '240ml', '', '', '', '', '', '1', '0', '5.5');
INSERT INTO `product` VALUES ('1030855', '6921355231472', '1', '三元 葡萄柚悦浓优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030855.jpg', '3.3', '三元', '酸奶能促进消化液的分泌，增加胃酸，因而能增强人的消化能力，促进食欲。酸奶中的乳酸不但能使肠道里的弱酸性物质转变成弱碱性，而且还能产生抗菌物质，对人体具有保健作用。制作酸奶时，某些乳酸菌能合成维生素C，使维生素C含量增加。', '2014-12-23 17:09:35', '', '21', '180g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030859', '6921211101017', '1', '曼妥思 薄荷劲嚼抛光糖 37g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030859.JPG', '2', '曼妥思', '曼妥思口香糖以其独特口感和珍珠般的外形享誉全球100多个国家，成为年轻人喜爱的糖果品牌，在今天的中国，通过不断研发和创新推出新口味，新包装，以期让所有中国人体验到曼妥思的独特之处。 果味浓郁的水果条糖，清新爽口的青柠薄。', '2014-12-24 12:28:28', '', '720', '37g', '', '', '', '', '', '1', '0', '2.5');
INSERT INTO `product` VALUES ('1030860', '6919892111708', '1', '康师傅 香浓奶油口味蛋酥卷 108g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030860.jpg', '8.3', '康师傅', '一层层精心卷制，营养丰富，口感香酥，色泽金黄，更有多种美味任您享用。经过精心的烘焙，这金黄的色泽，香酥的口感，保证您对它爱不释手，一口接一口……', '2014-12-23 17:09:35', '', '360', '108g', '', '', '', '', '', '1', '0', '8.8');
INSERT INTO `product` VALUES ('1030861', '6907592001375', '1', '王致和 火锅调料 160g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030861.jpg', '2.45', '王致和', '王致和火锅调料采用优质的原材料，去腥开胃，配方考究，工艺精湛，深受消费者青睐，味道地道经典，让你一尝北方火锅的真味。', '2014-12-23 17:09:35', '', '360', '160g', '', '', '', '', '', '1', '0', '2.95');
INSERT INTO `product` VALUES ('1030862', '6903148099483', '1', '舒肤佳 经典纯白沐浴露 720ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030862.jpg', '36.9', '舒肤佳', '舒肤佳经典净护纯白清香沐浴露，有效清洁肌肤表面杂质，帮助巩固肌肤自然保护层，给家人全身的保护。纯白色浴液，十五年经典清香，丰富泡沫，温和不刺激，适合全家每天使用。', '2014-12-23 17:09:35', '', '1080', '720ml', '', '', '', '', '', '1', '0', '37.4');
INSERT INTO `product` VALUES ('1030864', '6902534023811', '1', '甘竹 豆豉鲮鱼(黄) 227g', '1000031', 'http://pictures-of-goods.qiniudn.com/1030864.jpg', '13.2', '甘竹', '“甘竹罐头，甘香可口”，甘竹罐头集传统的食品工艺与现代科学技术于一体，十八年来一直都赢得广大消费者的信赖和钟爱，产品遍乃全国及东南亚、港澳地区，信誉、产销量、生产技术在同行业中遥遥领先。甘竹豆豉鲮鱼包装精美，携带方便，即开即食，安全卫生，实为居家旅行之佐餐佳品。', '2014-12-23 17:09:35', '', '720', '227g', '', '', '', '', '', '1', '0', '13.7');
INSERT INTO `product` VALUES ('1030865', '6907592001382', '1', '王致和 麻辣火锅调料 160g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030865.jpg', '2.98', '王致和', '选用优质腐乳，芝麻酱，韭菜花等原料辅以辣椒等精制加工而成；产口麻辣十足，香气浓郁，去腥开胃，营养丰富，是涮火锅的调味佳品；王致和火锅调料是华北地区最畅销的火锅调料之一。芝麻酱、腐乳、韭菜花搭配比例适中，是北方涮火锅必备的蘸料。', '2014-12-23 17:09:35', '', '360', '160g', '', '', '', '', '', '1', '0', '3.48');
INSERT INTO `product` VALUES ('1030866', '6923450682098', '1', '真知棒 什锦味棒棒糖 10.5g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030866.JPG', '0.5', '真知棒', '圆圆的糖球，一根小棒，可爱的造型，“真知棒”棒棒糖以她独特的造型和多种好滋味吸引着小朋友们。“真知棒”棒棒糖一直以来在产品概念、口味方面不断推陈出新，提供酷冰系列、夹心系列、果味什锦系列等各种口味。 ', '2014-12-24 12:29:34', '', '720', '10.5g', '', '', '', '', '', '1', '0', '1');
INSERT INTO `product` VALUES ('1030869', '6922175101242', '1', '古船 精制雪花粉 5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030869.jpg', '45.9', '古船', '以进口和国产优质专用小麦为原料，采用先进的设备和工艺精制而成的纯天然顶级面粉，不使用任何添加剂。其粉色由于不含增白剂呈天然的乳白色，筋力强，弹性好，质量稳定，适合制作各种精制面条和饺子等高档面点，制成品透明度度好，口感细腻，有咬劲，麦香味纯正浓郁。', '2014-12-23 17:09:35', '', '240', '5kg', '', '', '', '', '', '1', '0', '46.4');
INSERT INTO `product` VALUES ('1030871', '6901845040357', '1', '格力高 百力滋微辣比萨饼干 65g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030871.JPG', '4.3', '格力高', '百力滋区别于传统概念的饼干，在独特的棒状造型上，喷洒各种风味的调料烘焙而成的香脆百力滋。4款浓郁清脆口感的经典百力滋，自上市以来一直深受消费者青睐。松脆的口感是百力滋独具的特点，咬下一根百力滋，每一口都能听到清脆的“咔嗒、咔嗒”的声音。', '2014-12-24 12:22:39', '', '360', '65g', '', '', '', '', '', '1', '0', '4.8');
INSERT INTO `product` VALUES ('1030872', '6921355220094', '1', '三元 脱脂牛奶 500ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030872.jpg', '7.5', '三元', '精选优质鲜牛奶，最大化保留牛奶中的营养成分和天然风味。脱脂处理，更少脂肪，更多健康。满足家庭共同饮用，是您家庭用餐的最佳选择。', '2014-12-23 17:09:35', '', '8', '500ml', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030873', '6938888888813', '1', '香飘飘 椰果香芋奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030873.jpg', '3.3', '香飘飘', '香飘飘奶茶的杯子高大，量足,实惠，椰果奶茶是经过特殊加工的，呈条形，很容易就能吸起来，且有海南的风味，味道很特别。香飘飘吸管特别定制了双节伸缩式的吸管，平时是短短的两节，用时只要拉开就变长了，可以方便、优雅地放入杯中。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030874', '6903148030363', '1', '飘柔 兰花长效清爽去屑洗发 400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030874.jpg', '17.5', '飘柔', '持久洁净柔顺，解决头屑烦恼。飘柔家庭护理系列洗发露，令头发持久洁净柔顺，解决头屑烦恼，清新怡人。', '2014-12-23 17:09:35', '', '1080', '400ml', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030875', '6934665082535', '1', '蒙牛 黄桃冠益乳 450g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030875.jpg', '13.9', '蒙牛', '醇正奶源，安心品质；北美鲜果，精心甄选；欧洲BB完菌，激活健康；倾心研发，加冕健字号；环保包装，心系自然。', '2014-12-23 17:09:35', '', '21', '450g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030877', '6901236380642', '1', '维达 倍韧纸手帕 10包', '1000047', 'http://pictures-of-goods.qiniudn.com/1030877.JPG', '6.2', '维达', '艺术压花技术，独特美观，纸巾不易散开，优雅与个性融为一体，给追求质感与个性的你增添艺术灵感；无增白剂，自然柔白，触碰自然的感觉；迷人的Bobo香熏香氛，给你带来每一天的愉悦心情。', '2014-12-24 12:10:23', '', '1080', '10包', '', '', '', '', '', '1', '0', '6.7');
INSERT INTO `product` VALUES ('1030878', '6903148116975', '1', '汰渍 炫白360度洁净百合粉 1.65kg', '1000049', 'http://pictures-of-goods.qiniudn.com/1030878.jpg', '16.8', '汰渍', '全面洁净，一步到位；洁雅百合香型；PH值中性，对手温和；注意事项：适用于各种衣物；适用于各色衣物。', '2014-12-23 17:09:35', '', '720', '1.65kg', '', '', '', '', '', '1', '0', '17.3');
INSERT INTO `product` VALUES ('1030880', '6902088702835', '1', '奥妙 净蓝全效洗衣粉 500g', '1000049', 'http://pictures-of-goods.qiniudn.com/1030880.jpg', '5.2', '奥妙', '产品功效：超强去渍，保护双手，智能泡沫调节，速洁因子深层去污。适用于棉、麻、化纤及混纺等各种质地纤维。洗衣时，请认明衣物上的洗涤指示。先将适量洗衣粉放入洗衣机，选择正确的洗衣程序，开始洗涤。', '2014-12-23 17:09:35', '', '1080', '500g', '', '', '', '', '', '1', '0', '5.7');
INSERT INTO `product` VALUES ('1030882', '6938888888820', '1', '香飘飘 椰果巧克力奶茶 80g', '1000024', 'http://pictures-of-goods.qiniudn.com/1030882.jpg', '3.3', '香飘飘', '香飘飘奶茶的杯子比较高大，显得量足、实惠，并且里面的椰果条，本身就是软的，无需沸水。奶茶温水一泡就可以饮用，且有海南的风味，味道很特别，让人感觉有营养价值。其创新性的用椰果包代替了传统的珍珠，在口感和热量控制上深受女性消费者的喜爱。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030890', '6901844707114', '1', '味好美 黑胡椒粉 10g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030890.jpg', '2.6', '味好美', '精心挑选黑胡椒粉为原料制作而成，品质上乘，纯正天然；粉质细腻，口感醇厚香浓，鲜美可口，尽享美妙，增香去异味；尤其是加在鱼或浅色酱汁菜式中，让您尽享独特的舌尖美味。', '2014-12-23 17:09:35', '', '1095', '10g', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030891', '6922330911235', '1', '桃李 醇熟切片面包 400g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030891.jpg', '7.5', '桃李', '桃李醇熟切片面包，采用汤种及长时间低温熟成技术，还原真正麦香味道，并可长时间保持面包的口感润滑、松软。面包的热量及脂肪含量更加符合现代人的健康饮食需求。', '2014-12-23 17:09:35', '', '4', '400g', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030892', '6922330911358', '1', '桃李 醇熟全麦切片面包 400g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030892.jpg', '7.5', '桃李', '桃李醇熟切片面包，采用汤种及长时间低温熟成技术，还原真正麦香味道，并可长时间保持面包的口感润滑、松软。面包的热量及脂肪含量更加符合现代人的健康饮食需求。', '2014-12-23 17:09:35', '', '4', '400g', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030893', '6906785015076', '1', '红星 43°八年陈酿蓝瓶酒 500ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030893.jpg', '24.9', '红星', '红星二锅头酒是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆、纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。', '2014-12-23 17:09:35', '', '0', '500ml', '', '', '', '', '', '1', '0', '25.4');
INSERT INTO `product` VALUES ('1030894', '6932571031289', '1', '味全 草莓活性乳酸菌饮品 435ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030894.jpg', '6.95', '味全', 'LC01益生菌和黄金双歧因子，轻松呵护健康顺畅。清新草莓味，酸酸甜甜，带来一天的好心情。', '2014-12-23 17:09:35', '', '21', '435ml', '', '', '', '', '', '1', '0', '7.45');
INSERT INTO `product` VALUES ('1030895', '6920202866737', '1', '红牛 维生素牛磺酸强化饮料 250ml', '1000075', 'http://pictures-of-goods.qiniudn.com/1030895.jpg', '6.6', '红牛', '红牛产品是一种功能维生素饮料，可提高免疫力，有缓解疲劳的功能。红牛维他命饮料有限公司生产的红牛品牌功能饮料，具有抗疲劳的保健功能，是功能性饮料的主要生产商之一。', '2014-12-23 17:09:35', '', '540', '250ml', '', '', '', '', '', '1', '0', '7.1');
INSERT INTO `product` VALUES ('1030897', '6907868888266', '1', '八喜550g巧克力冰淇 550g*6', '1000078', 'http://pictures-of-goods.qiniudn.com/1030897.jpg', '33', '八喜', '巧克力（Chocolate）：特色浓郁巧克力风味的冰淇淋。圆润的巧克力口感满齿流香。可可粉作为原料赋予了产品浓郁的可可脂香气。“八喜”冰淇淋配方源于1932年美国旧金山，1990年进入中国，经营的是地道的美国冰淇淋文化，给中国消费者带来全新概念的全乳脂冰淇淋。', '2014-12-23 17:09:35', '', '365', '550g*6', '', '', '', '', '', '1', '0', '33.5');
INSERT INTO `product` VALUES ('1030898', '6906785015090', '1', '红星 43°八年陈酿蓝瓶酒 250ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030898.jpg', '14.3', '红星', '43度250ml蓝瓶8年陈酿是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆、纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。', '2014-12-23 17:09:35', '', '0', '250ml', '', '', '', '', '', '1', '0', '14.8');
INSERT INTO `product` VALUES ('1030899', '6902265170501', '1', '海天 鲜味生抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030899.jpg', '6.5', '海天', '海天鲜味生抽，以优质黄豆、小麦粉、精盐为主要原料晒制而成。色泽清透，清鲜味美，酱香浓郁，用于家常小炒，凉拌佐餐等，滴滴鲜味，餐餐美味。', '2014-12-23 17:09:35', '', '548', '500ml', '', '', '', '', '', '1', '0', '7');
INSERT INTO `product` VALUES ('1030900', '6922330911334', '1', '桃李 葡萄干切片面包 400g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030900.jpg', '9.9', '桃李', '采用汤种面包制作技术，口感、柔软度及面包弹性倍增，并可延缓面包老化时间，使面包维持如刚出炉之品质。全麦面包，低温熟成技术，口感滑润、松软。', '2014-12-23 17:09:35', '', '5', '400g', '', '', '', '', '', '1', '0', '10.4');
INSERT INTO `product` VALUES ('1030901', '6927006113593', '1', '百雀羚 凡士林保湿润肤霜 120g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030901.jpg', '14.5', '百雀羚', '滋养肌肤、润体防干燥、保湿嫩肤、滋润手足 专家配方的百雀羚凡士林润肤霜，蕴含独特的滋润因子Lipids精华，深入滋润干燥肌肤，同时锁住肌肤水份，长效保湿、舒缓干燥。所含滋润成分令肌肤晶莹柔滑，充满活力与弹性。 使用方法：清洁肌肤后，直接涂抹即可。', '2014-12-23 17:09:35', '', '1080', '120g', '', '', '', '', '', '1', '0', '15');
INSERT INTO `product` VALUES ('1030903', '6903148080016', '1', '沙宣 修护水养洗发露 400ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030903.jpg', '52', '沙宣', '新科技配方：新添加弹性配方，唤醒秀发中沉睡因子，令秀发弹性增加26%。产品特点：液态闪耀因子，创造水钻闪耀效果，散发动感光芒；水活线条科技，润泽每丝秀发，抚平毛躁，令秀发顺滑服；轻盈焕发配方，实现发型顶部轻盈，发丝可塑；液态修护配方，修补发丝表面受损，防止秀发分叉、毛躁。', '2014-12-23 17:09:35', '', '1080', '400ml', '', '', '', '', '', '1', '0', '52.5');
INSERT INTO `product` VALUES ('1030905', '6903148080023', '1', '沙宣 修护水养洗发露 750ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030905.jpg', '87.8', '沙宣', '新科技配方：新添加弹性配方，唤醒秀发中沉睡因子，令秀发弹性增加26%。产品特点：液态闪耀因子，创造水钻闪耀效果，散发动感光芒；水活线条科技，润泽每丝秀发，抚平毛躁，令秀发顺滑服；轻盈焕发配方，实现发型顶部轻盈，发丝可塑；液态修护配方，修补发丝表面受损，防止秀发分叉、毛躁。', '2014-12-23 17:09:35', '', '1080', '750ml', '', '', '', '', '', '1', '0', '88.3');
INSERT INTO `product` VALUES ('1030906', '6921355220087', '1', '三元 鲜牛奶 250ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030906.jpg', '3.9', '三元', '富含丰富的钙、钠、能量等，保持每天充足的生命活力；超高温灭菌，全封闭密封包装，严谨的制作的工艺加上超高，安全性的配送方式；盒装包装，保证品质，祟尚自然的包装设计风格，充分展示牛奶的天然与纯正；特选优质生牛奶原料，经标准化、均质、超高温灭菌和无菌灌装工艺制成。', '2014-12-23 17:09:35', '', '8', '250ml', '', '', '', '', '', '1', '0', '4.4');
INSERT INTO `product` VALUES ('1030908', '6922848641013', '1', '立顿 S25茶包茉莉花茶 50g', '1000026', 'http://pictures-of-goods.qiniudn.com/1030908.jpg', '11.9', '立顿', '手工采摘原片茶叶，加入优质茉莉花窨制而成，施以全新加工工艺，确保上佳品质。色泽鲜亮，茶香宜人，口味鲜爽甘醇。立顿，世界最大的茶饮料品牌，向您传递活力信息。', '2014-12-23 17:09:35', '', '720', '50g', '', '', '', '', '', '1', '0', '12.4');
INSERT INTO `product` VALUES ('1030909', '6924187821989', '1', '洽洽 原香瓜子 285g', '1000003', 'http://pictures-of-goods.qiniudn.com/1030909.jpg', '11.8', '洽洽', '洽洽香瓜子来自于海外原料基地和内蒙古草原的长白山纯天然香料和优质葵花籽原料，经过“洽洽”精心独特的配方，造就了“洽洽”香瓜子特有的口味，从此众口不再难调。“洽洽”香瓜子所具有的独特的口感和香味，主要在于用料精良，配方独特。', '2014-12-23 17:09:35', '', '240', '285g', '', '', '', '', '', '1', '0', '12.3');
INSERT INTO `product` VALUES ('1030911', '6906785015052', '1', '红星  43°蓝瓶八年陈酿酒 750ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030911.jpg', '33.5', '红星', '红星二锅头酒是传统酿酒工艺与现代微生物技术相结合的结晶，以优质红高梁、大麦、碗豆、纯净水为原料，清蒸清烧，老五甑工艺蒸馏，掐头去尾截取中段，长年窖存。酒质清澈透明，气味香馥、醇厚甘冽、清香纯正、回味悠长。', '2014-12-23 17:09:35', '', '0', '750ml', '', '', '', '', '', '1', '0', '34');
INSERT INTO `product` VALUES ('1030914', '6910160312377', '1', '丘比 香甜沙拉酱 200g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030914.jpg', '9.8', '丘比', '主要原料是鸡蛋和酿造醋、植物油，酱体细腻、圆滑、乳化状态非常好，适用于沙拉调制，寿司制作等；特有香甜口味，专为中国人饮食习惯所研制，特别适合各种蔬菜水果和寿司料理使用，可以将此沙拉酱作为基酱，根据个人口味加入其他调料。', '2014-12-23 17:09:35', '', '365', '200g', '', '', '', '', '', '1', '0', '10.3');
INSERT INTO `product` VALUES ('1030915', '6932571031241', '1', '味全 原味活性乳酸菌饮品 435ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030915.JPG', '6.95', '味全', '味全活性乳酸曲还配合添加了黄金双歧因子，轻松呵护健康顺畅；活化加吸收，双益搭配，让你健康加倍；每一瓶都含有300亿个LC01活性益菌，当你饭饱后来一瓶，身体更好。', '2014-12-24 12:55:21', '', '21', '435ml', '', '', '', '', '', '1', '0', '7.45');
INSERT INTO `product` VALUES ('1030916', '6906151600349', '1', '牛栏山 36°百年酒 400ml', '1000013', 'http://pictures-of-goods.qiniudn.com/1030916.jpg', '108', '牛栏山', '牛栏山二锅头，精选优质高粱和小麦等为原料，以豌豆 、大麦等制成大曲为发酵剂，纯粮酿造绿色自然。从原料粉碎到成品酒灌装，经糊化 、发酵 、蒸馏等十多道关键工序，二锅头的发酵，仍沿用古老的“地缸”发酵法。', '2014-12-23 17:09:35', '', '0', '400ml', '', '', '', '', '', '1', '0', '108.5');
INSERT INTO `product` VALUES ('1030919', '6934660524849', '1', '苏菲 超熟睡410超薄随心翻夜巾 8片', '1000083', 'http://pictures-of-goods.qiniudn.com/1030919.jpg', '17.5', '苏菲', '开发了从前延伸至扇尾的超长贴身区，整片 都贴合身体。有效解决普通超薄产品因扁扁平平，翻身时易产生间隙的问题。配合下层弹力空气感素材，不变形。全面背胶，平稳妥帖，不易变形。薄薄一片，尽享随心翻的乐趣！速吸小孔密集分布于表层，能将经血迅速锁入底层，不回流、不反渗。', '2014-12-23 17:09:35', '', '1080', '8片', '', '', '', '', '', '1', '0', '18');
INSERT INTO `product` VALUES ('1030920', '6901668054050', '1', '奥利奥 原味夹心饼干 130g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030920.jpg', '5.9', '奥利奥', '纯正黑巧克力夹心的组合,精美花纹,黑白经典,风行全世界.独特\"扭一扭,舔一舔,泡一泡\"有趣的吃法.配料:小麦粉,白砂糖,食用植物油,可可粉,淀粉,转化糖浆(白砂糖,水,柠檬酸,碳酸氢钠)食品添加剂(碳酸氢钠,碳酸氢铵,大豆磷脂)食用油,香兰素.', '2014-12-23 17:09:35', '', '365', '130g', '', '', '', '', '', '1', '0', '6.4');
INSERT INTO `product` VALUES ('1030922', '6903148079997', '1', '沙宣 修护水养洗发露 200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030922.jpg', '29.9', '沙宣', '沙宣修护水养洗发露,液态闪耀因子，创造水钻闪耀效果，散发动感光芒，水活线条科技，润泽每丝秀发，抚平毛躁，令秀发顺滑服帖。', '2014-12-23 17:09:35', '', '1080', '200ml', '', '', '', '', '', '1', '0', '30.4');
INSERT INTO `product` VALUES ('1030923', '6901236371749', '1', '维达10包超韧清香纸手帕', '1000047', 'http://pictures-of-goods.qiniudn.com/1030923.jpg', '7.5', '维达', '绿色原料，安心100%，4层韧度，4倍细韧，细密又厚实，湿水易破。', '2014-12-24 14:29:18', '', '1095', '0', '', '', '', '', '', '1', '0', '8');
INSERT INTO `product` VALUES ('1030926', '6920242104165', '1', '怡达 果丹皮 500g', '1000076', 'http://pictures-of-goods.qiniudn.com/1030926.jpg', '14.5', '怡达', '怡达之名出自清乾隆年间，乾隆到承德避暑期间，巧食了这里的山楂，觉此果清爽适口，还有消食清火之功效，便称赞道“怡色怡味，达心达情”，当即赐名曰“怡达红”，而其产地便就此被称为“怡达山”，一时间“怡达红”成为宫廷贡礼之上选。', '2014-12-23 17:09:35', '', '540', '500g', '', '', '', '', '', '1', '0', '15');
INSERT INTO `product` VALUES ('1030929', '6921355231359', '1', '三元 黑加仑悦浓优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030929.jpg', '3.3', '三元', '酸奶能促进消化液的分泌，增加胃酸，因而能增强人的消化能力，促进食欲。本品更有坚固牙龈、保护牙齿，保护肝功能，改善视功能，延缓衰老，补血补气，黑加仑含有非常丰富的维生素C、磷、镁、钾、钙、花青素、酚类物质。', '2014-12-23 17:09:35', '', '18', '180g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030930', '6944910318043', '1', '福临门 金典东北米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030930.jpg', '43.9', '福临门', '福临门金典特选东北米，原粮产自东北优质生态大米产区———吉林梅河口。长白山脚下古朴的沃土，松花江源头清澈的甘泉，让好米颗颗具备先天优良品质。生米米粒饱满、晶莹如玉，蒸煮后米饭清香宜人、软硬适口，品质经典纯粹。', '2014-12-23 17:09:35', '', '360', '5kg', '', '', '', '', '', '1', '0', '44.4');
INSERT INTO `product` VALUES ('1030931', '6923555210479', '1', '汇源 100%葡萄汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030931.jpg', '13.9', '汇源', '水果的季节性，固化了我们的选择，非应季水果售价、口感、营养都大打折扣。一水果残留农药不易清洗，同时不易随身携带，很多场合不适宜吃水果。喝果汁较吃水果营养更全面且更容易吸收，吃水果无法摄取水果的皮、籽中大量的营养，所以喝果汁是更睿智的选择。', '2014-12-23 17:09:35', '', '365', '1L', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030932', '6910160312520', '1', '丘比 草莓酱 340g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030932.jpg', '12.8', '丘比', '混合了好几个品种的草莓，强调了草莓的风味。减少甜度，清爽口味。 不仅可涂抹于面包，还可添加在酸奶中制成时尚饮品。', '2014-12-23 17:09:35', '', '540', '340g', '', '', '', '', '', '1', '0', '13.3');
INSERT INTO `product` VALUES ('1030933', '6901668054067', '1', '奥利奥 草莓夹心饼干 130g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030933.jpg', '5.9', '奥利奥', '奥利奥饼干始终代表着卓越的品质，以及温馨愉悦的亲近时刻。无论在世界的哪个角落，奥利奥“扭一扭，舔一舔，泡一泡”所带来的乐趣，总在感染并牵引着人们，享受与家人在一起的亲近时刻。它为生活带来童真的味道，让家庭充满甜美的温馨，每一次品尝，母一次分，都是一段美妙的时光。', '2014-12-23 17:09:35', '', '365', '130g', '', '', '', '', '', '1', '0', '6.4');
INSERT INTO `product` VALUES ('1030934', '6901845010169', '1', '格力高 百奇巧克力休闲棒饼 60g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030934.jpg', '5.8', '格力高', '格力高百奇，时尚小巧的饼干棒让人爱不释手，外面包裹着美味香滑的涂层。针对不同的消费者的不同喜好开发出了各种美味的巧克力酱作为涂层，让您在不同心情，不同场合之下感受到不同的芳香浓郁，随时随地感受百奇的魅力，时尚又美味。', '2014-12-23 17:09:35', '', '365', '60g', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030936', '6901668054074', '1', '奥利奥 巧克力夹心饼干 130g', '1000001', 'http://pictures-of-goods.qiniudn.com/1030936.jpg', '5.9', '奥利奥', '奥利奥饼干始终代表着卓越的品质，以及温馨愉悦的亲近时刻。无论在世界的哪个角落，奥利奥“扭一扭，舔一舔，泡一泡”所带来的乐趣，总在感染并牵引着人们，享受与家人在一起的亲近时刻。它为生活带来童真的味道，让家庭充满甜美的温馨，每一次品尝，母一次分，都是一段美妙的时光。', '2014-12-23 17:09:35', '', '365', '130g', '', '', '', '', '', '1', '0', '6.4');
INSERT INTO `product` VALUES ('1030938', '6921355231342', '1', '三元 青提悦浓优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030938.jpg', '3.3', '三元', '提子含丰富的维他命C及E，为皮肤提供抗氧化保护，有效对抗游离基，减轻皮肤受外来环境的侵袭。酸奶能促进消化液的分泌，增加胃酸，因而能增强人的消化能力，促进食欲。酸奶中的乳酸不但能使肠道里的弱酸性物质转变成弱碱性，而且还能产生抗菌物质，对人体具有保健作用。', '2014-12-23 17:09:35', '', '21', '180g', '', '', '', '', '', '1', '0', '3.8');
INSERT INTO `product` VALUES ('1030939', '6921204802204', '1', '葱伴侣 六月香豆瓣酱 300g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030939.jpg', '6.8', '葱伴侣', '精选东北非转基因大豆，山东优质小麦，是健康食品级原材料。经过恒温足期发酵和自然完熟的过程，不需要油炸，开盒即食。酱香浓郁，自然醇厚，酱香源自自然原酿。氨基酸态氮含量高，发酵过程产生大量人体所必需的氨基酸。', '2014-12-23 17:09:35', '', '360', '300g', '', '', '', '', '', '1', '0', '7.3');
INSERT INTO `product` VALUES ('1030941', '6954767447872', '1', '芬达 葡萄味汽水 600ml', '1000017', 'http://pictures-of-goods.qiniudn.com/1030941.jpg', '2.6', '芬达', '芬达，1940年诞生于德国，1984 进入中国。芬达的品牌愿景是：让这个世界玩起来。其自然果香融合丰富果味，为青少年开启一个充满玩趣的游乐园，引导，激发，促进有价值的玩。让青少年在玩中快乐成长！目前在中国芬达共有橙味、苹果味、水蜜桃味、葡萄味、四种种口味。', '2014-12-23 17:09:35', '', '270', '600ml', '', '', '', '', '', '1', '0', '3.1');
INSERT INTO `product` VALUES ('1030944', '6901009915538', '1', '长城 纸盒解百纳特选级干红 750ml', '1000010', 'http://pictures-of-goods.qiniudn.com/1030944.jpg', '128', '长城', '特选级解百纳、高端大气上档次!酒香气幽雅协调，入口酵和柔顺，余味悠长，佐以野味，烤牛排等肉类则相得益彰，具浓郁芬芳的果香及酒香，口味醇厚协调，酒体丰满，是宴请宾客理想之佳品，精美包装，亦是馈赠亲朋好友之佳品。', '2014-12-23 17:09:35', '', '3650', '750ml', '', '', '', '', '', '1', '0', '128.5');
INSERT INTO `product` VALUES ('1030945', '6921355230796', '1', '三元 益菌多原味酸奶 125g*8', '1000022', 'http://pictures-of-goods.qiniudn.com/1030945.jpg', '13.9', '三元', '益菌多产品系列来自三元优质牛奶，口感清爽，深受消费者多年的青睐。三元食品产品涵盖屋型包装鲜奶系列、超高温灭菌奶系列、酸奶系列、袋装鲜奶系列、奶粉系列、干酪系列及各种乳饮料、冷食、宫廷乳制品等。', '2014-12-23 17:09:35', '', '18', '125g*8', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030946', '6901306668021', '1', '太阳 小米麻辣锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030946.jpg', '2.2', '太阳', '小米太阳锅巴不同于质地疏松、没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。 ', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030947', '6904700200361', '1', '义利 什果全麦面包 100g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030947.jpg', '2.3', '义利', '北京义利食品以其悠久的历史、知名的品牌、精湛的技艺、优良的品质，赢得了广大消费者的喜爱，尤其果子面包，巧克力特别受欢迎。', '2014-12-23 17:09:35', '', '5', '100g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030949', '6922330911389', '1', '桃李 吉士排面包 340g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030949.jpg', '7.1', '桃李', '桃李黄金吉士排面包适合早餐、旅游、家庭等主食类佳品。精心制作，醇厚味道，有弹性。保证新鲜（保质期短）用料精选，商品细腻，有弹性，具有浓郁的奶香味。', '2014-12-23 17:09:35', '', '4', '340g', '', '', '', '', '', '1', '0', '7.6');
INSERT INTO `product` VALUES ('1030950', '6901306668014', '1', '太阳 麻辣豆香锅巴 50g', '1000072', 'http://pictures-of-goods.qiniudn.com/1030950.jpg', '2.2', '太阳', '豆香太阳锅巴麻辣太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴太阳锅巴不同于质地疏松，没有咀嚼感的各种膨化食品，它酥脆而实在，越嚼越香，余味无穷，即是随意小吃，亦可下酒及烹调菜肴。 ', '2014-12-23 17:09:35', '', '240', '50g', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030953', '6902088700770', '1', '金纺 薰衣草柔顺剂 3L', '1000050', 'http://pictures-of-goods.qiniudn.com/1030953.jpg', '32.9', '金纺', '柔软舒适，和家人最贴近的毛巾、孩子们最爱的绒毛玩具，冬日最温暖的毛衣和围巾，金纺护理后不但松软柔顺，而且清新淡雅。气味清新，金纺纯天然香薰能在衣物表面留香7天，无论是夏天衣物上残留的汗味还是朋友家人聚会留下的火锅味和烟味，都能更好的遮盖和让你和你家人始终拥有怡然心旷的好状态。', '2014-12-23 17:09:35', '', '1080', '3L', '', '', '', '', '', '1', '0', '33.4');
INSERT INTO `product` VALUES ('1030954', '6923555210455', '1', '汇源 100%橙汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030954.JPG', '13.9', '汇源', '高品质原浆打造，口味纯正，营养不流失。1000多万亩原料基地，采集优质水果，就近建立工厂，最大程度的保鲜保质。UHT超高温瞬时灭菌无菌冷灌15秒瞬时杀菌，更安全更多营养更新鲜。进口高端纸包装，7层材科，保障坚韧度，防止泄露，阻挡光线和氛气进入。', '2014-12-24 12:43:52', '', '365', '1L', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030955', '6921355230802', '1', '三元 益菌多无蔗糖酸奶 125g*8', '1000022', 'http://pictures-of-goods.qiniudn.com/1030955.jpg', '13.9', '三元', '益菌多产品系列来自三元优质牛奶，口感清爽，深受消费者多年的青睐。三元食品产品涵盖屋型包装鲜奶系列、超高温灭菌奶系列、酸奶系列、袋装鲜奶系列、奶粉系列、干酪系列及各种乳饮料、冷食、宫廷乳制品等。', '2014-12-23 17:09:35', '', '18', '125g*8', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030956', '6903102100125', '1', '燕京 11°精品啤酒 500ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030956.jpg', '3.99', '燕京', '一贯品质 无限陶醉。流露着妩媚，流露着圆润，流露着流畅，酒体闪着金黄色的光芒，非常的抗氧化工艺，传承着燕京啤酒一贯的品质，优质矿泉水、精选麦芽加上世界一流的工艺和技术，使燕京纯生啤酒的色感、口感，质感没有丝毫缺憾，更纯更爽更新鲜的感觉让你无限陶醉。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '4.49');
INSERT INTO `product` VALUES ('1030957', '6921355231311', '1', '三元 经典原味悦浓优酪乳 180g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030957.jpg', '3.1', '三元', '经典原味，无尽享受！产品采用新型环保包装，倡导绿色消费。持久保鲜，无异味，易消化，饮用更方便。', '2014-12-23 17:09:35', '', '18', '180g', '', '', '', '', '', '1', '0', '3.6');
INSERT INTO `product` VALUES ('1030958', '6910160312575', '1', '丘比 蓝莓酱 170g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030958.jpg', '10.9', '丘比', '特选新鲜上等水果,采用优良加工工艺,精制成鲜香可口好味果酱。细腻而幼滑,乃佐餐之必备佳品。香甜蓝莓味，真正水果制成，适宜直接食用，可用于制作美味糕点。', '2014-12-23 17:09:35', '', '540', '170g', '', '', '', '', '', '1', '0', '11.4');
INSERT INTO `product` VALUES ('1030960', '6923555210462', '1', '汇源 100%苹果汁 1L', '1000016', 'http://pictures-of-goods.qiniudn.com/1030960.jpg', '13.9', '汇源', '打开果汁瞬间，浓郁果香立刻扑鼻而来，果汁中包含果肉清香的美味，可谓是一次绝妙的味蕾体验。在国内优质水果产地建立600多万亩原料基地，采集优质水果，就近建立工厂，生产水果原浆和浓缩汁，采用先进冷榨技术，最大程度地保留水果的营养成份。同时，也从国外进口部分优质浓缩汁原料。', '2014-12-23 17:09:35', '', '365', '1L', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030961', '6921355222081', '1', '三元 百利包核桃牛奶 200ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030961.jpg', '2.2', '三元', '蒙牛是大陆生产牛奶、酸奶和乳制品的领头企业之一，1999年成立，至2005年时已成为中国奶制品营业倾第二大的公司，其中液态奶和冰激凌的产量都居全中国第一。作为国家农业产业化重点龙头企业，肩负着’百年裁牛、强乳兴农’的使命，借西部大开发的容风取得了长足发展。', '2014-12-23 17:09:35', '', '30', '200ml', '', '', '', '', '', '1', '0', '2.7');
INSERT INTO `product` VALUES ('1030963', '6903148047804', '1', '舒肤佳 柠檬清香沐浴露 200ml', '1000060', 'http://pictures-of-goods.qiniudn.com/1030963.jpg', '12.9', '舒肤佳', '舒肤佳含有抑菌成分“迪保肤”。有效去除99%皮肤接触的细菌，同时迪保肤能附着在细菌表面，破坏细菌的新陈代谢系统，不仅持久抑制皮肤细菌再生，而且持续抵抗新接触的皮肤细菌。每天洗澡使用，有助全家健康。柠橄清香配方，含丰富维他命，滋养肌肤。有效泊洁肌肤同时，带来清新沐浴体验。让全家肌肤爽洁分健康。', '2014-12-23 17:09:35', '', '1080', '200ml', '', '', '', '', '', '1', '0', '13.4');
INSERT INTO `product` VALUES ('1030964', '6921355240023', '1', '三元 纯牛奶 250ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030964.JPG', '3.1', '三元', '富含丰富的钙、钠、能量等。保持每天充足的生命活力。超高温灭菌，全封闭密封包装。严谨的制作的工艺加上超高安全性的配送方式。盒装包装，保证品质。祟尚自然的包装设计风格，充分展示牛奶的天然与纯正。特选优质生牛奶原料，经标准化、均质、超高温灭菌和无菌灌装工艺制成。', '2014-12-24 12:53:54', '', '240', '250ml', '', '', '', '', '', '1', '0', '3.6');
INSERT INTO `product` VALUES ('1030965', '6922175101396', '1', '古船 7+1营养强化富强粉 5kg', '1000029', 'http://pictures-of-goods.qiniudn.com/1030965.JPG', '22.5', '古船', '面粉富强粉是以国家标准为依据，依照优于国家标准的企业内控标准，以进口和国产优质小麦为原料，采用先进的设备和工艺粉制而成的优质面粉。小麦种子最核心的部分磨出的面粉，加工精度高，色泽洁白，筋力强，面筋含量高、杂质少、较白颗粒适中。', '2014-12-24 13:02:02', '', '240', '5kg', '', '', '', '', '', '1', '0', '23');
INSERT INTO `product` VALUES ('1030968', '6921355240030', '1', '三元 巧克力奶 250ml', '1000020', 'http://pictures-of-goods.qiniudn.com/1030968.JPG', '3.8', '三元', '三元巧克力牛奶，选用优质生牛乳为主要原料，添加可可粉等辅料。先进的生产工艺，经标准化、均质、超高温灭菌和无菌灌装工艺制成。', '2014-12-24 12:54:16', '', '240', '250ml', '', '', '', '', '', '1', '0', '4.3');
INSERT INTO `product` VALUES ('1030969', '6902890236412', '1', '双汇 猪肉风味俄式烤香肠 140g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030969.jpg', '6.7', '双汇', '俄式烤香肠，风味浓郁，口感上乘！便携装的美味小食，随身携带，品味俄式经典！食用方法：开袋即食，也可切片配合酱汁蘸食用别有风味！爆炒：切片或切丁后炒菜、炒饭均可；微波：微波加热后拼盘食用，或夹面包蔬菜做汉堡；烧烤：野炊休闲时烧烤使用，别有风味。', '2014-12-23 17:09:35', '', '90', '140g', '', '', '', '', '', '1', '0', '7.2');
INSERT INTO `product` VALUES ('1030971', '6920601711157', '1', '棒棒娃 香辣味酱香牛肉 80g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030971.jpg', '19.8', '棒棒娃', '甘醇嫩软，鲜美可口，清新宜人。肉质鲜美，细嫩入渣，回味悠长。棒棒娃牛肉系列之所以成为畅销产品，是因为我们做到选料--按严格的标准选取出的鲜美牛肉和辅料保证了产品的品质。操控--由四川著名传统腌卤师主课，保证了产品的口味纯正。', '2014-12-23 17:09:35', '', '360', '80g', '', '', '', '', '', '1', '0', '20.3');
INSERT INTO `product` VALUES ('1030972', '6904700200415', '1', '义利 红果面包 135g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030972.JPG', '2.3', '义利', '义利果子面包和义利维生素面包是目前市场上少有的几款不含氢化植物油、反式脂肪酸的传统面包，相比之下，不够松软，油性小，味道平和，口感几乎和70年代的义利面包一模一样。', '2014-12-24 12:32:01', '', '0', '135g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030974', '6926136720879', '1', '长寿花 金胚玉米油 1L', '1000027', 'http://pictures-of-goods.qiniudn.com/1030974.jpg', '22.9', '长寿花', '玉米油因其营养价值高,而被成为”黄金作物”.玉米油富含天然植物甾醇及人体内必需的维生素E和不饱和脂肪酸（主要为亚麻酸、亚油酸和油酸，其中亚油酸的含量在50%以上）植物甾醇能有效控制人体胆固醇水平。亚油酸是人体自身不能合成的必须脂肪酸，能降低人体胆固醇、降血脂、改善血脂循环。', '2014-12-23 17:09:35', '', '540', '1L', '', '', '', '', '', '1', '0', '23.4');
INSERT INTO `product` VALUES ('1030975', '6942032700098', '1', '捞派 海底捞麻辣香锅火锅底料 220g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030975.jpg', '15.6', '捞派', '使用麻辣底料，口感醇和，辣而不燥，是当前比较营养健康的香锅火锅。麻辣的底料搭配多样的食材，让你不只享受到香辣口感，更让你体会到川味火锅的美味。', '2014-12-23 17:09:35', '', '360', '220g', '', '', '', '', '', '1', '0', '16.1');
INSERT INTO `product` VALUES ('1030978', '6944910318005', '1', '福临门 稻花香米 5kg', '1000028', 'http://pictures-of-goods.qiniudn.com/1030978.jpg', '82.9', '福临门', '“国宴米”五常大米中一种最为特殊的高端米。由农民育种专家田永太，历时30年培育而出，因香气沁人心脾，命名稻花香。真正细心品味过正宗五常稻花香大米的人，无不为那唇齿留芳、经年不忘的饭香所陶醉。', '2014-12-23 17:09:35', '', '360', '5kg', '', '', '', '', '', '1', '0', '83.4');
INSERT INTO `product` VALUES ('1030979', '6907592001450', '1', '王致和 精制烹饪黄酒 500ml', '1000011', 'http://pictures-of-goods.qiniudn.com/1030979.jpg', '5.6', '王致和', '王致和烹饪黄酒精选优质原料，经过多道生产工艺精心制造而成。王致和烹饪黄酒柔和鲜咸，具有浓郁醇香气味，是烹饪的理想调味佳品。王致和烹饪黄酒不仅具有调味料酒的去腥解腻的作用，更突出清香和营养。', '2014-12-23 17:09:35', '', '360', '500ml', '', '', '', '', '', '1', '0', '6.1');
INSERT INTO `product` VALUES ('1030980', '6940486020144', '1', '浪奇 深海紫菜 30g', '1000032', 'http://pictures-of-goods.qiniudn.com/1030980.jpg', '6.99', '浪奇', '精选原料，科技加工；口感细嫩，香味浓；味道鲜美,含碘量丰富；多种食用方法，美味方便，佐餐佳品，厨房必备。', '2014-12-23 17:09:35', '', '540', '30g', '', '', '', '', '', '1', '0', '7.49');
INSERT INTO `product` VALUES ('1030981', '6920001158101', '1', '郁美净 儿童霜 25g*5', '1000060', 'http://pictures-of-goods.qiniudn.com/1030981.jpg', '7.2', '郁美净', '很多人在小时候都用过郁美净儿童霜，产品温和柔嫩，敏感肌肤都适用，滋润而且美白，增强肌肤弹性，治疗湿疹、奶藓效果一流，更适合干性和中性肌肤使用。采用科学配方，富含鲜奶及各种维生素，全面滋养肌肤，增强皮肤弹性，长期使用可使皮肤柔润光滑针对过敏性肌肤。', '2014-12-23 17:09:35', '', '1095', '25g*5', '', '', '', '', '', '1', '0', '7.7');
INSERT INTO `product` VALUES ('1030982', '6903148034156', '1', '佳洁士 茶洁防蛀牙膏 140g', '1000060', 'http://pictures-of-goods.qiniudn.com/1030982.jpg', '5.5', '佳洁士', '佳洁士茶洁防蛀牙膏，氟茶配方；含有茶多酚；有效防蛀固齿；帮助洁白牙齿；清新口气；帮助减少磨损牙齿。', '2014-12-23 17:09:35', '', '720', '140g', '', '', '', '', '', '1', '0', '6');
INSERT INTO `product` VALUES ('1030983', '6902022130526', '1', '蓝月亮 衣领净(喷) 500g', '1000049', 'http://pictures-of-goods.qiniudn.com/1030983.jpg', '27.9', '蓝月亮', '能有效去除常见顽固污渍，对难以去除的衣领袖口渍、食油渍、血渍、草渍、汗渍、机械油、果渍等多种顽固污渍特别有效；强力渗透帮助深层去渍，不用揉搓即可迅速瓦解顽固污渍，不损失衣物纤维，令衣服光洁如新。', '2014-12-23 17:09:35', '', '720', '500g', '', '', '', '', '', '1', '0', '28.4');
INSERT INTO `product` VALUES ('1030984', '6944978701368', '1', '有友 山椒味泡凤爪 158g', '1000007', 'http://pictures-of-goods.qiniudn.com/1030984.jpg', '13.9', '有友', '有友 泡凤爪(山椒味) 精湛工艺 精选上等凤爪、野山椒，配料正宗，精心制作,香味十足，香辣够劲，爽口不油腻，回味无穷。有友泡凤爪(山椒味) 独立包装,分量十足。 独立小包装，高温杀菌，食用时更加方便，卫生，快捷，让你的闲暇时光更加轻松自在！', '2014-12-23 17:09:35', '', '180', '158g', '', '', '', '', '', '1', '0', '14.4');
INSERT INTO `product` VALUES ('1030985', '6954767433073', '1', '可口可乐 雪碧 2L', '1000017', 'http://pictures-of-goods.qiniudn.com/1030985.jpg', '5.8', '可口可乐', '“雪碧”一词，音译自英语Sprite，原意为妖怪、精灵。作为一种饮料，把它译为“雪碧”可谓是煞费苦心。在汉语中，雪碧有纯洁、清凉的含义，使人在炎热的夏季里联想到一片纷飞的白雪，一潭清澈的碧水，顿时有一种清凉之感，产生“挡不住的诱惑”。', '2014-12-23 17:09:35', '', '365', '2L', '', '', '', '', '', '1', '0', '6.3');
INSERT INTO `product` VALUES ('1030986', '6921317996500', '1', '康师傅 绿茶 1L', '1000018', 'http://pictures-of-goods.qiniudn.com/1030986.jpg', '3.7', '康师傅', '康师傅绿茶是康师傅旗下的著名饮料品牌。每一瓶绿茶之中都包含天然蜂蜜,自然健康、润口解渴,清新爽口的口感让你感觉不仅是在品味绿茶饮品,更能感受到康师傅绿茶带来的心情舒放、轻松自在和清新态度。绿茶饮料的自然、健康、活力和生命力,向消费者传递自在轻松的感觉和健康的生活方式。', '2014-12-23 17:09:35', '', '360', '1L', '', '', '', '', '', '1', '0', '4.2');
INSERT INTO `product` VALUES ('1030987', '6906303888885', '1', '王守义 十三香 45g', '1000030', 'http://pictures-of-goods.qiniudn.com/1030987.jpg', '4.5', '王守义', '王守义十三香沿袭北宋兴隆堂独特的原料配方，依照中医理论和用药要求严格配方，根据食疗原料的性能，精心炮制而成，使烹饪的食物色、香、味俱全。', '2014-12-23 17:09:35', '', '180', '45g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030988', '6932571031111', '1', '味全 芦荟活性乳酸菌饮品 435ml', '1000021', 'http://pictures-of-goods.qiniudn.com/1030988.jpg', '6.95', '味全', '自然沁爽的芦荟口感，配合LCO1益生菌和黄金双歧因子，释放清新活力，轻松享受平衡健康。双益搭配，健康呵护全家。', '2014-12-23 17:09:35', '', '21', '435ml', '', '', '', '', '', '1', '0', '7.45');
INSERT INTO `product` VALUES ('1030989', '6919892113702', '1', '康师傅 醇香芝麻口味蛋酥卷 108g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030989.jpg', '8.3', '康师傅', '康师傅蛋酥卷醇香芝麻口味，经过精心的烘焙，这金黄的色泽，香酥的口感，保证您对它爱不释手，一口接一口……', '2014-12-23 17:09:35', '', '360', '108g', '', '', '', '', '', '1', '0', '8.8');
INSERT INTO `product` VALUES ('1030990', '6911316361584', '1', '曼妥思 霓虹糖 37g', '1000005', 'http://pictures-of-goods.qiniudn.com/1030990.JPG', '1.9', '曼妥思', '曼妥思霓虹糖源自欧洲荷兰,自1932年诞生以来,以有70多年的历史,于1995年走入中国,深受男女老少消费者的欢迎和喜爱.来一颗曼妥思吧,脆壳里藏着有嚼头的软芯,一咬一嚼,生活也许就会豁然开朗!曼妥思,清新妙计好心情!', '2014-12-24 12:28:48', '', '720', '37g', '', '', '', '', '', '1', '0', '2.4');
INSERT INTO `product` VALUES ('1030991', '6922824055018', '1', '李锦记 精选生抽 500ml', '1000030', 'http://pictures-of-goods.qiniudn.com/1030991.jpg', '6.9', '李锦记', '精选优质原料，以传统工艺酿造，用来烹调或西蘸点带出菜肴鲜味。精选优质黄豆、面粉，经传统工艺发酵酿造而成，豉香醇厚，滋味鲜美、色泽红润、体态澄清，质优味美、回味悠长，是一种鲜、咸、甜味俱佳、柔和醇厚、现代家庭必备的调味佳品。', '2014-12-23 17:09:35', '', '720', '500ml', '', '', '', '', '', '1', '0', '7.4');
INSERT INTO `product` VALUES ('1030992', '6921355222135', '1', '三元 大红枣酸牛奶 160g', '1000022', 'http://pictures-of-goods.qiniudn.com/1030992.jpg', '2.3', '三元', '新鲜爽口，营养美味。三元食品产品涵盖屋型包装鲜奶系列、超高温灭菌奶系列、酸奶系列、袋装鲜奶系列、奶粉系列、干酪系列及各种乳饮料、冷食、宫廷乳制品等。', '2014-12-23 17:09:35', '', '18', '160g', '', '', '', '', '', '1', '0', '2.8');
INSERT INTO `product` VALUES ('1030994', '6922330911433', '1', '桃李 迷你起酥面包 200g', '1000009', 'http://pictures-of-goods.qiniudn.com/1030994.jpg', '4.5', '桃李', '桃李迷你起酥面包工艺独特，商品层次清晰，适合上班、休闲、旅游之方便食用佳品。保证新鲜(保质期短)，mini身材，无限好味道。工艺独特，商品层次清晰，口感酥松，入口即化，香味浓郁。', '2014-12-23 17:09:35', '', '4', '200g', '', '', '', '', '', '1', '0', '5');
INSERT INTO `product` VALUES ('1030995', '6924743915237', '1', '乐事 美国经典原味薯片 165g', '1000002', 'http://pictures-of-goods.qiniudn.com/1030995.jpg', '10.6', '乐事', '乐事薯片的金黄剔透，来自它优秀的美国土豆种苗基因，乐事薯片的扑鼻清香，来自它美国专业生产技术的保鲜处理，乐事薯片的清脆声响，来自它全球统一的品质管理，这样美味的乐事薯片，才能令人难以抗拒！', '2014-12-23 17:09:35', '', '270', '165g', '', '', '', '', '', '1', '0', '11.1');
INSERT INTO `product` VALUES ('1030996', null, '1', '蓝贝超纯啤酒330ml箱24罐 ', '1000014', 'http://pictures-of-goods.qiniudn.com/1030996.jpg', '24', '蓝贝', '蓝带啤酒创始于1844年，已有166年的历史，曾多次获世界博览会金牌奖。该公司引进美国全套生产设备，选用优质原料和蓝带酵母、酒花，由美国酿酒专家指导，按照美国蓝带的传统工艺生产。其品味已完全达到美国篮带啤酒的标准，其产品以色浅、质优、味纯、气足的特点而著称。', '2015-01-11 14:19:35', null, null, null, null, null, null, null, '', '0', '1', '60');
INSERT INTO `product` VALUES ('1030997', null, '1', '蓝贝超纯啤酒330ml', '1000014', 'http://pictures-of-goods.qiniudn.com/1030997.jpg', '1', '蓝贝', '蓝带啤酒创始于1844年，已有167年的历史，曾多次获世界博览会金牌奖。该公司引进美国全套生产设备，选用优质原料和蓝带酵母、酒花，由美国酿酒专家指导，按照美国蓝带的传统工艺生产。其品味已完全达到美国篮带啤酒的标准，其产品以色浅、质优、味纯、气足的特点而著称。', '2015-01-11 14:19:30', null, null, null, null, null, null, null, '', '0', '1', '2.5');
INSERT INTO `product` VALUES ('1030998', null, '1', '九朵玫瑰 花汁饮料200ml（买1送1）', '1000017', 'http://pictures-of-goods.qiniudn.com/1030998.JPG', '6.5', '九朵玫瑰', '年终促销，买1送1，多买多送！\r\n一个专属于东方女性的玫瑰品牌——九朵玫瑰。\r\n“九朵玫瑰”选用优质无公害可食用玫瑰——重瓣红玫瑰，辅以天然花卉玫瑰露，通过现代前沿科技生物发酵工艺精制而成。\r\n产品不含任何添加剂，颜色炫丽如红宝石般迷人，酸甜适口，天然的玫瑰花香沁人心脾，口齿生香，回味持久。', '2015-01-04 10:49:05', null, null, null, null, null, null, null, '', '1', '0', '6.5');
INSERT INTO `product` VALUES ('1030999', null, '1', '蓝带北美淡爽啤酒330ml*6听（买1送1）', '1000014', 'http://pictures-of-goods.qiniudn.com/1030999.jpg', '21', '蓝带', '纯正北美血统，美式淡爽风味！\r\n采用古典的两罐法酿造工艺，低温深度冷藏，发酵周期长达一个月，酒体自然成熟，口感丰满醇爽。\r\n啤酒口味纯正，口感清新，泡沫洁白细腻，挂杯持久，酒气香气宜人。', '2015-01-04 10:54:47', null, null, null, null, null, null, null, '', '1', '0', '21');

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_name` varchar(64) NOT NULL COMMENT '分类名称',
  `category_img` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `level` int(10) DEFAULT '0',
  `version` varchar(255) DEFAULT '0',
  `parent_id` int(11) NOT NULL COMMENT '上级分类ID',
  `descript` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000085 DEFAULT CHARSET=utf8 COMMENT='商品分类信息表\r\n支持无限级分类';

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('10001', '休闲零食', 'http://one-level-category.qiniudn.com/xxls.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10002', '酒水饮料', 'http://one-level-category.qiniudn.com/jsyl.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10003', '牛奶冲饮', 'http://one-level-category.qiniudn.com/nmcy.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10004', '粮油副食', 'http://one-level-category.qiniudn.com/lyfs.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10006', '家庭清洁', 'http://one-level-category.qiniudn.com/jtqj.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10007', '家居用品', 'http://one-level-category.qiniudn.com/jjyp.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10008', '母婴用品', 'http://one-level-category.qiniudn.com/myyp.png', '0', '1', '-1', '');
INSERT INTO `product_category` VALUES ('10009', '营养保健', 'http://one-level-category.qiniudn.com/yybj.png', '0', '1', '-1', null);
INSERT INTO `product_category` VALUES ('1000001', '饼干', 'http://two-level-category.qiniudn.com/1000001.jpg', '0', '1', '10001', '烤馍等');
INSERT INTO `product_category` VALUES ('1000002', '薯片', 'http://two-level-category.qiniudn.com/1000002.jpg', '0', '1', '10001', '薯片等');
INSERT INTO `product_category` VALUES ('1000003', '坚果炒货', 'http://two-level-category.qiniudn.com/1000003.jpg', '0', '1', '10001', '瓜子、花生等');
INSERT INTO `product_category` VALUES ('1000004', '巧克力', 'http://two-level-category.qiniudn.com/1000004.jpg', '0', '1', '10001', '威化等');
INSERT INTO `product_category` VALUES ('1000005', '糖果', 'http://two-level-category.qiniudn.com/1000005.jpg', '0', '1', '10001', '奶酪、口香糖等');
INSERT INTO `product_category` VALUES ('1000008', '豆干', 'http://two-level-category.qiniudn.com/1000008.jpg', '0', '1', '10001', '豆干等');
INSERT INTO `product_category` VALUES ('1000009', '蛋糕糕点', 'http://two-level-category.qiniudn.com/1000009.jpg', '0', '1', '10001', '面包、点心等');
INSERT INTO `product_category` VALUES ('1000010', '葡萄酒', 'http://two-level-category.qiniudn.com/1000010.jpg', '0', '1', '10002', '干红等');
INSERT INTO `product_category` VALUES ('1000011', '黄酒', 'http://two-level-category.qiniudn.com/1000011.jpg', '0', '1', '10002', '花雕酒等');
INSERT INTO `product_category` VALUES ('1000012', '洋酒', 'http://two-level-category.qiniudn.com/1000012.jpg', '0', '1', '10002', '鸡尾酒等');
INSERT INTO `product_category` VALUES ('1000013', '白酒', 'http://two-level-category.qiniudn.com/1000013.jpg', '0', '1', '10002', '白酒等');
INSERT INTO `product_category` VALUES ('1000014', '啤酒', 'http://two-level-category.qiniudn.com/1000014.jpg', '0', '1', '10002', '听装、瓶装啤酒');
INSERT INTO `product_category` VALUES ('1000015', '水', 'http://two-level-category.qiniudn.com/1000015.jpg', '0', '1', '10002', '矿泉水等');
INSERT INTO `product_category` VALUES ('1000016', '果蔬饮料', 'http://two-level-category.qiniudn.com/1000016.jpg', '0', '1', '10002', '果汁等');
INSERT INTO `product_category` VALUES ('1000017', '碳酸饮料', 'http://two-level-category.qiniudn.com/1000017.jpg', '0', '1', '10002', '汽水、麦芽饮料等');
INSERT INTO `product_category` VALUES ('1000018', '茶饮料', 'http://two-level-category.qiniudn.com/1000018.jpg', '0', '1', '10002', '茶类饮料等');
INSERT INTO `product_category` VALUES ('1000019', '咖啡饮料', 'http://two-level-category.qiniudn.com/1000019.jpg', '0', '1', '10002', '咖啡饮料等');
INSERT INTO `product_category` VALUES ('1000020', '常温奶', 'http://two-level-category.qiniudn.com/1000020.jpg', '0', '1', '10003', '各种口味牛奶等');
INSERT INTO `product_category` VALUES ('1000021', '乳饮料', 'http://two-level-category.qiniudn.com/1000021.jpg', '0', '1', '10003', '活性乳、核桃露等');
INSERT INTO `product_category` VALUES ('1000022', '酸奶', 'http://two-level-category.qiniudn.com/1000022.jpg', '0', '1', '10003', '优酪乳、布丁等');
INSERT INTO `product_category` VALUES ('1000023', '豆奶', 'http://two-level-category.qiniudn.com/1000023.jpg', '0', '1', '10003', '豆奶等');
INSERT INTO `product_category` VALUES ('1000024', '奶茶', 'http://two-level-category.qiniudn.com/1000024.jpg', '0', '1', '10003', '冲饮、瓶装奶茶饮料等');
INSERT INTO `product_category` VALUES ('1000025', '蜂蜜', 'http://two-level-category.qiniudn.com/1000025.jpg', '0', '1', '10003', '蜂蜜等');
INSERT INTO `product_category` VALUES ('1000026', '茶包', 'http://two-level-category.qiniudn.com/1000026.jpg', '0', '1', '10003', '茶叶等');
INSERT INTO `product_category` VALUES ('1000027', '食用油', 'http://two-level-category.qiniudn.com/1000027.jpg', '0', '1', '10004', '调和油、花生油等');
INSERT INTO `product_category` VALUES ('1000028', '米', 'http://two-level-category.qiniudn.com/1000028.jpg', '0', '1', '10004', '大米等');
INSERT INTO `product_category` VALUES ('1000029', '面粉', 'http://two-level-category.qiniudn.com/1000029.jpg', '0', '1', '10004', '面粉、酵母等');
INSERT INTO `product_category` VALUES ('1000030', '厨房调料', 'http://two-level-category.qiniudn.com/1000030.jpg', '0', '1', '10004', '油盐、火锅料等');
INSERT INTO `product_category` VALUES ('1000031', '下饭菜', 'http://two-level-category.qiniudn.com/1000031.jpg', '0', '1', '10004', '榨菜、罐头等');
INSERT INTO `product_category` VALUES ('1000032', '菌菇干货', 'http://two-level-category.qiniudn.com/1000032.jpg', '0', '1', '10004', '紫菜等');
INSERT INTO `product_category` VALUES ('1000033', '面条粉丝', 'http://two-level-category.qiniudn.com/1000033.jpg', '0', '1', '10004', '挂面、方便面等');
INSERT INTO `product_category` VALUES ('1000045', '卫生纸', 'http://two-level-category.qiniudn.com/1000045.jpg', '0', '1', '10006', '卷纸等');
INSERT INTO `product_category` VALUES ('1000046', '抽纸', 'http://two-level-category.qiniudn.com/1000046.jpg', '0', '1', '10006', '抽纸等');
INSERT INTO `product_category` VALUES ('1000047', '手帕纸', 'http://two-level-category.qiniudn.com/1000047.jpg', '0', '1', '10006', '纸巾包、手帕纸等');
INSERT INTO `product_category` VALUES ('1000048', '湿巾', 'http://two-level-category.qiniudn.com/1000048.jpg', '0', '1', '10006', '湿巾等');
INSERT INTO `product_category` VALUES ('1000049', '衣物清洁', 'http://two-level-category.qiniudn.com/1000049.jpg', '0', '1', '10006', '洗衣粉、洗衣皂等');
INSERT INTO `product_category` VALUES ('1000050', '衣物护理', 'http://two-level-category.qiniudn.com/1000050.jpg', '0', '1', '10006', '护理剂等');
INSERT INTO `product_category` VALUES ('1000058', '餐具水具', 'http://two-level-category.qiniudn.com/1000058.jpg', '0', '1', '10007', '碗筷、杯子等');
INSERT INTO `product_category` VALUES ('1000059', '一次用品', 'http://two-level-category.qiniudn.com/1000059.jpg', '0', '1', '10007', '牙签、棉球等');
INSERT INTO `product_category` VALUES ('1000060', '卫浴用品', 'http://two-level-category.qiniudn.com/1000060.jpg', '0', '1', '10007', '牙具、香皂、美发用品等');
INSERT INTO `product_category` VALUES ('1000061', '生活电器', 'http://two-level-category.qiniudn.com/1000061.jpg', '0', '1', '10007', '电池、插座等');
INSERT INTO `product_category` VALUES ('1000062', '洗护用品', 'http://two-level-category.qiniudn.com/1000062.jpg', '0', '1', '10008', '润肤露等');
INSERT INTO `product_category` VALUES ('1000065', '湿巾', 'http://two-level-category.qiniudn.com/1000065.jpg', '0', '1', '10008', '婴儿湿巾等');
INSERT INTO `product_category` VALUES ('1000072', '膨化食品', 'http://two-level-category.qiniudn.com/1000072.jpg', '0', '1', '10001', '虾条、锅巴等');
INSERT INTO `product_category` VALUES ('1000073', '速食', 'http://two-level-category.qiniudn.com/1000073.jpg', '0', '1', '10004', '速冻食品、粥、汤等');
INSERT INTO `product_category` VALUES ('1000074', '居家日用', 'http://two-level-category.qiniudn.com/1000074.jpg', '0', '1', '10007', '');
INSERT INTO `product_category` VALUES ('1000075', '运动饮料', 'http://two-level-category.qiniudn.com/1000075.jpg', '0', '1', '10002', '维生素饮料等');
INSERT INTO `product_category` VALUES ('1000076', '蜜饯果干', 'http://two-level-category.qiniudn.com/1000076.jpg', '0', '1', '10001', '梅子、山楂片等');
INSERT INTO `product_category` VALUES ('1000077', '咖啡', 'http://two-level-category.qiniudn.com/1000077.jpg', '0', '1', '10003', '冲调咖啡等');
INSERT INTO `product_category` VALUES ('1000078', '冰淇淋', 'http://two-level-category.qiniudn.com/1000078.jpg', '0', '1', '10001', '冰淇淋、雪糕等');
INSERT INTO `product_category` VALUES ('1000080', '芝麻糊', 'http://two-level-category.qiniudn.com/1000080.jpg', '0', '1', '10003', '黑芝麻糊等');
INSERT INTO `product_category` VALUES ('1000081', '水产加工', 'http://two-level-category.qiniudn.com/1000081.jpg', '0', '1', '10001', '海苔、鱿鱼丝等');
INSERT INTO `product_category` VALUES ('1000082', '计生用品', 'http://two-level-category.qiniudn.com/1000082.jpg', '0', '1', '10007', '避孕套等');
INSERT INTO `product_category` VALUES ('1000083', '女性护理', 'http://two-level-category.qiniudn.com/1000083.jpg', '0', '1', '10007', '卫生巾、护垫等');
INSERT INTO `product_category` VALUES ('1000084', '传统滋补', 'http://two-level-category.qiniudn.com/1000084.jpg', '0', '1', '10009', '龟苓膏等');

-- ----------------------------
-- Table structure for `product_category_copy`
-- ----------------------------
DROP TABLE IF EXISTS `product_category_copy`;
CREATE TABLE `product_category_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_name` varchar(64) NOT NULL COMMENT '分类名称',
  `category_img` varchar(255) DEFAULT NULL COMMENT '分类图片',
  `level` tinyint(10) DEFAULT '0',
  `version` varchar(255) DEFAULT '0',
  `parent_id` int(11) NOT NULL COMMENT '上级分类ID',
  `descript` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name` (`category_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='商品分类信息表\r\n支持无限级分类';

-- ----------------------------
-- Records of product_category_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `product_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `product_favorite`;
CREATE TABLE `product_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `product_id` bigint(255) DEFAULT NULL COMMENT '商品ID',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `product_shortage`
-- ----------------------------
DROP TABLE IF EXISTS `product_shortage`;
CREATE TABLE `product_shortage` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `product_id` bigint(64) DEFAULT NULL COMMENT '商品ID',
  `shop_id` bigint(20) DEFAULT NULL COMMENT '商店ID',
  `create_time` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `operate_admin` bigint(20) DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='缺货商品信息表\r\n存储缺货的商品信息\r\n';

-- ----------------------------
-- Records of product_shortage
-- ----------------------------

-- ----------------------------
-- Table structure for `productcopy`
-- ----------------------------
DROP TABLE IF EXISTS `productcopy`;
CREATE TABLE `productcopy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `bar_code` varchar(50) DEFAULT NULL,
  `product_version` int(11) DEFAULT '0' COMMENT '商品版本号',
  `product_name` varchar(64) DEFAULT NULL COMMENT '商品名称',
  `product_category` int(11) DEFAULT '0' COMMENT '商品分类',
  `product_img` varchar(200) NOT NULL,
  `product_price` varchar(20) DEFAULT NULL COMMENT '商品价格',
  `product_brand` varchar(255) DEFAULT NULL COMMENT '商品品牌',
  `ordernum` int(11) DEFAULT '0',
  `tradenum` int(11) DEFAULT '0',
  `version` int(10) DEFAULT '0',
  `product_description` varchar(500) DEFAULT NULL COMMENT '商品详情',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pvalume` varchar(50) DEFAULT NULL COMMENT '商品体积',
  `pbzq` varchar(50) DEFAULT NULL COMMENT '保质期',
  `pweight` varchar(50) DEFAULT NULL COMMENT '重量',
  `dosing` varchar(45) DEFAULT NULL COMMENT '配料',
  `protechnics` varchar(45) DEFAULT NULL COMMENT '生产工艺',
  `qualitylevel` varchar(45) DEFAULT NULL COMMENT '质量等级',
  `storerange` varchar(45) DEFAULT NULL COMMENT '存储条件',
  `feature` varchar(1000) NOT NULL,
  `ishas` int(10) NOT NULL DEFAULT '1' COMMENT '是否有货（1有货，0没货）',
  `ispromotion` int(1) NOT NULL DEFAULT '0' COMMENT '是否促销产品(0=不是促销 1=促销)',
  `promotionprice` varchar(10) DEFAULT NULL COMMENT '促销价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000840 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of productcopy
-- ----------------------------

-- ----------------------------
-- Table structure for `productcount`
-- ----------------------------
DROP TABLE IF EXISTS `productcount`;
CREATE TABLE `productcount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `productid` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `shopsid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='商品购买统计';

-- ----------------------------
-- Records of productcount
-- ----------------------------
INSERT INTO `productcount` VALUES ('1', '1000509', '2', null);
INSERT INTO `productcount` VALUES ('2', '1000594', '1', null);
INSERT INTO `productcount` VALUES ('3', '1000508', '2', null);
INSERT INTO `productcount` VALUES ('4', '1000687', '1', null);
INSERT INTO `productcount` VALUES ('5', '1000688', '1', null);
INSERT INTO `productcount` VALUES ('6', '1000729', '1', null);
INSERT INTO `productcount` VALUES ('7', '1000595', '3', null);
INSERT INTO `productcount` VALUES ('8', '1000596', '2', null);
INSERT INTO `productcount` VALUES ('9', '1000638', '1', null);
INSERT INTO `productcount` VALUES ('10', '1000505', '5', null);
INSERT INTO `productcount` VALUES ('11', '1000504', '5', null);
INSERT INTO `productcount` VALUES ('12', '1000551', '1', null);
INSERT INTO `productcount` VALUES ('13', '1000506', '6', null);
INSERT INTO `productcount` VALUES ('14', '1000510', '1', null);
INSERT INTO `productcount` VALUES ('15', '1000618', '4', null);
INSERT INTO `productcount` VALUES ('16', '1000619', '1', null);
INSERT INTO `productcount` VALUES ('17', '1000621', '1', null);
INSERT INTO `productcount` VALUES ('18', '1000620', '1', null);
INSERT INTO `productcount` VALUES ('19', '1000622', '1', null);
INSERT INTO `productcount` VALUES ('20', '1000548', '1', null);
INSERT INTO `productcount` VALUES ('21', '1000625', '1', null);
INSERT INTO `productcount` VALUES ('22', '1000593', '2', null);
INSERT INTO `productcount` VALUES ('23', '1000583', '1', null);
INSERT INTO `productcount` VALUES ('24', '1000581', '1', null);
INSERT INTO `productcount` VALUES ('25', '1000679', '1', null);
INSERT INTO `productcount` VALUES ('26', '1000721', '1', null);
INSERT INTO `productcount` VALUES ('27', '1000582', '2', null);
INSERT INTO `productcount` VALUES ('28', '1000592', '2', null);
INSERT INTO `productcount` VALUES ('29', '1000627', '4', null);
INSERT INTO `productcount` VALUES ('30', '1000793', '2', null);
INSERT INTO `productcount` VALUES ('31', '1000584', '3', null);
INSERT INTO `productcount` VALUES ('32', '1000590', '1', null);
INSERT INTO `productcount` VALUES ('33', '1000637', '5', null);
INSERT INTO `productcount` VALUES ('34', '1030998', '12', null);
INSERT INTO `productcount` VALUES ('35', '1000677', '1', null);
INSERT INTO `productcount` VALUES ('36', '1030125', '6', null);
INSERT INTO `productcount` VALUES ('37', '1030931', '1', null);
INSERT INTO `productcount` VALUES ('38', '1030320', '3', null);
INSERT INTO `productcount` VALUES ('39', '1030996', '7', null);
INSERT INTO `productcount` VALUES ('40', '1030340', '12', null);
INSERT INTO `productcount` VALUES ('41', '1030675', '2', null);
INSERT INTO `productcount` VALUES ('42', '1030375', '1', null);
INSERT INTO `productcount` VALUES ('43', '1030574', '1', null);
INSERT INTO `productcount` VALUES ('44', '1000613', '2', null);
INSERT INTO `productcount` VALUES ('45', '1030145', '1', null);
INSERT INTO `productcount` VALUES ('46', '1030393', '2', null);
INSERT INTO `productcount` VALUES ('47', '1030030', '5', null);
INSERT INTO `productcount` VALUES ('48', '1030618', '1', null);
INSERT INTO `productcount` VALUES ('49', '1030778', '1', null);
INSERT INTO `productcount` VALUES ('50', '1030939', '3', null);
INSERT INTO `productcount` VALUES ('51', '1030245', '2', null);
INSERT INTO `productcount` VALUES ('52', '1030769', '2', null);
INSERT INTO `productcount` VALUES ('53', '1030820', '3', null);
INSERT INTO `productcount` VALUES ('54', '1030845', '2', null);
INSERT INTO `productcount` VALUES ('55', '1030516', '1', null);
INSERT INTO `productcount` VALUES ('56', '1030738', '2', null);
INSERT INTO `productcount` VALUES ('57', '1030997', '9', null);
INSERT INTO `productcount` VALUES ('58', '1030035', '1', null);
INSERT INTO `productcount` VALUES ('59', '1000550', '1', null);
INSERT INTO `productcount` VALUES ('60', '1030590', '1', null);
INSERT INTO `productcount` VALUES ('61', '1000805', '1', null);
INSERT INTO `productcount` VALUES ('62', '1000561', '1', null);
INSERT INTO `productcount` VALUES ('63', '1030113', '1', null);
INSERT INTO `productcount` VALUES ('64', '1030312', '1', null);
INSERT INTO `productcount` VALUES ('65', '1030397', '2', null);
INSERT INTO `productcount` VALUES ('66', '1030781', '1', null);
INSERT INTO `productcount` VALUES ('67', '1030789', '1', null);
INSERT INTO `productcount` VALUES ('68', '1030768', '1', null);
INSERT INTO `productcount` VALUES ('69', '1030825', '1', null);
INSERT INTO `productcount` VALUES ('70', '1030102', '1', null);
INSERT INTO `productcount` VALUES ('71', '1030319', '1', null);
INSERT INTO `productcount` VALUES ('72', '1000516', '1', null);
INSERT INTO `productcount` VALUES ('73', '1000589', '1', null);
INSERT INTO `productcount` VALUES ('74', '1030544', '7', null);
INSERT INTO `productcount` VALUES ('75', '1000612', '3', null);
INSERT INTO `productcount` VALUES ('76', '1030627', '2', null);
INSERT INTO `productcount` VALUES ('77', '1030150', '1', null);
INSERT INTO `productcount` VALUES ('78', '1030142', '1', null);
INSERT INTO `productcount` VALUES ('79', '1030101', '1', null);
INSERT INTO `productcount` VALUES ('80', '1030760', '1', null);
INSERT INTO `productcount` VALUES ('81', '1030926', '1', null);
INSERT INTO `productcount` VALUES ('82', '1030960', '1', null);
INSERT INTO `productcount` VALUES ('83', '1030315', '25', null);
INSERT INTO `productcount` VALUES ('84', '1030895', '1', null);
INSERT INTO `productcount` VALUES ('85', '1030222', '1', null);
INSERT INTO `productcount` VALUES ('86', '1030915', '1', null);
INSERT INTO `productcount` VALUES ('87', '1030106', '1', null);
INSERT INTO `productcount` VALUES ('88', '1030656', '1', null);
INSERT INTO `productcount` VALUES ('89', '1000601', '1', null);
INSERT INTO `productcount` VALUES ('90', '1000515', '2', null);
INSERT INTO `productcount` VALUES ('91', '1030776', '1', null);
INSERT INTO `productcount` VALUES ('92', '1000747', '1', null);
INSERT INTO `productcount` VALUES ('93', '1030424', '1', null);
INSERT INTO `productcount` VALUES ('94', '1000748', '2', null);
INSERT INTO `productcount` VALUES ('95', '1030196', '1', null);
INSERT INTO `productcount` VALUES ('96', '1030999', '1', null);
INSERT INTO `productcount` VALUES ('97', '1030559', '24', null);
INSERT INTO `productcount` VALUES ('98', '1000676', '1', null);
INSERT INTO `productcount` VALUES ('99', '1030464', '1', null);
INSERT INTO `productcount` VALUES ('100', '1030044', '1', null);
INSERT INTO `productcount` VALUES ('101', '1030537', '1', null);
INSERT INTO `productcount` VALUES ('102', '1030647', '1', null);
INSERT INTO `productcount` VALUES ('103', '1030919', '1', null);
INSERT INTO `productcount` VALUES ('104', '1030422', '1', null);
INSERT INTO `productcount` VALUES ('105', '1030573', '1', null);
INSERT INTO `productcount` VALUES ('106', '1030624', '4', null);
INSERT INTO `productcount` VALUES ('107', '1030156', '1', null);
INSERT INTO `productcount` VALUES ('108', '1030567', '1', null);
INSERT INTO `productcount` VALUES ('109', '1030223', '1', null);
INSERT INTO `productcount` VALUES ('110', '1000750', '1', null);
INSERT INTO `productcount` VALUES ('111', '1000796', '1', null);
INSERT INTO `productcount` VALUES ('112', '1000736', '1', null);
INSERT INTO `productcount` VALUES ('113', '1000648', '1', null);
INSERT INTO `productcount` VALUES ('114', '1000705', '6', null);
INSERT INTO `productcount` VALUES ('115', '1030949', '2', null);
INSERT INTO `productcount` VALUES ('116', '1000514', '1', null);
INSERT INTO `productcount` VALUES ('117', '1030817', '1', null);
INSERT INTO `productcount` VALUES ('118', '1000813', '2', null);
INSERT INTO `productcount` VALUES ('119', '1030763', '2', null);
INSERT INTO `productcount` VALUES ('120', '1030342', '1', null);
INSERT INTO `productcount` VALUES ('121', '1030013', '1', null);
INSERT INTO `productcount` VALUES ('122', '1000684', '1', null);
INSERT INTO `productcount` VALUES ('123', '1030463', '1', null);

-- ----------------------------
-- Table structure for `productrecord`
-- ----------------------------
DROP TABLE IF EXISTS `productrecord`;
CREATE TABLE `productrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主码',
  `userid` int(10) unsigned NOT NULL COMMENT '用户的id',
  `productid` int(10) unsigned NOT NULL COMMENT '商品id',
  `shopsid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='记录用户购买的商品记录';

-- ----------------------------
-- Records of productrecord
-- ----------------------------
INSERT INTO `productrecord` VALUES ('1', '70', '1000721', '0');
INSERT INTO `productrecord` VALUES ('2', '70', '1000582', '0');
INSERT INTO `productrecord` VALUES ('3', '70', '1000592', '0');
INSERT INTO `productrecord` VALUES ('4', '70', '1000627', '0');
INSERT INTO `productrecord` VALUES ('5', '69', '1000505', '0');
INSERT INTO `productrecord` VALUES ('6', '69', '1000506', '0');
INSERT INTO `productrecord` VALUES ('7', '92', '1000793', '0');
INSERT INTO `productrecord` VALUES ('8', '120', '1000584', '0');
INSERT INTO `productrecord` VALUES ('9', '120', '1000590', '0');
INSERT INTO `productrecord` VALUES ('10', '120', '1000618', '0');
INSERT INTO `productrecord` VALUES ('11', '138', '1000637', '0');
INSERT INTO `productrecord` VALUES ('12', '303', '1030998', '0');
INSERT INTO `productrecord` VALUES ('13', '306', '1000677', '0');
INSERT INTO `productrecord` VALUES ('14', '306', '1030125', '0');
INSERT INTO `productrecord` VALUES ('15', '306', '1030931', '0');
INSERT INTO `productrecord` VALUES ('16', '306', '1030320', '0');
INSERT INTO `productrecord` VALUES ('17', '228', '1030996', '0');
INSERT INTO `productrecord` VALUES ('18', '281', '1030340', '0');
INSERT INTO `productrecord` VALUES ('19', '138', '1030675', '0');
INSERT INTO `productrecord` VALUES ('20', '85', '1030998', '0');
INSERT INTO `productrecord` VALUES ('21', '315', '1030998', '0');
INSERT INTO `productrecord` VALUES ('22', '316', '1030998', '0');
INSERT INTO `productrecord` VALUES ('23', '320', '1030998', '0');
INSERT INTO `productrecord` VALUES ('24', '325', '1030996', '0');
INSERT INTO `productrecord` VALUES ('25', '324', '1030340', '0');
INSERT INTO `productrecord` VALUES ('26', '324', '1030375', '0');
INSERT INTO `productrecord` VALUES ('27', '120', '1030574', '0');
INSERT INTO `productrecord` VALUES ('28', '120', '1000613', '0');
INSERT INTO `productrecord` VALUES ('29', '120', '1030145', '0');
INSERT INTO `productrecord` VALUES ('30', '120', '1030393', '0');
INSERT INTO `productrecord` VALUES ('31', '120', '1030030', '0');
INSERT INTO `productrecord` VALUES ('32', '120', '1000618', '0');
INSERT INTO `productrecord` VALUES ('33', '120', '1030618', '0');
INSERT INTO `productrecord` VALUES ('34', '120', '1030778', '0');
INSERT INTO `productrecord` VALUES ('35', '331', '1030939', '0');
INSERT INTO `productrecord` VALUES ('36', '331', '1030245', '0');
INSERT INTO `productrecord` VALUES ('37', '331', '1030769', '0');
INSERT INTO `productrecord` VALUES ('38', '331', '1030820', '0');
INSERT INTO `productrecord` VALUES ('39', '331', '1030845', '0');
INSERT INTO `productrecord` VALUES ('40', '138', '1030516', '0');
INSERT INTO `productrecord` VALUES ('41', '138', '1030738', '0');
INSERT INTO `productrecord` VALUES ('42', '138', '1030997', '0');
INSERT INTO `productrecord` VALUES ('43', '338', '1030996', '0');
INSERT INTO `productrecord` VALUES ('44', '347', '1030035', '0');
INSERT INTO `productrecord` VALUES ('45', '347', '1000550', '0');
INSERT INTO `productrecord` VALUES ('46', '347', '1030590', '0');
INSERT INTO `productrecord` VALUES ('47', '347', '1000805', '0');
INSERT INTO `productrecord` VALUES ('48', '347', '1000561', '0');
INSERT INTO `productrecord` VALUES ('49', '347', '1030113', '0');
INSERT INTO `productrecord` VALUES ('50', '347', '1030312', '0');
INSERT INTO `productrecord` VALUES ('51', '347', '1030397', '0');
INSERT INTO `productrecord` VALUES ('52', '347', '1000593', '0');
INSERT INTO `productrecord` VALUES ('53', '347', '1030781', '0');
INSERT INTO `productrecord` VALUES ('54', '347', '1030789', '0');
INSERT INTO `productrecord` VALUES ('55', '370', '1030768', '0');
INSERT INTO `productrecord` VALUES ('56', '370', '1030825', '0');
INSERT INTO `productrecord` VALUES ('57', '370', '1030102', '0');
INSERT INTO `productrecord` VALUES ('58', '371', '1030319', '0');
INSERT INTO `productrecord` VALUES ('59', '371', '1000516', '0');
INSERT INTO `productrecord` VALUES ('60', '371', '1030997', '0');
INSERT INTO `productrecord` VALUES ('61', '371', '1000589', '0');
INSERT INTO `productrecord` VALUES ('62', '371', '1030544', '0');
INSERT INTO `productrecord` VALUES ('63', '382', '1030996', '0');
INSERT INTO `productrecord` VALUES ('64', '372', '1030996', '0');
INSERT INTO `productrecord` VALUES ('65', '399', '1030996', '0');
INSERT INTO `productrecord` VALUES ('66', '139', '1000612', '0');
INSERT INTO `productrecord` VALUES ('67', '416', '1030627', '0');
INSERT INTO `productrecord` VALUES ('68', '120', '1030150', '0');
INSERT INTO `productrecord` VALUES ('69', '120', '1030142', '0');
INSERT INTO `productrecord` VALUES ('70', '120', '1030101', '0');
INSERT INTO `productrecord` VALUES ('71', '120', '1030760', '0');
INSERT INTO `productrecord` VALUES ('72', '120', '1030926', '0');
INSERT INTO `productrecord` VALUES ('73', '120', '1030960', '0');
INSERT INTO `productrecord` VALUES ('74', '120', '1030315', '0');
INSERT INTO `productrecord` VALUES ('75', '120', '1000613', '0');
INSERT INTO `productrecord` VALUES ('76', '120', '1030393', '0');
INSERT INTO `productrecord` VALUES ('77', '120', '1030895', '0');
INSERT INTO `productrecord` VALUES ('78', '120', '1030125', '0');
INSERT INTO `productrecord` VALUES ('79', '120', '1030222', '0');
INSERT INTO `productrecord` VALUES ('80', '120', '1030915', '0');
INSERT INTO `productrecord` VALUES ('81', '120', '1030106', '0');
INSERT INTO `productrecord` VALUES ('82', '120', '1030656', '0');
INSERT INTO `productrecord` VALUES ('83', '120', '1030030', '0');
INSERT INTO `productrecord` VALUES ('84', '426', '1000601', '0');
INSERT INTO `productrecord` VALUES ('85', '426', '1030340', '0');
INSERT INTO `productrecord` VALUES ('86', '426', '1000515', '0');
INSERT INTO `productrecord` VALUES ('87', '426', '1030776', '0');
INSERT INTO `productrecord` VALUES ('88', '426', '1030544', '0');
INSERT INTO `productrecord` VALUES ('89', '303', '1030998', '0');
INSERT INTO `productrecord` VALUES ('90', '303', '1000747', '0');
INSERT INTO `productrecord` VALUES ('91', '303', '1030424', '0');
INSERT INTO `productrecord` VALUES ('92', '303', '1000748', '0');
INSERT INTO `productrecord` VALUES ('93', '303', '1030196', '0');
INSERT INTO `productrecord` VALUES ('94', '382', '1030999', '0');
INSERT INTO `productrecord` VALUES ('95', '382', '1030559', '0');
INSERT INTO `productrecord` VALUES ('96', '282', '1030315', '0');
INSERT INTO `productrecord` VALUES ('97', '282', '1000676', '0');
INSERT INTO `productrecord` VALUES ('98', '207', '1030464', '0');
INSERT INTO `productrecord` VALUES ('99', '207', '1000637', '0');
INSERT INTO `productrecord` VALUES ('100', '207', '1030820', '0');
INSERT INTO `productrecord` VALUES ('101', '207', '1030044', '0');
INSERT INTO `productrecord` VALUES ('102', '207', '1030537', '0');
INSERT INTO `productrecord` VALUES ('103', '282', '1030647', '0');
INSERT INTO `productrecord` VALUES ('104', '282', '1030919', '0');
INSERT INTO `productrecord` VALUES ('105', '282', '1030422', '0');
INSERT INTO `productrecord` VALUES ('106', '75', '1030573', '0');
INSERT INTO `productrecord` VALUES ('107', '75', '1000515', '0');
INSERT INTO `productrecord` VALUES ('108', '75', '1030624', '0');
INSERT INTO `productrecord` VALUES ('109', '75', '1030156', '0');
INSERT INTO `productrecord` VALUES ('110', '75', '1030567', '0');
INSERT INTO `productrecord` VALUES ('111', '75', '1000748', '0');
INSERT INTO `productrecord` VALUES ('112', '75', '1030223', '0');
INSERT INTO `productrecord` VALUES ('113', '428', '1000750', '0');
INSERT INTO `productrecord` VALUES ('114', '428', '1000796', '0');
INSERT INTO `productrecord` VALUES ('115', '428', '1000736', '0');
INSERT INTO `productrecord` VALUES ('116', '428', '1000648', '0');
INSERT INTO `productrecord` VALUES ('117', '75', '1000705', '0');
INSERT INTO `productrecord` VALUES ('118', '75', '1030949', '0');
INSERT INTO `productrecord` VALUES ('119', '75', '1000514', '0');
INSERT INTO `productrecord` VALUES ('120', '75', '1000595', '0');
INSERT INTO `productrecord` VALUES ('121', '75', '1030817', '0');
INSERT INTO `productrecord` VALUES ('122', '75', '1000813', '0');
INSERT INTO `productrecord` VALUES ('123', '75', '1030763', '0');
INSERT INTO `productrecord` VALUES ('124', '75', '1030342', '0');
INSERT INTO `productrecord` VALUES ('125', '75', '1030013', '0');
INSERT INTO `productrecord` VALUES ('126', '75', '1000705', '0');
INSERT INTO `productrecord` VALUES ('127', '75', '1000684', '0');
INSERT INTO `productrecord` VALUES ('128', '75', '1030949', '0');
INSERT INTO `productrecord` VALUES ('129', '75', '1030624', '0');
INSERT INTO `productrecord` VALUES ('130', '75', '1030463', '0');

-- ----------------------------
-- Table structure for `qtbill`
-- ----------------------------
DROP TABLE IF EXISTS `qtbill`;
CREATE TABLE `qtbill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `qturl` varchar(10000) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `voicelength` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qtbill
-- ----------------------------
INSERT INTO `qtbill` VALUES ('114', '1421989061548001', '272_1421988931209.amr', '', '1');
INSERT INTO `qtbill` VALUES ('115', '1421989068854002', '', '退伍', '0');

-- ----------------------------
-- Table structure for `qtbill_history`
-- ----------------------------
DROP TABLE IF EXISTS `qtbill_history`;
CREATE TABLE `qtbill_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) NOT NULL,
  `qturl` varchar(1000) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `voicelength` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qtbill_history
-- ----------------------------

-- ----------------------------
-- Table structure for `rotationimage`
-- ----------------------------
DROP TABLE IF EXISTS `rotationimage`;
CREATE TABLE `rotationimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) NOT NULL,
  `oimgurl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rotationimage
-- ----------------------------
INSERT INTO `rotationimage` VALUES ('19', '嘿嘿', 'http://the-advertisement-picture.qiniudn.com/main2.png', '0');

-- ----------------------------
-- Table structure for `scan_barcode_history`
-- ----------------------------
DROP TABLE IF EXISTS `scan_barcode_history`;
CREATE TABLE `scan_barcode_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) DEFAULT NULL COMMENT '客户ID',
  `barcode` bigint(255) DEFAULT NULL COMMENT '条形码',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '扫码时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scan_barcode_history
-- ----------------------------
INSERT INTO `scan_barcode_history` VALUES ('2', '1', null, '2014-06-18 16:22:01');
INSERT INTO `scan_barcode_history` VALUES ('3', '1', null, '2014-06-20 11:47:35');

-- ----------------------------
-- Table structure for `searchkeys`
-- ----------------------------
DROP TABLE IF EXISTS `searchkeys`;
CREATE TABLE `searchkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of searchkeys
-- ----------------------------
INSERT INTO `searchkeys` VALUES ('97', '盐', '1', '57');
INSERT INTO `searchkeys` VALUES ('98', '可乐', '2', '57');
INSERT INTO `searchkeys` VALUES ('99', '面条', '1', '57');
INSERT INTO `searchkeys` VALUES ('100', '花生', '1', '57');
INSERT INTO `searchkeys` VALUES ('101', '牙膏', '1', '59');
INSERT INTO `searchkeys` VALUES ('102', '可乐', '1', '59');
INSERT INTO `searchkeys` VALUES ('103', '二锅头', '2', '59');
INSERT INTO `searchkeys` VALUES ('104', '美年达', '2', '59');
INSERT INTO `searchkeys` VALUES ('105', '啤酒', '2', '59');
INSERT INTO `searchkeys` VALUES ('106', '纸', '2', '59');
INSERT INTO `searchkeys` VALUES ('107', '八宝粥', '2', '64');
INSERT INTO `searchkeys` VALUES ('108', '绿茶', '1', '61');
INSERT INTO `searchkeys` VALUES ('109', '冰红茶', '1', '64');
INSERT INTO `searchkeys` VALUES ('110', '快乐', '1', '64');
INSERT INTO `searchkeys` VALUES ('111', '八宝粥', '1', '58');
INSERT INTO `searchkeys` VALUES ('112', '花生油', '1', '58');
INSERT INTO `searchkeys` VALUES ('113', '方便面', '1', '59');
INSERT INTO `searchkeys` VALUES ('114', '盐', '1', '66');
INSERT INTO `searchkeys` VALUES ('115', 'ç', '1', '66');
INSERT INTO `searchkeys` VALUES ('116', '八宝粥', '1', '66');
INSERT INTO `searchkeys` VALUES ('117', '洗涤剂', '1', '67');
INSERT INTO `searchkeys` VALUES ('118', '二锅头', '2', '68');
INSERT INTO `searchkeys` VALUES ('119', '花生油', '1', '68');
INSERT INTO `searchkeys` VALUES ('120', '啤酒', '7', '68');
INSERT INTO `searchkeys` VALUES ('121', '酱油', '1', '68');
INSERT INTO `searchkeys` VALUES ('122', '八宝粥', '1', '68');
INSERT INTO `searchkeys` VALUES ('123', '奶茶', '1', '68');
INSERT INTO `searchkeys` VALUES ('124', '盐', '1', '68');
INSERT INTO `searchkeys` VALUES ('125', '同享', '1', '68');
INSERT INTO `searchkeys` VALUES ('126', '友臣', '1', '68');
INSERT INTO `searchkeys` VALUES ('127', '盼盼', '2', '68');
INSERT INTO `searchkeys` VALUES ('128', '达利园', '1', '68');
INSERT INTO `searchkeys` VALUES ('129', '奶香味', '1', '68');
INSERT INTO `searchkeys` VALUES ('130', '法式', '1', '68');
INSERT INTO `searchkeys` VALUES ('131', '原味', '1', '68');
INSERT INTO `searchkeys` VALUES ('132', '肉松饼', '1', '68');
INSERT INTO `searchkeys` VALUES ('133', '肉松', '1', '68');
INSERT INTO `searchkeys` VALUES ('134', '肉', '2', '68');
INSERT INTO `searchkeys` VALUES ('135', '饼', '4', '68');
INSERT INTO `searchkeys` VALUES ('136', '好丽友', '9', '68');
INSERT INTO `searchkeys` VALUES ('137', '康师傅', '2', '68');
INSERT INTO `searchkeys` VALUES ('138', '妙芙', '1', '68');
INSERT INTO `searchkeys` VALUES ('139', '百奇', '2', '68');
INSERT INTO `searchkeys` VALUES ('140', '盐', '2', '69');
INSERT INTO `searchkeys` VALUES ('141', '可乐', '2', '69');
INSERT INTO `searchkeys` VALUES ('142', '蘑菇', '1', '68');
INSERT INTO `searchkeys` VALUES ('143', '真巧', '1', '68');
INSERT INTO `searchkeys` VALUES ('144', '奥', '1', '68');
INSERT INTO `searchkeys` VALUES ('145', '乐事', '4', '68');
INSERT INTO `searchkeys` VALUES ('146', '上好佳', '1', '68');
INSERT INTO `searchkeys` VALUES ('147', '墨西哥', '2', '68');
INSERT INTO `searchkeys` VALUES ('148', '鸡味', '1', '68');
INSERT INTO `searchkeys` VALUES ('149', '旺旺', '1', '68');
INSERT INTO `searchkeys` VALUES ('150', '薯片', '1', '68');
INSERT INTO `searchkeys` VALUES ('151', '薯条', '2', '68');
INSERT INTO `searchkeys` VALUES ('152', '薯', '3', '68');
INSERT INTO `searchkeys` VALUES ('153', '薯愿', '1', '68');
INSERT INTO `searchkeys` VALUES ('154', '榨菜', '1', '60');
INSERT INTO `searchkeys` VALUES ('155', '小米', '1', '60');
INSERT INTO `searchkeys` VALUES ('156', '牙膏', '1', '64');
INSERT INTO `searchkeys` VALUES ('157', '绿茶', '2', '69');
INSERT INTO `searchkeys` VALUES ('158', '酱油', '2', '69');
INSERT INTO `searchkeys` VALUES ('159', '花生油', '2', '70');
INSERT INTO `searchkeys` VALUES ('160', '销量', '2', '70');
INSERT INTO `searchkeys` VALUES ('161', '二锅头', '1', '69');
INSERT INTO `searchkeys` VALUES ('162', '盐', '1', '82');
INSERT INTO `searchkeys` VALUES ('163', '啤酒', '1', '83');
INSERT INTO `searchkeys` VALUES ('164', '哈哈', '1', '83');
INSERT INTO `searchkeys` VALUES ('165', '薯片', '1', '70');
INSERT INTO `searchkeys` VALUES ('166', '啤酒', '5', '108');
INSERT INTO `searchkeys` VALUES ('167', '罐头', '1', '88');
INSERT INTO `searchkeys` VALUES ('168', '花生油', '1', '109');
INSERT INTO `searchkeys` VALUES ('169', '康师傅', '2', '116');
INSERT INTO `searchkeys` VALUES ('170', '八宝粥', '1', '112');
INSERT INTO `searchkeys` VALUES ('171', '玫瑰', '4', '108');
INSERT INTO `searchkeys` VALUES ('172', '有啥', '2', '108');
INSERT INTO `searchkeys` VALUES ('173', '二锅头', '1', '118');
INSERT INTO `searchkeys` VALUES ('174', '花生油', '1', '108');
INSERT INTO `searchkeys` VALUES ('175', '绿茶', '1', '108');
INSERT INTO `searchkeys` VALUES ('176', '香烟', '1', '145');
INSERT INTO `searchkeys` VALUES ('177', '蓝贝', '2', '68');
INSERT INTO `searchkeys` VALUES ('178', '方便面', '9', '68');
INSERT INTO `searchkeys` VALUES ('179', '号', '1', '68');
INSERT INTO `searchkeys` VALUES ('180', '其', '3', '68');
INSERT INTO `searchkeys` VALUES ('181', '方', '1', '68');
INSERT INTO `searchkeys` VALUES ('182', '牛肉粒', '2', '147');
INSERT INTO `searchkeys` VALUES ('183', '啤酒', '3', '94');
INSERT INTO `searchkeys` VALUES ('184', '大果粒', '1', '94');
INSERT INTO `searchkeys` VALUES ('185', '洗发水', '1', '94');
INSERT INTO `searchkeys` VALUES ('186', '洗发露', '2', '94');
INSERT INTO `searchkeys` VALUES ('187', '酸奶', '4', '159');
INSERT INTO `searchkeys` VALUES ('188', '啤酒', '2', '70');
INSERT INTO `searchkeys` VALUES ('189', '牙膏', '1', '146');
INSERT INTO `searchkeys` VALUES ('190', '二锅头', '1', '70');
INSERT INTO `searchkeys` VALUES ('191', '啤酒', '1', '146');
INSERT INTO `searchkeys` VALUES ('192', '辣条', '2', '250');
INSERT INTO `searchkeys` VALUES ('193', '劲酒', '1', '147');
INSERT INTO `searchkeys` VALUES ('194', '雪碧', '2', '70');
INSERT INTO `searchkeys` VALUES ('195', '百事', '1', '70');
INSERT INTO `searchkeys` VALUES ('196', '北冰洋', '1', '70');
INSERT INTO `searchkeys` VALUES ('197', '三全', '4', '70');
INSERT INTO `searchkeys` VALUES ('198', '思念', '1', '70');
INSERT INTO `searchkeys` VALUES ('199', '状元', '1', '70');
INSERT INTO `searchkeys` VALUES ('200', '面包', '4', '70');
INSERT INTO `searchkeys` VALUES ('201', '宾堡', '1', '70');
INSERT INTO `searchkeys` VALUES ('202', '本色', '2', '70');
INSERT INTO `searchkeys` VALUES ('203', '可乐', '3', '70');
INSERT INTO `searchkeys` VALUES ('204', '酱油', '2', '146');
INSERT INTO `searchkeys` VALUES ('205', '冰红茶', '1', '146');
INSERT INTO `searchkeys` VALUES ('206', '冰红茶', '3', '69');
INSERT INTO `searchkeys` VALUES ('207', '奶茶', '5', '69');
INSERT INTO `searchkeys` VALUES ('208', '牙膏', '1', '69');
INSERT INTO `searchkeys` VALUES ('209', '啤酒', '1', '327');
INSERT INTO `searchkeys` VALUES ('210', '爆米花', '1', '327');
INSERT INTO `searchkeys` VALUES ('211', '啤酒', '2', '122');
INSERT INTO `searchkeys` VALUES ('212', '牙膏', '5', '363');
INSERT INTO `searchkeys` VALUES ('213', '好丽友', '2', '369');
INSERT INTO `searchkeys` VALUES ('214', '八宝粥', '1', '367');
INSERT INTO `searchkeys` VALUES ('215', '矿泉水', '1', '70');
INSERT INTO `searchkeys` VALUES ('216', '盐', '1', '146');
INSERT INTO `searchkeys` VALUES ('217', '回', '1', '146');
INSERT INTO `searchkeys` VALUES ('218', '可乐', '2', '146');
INSERT INTO `searchkeys` VALUES ('219', '花生油', '1', '373');
INSERT INTO `searchkeys` VALUES ('220', '卫生纸', '1', '132');
INSERT INTO `searchkeys` VALUES ('221', '二锅头', '1', '376');
INSERT INTO `searchkeys` VALUES ('222', '胡椒', '1', '74');
INSERT INTO `searchkeys` VALUES ('223', '蜂蜜', '1', '389');
INSERT INTO `searchkeys` VALUES ('224', '二锅头', '1', '385');
INSERT INTO `searchkeys` VALUES ('225', '外卖', '1', '396');
INSERT INTO `searchkeys` VALUES ('226', '蓝贝', '3', '147');
INSERT INTO `searchkeys` VALUES ('227', '九朵', '1', '147');
INSERT INTO `searchkeys` VALUES ('228', '花生油', '1', '406');
INSERT INTO `searchkeys` VALUES ('229', '奶茶', '1', '146');
INSERT INTO `searchkeys` VALUES ('230', '麦丽素', '1', '352');
INSERT INTO `searchkeys` VALUES ('231', '二锅头', '1', '390');
INSERT INTO `searchkeys` VALUES ('232', '啤酒', '2', '124');
INSERT INTO `searchkeys` VALUES ('233', '酱油', '1', '124');
INSERT INTO `searchkeys` VALUES ('234', '牙膏', '1', '124');
INSERT INTO `searchkeys` VALUES ('235', '糕点', '3', '418');
INSERT INTO `searchkeys` VALUES ('236', '啤酒', '2', '422');
INSERT INTO `searchkeys` VALUES ('237', '酸奶', '4', '422');
INSERT INTO `searchkeys` VALUES ('238', '露露', '3', '70');
INSERT INTO `searchkeys` VALUES ('239', '银鹭', '2', '70');
INSERT INTO `searchkeys` VALUES ('240', '燕京', '1', '70');
INSERT INTO `searchkeys` VALUES ('241', '椰汁', '1', '70');
INSERT INTO `searchkeys` VALUES ('242', '蓝带', '1', '70');
INSERT INTO `searchkeys` VALUES ('243', '泸州', '1', '70');
INSERT INTO `searchkeys` VALUES ('244', '即客', '1', '70');
INSERT INTO `searchkeys` VALUES ('245', '烟', '2', '410');
INSERT INTO `searchkeys` VALUES ('246', '香烟', '2', '410');
INSERT INTO `searchkeys` VALUES ('247', '啤酒', '1', '441');
INSERT INTO `searchkeys` VALUES ('248', '番茄酱', '2', '75');
INSERT INTO `searchkeys` VALUES ('249', '口香糖', '1', '138');
INSERT INTO `searchkeys` VALUES ('250', '面包', '2', '138');
INSERT INTO `searchkeys` VALUES ('251', '花生油', '1', '122');
INSERT INTO `searchkeys` VALUES ('252', '卫生巾', '1', '75');
INSERT INTO `searchkeys` VALUES ('253', '油', '2', '75');
INSERT INTO `searchkeys` VALUES ('254', '啤酒', '3', '455');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(64) DEFAULT NULL COMMENT '商店名称',
  `longitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `business_hours` varchar(64) DEFAULT NULL COMMENT '营业时间',
  `business_status` int(11) DEFAULT NULL COMMENT '当前营业状态',
  `delivery_capacity` int(11) DEFAULT NULL COMMENT '配送能力',
  `description` varchar(500) DEFAULT NULL COMMENT '商店详情',
  `createtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `areaid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商店信息表';

-- ----------------------------
-- Records of shop
-- ----------------------------

-- ----------------------------
-- Table structure for `shops`
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bossname` varchar(45) NOT NULL DEFAULT '老板姓名',
  `bosstel` varchar(45) NOT NULL DEFAULT '老板电话',
  `shopname` varchar(45) NOT NULL DEFAULT '店铺名称',
  `shoptel` varchar(45) NOT NULL DEFAULT '店铺电话',
  `shopaddr` varchar(45) NOT NULL DEFAULT '店铺地址',
  `shopimg` varchar(200) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sheng` varchar(45) NOT NULL,
  `shi` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  `longitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(20) DEFAULT NULL COMMENT '维度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopname` (`shopname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='商家表';

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('64', '。。。', '15201351249', '美廉美超市', '15201351249', '。。。', 'shops/shops_8a23851a494246bf01494246bf940000.jpg', '2014-10-24 21:09:33', '1', '3', '41', null, null);
INSERT INTO `shops` VALUES ('65', '百旺', '15056694639', '百旺生活用品超市', '15056694639', '天通东苑一区', 'E:\\jike\\shops\\shops_402881614942560401494256041a0000.jpg', '2014-10-24 21:26:13', '1', '50', '51', null, null);

-- ----------------------------
-- Table structure for `shops_p`
-- ----------------------------
DROP TABLE IF EXISTS `shops_p`;
CREATE TABLE `shops_p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopsid` int(11) NOT NULL COMMENT '商家id',
  `pcid` int(11) NOT NULL COMMENT '商品分类id',
  `productid` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shops_p
-- ----------------------------

-- ----------------------------
-- Table structure for `sms_send`
-- ----------------------------
DROP TABLE IF EXISTS `sms_send`;
CREATE TABLE `sms_send` (
  `id` bigint(20) NOT NULL,
  `cellphone` varchar(11) DEFAULT NULL COMMENT '接收手机号码',
  `sms_type` enum('verify') DEFAULT 'verify' COMMENT '短信类型',
  `ext_data` varchar(6) DEFAULT NULL COMMENT '额外参数',
  `send_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发送时间',
  `sms_code` varchar(20) DEFAULT NULL COMMENT '网关返回码',
  PRIMARY KEY (`id`),
  KEY `cellphone_idx_for_query` (`cellphone`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='短信发送记录';

-- ----------------------------
-- Records of sms_send
-- ----------------------------
INSERT INTO `sms_send` VALUES ('1', '13811170117', 'verify', '645252', '2014-05-08 17:12:23', '81712231697182820');
INSERT INTO `sms_send` VALUES ('2', '13811170117', 'verify', '645252', '2014-05-08 17:13:09', '81713092672297730');
INSERT INTO `sms_send` VALUES ('3', '13811170117', 'verify', '333445', '2014-05-08 17:14:06', '81714062842502400');
INSERT INTO `sms_send` VALUES ('4', '13811170117', 'verify', '333445', '2014-05-08 17:16:50', '81716502982106480');
INSERT INTO `sms_send` VALUES ('5', '13811170117', 'verify', '333445', '2014-05-08 17:24:57', '81724572741947740');
INSERT INTO `sms_send` VALUES ('6', '18628128353', 'verify', '366641', '2014-05-08 17:39:33', '81739341903353700');
INSERT INTO `sms_send` VALUES ('7', '15201351249', 'verify', '661596', '2014-05-08 17:41:17', '81741173475222580');
INSERT INTO `sms_send` VALUES ('8', '15201351249', 'verify', '394199', '2014-05-08 17:43:19', '81743202464740510');
INSERT INTO `sms_send` VALUES ('9', '18628128353', 'verify', '895398', '2014-05-08 18:14:57', '81814571433878980');
INSERT INTO `sms_send` VALUES ('10', '15201351249', 'verify', '545280', '2014-05-08 18:15:09', '81815092590689040');
INSERT INTO `sms_send` VALUES ('11', '15201351249', 'verify', '970245', '2014-05-08 18:32:55', '81832552626625150');
INSERT INTO `sms_send` VALUES ('12', '15201351249', 'verify', '819647', '2014-05-08 19:05:30', '81905311781915840');
INSERT INTO `sms_send` VALUES ('13', '15201351249', 'verify', '358931', '2014-05-08 19:07:44', '81907454096864500');
INSERT INTO `sms_send` VALUES ('14', '18628128353', 'verify', '329887', '2014-05-08 22:49:26', '82249272018142510');
INSERT INTO `sms_send` VALUES ('15', '18628128353', 'verify', '209062', '2014-05-08 22:49:33', '8224933365875221');
INSERT INTO `sms_send` VALUES ('16', '18628128353', 'verify', '609029', '2014-05-08 22:49:39', '8224940484466851');
INSERT INTO `sms_send` VALUES ('17', '18628128353', 'verify', '873779', '2014-05-08 22:49:43', '82249433030967000');
INSERT INTO `sms_send` VALUES ('18', '18628128353', 'verify', '814611', '2014-05-09 09:11:13', '9091113801867816');
INSERT INTO `sms_send` VALUES ('19', '15201351249', 'verify', '566107', '2014-05-09 10:26:25', '9102625144642682');
INSERT INTO `sms_send` VALUES ('20', '15201351249', 'verify', '112242', '2014-05-09 10:29:04', '91029053803469150');
INSERT INTO `sms_send` VALUES ('21', '15201351249', 'verify', '456556', '2014-05-09 10:29:45', '91029461443659700');
INSERT INTO `sms_send` VALUES ('22', '15201351249', 'verify', '028632', '2014-05-09 10:58:04', '91058053264942370');
INSERT INTO `sms_send` VALUES ('23', '15201351249', 'verify', '290021', '2014-05-09 12:23:15', '91223161310427200');
INSERT INTO `sms_send` VALUES ('24', '15201351249', 'verify', '327600', '2014-05-09 18:10:19', '91810192198567860');
INSERT INTO `sms_send` VALUES ('25', '15201351249', 'verify', '610015', '2014-05-09 18:10:38', '91810381957571170');
INSERT INTO `sms_send` VALUES ('26', '15201351249', 'verify', '353819', '2014-05-09 18:19:18', '91819182377679660');
INSERT INTO `sms_send` VALUES ('27', '15201351249', 'verify', '176063', '2014-05-09 18:23:51', '91823513844317470');
INSERT INTO `sms_send` VALUES ('28', '15201351249', 'verify', '961990', '2014-05-09 18:44:57', '91844572349859980');
INSERT INTO `sms_send` VALUES ('29', '15201351249', 'verify', '095486', '2014-05-09 18:45:56', '91845571735823490');
INSERT INTO `sms_send` VALUES ('30', '15201351249', 'verify', '789329', '2014-05-09 19:19:33', '91919332383095700');
INSERT INTO `sms_send` VALUES ('31', '15201351249', 'verify', '488094', '2014-05-09 19:20:12', '91920121814586460');
INSERT INTO `sms_send` VALUES ('32', '15201351249', 'verify', '402650', '2014-05-09 19:29:14', '91929143814936220');
INSERT INTO `sms_send` VALUES ('33', '15201351249', 'verify', '383670', '2014-05-09 19:31:51', '91931522313917260');
INSERT INTO `sms_send` VALUES ('34', '15201351249', 'verify', '822914', '2014-05-09 19:34:08', '919340962553650');
INSERT INTO `sms_send` VALUES ('35', '15201351249', 'verify', '129208', '2014-05-09 19:35:44', '91935442084113630');
INSERT INTO `sms_send` VALUES ('36', '15201351249', 'verify', '339338', '2014-05-09 19:43:32', '9194332653356216');
INSERT INTO `sms_send` VALUES ('37', '15201351249', 'verify', '415486', '2014-05-09 20:03:57', '92003573108261120');
INSERT INTO `sms_send` VALUES ('38', '15201351249', 'verify', '859371', '2014-05-09 20:04:15', '92004161675868480');
INSERT INTO `sms_send` VALUES ('39', '15201351249', 'verify', '852969', '2014-05-09 21:46:45', '92146452055764160');
INSERT INTO `sms_send` VALUES ('40', '15201351249', 'verify', '586910', '2014-05-09 22:50:50', '92250501252253310');
INSERT INTO `sms_send` VALUES ('41', '15201351249', 'verify', '573362', '2014-05-09 23:26:12', '92326123584339980');
INSERT INTO `sms_send` VALUES ('42', '15201351249', 'verify', '830266', '2014-05-10 00:03:21', '100003212871203550');
INSERT INTO `sms_send` VALUES ('43', '15201351249', 'verify', '965366', '2014-05-10 00:06:50', '100006503251793650');
INSERT INTO `sms_send` VALUES ('44', '15201351249', 'verify', '455261', '2014-05-10 00:20:42', '100020422503256900');
INSERT INTO `sms_send` VALUES ('45', '15201351249', 'verify', '474093', '2014-05-10 01:17:27', '100117271706941920');
INSERT INTO `sms_send` VALUES ('46', '15201351249', 'verify', '464981', '2014-05-10 09:28:11', '100928113247189680');
INSERT INTO `sms_send` VALUES ('47', '15201351249', 'verify', '127680', '2014-05-10 15:45:13', '101545143852398820');
INSERT INTO `sms_send` VALUES ('48', '18628128353', 'verify', '157440', '2014-05-10 23:58:17', '102358182273568600');
INSERT INTO `sms_send` VALUES ('49', '18628128353', 'verify', '277366', '2014-05-10 23:58:30', '102358313415905730');
INSERT INTO `sms_send` VALUES ('50', '18628128353', 'verify', '649280', '2014-05-10 23:59:08', '102359093593977340');
INSERT INTO `sms_send` VALUES ('51', '18628128353', 'verify', '124922', '2014-05-11 00:00:53', '11000053835211252');
INSERT INTO `sms_send` VALUES ('52', '18628128353', 'verify', '099749', '2014-05-11 00:01:45', '110001453406678050');
INSERT INTO `sms_send` VALUES ('53', '18628128353', 'verify', '223171', '2014-05-11 00:01:56', '110001562418346800');
INSERT INTO `sms_send` VALUES ('54', '15201351249', 'verify', '779599', '2014-05-11 00:22:57', '110022581388199310');
INSERT INTO `sms_send` VALUES ('55', '18628128353', 'verify', '270747', '2014-05-11 13:20:16', '111320161547460380');
INSERT INTO `sms_send` VALUES ('56', '15201351249', 'verify', '865586', '2014-05-11 13:53:38', '111353382429503');
INSERT INTO `sms_send` VALUES ('57', '15201351249', 'verify', '864708', '2014-05-11 14:00:48', '111400483343021710');
INSERT INTO `sms_send` VALUES ('58', '15201351249', 'verify', '065053', '2014-05-11 23:21:02', '112321022755773780');
INSERT INTO `sms_send` VALUES ('59', '15201351249', 'verify', '937995', '2014-05-11 23:29:49', '11232949719854738');
INSERT INTO `sms_send` VALUES ('60', '15201351249', 'verify', '744200', '2014-05-11 23:40:46', '112340462960234380');
INSERT INTO `sms_send` VALUES ('61', '15201351249', 'verify', '014127', '2014-05-11 23:51:13', '112351131195711790');
INSERT INTO `sms_send` VALUES ('62', '15201351249', 'verify', '329111', '2014-05-11 23:58:31', '112358312087163420');
INSERT INTO `sms_send` VALUES ('63', '15201351249', 'verify', '503092', '2014-05-12 02:46:45', '120246452686330510');
INSERT INTO `sms_send` VALUES ('64', '15201351249', 'verify', '769639', '2014-05-12 02:48:00', '120248001473847400');
INSERT INTO `sms_send` VALUES ('65', '18628128353', 'verify', '676333', '2014-05-12 09:52:34', '120952351969887950');
INSERT INTO `sms_send` VALUES ('66', '18628128353', 'verify', '719104', '2014-05-12 09:55:53', '120955543403212850');
INSERT INTO `sms_send` VALUES ('67', '15201351249', 'verify', '384735', '2014-05-12 10:55:56', '12105556708087038');
INSERT INTO `sms_send` VALUES ('68', '15201351249', 'verify', '428215', '2014-05-12 11:37:34', '121137352331251120');
INSERT INTO `sms_send` VALUES ('69', '15201351249', 'verify', '395060', '2014-05-12 12:05:17', '121205172564735410');
INSERT INTO `sms_send` VALUES ('70', '15201351249', 'verify', '805269', '2014-05-12 12:13:23', '121213233968751310');
INSERT INTO `sms_send` VALUES ('71', '15201351249', 'verify', '019795', '2014-05-12 12:48:47', '121248473585028910');
INSERT INTO `sms_send` VALUES ('72', '15201351249', 'verify', '436391', '2014-05-12 13:39:55', '121339551404580530');
INSERT INTO `sms_send` VALUES ('73', '18628128353', 'verify', '933864', '2014-05-12 13:47:35', '121347361176126740');
INSERT INTO `sms_send` VALUES ('74', '18628128353', 'verify', '702380', '2014-05-12 13:49:14', '12134915395230956');
INSERT INTO `sms_send` VALUES ('75', '15201351249', 'verify', '161511', '2014-05-12 13:51:26', '121351263442172220');
INSERT INTO `sms_send` VALUES ('76', '15201351249', 'verify', '055957', '2014-05-12 13:52:23', '12135223704479');
INSERT INTO `sms_send` VALUES ('77', '15201351249', 'verify', '440966', '2014-05-12 13:56:52', '121356522478198940');
INSERT INTO `sms_send` VALUES ('78', '15201351249', 'verify', '466053', '2014-05-12 14:00:54', '121400553180864420');
INSERT INTO `sms_send` VALUES ('79', '15201351249', 'verify', '631624', '2014-05-12 14:07:51', '121407513875416220');
INSERT INTO `sms_send` VALUES ('80', '15201351249', 'verify', '228129', '2014-05-12 14:09:43', '121409431962795980');
INSERT INTO `sms_send` VALUES ('81', '15201351249', 'verify', '761689', '2014-05-12 14:51:31', '12145131738695304');
INSERT INTO `sms_send` VALUES ('82', '15201351249', 'verify', '028784', '2014-05-12 14:56:00', '121456003333807740');
INSERT INTO `sms_send` VALUES ('83', '15201351249', 'verify', '168715', '2014-05-12 15:52:16', '12155217113469658');
INSERT INTO `sms_send` VALUES ('84', '15201351249', 'verify', '586839', '2014-05-12 16:44:58', '121644582542741060');
INSERT INTO `sms_send` VALUES ('85', '15201351249', 'verify', '923995', '2014-05-12 16:50:38', '1216503825722248');
INSERT INTO `sms_send` VALUES ('86', '15201351249', 'verify', '272532', '2014-05-12 17:38:03', '121738043307763580');
INSERT INTO `sms_send` VALUES ('87', '15201351249', 'verify', '545828', '2014-05-12 23:07:19', '122307203462317280');
INSERT INTO `sms_send` VALUES ('88', '15201351249', 'verify', '052257', '2014-05-14 20:21:09', '14202110289065134');
INSERT INTO `sms_send` VALUES ('89', '15201351249', 'verify', '880774', '2014-06-11 19:00:03', '11190004178278432');
INSERT INTO `sms_send` VALUES ('90', '18628128353', 'verify', '394416', '2014-06-19 14:28:22', '191428221828653250');
INSERT INTO `sms_send` VALUES ('91', '18628128353', 'verify', '847488', '2014-06-19 14:36:31', '191436314245793250');
INSERT INTO `sms_send` VALUES ('92', '18628128353', 'verify', '556797', '2014-06-19 14:43:02', '1914430285417803');
INSERT INTO `sms_send` VALUES ('93', '18628128353', 'verify', '700297', '2014-06-19 14:57:36', '191457363355286500');
INSERT INTO `sms_send` VALUES ('94', '18628128353', 'verify', '125274', '2014-06-19 14:58:44', '191458441351193760');
INSERT INTO `sms_send` VALUES ('95', '18628128353', 'verify', '401242', '2014-06-19 14:59:42', '191459423645594600');
INSERT INTO `sms_send` VALUES ('96', '18628128353', 'verify', '745934', '2014-06-19 15:02:14', '191502134260666000');
INSERT INTO `sms_send` VALUES ('97', '18628128353', 'verify', '973873', '2014-06-20 11:46:49', '201146492942284960');
INSERT INTO `sms_send` VALUES ('98', '18628128353', 'verify', '684509', '2014-06-20 11:51:24', '201151243853377730');
INSERT INTO `sms_send` VALUES ('99', '18628128353', 'verify', '901852', '2014-06-20 14:39:05', '20143905415014536');
INSERT INTO `sms_send` VALUES ('100', '18628128353', 'verify', '029838', '2014-06-20 14:58:55', '20145855967270864');
INSERT INTO `sms_send` VALUES ('101', '13439988392', 'verify', '619755', '2014-06-20 15:08:17', '201508172005994900');
INSERT INTO `sms_send` VALUES ('102', '18614093826', 'verify', '763346', '2014-06-20 15:10:10', '20151010382848144');
INSERT INTO `sms_send` VALUES ('103', '18628128353', 'verify', '157413', '2014-06-20 16:04:34', '201604343798162400');
INSERT INTO `sms_send` VALUES ('104', '13439988392', 'verify', '875431', '2014-06-24 18:14:21', '241814211800169570');
INSERT INTO `sms_send` VALUES ('105', '13439988392', 'verify', '285616', '2014-06-24 18:15:24', '241815242739103940');
INSERT INTO `sms_send` VALUES ('106', '13439988392', 'verify', '452908', '2014-06-24 19:37:33', '24193733530533500');
INSERT INTO `sms_send` VALUES ('107', '18628128353', 'verify', '006739', '2014-06-26 17:29:28', '261729272017862530');

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', 'a', 'b');
INSERT INTO `test` VALUES ('2', 'aaaa', 'b');
INSERT INTO `test` VALUES ('3', 'aaaa', 'b');
INSERT INTO `test` VALUES ('4', 'ä¸­å?½', null);
INSERT INTO `test` VALUES ('5', 'ä¸­å?½', '123qwe');
INSERT INTO `test` VALUES ('6', 'ä¸­å?½', '123qwe');
INSERT INTO `test` VALUES ('7', '??', '123qwe');
INSERT INTO `test` VALUES ('8', '??', '123qwe');
INSERT INTO `test` VALUES ('9', '??', '123qwe');
INSERT INTO `test` VALUES ('10', '??', '123qwe');
INSERT INTO `test` VALUES ('11', 'è??å?´', '123123');
INSERT INTO `test` VALUES ('12', 'è??å?´', '123123');
INSERT INTO `test` VALUES ('13', '??', '123qwe');
INSERT INTO `test` VALUES ('14', '??', '123123');
INSERT INTO `test` VALUES ('15', '??', '123123');
INSERT INTO `test` VALUES ('16', '??', '123123');
INSERT INTO `test` VALUES ('17', '??', '123123');
INSERT INTO `test` VALUES ('18', '??', '123123');
INSERT INTO `test` VALUES ('19', '老吴', '123123');
INSERT INTO `test` VALUES ('20', '中国', '123qwe');
INSERT INTO `test` VALUES ('21', '中国', '123qwe');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descript` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='用户的操作类型';

-- ----------------------------
-- Records of type
-- ----------------------------

-- ----------------------------
-- Table structure for `user_activity`
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `activityid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `user_admin`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin`;
CREATE TABLE `user_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(64) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '混淆因子',
  `nickname` varchar(64) DEFAULT NULL COMMENT '用户妮称',
  `status` int(11) DEFAULT '0' COMMENT '用户状态',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0代表普通，1代表操作，2代表超级管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='管理用户表\r\n负责存储后台管理系统的用户信息';

-- ----------------------------
-- Records of user_admin
-- ----------------------------
INSERT INTO `user_admin` VALUES ('3', 'super', 'super', '1', 'super', '0', '2015-01-07 12:46:05', '2');
INSERT INTO `user_admin` VALUES ('4', '杨海', 'password', '1', '好人', '0', '2015-01-07 12:46:05', '0');
INSERT INTO `user_admin` VALUES ('5', 'common2', 'common2', '1', 'common2', '0', '2015-01-07 12:46:06', '0');
INSERT INTO `user_admin` VALUES ('6', 'opearte1', 'opearte1', '1', 'opearte1', '0', '2015-01-07 12:46:07', '1');
INSERT INTO `user_admin` VALUES ('7', 'yh', 'yh', '1', 'yh', '0', '2015-01-07 12:46:10', '1');

-- ----------------------------
-- Table structure for `user_admin_permission`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin_permission`;
CREATE TABLE `user_admin_permission` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'ID',
  `description` varchar(64) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台管理用户权限表';

-- ----------------------------
-- Records of user_admin_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `user_admin_permission_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin_permission_mapping`;
CREATE TABLE `user_admin_permission_mapping` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '自增标识',
  `admin_id` bigint(64) DEFAULT NULL COMMENT '管理用户ID',
  `permission_id` bigint(64) DEFAULT NULL COMMENT '管理用户权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理用户与权限映射表';

-- ----------------------------
-- Records of user_admin_permission_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for `user_admin_privelege`
-- ----------------------------
DROP TABLE IF EXISTS `user_admin_privelege`;
CREATE TABLE `user_admin_privelege` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_admin_privelege
-- ----------------------------

-- ----------------------------
-- Table structure for `user_customer`
-- ----------------------------
DROP TABLE IF EXISTS `user_customer`;
CREATE TABLE `user_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `username` varchar(64) DEFAULT NULL COMMENT '客户手机号码',
  `password` varchar(64) DEFAULT NULL COMMENT '客户密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '混淆因子',
  `nickname` varchar(64) DEFAULT NULL COMMENT '客户妮称',
  `status` int(11) DEFAULT '1' COMMENT '是否激活',
  `email` varchar(64) DEFAULT NULL COMMENT '客户邮箱',
  `qq` varchar(16) DEFAULT NULL COMMENT '客户QQ',
  `avartar` int(11) DEFAULT '0' COMMENT '头像',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `sex` int(11) DEFAULT '1' COMMENT '性别(1代表男)',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8 COMMENT='会员表\r\n存储会员信息';

-- ----------------------------
-- Records of user_customer
-- ----------------------------
INSERT INTO `user_customer` VALUES ('60', '18910347457', '7C28813E0A7032B0F3E1B12BF063EB63', null, '王振江', '1', null, null, null, null, '1', '2014-10-26 03:09:12');
INSERT INTO `user_customer` VALUES ('61', '15056694638', '4960ACB41EDE501D9113E85C5EE47424', null, '王振江', '1', null, null, null, null, '1', '2014-10-26 03:52:08');
INSERT INTO `user_customer` VALUES ('62', '18600050976', '25C1C8BBAD7B3CFAE6D557184F9DB4FC', null, '小七', '1', null, null, null, null, '1', '2014-10-26 21:56:26');
INSERT INTO `user_customer` VALUES ('63', '13911342615', 'B680500469E6BC8431C9BC876FBA0479', null, '我是谁', '1', null, null, null, null, '1', '2014-10-27 02:36:17');
INSERT INTO `user_customer` VALUES ('64', '13699255034', 'EE35AB98FE2F5B3BB336F1C3258F8D28', null, '玲珑剔透体育中心', '1', null, null, null, null, '1', '2014-10-27 11:10:07');
INSERT INTO `user_customer` VALUES ('65', '18855973083', '2FFF7EFD1642C4CFB28DC05C79A1075F', null, '大漠孤鸦', '1', null, null, null, null, '1', '2014-10-27 12:27:27');
INSERT INTO `user_customer` VALUES ('66', '15056694639', '3785A754AD48DC62B817503F1D1B3FEE', null, '还有很多', '1', null, null, null, null, '1', '2014-10-29 14:26:35');
INSERT INTO `user_customer` VALUES ('67', '13522784455', '39F5785A1BE69F72BC02397AFD84E9EF', null, 'ytcytc', '1', null, null, null, null, '1', '2014-11-01 13:30:52');
INSERT INTO `user_customer` VALUES ('68', '18510336313', '4002A6E531DFAF7BCAB6EF78E73EBA69', null, 'Julia', '1', null, null, null, null, '1', '2014-11-03 16:49:45');
INSERT INTO `user_customer` VALUES ('69', '15201351249', '10DC41CD316C61127A34F21645DBCD47', null, '我是江哥', '1', null, null, null, null, '1', '2014-11-06 11:45:43');
INSERT INTO `user_customer` VALUES ('70', '13810497654', '73AB5859105FCEA437F400DF60ABE9B2', null, '13810497654', '1', null, null, null, null, '1', '2014-11-07 12:51:57');
INSERT INTO `user_customer` VALUES ('71', '18611265849', '4598C5A1C0B4F5960C97E6A81F5ECE98', null, '和尚也开荤', '1', null, null, null, null, '1', '2014-11-10 23:20:09');
INSERT INTO `user_customer` VALUES ('72', '15210579218', '6D163DBA4B923E2D9DB871A4957C7280', null, 'hulu', '1', null, null, null, null, '1', '2014-11-11 02:50:24');
INSERT INTO `user_customer` VALUES ('73', '18010028992', '3A5E2C7FBF93B883D07CA89D3818359C', null, 'able127', '1', null, null, null, null, '1', '2014-11-14 18:29:21');
INSERT INTO `user_customer` VALUES ('74', '18500135421', '58A25B6AED0DCB0E26CFA0F3FC66EBC2', null, 'pijunzhang', '1', null, null, null, null, '1', '2014-11-15 16:23:58');
INSERT INTO `user_customer` VALUES ('75', '13611164039', 'D4446B67F6421D184AB0DC2598A2C4C7', null, '柠檬', '1', null, null, null, null, '1', '2014-11-16 10:24:37');
INSERT INTO `user_customer` VALUES ('76', '13126524865', '30731C3D49F575673419DD82D52B261B', null, '啦啦', '1', null, null, null, null, '1', '2014-11-16 13:43:50');
INSERT INTO `user_customer` VALUES ('77', '18611192295', '7B5901AFB92559AA919F77062AEB1B54', null, '不高不兴', '1', null, null, null, null, '1', '2014-11-17 18:53:50');
INSERT INTO `user_customer` VALUES ('78', '13681411604', '9107CD29B2D0AA430F97DF9290244D81', null, '面包师傅', '1', null, null, null, null, '1', '2014-11-19 15:13:48');
INSERT INTO `user_customer` VALUES ('79', '18600833750', 'F4D01C96A59FA06EC02554823BBA57F4', null, '哈哈', '1', null, null, null, null, '1', '2014-11-19 16:33:50');
INSERT INTO `user_customer` VALUES ('80', '13810348574', '0BBBA112BC1A33594C42D131D9569C74', null, '天通苑', '1', null, null, null, null, '1', '2014-11-20 21:23:41');
INSERT INTO `user_customer` VALUES ('81', '18410161172', 'F17C19ECE14B1B3C2C13D22BF2A5806C', null, '18410161172', '1', null, null, null, null, '1', '2014-11-21 15:03:58');
INSERT INTO `user_customer` VALUES ('82', '15201351248', '97FCBDFB0FDC39B6029DB162121AAB3C', null, '测试测试', '1', null, null, null, null, '1', '2014-11-28 03:48:25');
INSERT INTO `user_customer` VALUES ('83', '15201351213', '81D2C01F0134019118B069C8B769B5C3', null, '讲讲', '1', null, null, null, null, '1', '2014-11-28 09:07:23');
INSERT INTO `user_customer` VALUES ('84', '13131461387', '841F51C75CC6975532F7A534916A721B', null, 'Jxn', '1', null, null, null, null, '1', '2014-11-28 09:17:50');
INSERT INTO `user_customer` VALUES ('85', '17701384344', '3504D6F1B73357EF075EF82C24CC95AA', null, '17701384344', '1', null, null, null, null, '1', '2014-11-29 01:27:11');
INSERT INTO `user_customer` VALUES ('86', '13581618120', '687D4D8E5EF36AE4444ECCC20E2A219F', null, 'emilyxp', '1', null, null, null, null, '1', '2014-11-29 09:54:54');
INSERT INTO `user_customer` VALUES ('87', '18601300025', '26F0DD20298864888DFF1CF67A749DC2', null, '快乐之家', '1', null, null, null, null, '1', '2014-12-01 20:26:06');
INSERT INTO `user_customer` VALUES ('88', '15801030875', '8034F9E7AFF1B5A061ACE61EF82BCBC2', null, '柒yue桃夭', '1', null, null, null, null, '1', '2014-12-03 14:46:52');
INSERT INTO `user_customer` VALUES ('89', '18907982580', '5D49F8C1B314282648494B89B5765DD9', null, '徐翔', '1', null, null, null, null, '1', '2014-12-03 21:26:28');
INSERT INTO `user_customer` VALUES ('90', '13810108431', 'EDA2C57F5EE666418B952FC4C6A1E2A6', null, '北小贤', '1', null, null, null, null, '1', '2014-12-04 17:27:19');
INSERT INTO `user_customer` VALUES ('91', '18810951151', '816D02243CA141B6C83E3963C8F48D91', null, 'frankhuang', '1', null, null, null, null, '1', '2014-12-04 18:00:56');
INSERT INTO `user_customer` VALUES ('92', '18610210465', '2AF1149BAD5096CDE2AB8790E157A9BD', null, '哈哈', '1', null, null, null, null, '1', '2014-12-04 18:50:41');
INSERT INTO `user_customer` VALUES ('93', '18631200725', '0BD87318BE7AB17A7FD3B6F39A3CC176', null, '城市稻草人', '1', null, null, null, null, '1', '2014-12-04 20:18:51');
INSERT INTO `user_customer` VALUES ('94', '18810543171', 'BFE14ACBCAA67A3A2499777A47A312FF', null, 'tinybian', '1', null, null, null, null, '1', '2014-12-05 10:58:11');
INSERT INTO `user_customer` VALUES ('95', '13522005706', '57FE1FE84C05AE6AAA05ACC5B65EA3CE', null, 'amtfam', '1', null, null, null, null, '1', '2014-12-05 11:45:47');
INSERT INTO `user_customer` VALUES ('96', '13811545674', '4FE76733ED447D6579D0C5EBEDE8720E', null, 'Lv Jianhong', '1', null, null, null, null, '1', '2014-12-05 12:16:10');
INSERT INTO `user_customer` VALUES ('97', '15249502732', '394D6614E00DFEE96B499BE375974EA9', null, '马兰山', '1', null, null, null, null, '1', '2014-12-05 12:46:43');
INSERT INTO `user_customer` VALUES ('98', '18608040484', '9E46D9E7C9623622B79091BA91BECF04', null, '请叫我萌哥', '1', null, null, null, null, '1', '2014-12-05 18:58:57');
INSERT INTO `user_customer` VALUES ('99', '18101335097', '0F8538EB0D2BDC1BFE6914716E1D3F24', null, '1990xhy', '1', null, null, null, null, '1', '2014-12-06 08:41:13');
INSERT INTO `user_customer` VALUES ('100', '13810390345', '6A01C0B0FB307CC97E067A496C4F576A', null, '新启点', '1', null, null, null, null, '1', '2014-12-06 13:31:08');
INSERT INTO `user_customer` VALUES ('101', '15810191284', '3F6447EAEFC085A15DF5E79D5565B504', null, '小冷', '1', null, null, null, null, '1', '2014-12-06 16:56:12');
INSERT INTO `user_customer` VALUES ('102', '18600120490', '6BC268DBE2412FFA98553C46F0D68864', null, 'jiangzh0202', '1', null, null, null, null, '1', '2014-12-06 18:18:30');
INSERT INTO `user_customer` VALUES ('103', '18611989333', '781C3E00F55B75638055D531CCF3B609', null, '便利店', '1', null, null, null, null, '1', '2014-12-06 22:26:09');
INSERT INTO `user_customer` VALUES ('104', '18510248964', '32E4037A24D252970963C52D8D8C38EC', null, '18510248964', '1', null, null, null, null, '1', '2014-12-07 23:53:27');
INSERT INTO `user_customer` VALUES ('105', '18802203378', '2BE469E8CD420227EDDCE4B28C25A423', null, 'iask的', '1', null, null, null, null, '1', '2014-12-08 15:26:59');
INSERT INTO `user_customer` VALUES ('106', '18610606765', '7104E4F304CFF4FD45DE197CE9804457', null, '18610606765', '1', null, null, null, null, '1', '2014-12-08 16:57:44');
INSERT INTO `user_customer` VALUES ('107', '18511131996', 'E1E0EB8914123914E45B2B0151CAB78A', null, '崔牛之父', '1', null, null, null, null, '1', '2014-12-08 17:08:42');
INSERT INTO `user_customer` VALUES ('108', '15931571838', '3D81C43EB87031FD52D024F08E0F3A36', null, 'lianjiedela', '1', null, null, null, null, '1', '2014-12-08 19:39:47');
INSERT INTO `user_customer` VALUES ('109', '13910900287', 'A17DA45EE1C7FE76D4892808A3F44381', null, '你好', '1', null, null, null, null, '1', '2014-12-09 18:05:21');
INSERT INTO `user_customer` VALUES ('110', '13846597563', 'E5FB95FB96B9E8BEABCB1418A41B9D68', null, '加南村', '1', null, null, null, null, '1', '2014-12-10 14:42:05');
INSERT INTO `user_customer` VALUES ('111', '13767012778', '9DDC7EBB1FBB1A1599BED1E4FEDB96E3', null, '斯巴达的矛', '1', null, null, null, null, '1', '2014-12-10 15:37:06');
INSERT INTO `user_customer` VALUES ('112', '18621505188', '9D4CF65A29005597DF3DDA7BBA50CE1F', null, '简单', '1', null, null, null, null, '1', '2014-12-10 17:35:18');
INSERT INTO `user_customer` VALUES ('113', '13682605755', '4803EBA4A6D49C9BDD433656F4614078', null, 'jr3352297', '1', null, null, null, null, '1', '2014-12-11 01:15:03');
INSERT INTO `user_customer` VALUES ('114', '15356135913', 'E4DC39C4D0DA8C3C06BF647D29324F48', null, '营销', '1', null, null, null, null, '1', '2014-12-11 10:08:15');
INSERT INTO `user_customer` VALUES ('115', '18911404551', 'D18E271EFCED1BDC26D74E6B9ACD2462', null, '嘎嘎晓倩', '1', null, null, null, null, '1', '2014-12-11 10:23:43');
INSERT INTO `user_customer` VALUES ('116', '18810163223', 'F8BE3F1F8B442DA9C3036ECE89961A26', null, '凡人', '1', null, null, null, null, '1', '2014-12-11 13:17:38');
INSERT INTO `user_customer` VALUES ('117', '15600677043', '3D5DD7DA19B1A12BB581F40F448133DE', null, '15600677043', '1', null, null, null, null, '1', '2014-12-12 12:51:20');
INSERT INTO `user_customer` VALUES ('118', '13146904312', '92D18CE68B14A36D4DE47C2B4A50E266', null, '笑口常开', '1', null, null, null, null, '1', '2014-12-12 13:13:16');
INSERT INTO `user_customer` VALUES ('119', '13301062996', '41211ECB76182DFB20300856DA6267F6', null, '慕渭', '1', null, null, null, null, '1', '2014-12-12 21:15:36');
INSERT INTO `user_customer` VALUES ('120', '17710021110', 'BA965430CDC9D0FEA25AA0ECEBAD3F41', null, '900523', '1', null, null, null, null, '1', '2014-12-13 19:59:51');
INSERT INTO `user_customer` VALUES ('121', '15575927825', '57AD93446593039D766AF7D5B1372AB6', null, 'buyvon', '1', null, null, null, null, '1', '2014-12-13 21:10:27');
INSERT INTO `user_customer` VALUES ('122', '15811124123', '316B28E925A8A1EEC3B84ACC1C909C7D', null, '25588', '1', null, null, null, null, '1', '2014-12-13 22:56:19');
INSERT INTO `user_customer` VALUES ('123', '13811951909', '85DEB4D0F764A246E89B5D1216CEC6C1', null, '小米', '1', null, null, null, null, '1', '2014-12-14 13:44:58');
INSERT INTO `user_customer` VALUES ('124', '15936225304', '8FC5CBAF1FAF31E239BDEAC108679EF0', null, '啊哈嘿', '1', null, null, null, null, '1', '2014-12-14 18:38:19');
INSERT INTO `user_customer` VALUES ('125', '18612559768', 'E21A0230C73DE5C1F6631D1D2559C21D', null, '我的菜香', '1', null, null, null, null, '1', '2014-12-14 21:40:41');
INSERT INTO `user_customer` VALUES ('126', '13323363935', '945B9D94A145EAFB42D9060C34B38126', null, '姜先生', '1', null, null, null, null, '1', '2014-12-15 09:06:51');
INSERT INTO `user_customer` VALUES ('127', '18222289976', 'F722AD317D22FC3375AB57F1CC8770B2', null, '18222289976', '1', null, null, null, null, '1', '2014-12-15 14:28:12');
INSERT INTO `user_customer` VALUES ('128', '13911174518', 'A966673C6F746B084D2BFF2DBFB14436', null, '978552756', '1', null, null, null, null, '1', '2014-12-16 17:14:52');
INSERT INTO `user_customer` VALUES ('129', '13810929919', '17DFD8C3BABB345F1AB9B6E64C8DA4AF', null, 'fhqfly', '1', null, null, null, null, '1', '2014-12-16 17:43:21');
INSERT INTO `user_customer` VALUES ('130', '15010251013', '2F8F2CB52F8EB0C221ABACFE9E4E44A6', null, '蝈蝈', '1', null, null, null, null, '1', '2014-12-18 11:23:05');
INSERT INTO `user_customer` VALUES ('131', '15510200230', '99829A1BF746FF383FB6757E87B5E9B1', null, '流过时间', '1', null, null, null, null, '1', '2014-12-18 20:58:48');
INSERT INTO `user_customer` VALUES ('132', '18611828300', '71B6ECE6C628A2570D17CC7AA5BFD592', null, 'Kitty', '1', null, null, null, null, '1', '2014-12-18 22:31:56');
INSERT INTO `user_customer` VALUES ('133', '18611620601', '47DCA0FD08CA539C2B1948895506154D', null, 'liufeng9102', '1', null, null, null, null, '1', '2014-12-19 15:43:32');
INSERT INTO `user_customer` VALUES ('134', '13810036774', '7BD80EF44656B5A040BDB067BB714532', null, '香蕉，橘子，苹果', '1', null, null, null, null, '1', '2014-12-19 20:35:21');
INSERT INTO `user_customer` VALUES ('135', '13402168868', '306431E07AB9010F10EBC7E969B83F21', null, '不解释先生', '1', null, null, null, null, '1', '2014-12-19 23:51:07');
INSERT INTO `user_customer` VALUES ('136', '13911162062', '3CED1ED572C211D5DEB29D3F3BFA6BAE', null, '13911162062', '1', null, null, null, null, '1', '2014-12-20 09:13:35');
INSERT INTO `user_customer` VALUES ('137', '18610104647', 'D1BD054DA1269358ECCA2463292A1EDC', null, 'tianguaapple', '1', null, null, null, null, '1', '2014-12-21 15:56:27');
INSERT INTO `user_customer` VALUES ('138', '13701124311', '9B1DC296A9C8C246EA69CF7725E78FF0', null, '二宝宝', '1', null, null, null, null, '1', '2014-12-22 16:54:18');
INSERT INTO `user_customer` VALUES ('139', '18911268172', '99FCB71F4BE68703F99FCFC4E3CC7D69', null, '大肉丸子要起义', '1', null, null, null, null, '1', '2014-12-22 18:32:51');
INSERT INTO `user_customer` VALUES ('140', '13055520219', '41FC91F11AE17885A59723AC1B5C8367', null, 'sony', '1', null, null, null, null, '1', '2014-12-22 23:09:27');
INSERT INTO `user_customer` VALUES ('141', '18511566479', 'A89246004A980CC8497E4434FEF78249', null, '即客客官', '1', null, null, null, null, '1', '2014-12-23 15:44:01');
INSERT INTO `user_customer` VALUES ('142', '15712977285', '794F08D406EA1E8F8E8AC9F34AF97F4A', null, '激萌君>o<', '1', null, null, null, null, '1', '2014-12-23 18:54:04');
INSERT INTO `user_customer` VALUES ('143', '13691226393', '5568981217B0B91253ECCD2082346F13', null, '陈老七', '1', null, null, null, null, '1', '2014-12-23 20:37:10');
INSERT INTO `user_customer` VALUES ('144', '18610719599', 'F7D530719618E1AA2A3FA183C518F4BA', null, '袁启睦', '1', null, null, null, null, '1', '2014-12-23 21:41:27');
INSERT INTO `user_customer` VALUES ('145', '13910699788', '472F2DE3982D6C558C8A416140DB57DA', null, '洪哥', '1', null, null, null, null, '1', '2014-12-24 01:16:01');
INSERT INTO `user_customer` VALUES ('146', '13436066680', '5131C1FB12520084528EFC1819D42F7D', null, '默默了', '1', null, null, null, null, '1', '2014-12-24 09:32:58');
INSERT INTO `user_customer` VALUES ('147', '18612781478', '50C2995BA83A645D9AE3C281EAFF1A8C', null, '好孩子', '1', null, null, null, null, '1', '2014-12-24 14:19:57');
INSERT INTO `user_customer` VALUES ('148', '13186986147', '3FB846612C7E258079C58B371EB83395', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 10:03:40');
INSERT INTO `user_customer` VALUES ('149', '13817965638', 'C5B3BC875F896F6FC48207171D95517D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 10:04:38');
INSERT INTO `user_customer` VALUES ('150', '15715513876', '8326FD9F2286E19230E354A104EB9DB2', null, 'e_yaojian', '1', null, null, null, null, '1', '2014-12-25 10:33:35');
INSERT INTO `user_customer` VALUES ('151', '15508313355', '31993C2D73297DBA7502A5383716211F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 16:08:31');
INSERT INTO `user_customer` VALUES ('152', '13683663662', '17351B3D808402197924C27AEFB8F81A', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 16:49:59');
INSERT INTO `user_customer` VALUES ('153', '15540652355', '18FB5A1410B20487878255CCEE7BF9B7', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 16:56:33');
INSERT INTO `user_customer` VALUES ('154', '18513885952', '2FDA034EEFFCB78D1C0C5318200C550F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:01:59');
INSERT INTO `user_customer` VALUES ('155', '13718030288', '6C4F29F9B963FD15F708A21F779ACCBB', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:19:28');
INSERT INTO `user_customer` VALUES ('156', '13718517284', 'EE44CD4229D47BB3B815CAB4DA69ABD1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:21:33');
INSERT INTO `user_customer` VALUES ('157', '13146561236', '9B42BA593CC90C9A11A8EAF5A5F80C91', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:32:55');
INSERT INTO `user_customer` VALUES ('158', '15201140451', 'C7DA4D936973A3AAF6BE9215D93195AD', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:33:21');
INSERT INTO `user_customer` VALUES ('159', '18612602446', '9B54B2D21E702CE0094E2480B38819E8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 17:57:14');
INSERT INTO `user_customer` VALUES ('160', '13439030315', 'E5DB90B8BC644EFEA45C36B3DCAB23E6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-25 18:00:20');
INSERT INTO `user_customer` VALUES ('161', '18811030309', 'FD0E3B24EC5236EE68F3525AB61264CF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 12:24:42');
INSERT INTO `user_customer` VALUES ('162', '15527621051', '0AD7A33EDBCEA45AB2EA40E67416A0D9', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 13:28:09');
INSERT INTO `user_customer` VALUES ('163', '18600412412', 'FBB0CD9FE59475E6C68F63A15B7303D9', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 13:59:02');
INSERT INTO `user_customer` VALUES ('164', '13641156283', '1514CD1671154F895796F918A18B7367', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:08:53');
INSERT INTO `user_customer` VALUES ('165', '15712929373', 'A0B5E573F0391A89FB453A756E23425B', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:09:44');
INSERT INTO `user_customer` VALUES ('166', '18611285941', '64AA04B1A2637776FA9EC171EBFBCE8F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:12:48');
INSERT INTO `user_customer` VALUES ('167', '15110293779', '3BFAFA37BA081508D92678B0E98A6784', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:22:52');
INSERT INTO `user_customer` VALUES ('168', '18911058902', '67B92FD23817ED648A90E433BA04D947', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:32:28');
INSERT INTO `user_customer` VALUES ('169', '13671090465', '1309860BC952D82304FA29F9B67D0E32', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:36:09');
INSERT INTO `user_customer` VALUES ('170', '15010203400', 'B09ED15FA18CBF98267B1895747E09F1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:37:09');
INSERT INTO `user_customer` VALUES ('171', '13810876688', 'C23C76363FE7F338FD4A6E8A2377E7BC', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:50:54');
INSERT INTO `user_customer` VALUES ('172', '13269600667', '5871231BE00BE8E2950699E9A9FB0FF7', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 17:51:00');
INSERT INTO `user_customer` VALUES ('173', '15010579084', '5B15C931272976E99878034A181B6D65', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:03:10');
INSERT INTO `user_customer` VALUES ('174', '18612191476', '03C985F670E7439EFB5E07D02BF94632', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:06:08');
INSERT INTO `user_customer` VALUES ('175', '13671164760', 'CBEF434DBB527F201060D525BEEC731E', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:11:30');
INSERT INTO `user_customer` VALUES ('176', '17710057606', 'E6BA3ABD84B2E42F0D0BB660C41BF121', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:11:59');
INSERT INTO `user_customer` VALUES ('177', '13910512950', '99C371C49507E4ACED858E11D91D340A', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:12:50');
INSERT INTO `user_customer` VALUES ('178', '15010170508', '53636CB692461203FB5C4778CC8F8988', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:13:57');
INSERT INTO `user_customer` VALUES ('179', '18310528384', '78EC6CDDC69E60BBB013155301EC6C0B', null, '汪东双', '1', null, null, null, null, '1', '2014-12-26 18:31:28');
INSERT INTO `user_customer` VALUES ('180', '18975820914', 'CAC662EA0109557670DB3A984E1DA7F7', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:43:58');
INSERT INTO `user_customer` VALUES ('181', '13718500637', '6569B6F261FDD1C760B64C0E968570F4', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:53:34');
INSERT INTO `user_customer` VALUES ('182', '13699270837', '5082E230709EA34A0BF46591D425AF2D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:56:37');
INSERT INTO `user_customer` VALUES ('183', '15210829874', 'FD9802261B20DB0CD4D65676F9CAFEF6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 18:57:39');
INSERT INTO `user_customer` VALUES ('184', '18610148280', '90C07CCC3779F4330D5ED2D4AE890523', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 19:00:08');
INSERT INTO `user_customer` VALUES ('185', '18301225456', 'D5A8ACD9263B776DDC3C0D22A9E9EAC1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 19:06:35');
INSERT INTO `user_customer` VALUES ('186', '13311379458', '2FC8F736A2374E0D858821ED06052202', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 19:09:22');
INSERT INTO `user_customer` VALUES ('187', '13701237749', 'AD5980C75C4C7873FBC15B076030E6B4', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 19:09:42');
INSERT INTO `user_customer` VALUES ('188', '18954187063', '5E56DF9B15D2D4B1140EE1505BB8E9DF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-26 19:18:11');
INSERT INTO `user_customer` VALUES ('189', '18611294289', 'B7588A9EC69309573CAB21ECF507B630', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:27:47');
INSERT INTO `user_customer` VALUES ('190', '13311097865', 'EF8278DAC40F5C1047758F7BE3B09B0F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:30:46');
INSERT INTO `user_customer` VALUES ('191', '13811224881', 'DA6006BA73E0324FC6C555E0AF269F4C', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:30:49');
INSERT INTO `user_customer` VALUES ('192', '18612906009', '687544911E7EB82F3D7D71E74F017AC1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:31:47');
INSERT INTO `user_customer` VALUES ('193', '13581729406', '479E5A19C8A0E89C93B287C1FA43489E', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:34:09');
INSERT INTO `user_customer` VALUES ('194', '15011001208', '3F21DDA9ADC88237B162E9892B9A9267', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:35:42');
INSERT INTO `user_customer` VALUES ('195', '18401513689', '3E68EB6B5632BD92DF1F06422A9BB2FA', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:38:01');
INSERT INTO `user_customer` VALUES ('196', '18612372913', 'DDA7BB71C656E5DE0BD6A6AC2B9B1C51', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:38:10');
INSERT INTO `user_customer` VALUES ('197', '18612277663', '2B583F46AA09D3E356C30AA1064330CC', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:43:45');
INSERT INTO `user_customer` VALUES ('198', '18612359017', 'E6C2E0981DB24D88D55AC2A2D75A7C27', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:44:54');
INSERT INTO `user_customer` VALUES ('199', '13910412035', 'B745BBFD734C38067286E91A154D80B6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 13:47:32');
INSERT INTO `user_customer` VALUES ('200', '13691566301', 'FA8A9C28FFCCEF223A8447B23E2BA558', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 14:02:07');
INSERT INTO `user_customer` VALUES ('201', '18910188965', '3FCF6137CA345BF64CD45CD6DDC979CF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 14:02:39');
INSERT INTO `user_customer` VALUES ('202', '15904352288', '94C040A48ADB0BF99B85AD4367CF4624', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 14:08:19');
INSERT INTO `user_customer` VALUES ('203', '15810977617', '549B8D1137C9769E3B4C97024D97CC7A', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 14:22:54');
INSERT INTO `user_customer` VALUES ('204', '18618312280', '10607673BBB1BFD0BC13F0616DE8030B', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 15:10:33');
INSERT INTO `user_customer` VALUES ('205', '18210609368', 'B9CE6DFEB68A86CC718C26FF05A4D0C2', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 15:14:08');
INSERT INTO `user_customer` VALUES ('206', '13691506740', '036D75ED128A9EB296AD10462642A1D8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 15:24:02');
INSERT INTO `user_customer` VALUES ('207', '13161367330', 'FFE97806006FB647F1B24CA9BB82805F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 15:28:32');
INSERT INTO `user_customer` VALUES ('208', '13911554612', 'C8EB8F702D0F429C7FEA74FE73F84BA2', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 15:58:51');
INSERT INTO `user_customer` VALUES ('209', '13121779726', '44F09C3861ADB0547FB9546A26F83112', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 16:09:51');
INSERT INTO `user_customer` VALUES ('210', '15810697933', '2E91CB6AF4D0E0070F1A35A8998A1A3D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 16:28:59');
INSERT INTO `user_customer` VALUES ('211', '18620471916', '8A245653E72BB31425E7C2FED4782832', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 16:31:10');
INSERT INTO `user_customer` VALUES ('212', '13146318553', '5C8833241F906E57983F3D1D1841180C', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 16:32:50');
INSERT INTO `user_customer` VALUES ('213', '13301000486', '8114A7B185CCEBF9613E3CD78AA1FC71', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 16:53:50');
INSERT INTO `user_customer` VALUES ('214', '13439402915', 'BF0FCF7F539634A8232018867FD74C47', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:06:38');
INSERT INTO `user_customer` VALUES ('215', '18501341856', 'DB4B7BFE6DB1E6A3C4328C56863AA83D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:17:46');
INSERT INTO `user_customer` VALUES ('216', '13718721428', '799FC73E6D353BFFA6BA158BA6F7D6C8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:35:13');
INSERT INTO `user_customer` VALUES ('217', '18118316306', '90FAD7312B3722457B94440D5B0921F9', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:41:03');
INSERT INTO `user_customer` VALUES ('218', '13031085515', 'D72E49E46F420EAD288C2A883C49F7EB', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:56:12');
INSERT INTO `user_customer` VALUES ('219', '13693370563', 'AD74ECDE5B0C17766820D6AAA8BE71BC', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 17:58:59');
INSERT INTO `user_customer` VALUES ('220', '15210849909', '9C43D1C0B33D8FF96B09C68A3C2B0C77', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 18:15:39');
INSERT INTO `user_customer` VALUES ('221', '13904559561', '89A171D382A8B16C0312245E0E96A5A2', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 18:28:58');
INSERT INTO `user_customer` VALUES ('222', '13521866107', '3F977F907FB2F77B8190B4CA89F027B1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 18:30:12');
INSERT INTO `user_customer` VALUES ('223', '15001141216', 'DF6DCCAFDCB3AD464E47D3CCC1734791', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 18:32:07');
INSERT INTO `user_customer` VALUES ('224', '18301491605', '458E36D22724E950608159C0CFF598F8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 18:32:20');
INSERT INTO `user_customer` VALUES ('225', '18921291558', '281CCC19267C578DC6F592C7C9F04C84', null, '即客客官', '1', null, null, null, null, '1', '2014-12-27 23:22:21');
INSERT INTO `user_customer` VALUES ('226', '13366251661', '5C94B400D638FA457FFA09B014AA3A40', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:07:18');
INSERT INTO `user_customer` VALUES ('227', '13034408686', '4978DF272701F2004B1BD562416A4D53', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:32:16');
INSERT INTO `user_customer` VALUES ('228', '13810945214', '653FF9F53747709D0FE942644392E0FD', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:33:37');
INSERT INTO `user_customer` VALUES ('229', '13683176069', '7EBCFB190B9F0EC8D24ECDBC54F98CD8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:36:59');
INSERT INTO `user_customer` VALUES ('230', '13910053864', '9361EB1796C6615F6E3B5DFB9EDA0090', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:39:00');
INSERT INTO `user_customer` VALUES ('231', '13240283967', '2D3E5DAD77457648B66F7875BBC0FB06', null, '13240283967', '1', null, null, null, null, '1', '2014-12-28 12:39:02');
INSERT INTO `user_customer` VALUES ('232', '18518367523', '965853148CFAF26401A1782CC118A3EB', null, '18518367523', '1', null, null, null, null, '1', '2014-12-28 12:39:05');
INSERT INTO `user_customer` VALUES ('233', '15301309523', 'F3912F24B4E04360B07B468CEA4FAEBB', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:49:07');
INSERT INTO `user_customer` VALUES ('234', '18600330408', '527667F5AFA74D957878BAFE929DC96A', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:52:57');
INSERT INTO `user_customer` VALUES ('235', '18310275363', 'FCE081F2EFB0002E15F08FB8CE52E0A1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:54:31');
INSERT INTO `user_customer` VALUES ('236', '13161384696', '29947A5516D2DD42E74560E820CA767E', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 12:57:37');
INSERT INTO `user_customer` VALUES ('237', '15300055001', 'B44510CFAF636F714BD7CFACDBC66675', null, '15300055001', '1', null, null, null, null, '1', '2014-12-28 13:01:58');
INSERT INTO `user_customer` VALUES ('238', '17710035211', '77639FD27A5DADB84BCC7FDFD67130BD', null, '17710035211', '1', null, null, null, null, '1', '2014-12-28 13:02:08');
INSERT INTO `user_customer` VALUES ('239', '15801080253', '9586A0184F835F6C3A27D59B9330C2EF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:09:44');
INSERT INTO `user_customer` VALUES ('240', '18510509686', '3595E92AD68301E5DE187BF823FB1B8E', null, '18510509686', '1', null, null, null, null, '1', '2014-12-28 13:14:21');
INSERT INTO `user_customer` VALUES ('241', '13161863834', 'BF19F51321C36AC6D1BAA46765DD4954', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:24:26');
INSERT INTO `user_customer` VALUES ('242', '13488691981', '222EC0C5D4B6896B058E98EE18290EF6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:31:10');
INSERT INTO `user_customer` VALUES ('243', '13810205984', '7B9FEEBEA49FBE3C1BAE5DBD9B791B2C', null, '13810205984', '1', null, null, null, null, '1', '2014-12-28 13:40:30');
INSERT INTO `user_customer` VALUES ('244', '15001399197', '61D6C563E22AE4140A55A47A71DACEAA', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:44:44');
INSERT INTO `user_customer` VALUES ('245', '13381130882', 'CE75F9A14BCDE04EE70C38285E4450E4', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:45:22');
INSERT INTO `user_customer` VALUES ('246', '18600332721', '822141BFF7D6A579E91F2664407BF363', null, '18600332721', '1', null, null, null, null, '1', '2014-12-28 13:52:49');
INSERT INTO `user_customer` VALUES ('247', '13716861735', '053AAC2E3E19615952BDF3B3CD662C4A', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:53:28');
INSERT INTO `user_customer` VALUES ('248', '13522020106', 'D51302C2C3B0B0DBA6D09480D2C70DBF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 13:58:55');
INSERT INTO `user_customer` VALUES ('249', '18210471097', 'A910931DA947F6AB69A9ECAAD79CE859', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:00:10');
INSERT INTO `user_customer` VALUES ('250', '13520368727', '88C60F56EA728FBF8A7D50CD93E7EC38', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:05:28');
INSERT INTO `user_customer` VALUES ('251', '18310791602', '7962CA6A77E1743B5E14FD58BDB19A2F', null, '18310791602', '1', null, null, null, null, '1', '2014-12-28 14:13:59');
INSERT INTO `user_customer` VALUES ('252', '18310816135', '72EB6038DBC792732A9CB69408E22699', null, '18310816135', '1', null, null, null, null, '1', '2014-12-28 14:16:02');
INSERT INTO `user_customer` VALUES ('253', '15210465262', 'B3447A5B33361547916D5C307519B774', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:19:36');
INSERT INTO `user_customer` VALUES ('254', '18101150578', '2C58E5F1AA86C307601AA8066B245597', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:24:39');
INSERT INTO `user_customer` VALUES ('255', '18513114055', 'F1C9FC0231B3CB92653819103AA3A2A3', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:24:59');
INSERT INTO `user_customer` VALUES ('256', '13911131219', '3850887BB37C40A0BACF69CD91197210', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 14:25:48');
INSERT INTO `user_customer` VALUES ('257', '13810490123', 'C1EAA566EBA1428038CE4F78312DC37C', null, '13810490123', '1', null, null, null, null, '1', '2014-12-28 14:55:09');
INSERT INTO `user_customer` VALUES ('258', '18600758815', 'DA4E96D7D4C92A383E219A9AF54D5990', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:02:04');
INSERT INTO `user_customer` VALUES ('259', '13691356637', 'F75792DD4BFE0627E0B4141723B16076', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:03:27');
INSERT INTO `user_customer` VALUES ('260', '13810686267', '624F6431F1ECE63A8601F236C3DF8F6D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:03:37');
INSERT INTO `user_customer` VALUES ('261', '15110276665', 'B66C93672AC043871CDE751AD300A7F9', null, '15110276665', '1', null, null, null, null, '1', '2014-12-28 15:04:33');
INSERT INTO `user_customer` VALUES ('262', '18301386936', '48DCDC693AE7105E6C2D5285F8E18EB6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:06:27');
INSERT INTO `user_customer` VALUES ('263', '18710166585', '1AB412A69BB16CA86FD01D55779081F9', null, '18710166585', '1', null, null, null, null, '1', '2014-12-28 15:08:27');
INSERT INTO `user_customer` VALUES ('264', '18701060018', '38B62E31C4B4EB1F835988954BAF989C', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:09:27');
INSERT INTO `user_customer` VALUES ('265', '18911932217', '2B9CF9FA48FE2FF559D2105F1D80A448', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:15:55');
INSERT INTO `user_customer` VALUES ('266', '13581712556', '0874617E8F12AAB728D8C40379B74C90', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:20:01');
INSERT INTO `user_customer` VALUES ('267', '17001195159', '1246BA41EE0800595DA811D8FD000B3B', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 15:37:11');
INSERT INTO `user_customer` VALUES ('268', '18610883540', 'B54C0051DF6F0DEBE767309E5C9AFA3F', null, '18610883540', '1', null, null, null, null, '1', '2014-12-28 15:42:12');
INSERT INTO `user_customer` VALUES ('269', '18101033933', 'EAB0A19498F234C1C1ACDBC88BE12336', null, '18101033933', '1', null, null, null, null, '1', '2014-12-28 16:08:19');
INSERT INTO `user_customer` VALUES ('270', '15911175321', 'F96D3828D55325699564674556A42F6F', null, '15911175321', '1', null, null, null, null, '1', '2014-12-28 16:18:33');
INSERT INTO `user_customer` VALUES ('271', '15810613949', 'B8F127EF867335B811794B0C31198E8C', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:20:20');
INSERT INTO `user_customer` VALUES ('272', '18911761101', '491EC47397B6643A606095AB06346D40', null, '18911761101', '1', null, null, null, null, '1', '2014-12-28 16:21:04');
INSERT INTO `user_customer` VALUES ('273', '18710040153', '515131E208E0992474917803C731503B', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:21:55');
INSERT INTO `user_customer` VALUES ('274', '13381225415', '031BD790768FB3317269B0FC87CEB8F6', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:27:15');
INSERT INTO `user_customer` VALUES ('275', '15300232900', '2073AFEF0272F928AD3CECFC1316B8EC', null, '15300232900', '1', null, null, null, null, '1', '2014-12-28 16:27:16');
INSERT INTO `user_customer` VALUES ('277', '13701143258', 'AFBFF4045B3262D528D3F753A3AD7992', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:35:29');
INSERT INTO `user_customer` VALUES ('278', '13901362190', '169C82A8AF24E03CD5DAABC33E81EFBA', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:43:13');
INSERT INTO `user_customer` VALUES ('279', '18511218231', '1561A9B3F94BF46B94C690E04320FA1D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:51:01');
INSERT INTO `user_customer` VALUES ('280', '15801637569', '0AF98C739DDF39CFF60AD0695F609FDE', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:57:38');
INSERT INTO `user_customer` VALUES ('281', '13343120227', 'D4D0AE44AEE853A711C2282CC06EEEE8', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 16:59:02');
INSERT INTO `user_customer` VALUES ('282', '13366963499', 'DC1E3C21814336E109335D66456AFC4F', null, '13366963499', '1', null, null, null, null, '1', '2014-12-28 17:08:44');
INSERT INTO `user_customer` VALUES ('283', '18811559437', '1162DE698BD1FD98AAAD023A299CD287', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 17:13:47');
INSERT INTO `user_customer` VALUES ('284', '15110206243', '653FE0A8ECDCF37D4BBC3B7520962A6F', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 17:15:29');
INSERT INTO `user_customer` VALUES ('285', '15601100320', '19C2B19C6FB1E7B406093B0D0A9832F1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 17:21:31');
INSERT INTO `user_customer` VALUES ('286', '13366665604', 'FBCC7E93FA2B20BEFBE402F78CE88E2D', null, '13366665604', '1', null, null, null, null, '1', '2014-12-28 17:27:35');
INSERT INTO `user_customer` VALUES ('287', '13811277984', '8FC2FD053A824AFAC16705D6E14EE6BB', null, '即客客官', '1', null, null, null, null, '1', '2014-12-28 17:43:44');
INSERT INTO `user_customer` VALUES ('288', '13439386782', 'BDCA5C7B6AF7CFA12ACF4CED3D5BC005', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 12:47:43');
INSERT INTO `user_customer` VALUES ('289', '15010630616', '253D6B4C9D124BE72E56574CEF3A0DC4', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:01:40');
INSERT INTO `user_customer` VALUES ('290', '15810917119', 'D89CFC7B5CB3D2262E605E571F667B25', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:05:07');
INSERT INTO `user_customer` VALUES ('291', '18610070469', 'A84AED0CA61135ABEB43B46FA0C7D462', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:21:03');
INSERT INTO `user_customer` VALUES ('292', '13269006167', '735E6EF24C023F55B34EA7E17F558BED', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:30:21');
INSERT INTO `user_customer` VALUES ('293', '15810259693', 'E8354DB62919C2FC1F5F74D8156C3605', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:32:23');
INSERT INTO `user_customer` VALUES ('294', '13520206687', '2AE1218F98FA449EE8FF7D3F6C84B07D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 13:47:07');
INSERT INTO `user_customer` VALUES ('295', '13901153478', 'D232534D613962ABC48D5B212A527AFF', null, '13901153478', '1', null, null, null, null, '1', '2014-12-29 13:54:06');
INSERT INTO `user_customer` VALUES ('296', '18611729876', 'E025B857577581EF68EAEAD6EA155711', null, '18611729876', '1', null, null, null, null, '1', '2014-12-29 13:55:27');
INSERT INTO `user_customer` VALUES ('297', '13488838220', '4AD38F08A89FFF2BFBBAB2D044226C13', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 14:50:33');
INSERT INTO `user_customer` VALUES ('298', '18701595465', '1EF86C17F17EDBA2C76C05C08232FADD', null, '18701595465', '1', null, null, null, null, '1', '2014-12-29 15:40:01');
INSERT INTO `user_customer` VALUES ('299', '15311433257', '14BF735FFCF8DC1716AA4039AD34E6B0', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 16:22:19');
INSERT INTO `user_customer` VALUES ('300', '13426358073', '129F02D169FD0F63317CF29B200B3CDE', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 16:22:48');
INSERT INTO `user_customer` VALUES ('301', '18122115205', '91786A1E3A2F3C97A45D71BBD1EDC0EA', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 16:28:01');
INSERT INTO `user_customer` VALUES ('302', '18911165552', 'FC0D2766569F74AAB60D9341E6BD62A9', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 16:30:04');
INSERT INTO `user_customer` VALUES ('303', '13321192928', 'BC919EC3011096C9586E2E0FA0B4AF7E', null, '13321192928', '1', null, null, null, null, '1', '2014-12-29 16:30:09');
INSERT INTO `user_customer` VALUES ('304', '15600898848', '827B33A49047E14DAE04A511EDA97CBF', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 16:33:40');
INSERT INTO `user_customer` VALUES ('305', '18310717321', 'BDF20C4C1D72440C79D434DC62790C08', null, '18310717321', '1', null, null, null, null, '1', '2014-12-29 17:14:09');
INSERT INTO `user_customer` VALUES ('306', '13910239121', 'A9ACD8A94390D02465393B5A3C1C2A84', null, '即客客官', '1', null, null, null, null, '1', '2014-12-29 18:07:01');
INSERT INTO `user_customer` VALUES ('307', '18660554279', '781460F6A739C75F90ACCBFA4720C62C', null, '18660554279', '1', null, null, null, null, '1', '2014-12-29 18:10:04');
INSERT INTO `user_customer` VALUES ('308', '15611461816', '4159425ECA170D4229558188239ED612', null, '15611461816', '1', null, null, null, null, '1', '2014-12-30 14:14:10');
INSERT INTO `user_customer` VALUES ('309', '15237997402', '599962358E8F537AB5E32582AC43A9AD', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 16:09:40');
INSERT INTO `user_customer` VALUES ('310', '18710066280', '923554CBD0EBDF698CF63789F6BD0AF2', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 16:13:16');
INSERT INTO `user_customer` VALUES ('311', '18101077824', '187B50E97379DABD04902BC8350BEACC', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 16:13:57');
INSERT INTO `user_customer` VALUES ('312', '15930155963', '3F487DD88634DBD53ED30083D2E70ED7', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 16:44:35');
INSERT INTO `user_customer` VALUES ('313', '13901092426', '6682545AC40FA08AAAF87B9ED8D94F76', null, '13901092426', '1', null, null, null, null, '1', '2014-12-30 16:58:53');
INSERT INTO `user_customer` VALUES ('314', '18501153897', 'BC2B2E9C184AD0A5465A03877DF8F1D8', null, '18501153897', '1', null, null, null, null, '1', '2014-12-30 17:10:57');
INSERT INTO `user_customer` VALUES ('315', '18201647037', '5BFAFECC8BDFE34955D7376B6061395D', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:23:54');
INSERT INTO `user_customer` VALUES ('316', '18210940897', '6E017251B4D2B8DDB133EFFABE44BFDD', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:26:53');
INSERT INTO `user_customer` VALUES ('317', '18001301386', '66F7168CA7DB03D851A367B8E14B9D03', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:30:01');
INSERT INTO `user_customer` VALUES ('318', '13321190396', '102FF9CA7AA1888EC392F732DABEE058', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:45:54');
INSERT INTO `user_customer` VALUES ('319', '18601255572', '1D741ABDBA36A88C30753878C79F53C2', null, '18601255572', '1', null, null, null, null, '1', '2014-12-30 17:54:33');
INSERT INTO `user_customer` VALUES ('320', '13641337831', '6E899D233E5B6EBDCDEBDA2865B87B69', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:56:53');
INSERT INTO `user_customer` VALUES ('321', '18701128231', '9BB1D362F4FB9DD0CF5F51A64AD42E58', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 17:58:24');
INSERT INTO `user_customer` VALUES ('322', '18910146335', '6D00F0B0F6E6D476EF1C9DEAE4B78C29', null, '即客客官', '1', null, null, null, null, '1', '2014-12-30 18:09:36');
INSERT INTO `user_customer` VALUES ('323', '18500080403', 'E4FC28E4FF7F7178C43FEA9082D55968', null, '18500080403', '1', null, null, null, null, '1', '2014-12-30 18:31:58');
INSERT INTO `user_customer` VALUES ('324', '13381022739', '40AF3542DCC47869E7DD9A31F2D32A67', null, '即客客官', '1', null, null, null, null, '1', '2014-12-31 09:52:03');
INSERT INTO `user_customer` VALUES ('325', '13180218899', '8C28386EDF3547FB7F65412FFE12D7BE', null, '即客客官', '1', null, null, null, null, '1', '2014-12-31 13:36:32');
INSERT INTO `user_customer` VALUES ('326', '15110268816', '0F3C007E0AB4999A84FE025C4BD7EE50', null, '15110268816', '1', null, null, null, null, '1', '2014-12-31 13:48:32');
INSERT INTO `user_customer` VALUES ('327', '13752037088', '74D93279C0371846FDB36B6EBDA9C5D1', null, '即客客官', '1', null, null, null, null, '1', '2014-12-31 15:58:38');
INSERT INTO `user_customer` VALUES ('328', '15830771082', '237ABF5A16854A532963ED6FE25E50D7', null, '即客客官', '1', null, null, null, null, '1', '2014-12-31 17:56:37');
INSERT INTO `user_customer` VALUES ('329', '13521742139', '4606C5EC53F321097D32F86BEF7A33C2', null, '13521742139', '1', null, null, null, null, '1', '2014-12-31 22:02:34');
INSERT INTO `user_customer` VALUES ('330', '15092493161', 'C343E841DC810C216340F613187414E1', null, '记得爱', '1', null, null, null, null, '1', '2015-01-01 09:32:00');
INSERT INTO `user_customer` VALUES ('331', '13911533135', '8097196DC29D6EFC562B614FB820D685', null, '13911533135', '1', null, null, null, null, '1', '2015-01-01 10:59:07');
INSERT INTO `user_customer` VALUES ('332', '13261868828', '5A7C53D9015E67033717470273E9761D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:02:11');
INSERT INTO `user_customer` VALUES ('333', '13021214192', '26369D0B0C04F6757E5CE9FA24565871', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:04:23');
INSERT INTO `user_customer` VALUES ('334', '13161710489', '504499AA73E59780F13219AD506DFE28', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:05:11');
INSERT INTO `user_customer` VALUES ('335', '13552566783', 'C90BACE19B869604AE23A67315A2C7C8', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:05:30');
INSERT INTO `user_customer` VALUES ('336', '18910664583', 'FB51AF91294DA945A7E345A8E3800084', null, '18910664583', '1', null, null, null, null, '1', '2015-01-01 12:14:31');
INSERT INTO `user_customer` VALUES ('337', '15811200613', 'BA8CDBCFDA65CAF388A22CB4ACD01351', null, '15811200613', '1', null, null, null, null, '1', '2015-01-01 12:25:49');
INSERT INTO `user_customer` VALUES ('338', '18600171848', '839216D4B02F1243F0EF6A56C0B44E85', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:26:41');
INSERT INTO `user_customer` VALUES ('339', '15311181165', 'AE81071875A4E94AD5D3951B18D900BD', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 12:51:04');
INSERT INTO `user_customer` VALUES ('340', '15600729371', '254021E9837BDC687D1D82DB90F483D8', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 13:49:01');
INSERT INTO `user_customer` VALUES ('341', '18545307361', '42846BDEF3E238D96206CCFF8FF6838B', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 13:50:52');
INSERT INTO `user_customer` VALUES ('342', '13260274520', 'BAA038E384C49F18CB18C08B240F5CD4', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 13:54:41');
INSERT INTO `user_customer` VALUES ('343', '13241246576', 'BBC5B96ED1AC9D3080B92EA6E991AA63', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 14:01:29');
INSERT INTO `user_customer` VALUES ('344', '13522584020', '1598D186024267E7415E531C49AD0800', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 14:02:34');
INSERT INTO `user_customer` VALUES ('345', '18201126897', 'FB2D896E609F831B0CEC7A645298AB39', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 14:31:28');
INSERT INTO `user_customer` VALUES ('346', '18518367625', '339FC758B130219C4D5535BD900B5C78', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 14:41:02');
INSERT INTO `user_customer` VALUES ('347', '13161604003', 'BF221777A6ECFEC5379EEF3BD57FC9D6', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 14:52:17');
INSERT INTO `user_customer` VALUES ('348', '18610634674', 'BB10AA7E5D487A1E8CF1444F52352392', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:00:37');
INSERT INTO `user_customer` VALUES ('349', '18610275597', 'E476CF4928C67AF0BDCF77475557A0BC', null, '18610275597', '1', null, null, null, null, '1', '2015-01-01 15:01:55');
INSERT INTO `user_customer` VALUES ('350', '18201518654', '1C9A56C010ADA24E5B7A935A4D9AB937', null, '18201518654', '1', null, null, null, null, '1', '2015-01-01 15:07:17');
INSERT INTO `user_customer` VALUES ('351', '15210073559', '86E3C16460818E100982584E5795DBA8', null, '15210073559', '1', null, null, null, null, '1', '2015-01-01 15:10:47');
INSERT INTO `user_customer` VALUES ('352', '18601248636', 'B5ADEC78FBE33D12D1423FAC69B05DE7', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:10:54');
INSERT INTO `user_customer` VALUES ('353', '18701048672', 'E2DDFB4BA3FD3450F0F5DFB8DAC262A7', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:13:34');
INSERT INTO `user_customer` VALUES ('354', '18301432601', '3B353F338884DF9B5F2E2CFA3FAC6278', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:15:31');
INSERT INTO `user_customer` VALUES ('355', '18600418989', 'BC34FA22382A44D38EBAF2D4AF669838', null, '18600418989', '1', null, null, null, null, '1', '2015-01-01 15:19:46');
INSERT INTO `user_customer` VALUES ('356', '13994241083', '4B431CDFD5964D8DCA58DD5ECE08605B', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:25:33');
INSERT INTO `user_customer` VALUES ('357', '18510736978', 'BB21C39D26D795915D9FD05E6DF6551F', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 15:29:31');
INSERT INTO `user_customer` VALUES ('358', '15810564389', '2116FC1BE91EA53F9549055F158A1D42', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 16:00:32');
INSERT INTO `user_customer` VALUES ('359', '18201418190', '8E8B5B5BFE5FD9FF9D7073BF635AAC3A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 16:08:02');
INSERT INTO `user_customer` VALUES ('360', '18500956950', '23983A6EC3216F5A605BEDFCE4EE19B4', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 16:17:37');
INSERT INTO `user_customer` VALUES ('361', '13141104445', 'C39A2699A13E20E12C9E2532C38A9132', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 16:44:18');
INSERT INTO `user_customer` VALUES ('362', '13671022780', 'B76B801C751AF49D0ECFADCE26A3856D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 16:50:45');
INSERT INTO `user_customer` VALUES ('363', '13401103733', 'FA2E0EFB1C76723E3A16EC7D74FC0952', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:00:44');
INSERT INTO `user_customer` VALUES ('364', '18513785289', 'C74073A2D0B240E1C16BC1E9DC6B4492', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:11:51');
INSERT INTO `user_customer` VALUES ('365', '18672851691', 'A4CE5BDF372E729C0724054495654DE9', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:13:48');
INSERT INTO `user_customer` VALUES ('366', '13693663606', '8B20CB3B240463E024F54EC31CEC9F6F', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:25:55');
INSERT INTO `user_customer` VALUES ('367', '15313228633', '741E66DA04434A8349B2D7E217B84C71', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:27:51');
INSERT INTO `user_customer` VALUES ('368', '13121984213', 'DDC236A3E8024FC30A7B3E4964AC9F21', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 17:39:42');
INSERT INTO `user_customer` VALUES ('369', '18610089225', '21DF1007E62FCEC4CA2380E5884B84DC', null, '即客客官', '1', null, null, null, null, '1', '2015-01-01 18:10:50');
INSERT INTO `user_customer` VALUES ('370', '18600360466', 'F3C022F3ED424B71F1931633E508102F', null, '18600360466', '1', null, null, null, null, '1', '2015-01-01 19:14:09');
INSERT INTO `user_customer` VALUES ('371', '15010803554', '3E1F17D5AED64DAFB32B9A56F80C40E2', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 09:51:21');
INSERT INTO `user_customer` VALUES ('372', '15910551150', '8958E6298331672A192EB4A9BD54AC9E', null, '芳芳', '1', null, null, null, null, '1', '2015-01-02 12:55:26');
INSERT INTO `user_customer` VALUES ('373', '18910120779', '6559BEB6C78846C573BE07D0C4934AA6', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:01:48');
INSERT INTO `user_customer` VALUES ('374', '15210051692', '4DCF51394619A1221F57BF2CFB2ABB06', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:04:51');
INSERT INTO `user_customer` VALUES ('375', '18201272539', '9CEB6ABBBA020D4C7640CDF76223EDBE', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:06:06');
INSERT INTO `user_customer` VALUES ('376', '18810078501', 'E6E3B4D42274BBE02603080933099EE9', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:11:23');
INSERT INTO `user_customer` VALUES ('377', '13691275450', 'C765D2203869556F821D9487478B17DE', null, '13691275450', '1', null, null, null, null, '1', '2015-01-02 13:12:12');
INSERT INTO `user_customer` VALUES ('378', '18810079550', '7DCE348BB59792EF86D0DDE8DAE626F8', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:12:57');
INSERT INTO `user_customer` VALUES ('379', '13436963458', '09F001A5C64C06D73AB598C6035BBBB5', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:18:03');
INSERT INTO `user_customer` VALUES ('380', '18515661998', '9C817DD29B2E35B8A099B6A06C93C89C', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:20:26');
INSERT INTO `user_customer` VALUES ('381', '13828015890', '81CE16DAE8E41E4C4BDC3522A051F414', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:21:25');
INSERT INTO `user_customer` VALUES ('382', '15011217707', '94390185B664CDB00BB0C30420DD5D1B', null, '15011217707', '1', null, null, null, null, '1', '2015-01-02 13:28:57');
INSERT INTO `user_customer` VALUES ('383', '13521338265', '52CD2B1CB45C81A9883886054A5E0D9E', null, '13521338265', '1', null, null, null, null, '1', '2015-01-02 13:39:47');
INSERT INTO `user_customer` VALUES ('384', '15810055687', 'F333F2D04C1A6898BFA09172E236FBD7', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:52:05');
INSERT INTO `user_customer` VALUES ('385', '18515493673', '6680D601F00B97C1482EB298383DF511', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 13:58:46');
INSERT INTO `user_customer` VALUES ('386', '13681506074', 'FBF1F7693065CAA7A55934DEEE739632', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:00:45');
INSERT INTO `user_customer` VALUES ('387', '18513336502', '66D764B4109B39D243F1D439254AAB24', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:03:01');
INSERT INTO `user_customer` VALUES ('388', '13072220137', '0052E13CEE8826415224E52A5693C00D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:25:00');
INSERT INTO `user_customer` VALUES ('389', '18515948980', '63080E4417F374D9AA671BB58170DE6E', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:25:52');
INSERT INTO `user_customer` VALUES ('390', '17701350495', 'FC4C57317D3BF8B52ED8A1CF8F7F4721', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:26:14');
INSERT INTO `user_customer` VALUES ('391', '17090142795', 'D84AA13498E8C232F1824B64644B1708', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:28:11');
INSERT INTO `user_customer` VALUES ('392', '18501212482', '7DE5CA4F5A090C26BBF7FA42027D78E1', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 14:30:51');
INSERT INTO `user_customer` VALUES ('393', '18611527854', '428B456A72F3E28C7A2F4DB1F5628B68', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 15:23:45');
INSERT INTO `user_customer` VALUES ('394', '18612057897', '0FD84EB5FF9D3C2248441FB66DEFDEFB', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 15:24:11');
INSERT INTO `user_customer` VALUES ('395', '18601147984', '941DB0421AB86B5700A24F5C39D07817', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 15:29:01');
INSERT INTO `user_customer` VALUES ('396', '15201086074', '6D6487491D512A6ADB14D88260D5C67E', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 15:31:38');
INSERT INTO `user_customer` VALUES ('397', '15201407301', '1D0AB06FD499A5E11C380A4B63CBA3C7', null, '即客客官', '1', null, null, null, null, '1', '2015-01-02 15:34:11');
INSERT INTO `user_customer` VALUES ('398', '15868287730', '76F99D26054EFFEC70D9C3A36E4CB268', null, 'Sendex', '1', null, null, null, null, '1', '2015-01-03 05:27:51');
INSERT INTO `user_customer` VALUES ('399', '13681446682', 'FDCA82623BF926CDF19799C56DDF6E62', null, '即客客官', '1', null, null, null, null, '1', '2015-01-03 14:37:58');
INSERT INTO `user_customer` VALUES ('400', '13917407567', 'EFCD47951BCF2E8DC339B52EE32F2EBB', null, '即客客官', '1', null, null, null, null, '1', '2015-01-03 15:03:14');
INSERT INTO `user_customer` VALUES ('401', '18600705556', '9C2DFD88A6AECD003B1CBB03EDFA7AEC', null, '18600705556', '1', null, null, null, null, '1', '2015-01-03 23:19:53');
INSERT INTO `user_customer` VALUES ('402', '13818157939', 'FC5C51CF6E76D51EED1EA8989C8C28FB', null, '即客客官', '1', null, null, null, null, '1', '2015-01-04 01:18:11');
INSERT INTO `user_customer` VALUES ('403', '13512268195', '8D2542C6077E3977A3BECB41EEBF903A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-04 08:46:29');
INSERT INTO `user_customer` VALUES ('404', '15602326944', '6B209DF4BF88689EC6E41EC287E70B9F', null, '即客客官', '1', null, null, null, null, '1', '2015-01-04 20:01:30');
INSERT INTO `user_customer` VALUES ('405', '18600397857', '8B0FCEFFEBF1286BD1770F36481BA645', null, '即客客官', '1', null, null, null, null, '1', '2015-01-04 22:12:40');
INSERT INTO `user_customer` VALUES ('406', '18642686588', 'D5272934A5B4DCB451AAFA14A3A4E60D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-04 22:17:32');
INSERT INTO `user_customer` VALUES ('407', '18971715446', 'F40DF2262970F5981CA6760A468C7D13', null, '18971715446', '1', null, null, null, null, '1', '2015-01-04 22:41:57');
INSERT INTO `user_customer` VALUES ('408', '13474472587', '55CA7BD4B7FEAB8C7DD92CD57914DDD6', null, '13474472587', '1', null, null, null, null, '1', '2015-01-05 10:51:24');
INSERT INTO `user_customer` VALUES ('409', '13712338666', 'C310F845DE90AE5FF5FF1B3FF5D7B27A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-05 11:05:22');
INSERT INTO `user_customer` VALUES ('410', '18701006675', '94C57924C4D8C6A456E3D0C617A21355', null, '即客客官', '1', null, null, null, null, '1', '2015-01-05 16:11:14');
INSERT INTO `user_customer` VALUES ('411', '13439196957', '9F3A958D293623349EACA75884BCC83A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-05 21:16:59');
INSERT INTO `user_customer` VALUES ('412', '15911185981', 'D042C08BC83EC1FE3DF87841B267B864', null, '即客客官', '1', null, null, null, null, '1', '2015-01-05 21:42:26');
INSERT INTO `user_customer` VALUES ('413', '13827775615', '496C0FFB2D493F35B474671F013147BD', null, '13827775615', '1', null, null, null, null, '1', '2015-01-07 10:14:49');
INSERT INTO `user_customer` VALUES ('414', '13146007715', '0C783830B6A672648404E626AA8D7B5D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-07 12:15:37');
INSERT INTO `user_customer` VALUES ('415', '13439045142', '02DEDCAD35A4EFA516005430300F0D18', null, 'Fanxingnet', '1', null, null, null, null, '1', '2015-01-07 22:11:47');
INSERT INTO `user_customer` VALUES ('416', '18681522581', '6469D9952E6EA6DE2D02D41E8B4B8682', null, '萝卜上的花', '1', null, null, null, null, '1', '2015-01-08 01:42:55');
INSERT INTO `user_customer` VALUES ('417', '13501278061', '4E5C45FBF7D1BCBFB4C2DB0394BF7EF3', null, '13501278061', '1', null, null, null, null, '1', '2015-01-09 12:25:25');
INSERT INTO `user_customer` VALUES ('418', '15100177101', '052E013E5E896C050A90616AFE9C667B', null, '即客客官', '1', null, null, null, null, '1', '2015-01-09 13:10:00');
INSERT INTO `user_customer` VALUES ('419', '15188951957', 'E32C40D6B7984A69F85435741D59D9A8', null, '即客客官', '1', null, null, null, null, '1', '2015-01-09 13:10:21');
INSERT INTO `user_customer` VALUES ('420', '13811531152', '11DD99CCB1F06978C2E209E92D418E35', null, '13811531152', '1', null, null, null, null, '1', '2015-01-10 12:05:26');
INSERT INTO `user_customer` VALUES ('421', '17701125909', 'F1A322811797FCBEC67A4EA37AC6B090', null, '即客客官', '1', null, null, null, null, '1', '2015-01-10 12:38:20');
INSERT INTO `user_customer` VALUES ('422', '15811238688', 'C7A783506086B526E9642E8E4BF5937D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-10 12:41:20');
INSERT INTO `user_customer` VALUES ('423', '15201278776', 'C6146667D9BB0574AC59589335E80329', null, '即客客官', '1', null, null, null, null, '1', '2015-01-10 13:45:21');
INSERT INTO `user_customer` VALUES ('424', '18910487282', '876ED2D9D682D0DDFD8DC99A158A577F', null, '18910487282', '1', null, null, null, null, '1', '2015-01-10 14:07:07');
INSERT INTO `user_customer` VALUES ('425', '13601268948', '815618891FCE156AAB0E50651170F63A', null, '13601268948', '1', null, null, null, null, '1', '2015-01-10 15:49:11');
INSERT INTO `user_customer` VALUES ('426', '18600394477', '2F536A8DD22FDE16761DFC9647B5CCE1', null, '即客客官', '1', null, null, null, null, '1', '2015-01-10 16:32:22');
INSERT INTO `user_customer` VALUES ('427', '13821049319', 'D93801C9DABCEF8BD1922C03D00E8320', null, '即客客官', '1', null, null, null, null, '1', '2015-01-11 12:16:43');
INSERT INTO `user_customer` VALUES ('428', '15600359107', '8941ADDC5851A177D0B26C8CFFA8F248', null, '即客客官', '1', null, null, null, null, '1', '2015-01-11 19:35:27');
INSERT INTO `user_customer` VALUES ('429', '18696478489', 'AC41C1FDCA291A3BE817AA7ABA187860', null, '即客客官', '1', null, null, null, null, '1', '2015-01-11 21:23:47');
INSERT INTO `user_customer` VALUES ('430', '15947477710', 'C838BC914D94F37897C8640EBDC9EA1F', null, '即客客官', '1', null, null, null, null, '1', '2015-01-12 15:46:31');
INSERT INTO `user_customer` VALUES ('431', '18611409129', '903A2184418DB0FF1A03771148EEBF36', null, '即客客官', '1', null, null, null, null, '1', '2015-01-12 18:36:31');
INSERT INTO `user_customer` VALUES ('432', '18618125725', '8327C36E0182A604C088E752AF7B439D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-12 20:10:13');
INSERT INTO `user_customer` VALUES ('433', '18663111786', '4BD4DA200DD2840C6BB5F939007A3D33', null, '即客客官', '1', null, null, null, null, '1', '2015-01-14 01:09:00');
INSERT INTO `user_customer` VALUES ('434', '15600180980', 'DB95F89B5CF5F45375D38F9D43EEF068', null, '15600180980', '1', null, null, null, null, '1', '2015-01-15 13:28:38');
INSERT INTO `user_customer` VALUES ('435', '13811524460', '01A0B221F875C760BAF0DB30CF325073', null, '13811524460', '1', null, null, null, null, '1', '2015-01-17 13:12:14');
INSERT INTO `user_customer` VALUES ('436', '18724543622', '26657934288E309D06915CF21271C1E2', null, '即客客官', '1', null, null, null, null, '1', '2015-01-17 13:18:28');
INSERT INTO `user_customer` VALUES ('437', '13681334173', '425E1E77D0007083EFBB91392180C12D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-17 13:28:12');
INSERT INTO `user_customer` VALUES ('438', '18671276378', '75B11FC8B96FEFBCC84EADA3DCDF5E1D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-17 16:45:35');
INSERT INTO `user_customer` VALUES ('439', '15311411882', '749911CBD37B0C35BED038F74638FA30', null, '15311411882', '1', null, null, null, null, '1', '2015-01-17 16:45:58');
INSERT INTO `user_customer` VALUES ('440', '13311552721', 'B2BB0B14177AEE9AD2862647933601AC', null, '13311552721', '1', null, null, null, null, '1', '2015-01-17 16:46:11');
INSERT INTO `user_customer` VALUES ('441', '18310635367', '2975E4A7C052DDA187E563B89245B01A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-17 16:48:21');
INSERT INTO `user_customer` VALUES ('442', '13810279337', 'A46E41D5DDC7622FEAF53593512DE5A7', null, '即客客官', '1', null, null, null, null, '1', '2015-01-17 16:54:16');
INSERT INTO `user_customer` VALUES ('443', '18611680075', 'DDDADD568A34A0AA8FA6E7EE71AA6139', null, '18611680075', '1', null, null, null, null, '1', '2015-01-17 20:28:29');
INSERT INTO `user_customer` VALUES ('444', '18611331637', 'E510226E6A5E22C3A747C70D0B81365E', null, '18611331637', '1', null, null, null, null, '1', '2015-01-17 21:14:34');
INSERT INTO `user_customer` VALUES ('445', '18611176915', '18DCFF2245632FD365CBA9DF70147AD1', null, '18611176915', '1', null, null, null, null, '1', '2015-01-17 23:37:17');
INSERT INTO `user_customer` VALUES ('446', '13301229590', 'B9EFD946BB4B08979B73F8E023BDD8D0', null, '13301229590', '1', null, null, null, null, '1', '2015-01-18 11:52:25');
INSERT INTO `user_customer` VALUES ('447', '15652461342', '08F43A924282B73347F76DA2A23E46F2', null, '即客客官', '1', null, null, null, null, '1', '2015-01-18 11:54:08');
INSERT INTO `user_customer` VALUES ('448', '18513846607', '5CEB2C234250C26E7E06959B7E79AFCD', null, '即客客官', '1', null, null, null, null, '1', '2015-01-18 12:16:11');
INSERT INTO `user_customer` VALUES ('449', '18611803011', '16F684DB747EC719F89DBBDCE0F5F41D', null, '18611803011', '1', null, null, null, null, '1', '2015-01-18 12:35:57');
INSERT INTO `user_customer` VALUES ('450', '13671007171', 'C8F448A598DE6C34A7E6F0B43A846989', null, '即客客官', '1', null, null, null, null, '1', '2015-01-18 13:07:50');
INSERT INTO `user_customer` VALUES ('451', '13436908284', 'B69FF421CC983FF6CECB03E7B16AD0FA', null, '即客客官', '1', null, null, null, null, '1', '2015-01-18 13:08:53');
INSERT INTO `user_customer` VALUES ('452', '13810483036', '4FB9700E6B9244EE3E96CCAE6C68AD49', null, '13810483036', '1', null, null, null, null, '1', '2015-01-18 15:27:01');
INSERT INTO `user_customer` VALUES ('453', '13910254870', 'E8206A1452037D04E883CC1116278D4B', null, '王习俗', '1', null, null, null, null, '1', '2015-01-18 16:02:23');
INSERT INTO `user_customer` VALUES ('454', '18810093521', '19FFAF6B458FE9B2DE26950A7DAD2A9D', null, '即客客官', '1', null, null, null, null, '1', '2015-01-19 11:41:43');
INSERT INTO `user_customer` VALUES ('455', '18624119826', '0B522F10CA671CA15687A01AD74B881A', null, '即客客官', '1', null, null, null, null, '1', '2015-01-21 19:22:32');
INSERT INTO `user_customer` VALUES ('456', '13758212780', 'C039B8AC24514BC250C52CCF782F6A63', null, '即客客官', '1', null, null, null, null, '1', '2015-01-22 14:01:11');

-- ----------------------------
-- Table structure for `user_customer_delivery_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_customer_delivery_address`;
CREATE TABLE `user_customer_delivery_address` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增标识',
  `customer_id` int(20) DEFAULT '0' COMMENT '客户ID',
  `contacts` varchar(64) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `area` int(11) DEFAULT '0' COMMENT '地区',
  `community` int(11) DEFAULT '0' COMMENT '小区',
  `shop` int(11) DEFAULT '0',
  `is_default` int(11) DEFAULT '0' COMMENT '1代表默认地址',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `stamp` int(20) DEFAULT '0' COMMENT '版本',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `communityname` varchar(45) DEFAULT NULL,
  `countryname` varchar(255) DEFAULT NULL,
  `provincename` varchar(255) DEFAULT NULL,
  `regionalname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=utf8 COMMENT='客户收货地址信息\r\n一个客户有N个收货地址\r\n客户的收货地址与商店有绑定关系';

-- ----------------------------
-- Records of user_customer_delivery_address
-- ----------------------------
INSERT INTO `user_customer_delivery_address` VALUES ('170', '60', '王振江', '15201351249', '51', '32', null, '1', '8单元4号楼502', null, '2014-10-26 03:11:27', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('171', '59', '吴柯维', '17701361266', '41', '34', null, '1', '4栋301', null, '2014-10-26 03:17:04', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('173', '61', '王振江', '15201351249', '41', '20', null, '1', '4号楼8单元502', null, '2014-10-26 14:58:20', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('174', '62', '小七', '18600050976', '41', '18', null, '1', '5号楼1405', null, '2014-10-26 21:57:25', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('175', '61', '王振江', '15201351249', '51', '32', null, '0', '测试', null, '2014-10-27 17:30:46', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('176', '64', '啊', '13699255034', '41', '34', null, '1', '12单元601', null, '2014-10-27 21:48:59', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('177', '67', '杨天椿', '13522784455', '41', '18', null, '1', '建材城东一里1-2-503', null, '2014-11-01 13:32:49', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('179', '70', '吴柯维', '13810497654', '51', '42', null, '1', '301', null, '2014-11-07 12:52:30', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('180', '58', '测试', '15201351249', '51', '32', null, '1', '测试', null, '2014-11-08 09:28:22', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('181', '70', '王先生', '17701361266', '51', '32', null, '0', '16号楼201室', null, '2014-11-08 14:34:44', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('185', '73', '王莹莹', '18010028992', '51', '32', null, '1', '10栋503', null, '2014-11-14 18:30:07', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('186', '74', '皮俊章', '18500135421', '51', '32', null, '1', '3＃1402', null, '2014-11-15 16:27:41', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('187', '75', '张娇', '13611164039', '51', '32', null, '1', '37号楼608', null, '2014-11-16 10:25:19', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('188', '76', '王晓丽', '13229528552', '41', '33', null, '0', '垃圾拖把咯哦五天', null, '2014-11-16 13:44:51', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('189', '77', '胡健', '18611192295', '51', '32', null, '1', '56号楼1103', null, '2014-11-17 18:54:34', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('190', '81', '刘扬', '18410161172', '51', '42', null, '0', '东二区23号楼2单元103', null, '2014-11-21 15:05:08', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('191', '68', '张力', '18510336313', '51', '42', null, '1', '天通苑（测试勿接单）', null, '2014-11-25 14:01:20', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('192', '82', '哈哈', '15201351249', '51', '32', null, '1', '哈哈', null, '2014-11-28 03:49:39', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('199', '83', '江哥', '15201351249', '51', '32', null, '1', '哈哈接口', null, '2014-11-28 09:09:17', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('200', '85', '王芮', '18501153897', '0', '0', null, '1', '天通苑中院11号', null, '2014-11-29 16:59:51', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('201', '87', '王杰', '18601300025', '51', '32', null, '1', '66号楼808', null, '2014-12-01 20:26:51', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('209', '63', '擦擦', '13911342615', '0', '0', null, '0', 'Wukesong North Road', null, '2014-12-02 19:35:10', '-', 'Haidian', 'Beijing', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('210', '63', '牛牛牛', '13412345678', '51', '42', null, '0', '我么么', null, '2014-12-03 02:12:40', '天通东苑二区', '昌平区', '北京市', '天通苑');
INSERT INTO `user_customer_delivery_address` VALUES ('211', '63', '咱们', '13112345678', '51', '43', null, '1', '走在一条路', null, '2014-12-03 02:36:10', '天通东苑三区', '昌平区', '北京市', '天通苑');
INSERT INTO `user_customer_delivery_address` VALUES ('212', '89', '徐翔', '18907982580', '51', '32', null, '1', '12座2107', null, '2014-12-03 21:31:17', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('213', '90', '林咸元', '13810108431', '41', '38', null, '0', '北新家园', null, '2014-12-04 17:33:36', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('214', '91', '华', '18810951151', '51', '32', null, '1', '刷单', null, '2014-12-04 18:05:39', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('215', '92', '李先生', '18610210465', '51', '32', null, '1', '33号楼3单元101', null, '2014-12-04 18:53:06', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('216', '95', '郑书雷', '13522005706', '51', '32', null, '0', '海淀区西三旗硅谷先锋建材城东二里1号楼4单元401', null, '2014-12-05 11:56:14', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('217', '85', '赵鑫', '17701384344', '51', '32', null, '0', '测试地址。', null, '2014-12-06 14:30:10', '天通东苑一区', '昌平区', '北京市', '天通苑');
INSERT INTO `user_customer_delivery_address` VALUES ('218', '101', '李大伟', '15810191284', '41', '18', null, '1', '无', null, '2014-12-06 16:57:12', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('219', '102', '双桥', '18600120490', '51', '32', null, '1', '测试', null, '2014-12-06 18:19:10', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('221', '106', '赵先生', '18610606765', '51', '32', null, '1', '19号楼', null, '2014-12-08 17:00:12', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('222', '88', '焦罗馨', '15801030875', '51', '42', null, '1', '8号楼608', null, '2014-12-09 05:28:00', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('223', '66', '海子', '15056694639', '51', '32', null, '1', '一条街', null, '2014-12-09 17:57:15', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('224', '109', '立', '13910900287', '41', '34', null, '1', '你好', null, '2014-12-09 18:06:04', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('225', '110', '加南村', '13845233365', '41', '38', null, '1', '啊啊啊啊', null, '2014-12-10 14:42:58', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('226', '119', '慕渭', '13301062996', '51', '32', null, '1', '50号楼5单元502', null, '2014-12-12 21:16:51', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('227', '120', '林杨', '17710023336', '51', '32', null, '1', '天通苑东一区34号楼1301', null, '2014-12-13 20:03:03', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('230', '128', '周明', '13911174518', '51', '43', null, '1', '56号楼13门三年二班主题烤吧地下室', null, '2014-12-16 17:17:33', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('231', '131', '王曦', '15510200230', '51', '43', '0', '1', '61号楼1202室', null, '2014-12-18 21:12:36', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('232', '132', '胡静', '18611828300', '51', '42', '0', '1', '天通苑东二区九号楼1408', null, '2014-12-18 22:33:59', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('233', '134', '白静', '13810036774', '51', '32', '0', '0', '北京市海淀区西三旗建材城东二里硅谷先锋9号楼4单元403', null, '2014-12-19 20:41:06', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('234', '137', '李洋', '18610104647', '51', '32', '0', '1', '东一区47号楼一单元601', null, '2014-12-21 15:57:15', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('235', '138', '孙宁', '13701124311', '51', '32', '0', '1', '44-4-301', null, '2014-12-22 16:55:15', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('236', '146', '蹇波', '13436066680', '0', '0', '0', '1', '科园一街25号-北20米', null, '2014-12-24 09:34:32', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('238', '147', '段俊', '18612781478', '0', '0', '0', '1', '西土城路10号院     测试', '0', '2014-12-24 14:22:17', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('240', '148', '韦玉', '13186986147', '0', '0', '0', '1', '万家花城二期26幢603', '0', '2014-12-25 10:09:11', '-', '拱墅区', '杭州市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('241', '150', '姚健', '15715513876', '41', '34', '0', '1', '3号楼1207', '0', '2014-12-25 10:34:26', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('242', '145', '于洪', '13910699788', '0', '0', '0', '1', '天通苑太平家园23号楼708', '0', '2014-12-25 11:26:25', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('243', '161', '汪先生', '18811030309', '0', '0', '0', '1', '东柏街时代国际小区2号楼3单元704室', '0', '2014-12-26 12:25:27', '-', '朝阳区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('244', '164', '陈小红', '13641156283', '0', '0', '0', '1', '天通苑西三区3号楼2004号', '0', '2014-12-26 18:23:45', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('245', '228', '房建军', '13810945214', '0', '0', '0', '1', '北京市昌平区北七家镇白庙村西街132号', '0', '2014-12-28 20:28:09', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('246', '279', '刘杰', '18511218231', '0', '0', '0', '1', '天通苑东三13 号七单元', '0', '2014-12-29 10:57:39', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('247', '303', '苏晓敏', '13321192928', '0', '0', '0', '1', '天通苑东三区19号楼10单元202', '0', '2014-12-29 16:33:46', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('248', '306', '宫永进', '13910239121', '0', '0', '0', '1', '中滩村北三街', '0', '2014-12-29 18:08:47', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('249', '307', '陈羽', '18660554279', '0', '0', '0', '1', '番禺区大石镇大山村镇北大街18号之三', '0', '2014-12-29 18:13:29', '-', '番禺区', '广东省', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('250', '281', '张晶', '13343120227', '0', '0', '0', '1', '白坊物美入口修表处', '0', '2014-12-30 10:50:49', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('252', '315', '丁悦', '18201647037', '0', '0', '0', '1', '昌平区天通苑东二区一号楼底商中国电信业务代办点地下室', '0', '2014-12-30 17:24:42', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('253', '316', '徐冉', '18210940897', '0', '0', '0', '1', '昌平区天通苑东二区一号楼底商中国电信业务代办点地下室', '0', '2014-12-30 17:28:05', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('258', '320', '郭女士', '13641337831', '0', '0', '0', '1', '中苑13号楼', '0', '2014-12-30 17:59:11', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('265', '314', '王瑞', '18501153897', '0', '0', '0', '1', '北京市昌平区天通中苑11号楼6单元402', '0', '2014-12-30 18:47:38', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('266', '179', '汪东双', '18310528384', '0', '0', '0', '1', '东三旗路', '0', '2014-12-30 20:38:35', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('267', '179', '汪东双', '18310528384', '0', '0', '0', '1', '东三旗路', '0', '2014-12-30 20:38:35', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('268', '179', '汪东双', '18310528384', '0', '0', '0', '1', '东三旗路', '0', '2014-12-30 20:38:35', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('269', '179', '汪东双', '18310528384', '0', '0', '0', '1', '东三旗路', '0', '2014-12-30 20:38:35', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('272', '69', '间隔', '15201351246', '0', '0', '0', '1', '西土城路10号院-6号楼', '0', '2014-12-30 22:11:04', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('273', '325', '张曼', '13180218899', '0', '0', '0', '1', '太平庄东路', '0', '2014-12-31 13:40:20', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('274', '324', '赵杰', '13381022739', '0', '0', '0', '1', '天通苑物美超市', '0', '2014-12-31 14:03:19', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('275', '328', '王亚楠', '15830771082', '0', '0', '0', '1', '河北省邯郸市成安县商城镇东岗村', '0', '2014-12-31 17:58:57', '-', '成安县', '邯郸市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('276', '122', '冯红兵', '15811124123', '0', '0', '0', '1', '瑞旗家园31号楼301', '0', '2014-12-31 19:51:29', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('277', '331', '刘雪超', '13911533135', '51', '32', '0', '1', '26号楼3单元602室', '0', '2015-01-01 11:00:02', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('278', '338', '孙连科', '18600171848', '0', '0', '0', '1', '天通苑东一区45号楼13单元402室', '0', '2015-01-01 12:33:30', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('279', '347', '李晓琳', '13161604003', '0', '0', '0', '1', '天通苑东三区9号楼4单元402', '0', '2015-01-01 14:53:08', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('280', '363', '杨先生', '13401103733', '0', '0', '0', '1', '加州水郡179-604', '0', '2015-01-01 17:01:22', '-', '房山区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('281', '369', '陈大鱼', '18610089225', '0', '0', '0', '1', '宏福园小区8302', '0', '2015-01-01 18:11:39', '-', '大兴区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('282', '370', '李娜', '18600360466', '51', '32', '0', '1', '48号楼2单元301', '0', '2015-01-01 19:15:11', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('283', '371', '刘鑫', '15010803554', '0', '0', '0', '1', '天通苑西二区15号楼2507', '0', '2015-01-02 09:53:48', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('284', '382', '张先生', '15011217707', '0', '0', '0', '1', '天通北苑2区1-8-1202', '0', '2015-01-02 13:33:20', '-', 'Changping', 'Beijing', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('285', '372', '刘瑞芳', '15910551150', '0', '0', '0', '1', '天通苑西三区7号楼3单元801', '0', '2015-01-02 17:17:13', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('286', '385', '唐庆', '18515493673', '0', '0', '0', '1', '燕丹家家福超市', '0', '2015-01-02 19:39:38', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('287', '399', '张先生', '13681446682', '0', '0', '0', '1', '天通北苑二区一号楼8单元1202', '0', '2015-01-03 14:40:22', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('288', '401', '王泽铭', '18600705556', '0', '0', '0', '1', '北辰东路慧忠北里第一社区415号楼1303', '0', '2015-01-03 23:20:59', '-', '朝阳区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('289', '403', '李张', '13512268195', '0', '0', '0', '1', '大街胡同102102', '0', '2015-01-04 08:47:40', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('290', '404', '许建衡', '15602326944', '0', '0', '0', '1', '沙湾镇市良路1342号', '0', '2015-01-04 20:03:49', '-', '番禺区', '广州市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('291', '139', '陈', '18911268172', '51', '32', '0', '1', '42号楼3单元202', '0', '2015-01-04 21:34:42', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('292', '406', 'peter', '18642686588', '0', '0', '0', '1', '北苑领地office', '0', '2015-01-04 22:18:29', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('293', '408', '郑洪涛', '13474472587', '0', '0', '0', '1', '科技三路西格玛大厦', '0', '2015-01-05 10:51:53', '-', '雁塔区', '陕西省', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('295', '410', '贾金利', '18701006675', '0', '0', '0', '1', '苏州街长远天地大厦B1座12A-02', '0', '2015-01-05 16:24:28', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('296', '411', '尚维', '13439196957', '0', '0', '0', '1', '天通苑东苑一二三区管理处', '0', '2015-01-05 21:17:32', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('297', '412', '任梓溶', '15911185981', '0', '0', '0', '1', 'nullnull', '0', '2015-01-05 21:43:20', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('298', '414', '好的', '13146007715', '0', '0', '0', '1', '宝盛路28号', '0', '2015-01-07 12:18:18', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('299', '124', '考虑', '13575586585', '51', '43', '0', '1', '来看看', '0', '2015-01-07 14:21:09', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('300', '416', '张韧', '13683342539', '0', '0', '0', '1', '天通苑东一区19号楼8单元602', '0', '2015-01-08 01:45:04', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('301', '426', '刘鑫', '18600394477', '0', '0', '0', '1', '天通苑西二区15号楼2507', '0', '2015-01-10 16:32:57', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('302', '282', '孟祥同', '13366963499', '0', '0', '0', '1', '天通苑东二区24号楼12单元402', '0', '2015-01-11 18:33:10', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('303', '431', '刘锦辉', '18611409129', '0', '0', '0', '1', '马家堡东路57-1号', '0', '2015-01-12 18:43:09', '-', '丰台区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('304', '432', '叶先生', '18618125725', '0', '0', '0', '1', '沙河镇定泗路信苑小区', '0', '2015-01-12 20:11:57', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('305', '207', '马晓曦', '13161367330', '0', '0', '0', '1', '天通苑6区6号楼2单元601', '0', '2015-01-13 20:31:17', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('306', '445', '刘', '18611176915', '0', '0', '0', '1', '齐庄子', '0', '2015-01-17 23:38:08', '-', '丰台区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('307', '428', '安洁', '15608359107', '0', '0', '0', '1', '天通苑东一区49号楼一单元301', '0', '2015-01-18 12:00:35', '-', '昌平区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('308', '448', '王先生', '18513846607', '0', '0', '0', '1', '中关村0001', '0', '2015-01-18 12:16:45', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('309', '453', '王', '13910788549', '51', '32', '0', '1', '1001', '0', '2015-01-18 16:03:22', null, null, null, null);
INSERT INTO `user_customer_delivery_address` VALUES ('310', '454', '毛小', '18810093521', '0', '0', '0', '1', '知春路13号', '0', '2015-01-19 11:42:44', '-', '海淀区', '北京市', '-');
INSERT INTO `user_customer_delivery_address` VALUES ('311', '455', '看看', '18624119826', '0', '0', '0', '1', '金石路啦咯啦咯啦咯', '0', '2015-01-21 19:22:56', '-', '金州区', '大连市', '-');

-- ----------------------------
-- Table structure for `user_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `user_delivery`;
CREATE TABLE `user_delivery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '快递员ID',
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(64) DEFAULT NULL COMMENT '混淆因子',
  `nickname` varchar(64) DEFAULT NULL COMMENT '妮称',
  `shop_id` bigint(64) DEFAULT NULL COMMENT '商店ID',
  `status` int(11) DEFAULT '0' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `telphone` varchar(45) NOT NULL COMMENT '手机号码',
  `idnumber` varchar(20) DEFAULT NULL,
  `imgpath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='快递员信息表\r\n一个快递员属于属于个商店，派送某一个商店的商品？是否合理？';

-- ----------------------------
-- Records of user_delivery
-- ----------------------------
INSERT INTO `user_delivery` VALUES ('1', '江哥', '3785A754AD48DC62B817503F1D1B3FEE', null, '', '65', '0', '2014-11-17 17:07:18', '15056694638', '340828199006261412', 'delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('2', '吴柯维', '868F8791BC3EB6AE76434E10FB877B22', null, '', '64', '0', '2014-11-28 10:29:46', '17701361266', '421122198304080011', 'delivery/421122198304080011/tx.jpg');
INSERT INTO `user_delivery` VALUES ('3', '杨海', '123456', null, '', '64', '0', '2014-10-29 15:54:04', '15056694638', '340828199006261412', 'delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('4', '王蒙', '123456', null, '', '64', '0', '2014-10-26 13:01:02', '13811626315', '130682198808106338', 'delivery/130682198808106338/tx.jpg');
INSERT INTO `user_delivery` VALUES ('5', '赵鑫', '123456', null, '', '64', '0', '2014-10-28 11:24:20', '18943443332', '230205199106240413', 'delivery/230205199106240413/tx.jpg');
INSERT INTO `user_delivery` VALUES ('7', '赵鑫', '123456', null, '', '65', '0', '2014-11-08 09:25:25', '18910347457', '340828199006261412', 'interface.jikesoon.com/jk1/delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('8', '江哥', '10DC41CD316C61127A34F21645DBCD47', null, '', '65', '0', '2014-11-17 17:11:40', '15201351249', '340828199006261412', 'interface.jikesoon.com/jk1/delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('9', '空客户', 'D9CE9A233880E3FD5DA56EA3E5526BE1', null, '', '64', '0', '2014-11-28 02:12:59', '15201351248', '340828199006261412', 'interface.jikesoon.com/jk1/delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('10', '赵鑫', '3504D6F1B73357EF075EF82C24CC95AA', null, '', '65', '0', '2014-11-28 13:01:02', '17701384344', '230205199106240413', 'interface.jikesoon.com/jk1/delivery/230205199106240413/tx.jpg');
INSERT INTO `user_delivery` VALUES ('11', 'Ray', 'B680500469E6BC8431C9BC876FBA0479', null, '', '65', '0', '2014-12-29 18:40:44', '13911342615', '340104198704141510', 'interface.jikesoon.com/jk1/delivery/340104198704141510/tx.jpg');
INSERT INTO `user_delivery` VALUES ('12', '段俊', 'E1605A5BDA10227581FC730C2635473D', null, '', '65', '0', '2014-12-30 12:42:29', '18612781478', '340828199006261412', 'interface.jikesoon.com/jk1/delivery/340828199006261412/tx.jpg');
INSERT INTO `user_delivery` VALUES ('13', '贾竹军', '6D328CEE78520B755FB932864A367D5C', null, '', '65', '0', '2014-12-30 16:55:42', '13521839151', '340828199006261412', 'interface.jikesoon.com/jk1/delivery/340828199006261412/tx.jpg');

-- ----------------------------
-- Table structure for `user_delivery_permission`
-- ----------------------------
DROP TABLE IF EXISTS `user_delivery_permission`;
CREATE TABLE `user_delivery_permission` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '权限ID',
  `description` varchar(64) DEFAULT NULL COMMENT '权限描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递员权限表';

-- ----------------------------
-- Records of user_delivery_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `user_delivery_permission_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `user_delivery_permission_mapping`;
CREATE TABLE `user_delivery_permission_mapping` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT '自增标识',
  `delivery_id` bigint(64) DEFAULT NULL COMMENT '快递员ID',
  `permission_id` bigint(64) DEFAULT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递员与权限映射关系表';

-- ----------------------------
-- Records of user_delivery_permission_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for `user_delivery_privelege`
-- ----------------------------
DROP TABLE IF EXISTS `user_delivery_privelege`;
CREATE TABLE `user_delivery_privelege` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_delivery_privelege
-- ----------------------------

-- ----------------------------
-- Table structure for `versions`
-- ----------------------------
DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_ver` varchar(45) NOT NULL COMMENT '分类版本',
  `area_ver` varchar(45) NOT NULL COMMENT '地区版本',
  `soft_ver` varchar(45) NOT NULL COMMENT '软件版本',
  `lowprice` varchar(255) NOT NULL DEFAULT '29' COMMENT '最低配送价，低于该价格不配送',
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `deliveryprice` varchar(255) NOT NULL DEFAULT '5' COMMENT '配送费用',
  `deliveryrange` varchar(255) NOT NULL DEFAULT '50' COMMENT '该值一下的配送',
  `changetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '版本修改时间',
  `role` varchar(45) NOT NULL COMMENT '版本角色',
  `deliverytimer` int(11) NOT NULL DEFAULT '30' COMMENT '配送的时间(分钟)',
  `ipurl` varchar(255) DEFAULT NULL,
  `ipstart` date DEFAULT NULL,
  `ipend` date DEFAULT NULL,
  `style` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='软件的版本信息';

-- ----------------------------
-- Records of versions
-- ----------------------------
INSERT INTO `versions` VALUES ('1', '2.4', '1.1', '1.0.2', '10', '09:00:00', '21:00:00', '0', '0', '2015-01-23 12:45:07', 'customer', '30', 'http://the-advertisement-picture.qiniudn.com/sd_index1.png', '2015-01-03', '2015-01-10', '2');
INSERT INTO `versions` VALUES ('2', '2', '1.1', '1.0.2', '10', '21:00:00', '21:00:00', '0', '0', '2015-01-23 12:39:50', 'delivery', '60', 'http://the-advertisement-picture.qiniudn.com/sd_index1.png', null, null, '1');

-- ----------------------------
-- Table structure for `virtualarea`
-- ----------------------------
DROP TABLE IF EXISTS `virtualarea`;
CREATE TABLE `virtualarea` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '焊点的名字',
  `range` varchar(255) DEFAULT NULL COMMENT '站点的范围',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存在商品库存信息（该虚拟区域所有的商品信息）';

-- ----------------------------
-- Records of virtualarea
-- ----------------------------

-- ----------------------------
-- Table structure for `virtualarea_category1`
-- ----------------------------
DROP TABLE IF EXISTS `virtualarea_category1`;
CREATE TABLE `virtualarea_category1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualareaid` int(11) NOT NULL COMMENT '站点的id',
  `category1id` int(11) NOT NULL COMMENT '一级分类id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of virtualarea_category1
-- ----------------------------

-- ----------------------------
-- Table structure for `virtualarea_category2`
-- ----------------------------
DROP TABLE IF EXISTS `virtualarea_category2`;
CREATE TABLE `virtualarea_category2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualareaid` int(11) NOT NULL,
  `category2id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of virtualarea_category2
-- ----------------------------

-- ----------------------------
-- Table structure for `virtualarea_product`
-- ----------------------------
DROP TABLE IF EXISTS `virtualarea_product`;
CREATE TABLE `virtualarea_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `virtualareaid` int(11) NOT NULL COMMENT '站点id',
  `productid` int(11) NOT NULL COMMENT '商品id',
  `productprice` varchar(255) NOT NULL COMMENT '商品价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of virtualarea_product
-- ----------------------------

-- ----------------------------
-- Procedure structure for `outonebill`
-- ----------------------------
DROP PROCEDURE IF EXISTS `outonebill`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `outonebill`()
BEGIN
	INSERT INTO allorder_history SELECT * FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime);
	INSERT INTO bill_history SELECT * FROM bill WHERE orderid IN (SELECT orderid FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime));
	INSERT INTO qtbill_history SELECT * FROM qtbill WHERE orderid IN (SELECT orderid FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime));
	DELETE FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime);
	DELETE FROM bill WHERE orderid IN (SELECT orderid FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime));
	DELETE FROM qtbill WHERE orderid IN (SELECT orderid FROM allorder WHERE DATE_SUB(CURDATE(), INTERVAL 30 DAY) >= date(createtime));
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `oneoutbill`
-- ----------------------------
DROP EVENT IF EXISTS `oneoutbill`;
DELIMITER ;;
CREATE EVENT `oneoutbill` ON SCHEDULE EVERY 1 HOUR STARTS '2015-01-15 11:00:01' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	CALL outonebill();
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002dd08d_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_002dd08d_bi` BEFORE INSERT ON `area` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002dd08d_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_002dd08d_ai` AFTER INSERT ON `area` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @area_DB_DV is null or not @area_DB_DV=@now_ts then set @@global.dbdv_area.key_cache_age_threshold=(@now_ts-1380000000)*100;set @area_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002dd08d_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_002dd08d_bu` BEFORE UPDATE ON `area` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002dd08d_au`;
DELIMITER ;;
CREATE TRIGGER `tr_002dd08d_au` AFTER UPDATE ON `area` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @area_DB_DV is null or not @area_DB_DV=@now_ts then set @@global.dbdv_area.key_cache_age_threshold=(@now_ts-1380000000)*100;set @area_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002dd08d_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_002dd08d_ad` AFTER DELETE ON `area` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @area_DB_DV is null or not @area_DB_DV=@now_ts then set @@global.dbdv_area.key_cache_age_threshold=(@now_ts-1380000000)*100;set @area_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a7c52fe9_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_a7c52fe9_bi` BEFORE INSERT ON `community` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a7c52fe9_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_a7c52fe9_ai` AFTER INSERT ON `community` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @community_DB_DV is null or not @community_DB_DV=@now_ts then set @@global.dbdv_community.key_cache_age_threshold=(@now_ts-1380000000)*100;set @community_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a7c52fe9_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_a7c52fe9_bu` BEFORE UPDATE ON `community` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a7c52fe9_au`;
DELIMITER ;;
CREATE TRIGGER `tr_a7c52fe9_au` AFTER UPDATE ON `community` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @community_DB_DV is null or not @community_DB_DV=@now_ts then set @@global.dbdv_community.key_cache_age_threshold=(@now_ts-1380000000)*100;set @community_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a7c52fe9_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_a7c52fe9_ad` AFTER DELETE ON `community` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @community_DB_DV is null or not @community_DB_DV=@now_ts then set @@global.dbdv_community.key_cache_age_threshold=(@now_ts-1380000000)*100;set @community_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dc4520e9_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_dc4520e9_ai` AFTER INSERT ON `complain` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @complain_DB_DV is null or not @complain_DB_DV=@now_ts then set @@global.dbdv_complain.key_cache_age_threshold=(@now_ts-1380000000)*100;set @complain_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dc4520e9_au`;
DELIMITER ;;
CREATE TRIGGER `tr_dc4520e9_au` AFTER UPDATE ON `complain` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @complain_DB_DV is null or not @complain_DB_DV=@now_ts then set @@global.dbdv_complain.key_cache_age_threshold=(@now_ts-1380000000)*100;set @complain_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dc4520e9_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_dc4520e9_ad` AFTER DELETE ON `complain` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @complain_DB_DV is null or not @complain_DB_DV=@now_ts then set @@global.dbdv_complain.key_cache_age_threshold=(@now_ts-1380000000)*100;set @complain_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a40484f7_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_a40484f7_bi` BEFORE INSERT ON `device_model` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dcc4e400_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_dcc4e400_ai` AFTER INSERT ON `device_model` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @device_model_DB_DV is null or not @device_model_DB_DV=@now_ts then set @@global.dbdv_device_model.key_cache_age_threshold=(@now_ts-1380000000)*100;set @device_model_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a40484f7_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_a40484f7_bu` BEFORE UPDATE ON `device_model` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dcc4e400_au`;
DELIMITER ;;
CREATE TRIGGER `tr_dcc4e400_au` AFTER UPDATE ON `device_model` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @device_model_DB_DV is null or not @device_model_DB_DV=@now_ts then set @@global.dbdv_device_model.key_cache_age_threshold=(@now_ts-1380000000)*100;set @device_model_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dcc4e400_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_dcc4e400_ad` AFTER DELETE ON `device_model` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @device_model_DB_DV is null or not @device_model_DB_DV=@now_ts then set @@global.dbdv_device_model.key_cache_age_threshold=(@now_ts-1380000000)*100;set @device_model_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a40484f7_bi_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_a40484f7_bi_copy` BEFORE INSERT ON `devices` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_5cf8acdd_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_5cf8acdd_ai` AFTER INSERT ON `devices` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @devices_DB_DV is null or not @devices_DB_DV=@now_ts then set @@global.dbdv_devices.key_cache_age_threshold=(@now_ts-1380000000)*100;set @devices_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a40484f7_bu_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_a40484f7_bu_copy` BEFORE UPDATE ON `devices` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_5cf8acdd_au`;
DELIMITER ;;
CREATE TRIGGER `tr_5cf8acdd_au` AFTER UPDATE ON `devices` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @devices_DB_DV is null or not @devices_DB_DV=@now_ts then set @@global.dbdv_devices.key_cache_age_threshold=(@now_ts-1380000000)*100;set @devices_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_5cf8acdd_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_5cf8acdd_ad` AFTER DELETE ON `devices` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @devices_DB_DV is null or not @devices_DB_DV=@now_ts then set @@global.dbdv_devices.key_cache_age_threshold=(@now_ts-1380000000)*100;set @devices_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002f0bb6_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_002f0bb6_ai` AFTER INSERT ON `dict` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_DB_DV is null or not @dict_DB_DV=@now_ts then set @@global.dbdv_dict.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002f0bb6_au`;
DELIMITER ;;
CREATE TRIGGER `tr_002f0bb6_au` AFTER UPDATE ON `dict` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_DB_DV is null or not @dict_DB_DV=@now_ts then set @@global.dbdv_dict.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_002f0bb6_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_002f0bb6_ad` AFTER DELETE ON `dict` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_DB_DV is null or not @dict_DB_DV=@now_ts then set @@global.dbdv_dict.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c6831e23_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_c6831e23_ai` AFTER INSERT ON `dict_type` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_type_DB_DV is null or not @dict_type_DB_DV=@now_ts then set @@global.dbdv_dict_type.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_type_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c6831e23_au`;
DELIMITER ;;
CREATE TRIGGER `tr_c6831e23_au` AFTER UPDATE ON `dict_type` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_type_DB_DV is null or not @dict_type_DB_DV=@now_ts then set @@global.dbdv_dict_type.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_type_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c6831e23_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_c6831e23_ad` AFTER DELETE ON `dict_type` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @dict_type_DB_DV is null or not @dict_type_DB_DV=@now_ts then set @@global.dbdv_dict_type.key_cache_age_threshold=(@now_ts-1380000000)*100;set @dict_type_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c7346b04_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_c7346b04_bi` BEFORE INSERT ON `jk_cache` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c7346b04_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_c7346b04_ai` AFTER INSERT ON `jk_cache` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @jk_cache_DB_DV is null or not @jk_cache_DB_DV=@now_ts then set @@global.dbdv_jk_cache.key_cache_age_threshold=(@now_ts-1380000000)*100;set @jk_cache_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c7346b04_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_c7346b04_bu` BEFORE UPDATE ON `jk_cache` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c7346b04_au`;
DELIMITER ;;
CREATE TRIGGER `tr_c7346b04_au` AFTER UPDATE ON `jk_cache` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @jk_cache_DB_DV is null or not @jk_cache_DB_DV=@now_ts then set @@global.dbdv_jk_cache.key_cache_age_threshold=(@now_ts-1380000000)*100;set @jk_cache_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_c7346b04_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_c7346b04_ad` AFTER DELETE ON `jk_cache` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @jk_cache_DB_DV is null or not @jk_cache_DB_DV=@now_ts then set @@global.dbdv_jk_cache.key_cache_age_threshold=(@now_ts-1380000000)*100;set @jk_cache_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_77fea422_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_77fea422_ai` AFTER INSERT ON `log_bill` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_bill_DB_DV is null or not @log_bill_DB_DV=@now_ts then set @@global.dbdv_log_bill.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_bill_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_77fea422_au`;
DELIMITER ;;
CREATE TRIGGER `tr_77fea422_au` AFTER UPDATE ON `log_bill` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_bill_DB_DV is null or not @log_bill_DB_DV=@now_ts then set @@global.dbdv_log_bill.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_bill_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_77fea422_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_77fea422_ad` AFTER DELETE ON `log_bill` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_bill_DB_DV is null or not @log_bill_DB_DV=@now_ts then set @@global.dbdv_log_bill.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_bill_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_20690d88_ai_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_20690d88_ai_copy` AFTER INSERT ON `log_bill_items` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @bill_items_DB_DV is null or not @bill_items_DB_DV=@now_ts then set @@global.dbdv_bill_items.key_cache_age_threshold=(@now_ts-1380000000)*100;set @bill_items_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_20690d88_au_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_20690d88_au_copy` AFTER UPDATE ON `log_bill_items` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @bill_items_DB_DV is null or not @bill_items_DB_DV=@now_ts then set @@global.dbdv_bill_items.key_cache_age_threshold=(@now_ts-1380000000)*100;set @bill_items_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_20690d88_ad_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_20690d88_ad_copy` AFTER DELETE ON `log_bill_items` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @bill_items_DB_DV is null or not @bill_items_DB_DV=@now_ts then set @@global.dbdv_bill_items.key_cache_age_threshold=(@now_ts-1380000000)*100;set @bill_items_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ddf992f4_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_ddf992f4_ai` AFTER INSERT ON `log_product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_DB_DV is null or not @log_product_DB_DV=@now_ts then set @@global.dbdv_log_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ddf992f4_au`;
DELIMITER ;;
CREATE TRIGGER `tr_ddf992f4_au` AFTER UPDATE ON `log_product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_DB_DV is null or not @log_product_DB_DV=@now_ts then set @@global.dbdv_log_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ddf992f4_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_ddf992f4_ad` AFTER DELETE ON `log_product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_DB_DV is null or not @log_product_DB_DV=@now_ts then set @@global.dbdv_log_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_73a583ee_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_73a583ee_ai` AFTER INSERT ON `log_product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_shortage_DB_DV is null or not @log_product_shortage_DB_DV=@now_ts then set @@global.dbdv_log_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_73a583ee_au`;
DELIMITER ;;
CREATE TRIGGER `tr_73a583ee_au` AFTER UPDATE ON `log_product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_shortage_DB_DV is null or not @log_product_shortage_DB_DV=@now_ts then set @@global.dbdv_log_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_73a583ee_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_73a583ee_ad` AFTER DELETE ON `log_product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_product_shortage_DB_DV is null or not @log_product_shortage_DB_DV=@now_ts then set @@global.dbdv_log_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_8006cdb6_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_8006cdb6_bi` BEFORE INSERT ON `log_user_admin` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_8006cdb6_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_8006cdb6_ai` AFTER INSERT ON `log_user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_admin_DB_DV is null or not @log_user_admin_DB_DV=@now_ts then set @@global.dbdv_log_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_8006cdb6_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_8006cdb6_bu` BEFORE UPDATE ON `log_user_admin` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_8006cdb6_au`;
DELIMITER ;;
CREATE TRIGGER `tr_8006cdb6_au` AFTER UPDATE ON `log_user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_admin_DB_DV is null or not @log_user_admin_DB_DV=@now_ts then set @@global.dbdv_log_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_8006cdb6_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_8006cdb6_ad` AFTER DELETE ON `log_user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_admin_DB_DV is null or not @log_user_admin_DB_DV=@now_ts then set @@global.dbdv_log_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f5a34817_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_f5a34817_ai` AFTER INSERT ON `log_user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_DB_DV is null or not @log_user_customer_DB_DV=@now_ts then set @@global.dbdv_log_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f5a34817_au`;
DELIMITER ;;
CREATE TRIGGER `tr_f5a34817_au` AFTER UPDATE ON `log_user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_DB_DV is null or not @log_user_customer_DB_DV=@now_ts then set @@global.dbdv_log_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f5a34817_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_f5a34817_ad` AFTER DELETE ON `log_user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_DB_DV is null or not @log_user_customer_DB_DV=@now_ts then set @@global.dbdv_log_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_61a595d1_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_61a595d1_bi` BEFORE INSERT ON `log_user_customer_delivery_address` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_61a595d1_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_61a595d1_ai` AFTER INSERT ON `log_user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_delivery_address_DB_DV is null or not @log_user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_log_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_61a595d1_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_61a595d1_bu` BEFORE UPDATE ON `log_user_customer_delivery_address` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_61a595d1_au`;
DELIMITER ;;
CREATE TRIGGER `tr_61a595d1_au` AFTER UPDATE ON `log_user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_delivery_address_DB_DV is null or not @log_user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_log_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_61a595d1_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_61a595d1_ad` AFTER DELETE ON `log_user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_customer_delivery_address_DB_DV is null or not @log_user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_log_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0296e42d_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_0296e42d_ai` AFTER INSERT ON `log_user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_delivery_DB_DV is null or not @log_user_delivery_DB_DV=@now_ts then set @@global.dbdv_log_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0296e42d_au`;
DELIMITER ;;
CREATE TRIGGER `tr_0296e42d_au` AFTER UPDATE ON `log_user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_delivery_DB_DV is null or not @log_user_delivery_DB_DV=@now_ts then set @@global.dbdv_log_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0296e42d_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_0296e42d_ad` AFTER DELETE ON `log_user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @log_user_delivery_DB_DV is null or not @log_user_delivery_DB_DV=@now_ts then set @@global.dbdv_log_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @log_user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ed8dccef_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_ed8dccef_ai` AFTER INSERT ON `product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_DB_DV is null or not @product_DB_DV=@now_ts then set @@global.dbdv_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ed8dccef_au`;
DELIMITER ;;
CREATE TRIGGER `tr_ed8dccef_au` AFTER UPDATE ON `product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_DB_DV is null or not @product_DB_DV=@now_ts then set @@global.dbdv_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ed8dccef_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_ed8dccef_ad` AFTER DELETE ON `product` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_DB_DV is null or not @product_DB_DV=@now_ts then set @@global.dbdv_product.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_ai` AFTER INSERT ON `product_category` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_au`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_au` AFTER UPDATE ON `product_category` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_ad` AFTER DELETE ON `product_category` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_ai_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_ai_copy` AFTER INSERT ON `product_category_copy` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_au_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_au_copy` AFTER UPDATE ON `product_category_copy` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_a0303e4e_ad_copy`;
DELIMITER ;;
CREATE TRIGGER `tr_a0303e4e_ad_copy` AFTER DELETE ON `product_category_copy` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_category_DB_DV is null or not @product_category_DB_DV=@now_ts then set @@global.dbdv_product_category.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_category_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dbcf4aec_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_dbcf4aec_bi` BEFORE INSERT ON `product_favorite` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dbcf4aec_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_dbcf4aec_ai` AFTER INSERT ON `product_favorite` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_favorite_DB_DV is null or not @product_favorite_DB_DV=@now_ts then set @@global.dbdv_product_favorite.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_favorite_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dbcf4aec_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_dbcf4aec_bu` BEFORE UPDATE ON `product_favorite` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dbcf4aec_au`;
DELIMITER ;;
CREATE TRIGGER `tr_dbcf4aec_au` AFTER UPDATE ON `product_favorite` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_favorite_DB_DV is null or not @product_favorite_DB_DV=@now_ts then set @@global.dbdv_product_favorite.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_favorite_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_dbcf4aec_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_dbcf4aec_ad` AFTER DELETE ON `product_favorite` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_favorite_DB_DV is null or not @product_favorite_DB_DV=@now_ts then set @@global.dbdv_product_favorite.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_favorite_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_88c35453_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_88c35453_ai` AFTER INSERT ON `product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_shortage_DB_DV is null or not @product_shortage_DB_DV=@now_ts then set @@global.dbdv_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_88c35453_au`;
DELIMITER ;;
CREATE TRIGGER `tr_88c35453_au` AFTER UPDATE ON `product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_shortage_DB_DV is null or not @product_shortage_DB_DV=@now_ts then set @@global.dbdv_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_88c35453_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_88c35453_ad` AFTER DELETE ON `product_shortage` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @product_shortage_DB_DV is null or not @product_shortage_DB_DV=@now_ts then set @@global.dbdv_product_shortage.key_cache_age_threshold=(@now_ts-1380000000)*100;set @product_shortage_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d9b97613_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_d9b97613_bi` BEFORE INSERT ON `scan_barcode_history` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d9b97613_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_d9b97613_ai` AFTER INSERT ON `scan_barcode_history` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @scan_barcode_history_DB_DV is null or not @scan_barcode_history_DB_DV=@now_ts then set @@global.dbdv_scan_barcode_history.key_cache_age_threshold=(@now_ts-1380000000)*100;set @scan_barcode_history_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d9b97613_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_d9b97613_bu` BEFORE UPDATE ON `scan_barcode_history` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d9b97613_au`;
DELIMITER ;;
CREATE TRIGGER `tr_d9b97613_au` AFTER UPDATE ON `scan_barcode_history` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @scan_barcode_history_DB_DV is null or not @scan_barcode_history_DB_DV=@now_ts then set @@global.dbdv_scan_barcode_history.key_cache_age_threshold=(@now_ts-1380000000)*100;set @scan_barcode_history_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d9b97613_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_d9b97613_ad` AFTER DELETE ON `scan_barcode_history` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @scan_barcode_history_DB_DV is null or not @scan_barcode_history_DB_DV=@now_ts then set @@global.dbdv_scan_barcode_history.key_cache_age_threshold=(@now_ts-1380000000)*100;set @scan_barcode_history_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0035daf6_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_0035daf6_bi` BEFORE INSERT ON `shop` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0035daf6_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_0035daf6_ai` AFTER INSERT ON `shop` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @shop_DB_DV is null or not @shop_DB_DV=@now_ts then set @@global.dbdv_shop.key_cache_age_threshold=(@now_ts-1380000000)*100;set @shop_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0035daf6_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_0035daf6_bu` BEFORE UPDATE ON `shop` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0035daf6_au`;
DELIMITER ;;
CREATE TRIGGER `tr_0035daf6_au` AFTER UPDATE ON `shop` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @shop_DB_DV is null or not @shop_DB_DV=@now_ts then set @@global.dbdv_shop.key_cache_age_threshold=(@now_ts-1380000000)*100;set @shop_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_0035daf6_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_0035daf6_ad` AFTER DELETE ON `shop` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @shop_DB_DV is null or not @shop_DB_DV=@now_ts then set @@global.dbdv_shop.key_cache_age_threshold=(@now_ts-1380000000)*100;set @shop_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f9dc3aae_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_f9dc3aae_ai` AFTER INSERT ON `sms_send` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @sms_send_DB_DV is null or not @sms_send_DB_DV=@now_ts then set @@global.dbdv_sms_send.key_cache_age_threshold=(@now_ts-1380000000)*100;set @sms_send_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f9dc3aae_au`;
DELIMITER ;;
CREATE TRIGGER `tr_f9dc3aae_au` AFTER UPDATE ON `sms_send` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @sms_send_DB_DV is null or not @sms_send_DB_DV=@now_ts then set @@global.dbdv_sms_send.key_cache_age_threshold=(@now_ts-1380000000)*100;set @sms_send_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_f9dc3aae_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_f9dc3aae_ad` AFTER DELETE ON `sms_send` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @sms_send_DB_DV is null or not @sms_send_DB_DV=@now_ts then set @@global.dbdv_sms_send.key_cache_age_threshold=(@now_ts-1380000000)*100;set @sms_send_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_00364492_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_00364492_ai` AFTER INSERT ON `test` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @test_DB_DV is null or not @test_DB_DV=@now_ts then set @@global.dbdv_test.key_cache_age_threshold=(@now_ts-1380000000)*100;set @test_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_00364492_au`;
DELIMITER ;;
CREATE TRIGGER `tr_00364492_au` AFTER UPDATE ON `test` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @test_DB_DV is null or not @test_DB_DV=@now_ts then set @@global.dbdv_test.key_cache_age_threshold=(@now_ts-1380000000)*100;set @test_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_00364492_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_00364492_ad` AFTER DELETE ON `test` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @test_DB_DV is null or not @test_DB_DV=@now_ts then set @@global.dbdv_test.key_cache_age_threshold=(@now_ts-1380000000)*100;set @test_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_724e0ddb_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_724e0ddb_bi` BEFORE INSERT ON `user_admin` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_724e0ddb_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_724e0ddb_ai` AFTER INSERT ON `user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_DB_DV is null or not @user_admin_DB_DV=@now_ts then set @@global.dbdv_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_724e0ddb_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_724e0ddb_bu` BEFORE UPDATE ON `user_admin` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_724e0ddb_au`;
DELIMITER ;;
CREATE TRIGGER `tr_724e0ddb_au` AFTER UPDATE ON `user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_DB_DV is null or not @user_admin_DB_DV=@now_ts then set @@global.dbdv_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_724e0ddb_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_724e0ddb_ad` AFTER DELETE ON `user_admin` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_DB_DV is null or not @user_admin_DB_DV=@now_ts then set @@global.dbdv_user_admin.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_6d5466b3_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_6d5466b3_ai` AFTER INSERT ON `user_admin_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_DB_DV is null or not @user_admin_permission_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_6d5466b3_au`;
DELIMITER ;;
CREATE TRIGGER `tr_6d5466b3_au` AFTER UPDATE ON `user_admin_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_DB_DV is null or not @user_admin_permission_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_6d5466b3_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_6d5466b3_ad` AFTER DELETE ON `user_admin_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_DB_DV is null or not @user_admin_permission_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_87e3c342_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_87e3c342_ai` AFTER INSERT ON `user_admin_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_mapping_DB_DV is null or not @user_admin_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_87e3c342_au`;
DELIMITER ;;
CREATE TRIGGER `tr_87e3c342_au` AFTER UPDATE ON `user_admin_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_mapping_DB_DV is null or not @user_admin_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_87e3c342_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_87e3c342_ad` AFTER DELETE ON `user_admin_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_permission_mapping_DB_DV is null or not @user_admin_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_admin_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ae8a4b49_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_ae8a4b49_ai` AFTER INSERT ON `user_admin_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_privelege_DB_DV is null or not @user_admin_privelege_DB_DV=@now_ts then set @@global.dbdv_user_admin_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ae8a4b49_au`;
DELIMITER ;;
CREATE TRIGGER `tr_ae8a4b49_au` AFTER UPDATE ON `user_admin_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_privelege_DB_DV is null or not @user_admin_privelege_DB_DV=@now_ts then set @@global.dbdv_user_admin_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_ae8a4b49_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_ae8a4b49_ad` AFTER DELETE ON `user_admin_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_admin_privelege_DB_DV is null or not @user_admin_privelege_DB_DV=@now_ts then set @@global.dbdv_user_admin_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_admin_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_2724d9d2_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_2724d9d2_bi` BEFORE INSERT ON `user_customer` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_2724d9d2_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_2724d9d2_ai` AFTER INSERT ON `user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_DB_DV is null or not @user_customer_DB_DV=@now_ts then set @@global.dbdv_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_2724d9d2_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_2724d9d2_bu` BEFORE UPDATE ON `user_customer` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_2724d9d2_au`;
DELIMITER ;;
CREATE TRIGGER `tr_2724d9d2_au` AFTER UPDATE ON `user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_DB_DV is null or not @user_customer_DB_DV=@now_ts then set @@global.dbdv_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_2724d9d2_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_2724d9d2_ad` AFTER DELETE ON `user_customer` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_DB_DV is null or not @user_customer_DB_DV=@now_ts then set @@global.dbdv_user_customer.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_79e85176_bi`;
DELIMITER ;;
CREATE TRIGGER `tr_79e85176_bi` BEFORE INSERT ON `user_customer_delivery_address` FOR EACH ROW begin
SET NEW.createtime=now();
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_79e85176_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_79e85176_ai` AFTER INSERT ON `user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_delivery_address_DB_DV is null or not @user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_79e85176_bu`;
DELIMITER ;;
CREATE TRIGGER `tr_79e85176_bu` BEFORE UPDATE ON `user_customer_delivery_address` FOR EACH ROW begin
SET NEW.createtime=OLD.createtime;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_79e85176_au`;
DELIMITER ;;
CREATE TRIGGER `tr_79e85176_au` AFTER UPDATE ON `user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_delivery_address_DB_DV is null or not @user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_79e85176_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_79e85176_ad` AFTER DELETE ON `user_customer_delivery_address` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_customer_delivery_address_DB_DV is null or not @user_customer_delivery_address_DB_DV=@now_ts then set @@global.dbdv_user_customer_delivery_address.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_customer_delivery_address_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_341875e8_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_341875e8_ai` AFTER INSERT ON `user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_DB_DV is null or not @user_delivery_DB_DV=@now_ts then set @@global.dbdv_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_341875e8_au`;
DELIMITER ;;
CREATE TRIGGER `tr_341875e8_au` AFTER UPDATE ON `user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_DB_DV is null or not @user_delivery_DB_DV=@now_ts then set @@global.dbdv_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_341875e8_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_341875e8_ad` AFTER DELETE ON `user_delivery` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_DB_DV is null or not @user_delivery_DB_DV=@now_ts then set @@global.dbdv_user_delivery.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_187e6486_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_187e6486_ai` AFTER INSERT ON `user_delivery_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_DB_DV is null or not @user_delivery_permission_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_187e6486_au`;
DELIMITER ;;
CREATE TRIGGER `tr_187e6486_au` AFTER UPDATE ON `user_delivery_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_DB_DV is null or not @user_delivery_permission_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_187e6486_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_187e6486_ad` AFTER DELETE ON `user_delivery_permission` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_DB_DV is null or not @user_delivery_permission_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d0283e15_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_d0283e15_ai` AFTER INSERT ON `user_delivery_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_mapping_DB_DV is null or not @user_delivery_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d0283e15_au`;
DELIMITER ;;
CREATE TRIGGER `tr_d0283e15_au` AFTER UPDATE ON `user_delivery_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_mapping_DB_DV is null or not @user_delivery_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_d0283e15_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_d0283e15_ad` AFTER DELETE ON `user_delivery_permission_mapping` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_permission_mapping_DB_DV is null or not @user_delivery_permission_mapping_DB_DV=@now_ts then set @@global.dbdv_user_delivery_permission_mapping.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_permission_mapping_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_b40fc716_ai`;
DELIMITER ;;
CREATE TRIGGER `tr_b40fc716_ai` AFTER INSERT ON `user_delivery_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_privelege_DB_DV is null or not @user_delivery_privelege_DB_DV=@now_ts then set @@global.dbdv_user_delivery_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_b40fc716_au`;
DELIMITER ;;
CREATE TRIGGER `tr_b40fc716_au` AFTER UPDATE ON `user_delivery_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_privelege_DB_DV is null or not @user_delivery_privelege_DB_DV=@now_ts then set @@global.dbdv_user_delivery_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tr_b40fc716_ad`;
DELIMITER ;;
CREATE TRIGGER `tr_b40fc716_ad` AFTER DELETE ON `user_delivery_privelege` FOR EACH ROW begin
set @now_ts=UNIX_TIMESTAMP(); if @@server_id<=1 then if @user_delivery_privelege_DB_DV is null or not @user_delivery_privelege_DB_DV=@now_ts then set @@global.dbdv_user_delivery_privelege.key_cache_age_threshold=(@now_ts-1380000000)*100;set @user_delivery_privelege_DB_DV=@now_ts; end if; end if;
end
;;
DELIMITER ;

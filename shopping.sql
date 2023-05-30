/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-04-21 14:34:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for active
-- ----------------------------
DROP TABLE IF EXISTS `active`;
CREATE TABLE `active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of active
-- ----------------------------
INSERT INTO `active` VALUES ('15', '尚品宅配橱柜定制 欧式风格整体橱柜', '尚品宅配橱柜定制 欧式风格整体橱柜智能厨柜定制多功能橱柜厨房定做 石英石台面厨柜 预付金（非商品价格）\r\n全屋家具定制0元量尺，0元设计，上门安装，5年质保     <a href=\"http://localhost:8082/OnlineShopping/goodsdetails?id=31\">--查看详情--</a>', 'ADMIN', '2018-04-20 00:37:36', null, null);
INSERT INTO `active` VALUES ('16', '龙鼎天著木门 卧室门室内门实木复合门', '龙鼎天著木门 卧室门室内门实木复合门定制木门生态门MQC-@01龙凤檀木    <a href=\"http://localhost:8082/OnlineShopping/goodsdetails?id=30\">--查看详情--</a>\r\n', 'ADMIN', '2018-04-20 00:38:26', null, null);
INSERT INTO `active` VALUES ('17', '博致（BOZO） 卫浴马桶大冲力大口径喷射虹吸式坐便器', '博致（BOZO） 卫浴马桶大冲力大口径喷射虹吸式坐便器静音防臭座便家用抽水马桶 300坑距白色脲醛盖板\r\n博致（BOZO） 卫浴马桶大冲力大口径喷射虹吸式坐便器静音防臭座便家用抽水马桶 300坑距白色脲醛盖板    <a href=\"http://localhost:8082/OnlineShopping/goodsdetails?id=26\">--查看详情--</a>', 'ADMIN', '2018-04-20 00:39:26', null, null);

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('11', '10', '天津市河西区丰和路1039号', 'USER', '2018-04-20 00:34:41', null, null);
INSERT INTO `address` VALUES ('12', '10', '天津市南开区1048号', 'USER', '2018-04-20 00:35:14', null, null);
INSERT INTO `address` VALUES ('13', '12', '江苏省苏州市工业区1039号', 'USER', '2018-04-20 00:47:58', null, null);

-- ----------------------------
-- Table structure for aftersales
-- ----------------------------
DROP TABLE IF EXISTS `aftersales`;
CREATE TABLE `aftersales` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cause` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creater` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aftersales
-- ----------------------------
INSERT INTO `aftersales` VALUES ('12', '12', '24', '32', '1', '1', '有松动迹象，想要换一个好的', 'USER', '2018-04-20 00:49:13');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `typeid` int(11) NOT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `descript` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `messageurl` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `photourl` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `total` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT '还剩下多少',
  `tuijian` int(11) NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('17', '雷士三室两厅一阳台套装', '15', '雷士照明 led客厅灯吸', '雷士照明 led客厅灯吸顶灯卧室灯吊灯阳台灯餐吊灯具灯饰 调光调色现代简约镂空温馨浪漫长方形三室两厅一阳台套餐', '1999.00', '2533a4c3-de33-407b-96ef-4f582002e915.jpg', '85494922-d7e0-4480-9ff9-8a64988f4625.jpg', '9.08', '1', '124', '1', 'ADMIN', '2018-04-19 23:23:07', null, null);
INSERT INTO `goods` VALUES ('18', '北欧卧室灯', '15', '北欧卧室灯圆形简约现代客厅阳台灯具', '北欧卧室灯圆形简约现代客厅阳台灯具超薄led马卡龙儿童房吸顶灯', '158.00', '38284feb-e019-4ba0-98b0-c77f080753cd.png', '1dc2fd72-6ab2-4179-a7c6-4f382f8b5177.png', '12.60', '1', '19', '1', 'ADMIN', '2018-04-19 23:31:18', null, null);
INSERT INTO `goods` VALUES ('19', '西西可灯饰', '15', '现代简约led吸顶灯', '客厅灯长方形大气 现代简约led吸顶灯超薄卧室灯书房餐厅大厅灯具', '358.00', '2fae25f4-79af-48e9-94d6-3b0201513581.png', 'fc63df79-b14d-4abb-8459-0741792d107e.png', '20.50', '2', '13', '1', 'ADMIN', '2018-04-19 23:50:47', null, null);
INSERT INTO `goods` VALUES ('20', '烛韵', '15', '简约现代客厅灯具', '简约现代客厅灯具 LED吸顶灯后现代创意个性大气家用北欧卧室灯饰', '369.00', 'bd4774f0-2923-4ea3-b010-d5b48c2c52d9.png', '56be8e1c-c6a3-4ff7-8513-1faeb7819d4d.png', '14.60', '1', '14', '1', 'ADMIN', '2018-04-19 23:54:10', null, null);
INSERT INTO `goods` VALUES ('21', 'A家 床 实木框床', '16', 'A家 床 实木框床1.5米1.8米北欧双人床', 'A家 床 实木框床1.5米1.8米北欧双人床单人储物高箱木床现代简约软包皮床主卧卧室家具 床 高箱床(1500mm*2000mm)', '5133.00', 'c4b13c4c-fdcc-4d3a-999f-ff872bda114d.png', '9873c3be-a79c-4dfb-9a2f-42229df2d349.png', '150.80', '0', '10', '1', 'ADMIN', '2018-04-19 23:58:40', null, null);
INSERT INTO `goods` VALUES ('22', 'A家 床 双人床', '16', '双人床板木床', 'A家 床 双人床板木床单人实木框架高箱床储物床现代简约卧室家具大空间储物1.5米1.8米 组装高箱床 1.5*2米单床', '3185.00', 'af4f931f-bed7-425c-a338-2accc4fbaab0.png', '7de7b1df-d431-4018-a03c-4b8993c23e94.png', '130.50', '2', '0', '1', 'ADMIN', '2018-04-20 00:01:12', null, null);
INSERT INTO `goods` VALUES ('23', '摩天（Motian）床', '16', '皮床真皮床1.8m双人床', '摩天（Motian）床 皮床真皮床1.8m双人床公主床卧室大床家具 真皮床+乳胶床垫+床头柜2个 1500*2000【升级储物另+400】', '3880.00', '1f32555c-c54f-4df7-83fa-6f0249b3cc8a.png', 'db1a7052-d0e4-470a-8628-adf9ec852a86.png', '167.80', '0', '30', '0', 'ADMIN', '2018-04-20 00:05:08', null, null);
INSERT INTO `goods` VALUES ('24', '皇家御兔', '16', '儿童床上下床双', '皇家御兔 床全实木床儿童床上下床双人床子母床高低床双层床上下铺公主床 直梯床上铺宽115下铺宽135 ', '1850.00', 'd00ca334-b0cd-47dc-b65a-505771b44421.png', '76054bdf-1504-4c2a-a7c4-f413d2e419db.png', '89.50', '1', '29', '0', 'ADMIN', '2018-04-20 00:08:05', null, null);
INSERT INTO `goods` VALUES ('25', '欧堂家私', '16', '茶桌椅组合茶台桌', '欧堂家私（O U T A N G J I A S I） 茶桌椅组合茶台桌实木茶几南榆木 【仿古色】1.5米单张四抽茶桌（不带椅子）', '1650.00', 'e3766595-6eb5-4692-bc76-105ebab76a83.png', 'd875877d-7a66-470a-a0ea-169e887dc5f3.png', '36.50', '0', '26', '1', 'ADMIN', '2018-04-20 00:12:06', null, null);
INSERT INTO `goods` VALUES ('26', '博致（BOZO） 卫浴马桶', '14', '卫浴马桶大冲力大口径喷射虹吸式坐便器', '博致（BOZO） 卫浴马桶大冲力大口径喷射虹吸式坐便器静音防臭座便家用抽水马桶 300坑距白色脲醛盖板', '828.00', '23e22343-2010-426d-9c16-0ed6ecf8d052.png', '8e7ee902-d320-48d9-bf8a-18da6b50c3db.png', '58.60', '1', '39', '1', 'ADMIN', '2018-04-20 00:15:24', null, null);
INSERT INTO `goods` VALUES ('27', '厨房304不锈钢 水槽 ', '14', '水槽 双槽 洗菜盆', '华帝 VATTI H-A2012(77)-C.1 厨房304不锈钢 水槽 双槽 洗菜盆 洗碗盆厨盆 套餐加厚', '178.00', '0b08441d-64ea-4115-84c9-6d9ca9990056.png', 'bd1c7dc5-5bc7-40a6-bddd-8458bf769525.png', '12.60', '0', '14', '1', 'ADMIN', '2018-04-20 00:20:40', null, null);
INSERT INTO `goods` VALUES ('28', '公牛G07Z223A', '17', '公牛(BULL) 开关插座 G07系列', '公牛(BULL) 开关插座 G07系列 斜五孔开关 86型插座面板G07Z223A(U6) 香槟金 10只装', '162.00', '0032c757-5295-437b-aad5-ee020d3a0603.png', 'd8c7b2c5-3476-4653-b922-942cbd946add.png', '6.50', '0', '102', '1', 'ADMIN', '2018-04-20 00:23:42', null, null);
INSERT INTO `goods` VALUES ('29', '德施曼（DESSMANN）T7H', '17', '小嘀指纹锁 ', '德施曼（DESSMANN）T7H 小嘀指纹锁 家用防盗门云智能锁 电子密码锁', '1500.00', 'b9aefd56-d98a-4591-95e9-035385b9c490.png', '2ddbe417-c8a4-4958-a5fe-379a63c88bc0.png', '10.20', '1', '19', '0', 'ADMIN', '2018-04-20 00:26:04', null, null);
INSERT INTO `goods` VALUES ('30', '龙鼎天著木门', '18', '卧室门室内门实木复合门', '龙鼎天著木门 卧室门室内门实木复合门定制木门生态门MQC-@01龙凤檀木', '153.00', '5649d650-7c66-4e05-ab2f-3d8143359ffc.png', '76a0c0f9-120e-40e0-8941-8e7363b6a85b.png', '74.50', '0', '12', '1', 'ADMIN', '2018-04-20 00:28:56', null, null);
INSERT INTO `goods` VALUES ('31', '尚品宅配橱柜定制', '18', '欧式风格整体橱柜', '尚品宅配橱柜定制 欧式风格整体橱柜智能厨柜定制多功能橱柜厨房定做 石英石台面厨柜 预付金（非商品价格）', '1258.00', 'bf21d289-281a-410b-b093-889c1054d4eb.png', '449e6c16-3a30-4762-af6f-6c294116117b.png', '152.60', '0', '14', '1', 'ADMIN', '2018-04-20 00:31:10', null, null);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodstype` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('14', '厨房卫浴', 'ADMIN', '2018-04-19 23:09:45', null, null);
INSERT INTO `goodstype` VALUES ('15', '灯具', 'ADMIN', '2018-04-19 23:16:27', null, null);
INSERT INTO `goodstype` VALUES ('16', '家具', 'ADMIN', '2018-04-19 23:17:23', null, null);
INSERT INTO `goodstype` VALUES ('17', '五金电工', 'ADMIN', '2018-04-19 23:17:57', null, null);
INSERT INTO `goodstype` VALUES ('18', '家装建材', 'ADMIN', '2018-04-19 23:18:18', null, null);

-- ----------------------------
-- Table structure for install
-- ----------------------------
DROP TABLE IF EXISTS `install`;
CREATE TABLE `install` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `creater` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of install
-- ----------------------------
INSERT INTO `install` VALUES ('1', '10', '22', '30', '2', 'USER', '2018-04-20 00:45:30');
INSERT INTO `install` VALUES ('3', '12', '29', '36', '1', 'USER', '2018-04-20 00:52:38');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `ordernum` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `goodsid` int(11) NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `senddate` datetime DEFAULT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('30', '10', '384355', '22', '11', '1', '3185.00', '7', null, 'USER', '2018-04-20 00:35:52', null, null);
INSERT INTO `orderdetail` VALUES ('31', '10', '192402', '20', '12', '1', '369.00', '3', null, 'USER', '2018-04-20 00:44:48', null, null);
INSERT INTO `orderdetail` VALUES ('32', '12', '450898', '24', '13', '1', '1850.00', '4', null, 'USER', '2018-04-20 00:48:16', null, null);
INSERT INTO `orderdetail` VALUES ('33', '12', '300072', '26', '13', '1', '828.00', '2', null, 'USER', '2018-04-20 00:50:16', null, null);
INSERT INTO `orderdetail` VALUES ('34', '12', '891230', '17', '13', '1', '1999.00', '1', null, 'USER', '2018-04-20 00:50:52', null, null);
INSERT INTO `orderdetail` VALUES ('35', '12', '994870', '22', '13', '1', '3185.00', '3', null, 'USER', '2018-04-20 00:51:22', null, null);
INSERT INTO `orderdetail` VALUES ('36', '12', '261294', '29', '13', '1', '1500.00', '6', null, 'USER', '2018-04-20 00:52:01', null, null);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordernum` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('41', '384355', '10', 'USER', '2018-04-20 00:35:52', null, null);
INSERT INTO `orders` VALUES ('42', '192402', '10', 'USER', '2018-04-20 00:44:48', null, null);
INSERT INTO `orders` VALUES ('43', '450898', '12', 'USER', '2018-04-20 00:48:16', null, null);
INSERT INTO `orders` VALUES ('44', '300072', '12', 'USER', '2018-04-20 00:50:16', null, null);
INSERT INTO `orders` VALUES ('45', '891230', '12', 'USER', '2018-04-20 00:50:52', null, null);
INSERT INTO `orders` VALUES ('46', '994870', '12', 'USER', '2018-04-20 00:51:22', null, null);
INSERT INTO `orders` VALUES ('47', '261294', '12', 'USER', '2018-04-20 00:52:01', null, null);
INSERT INTO `orders` VALUES ('48', '330051', '12', 'USER', '2018-04-20 01:00:20', null, null);

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `creater` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('10', '10', '18', '1', '158.00', 'USER', '2018-04-21 14:22:27', null, null);
INSERT INTO `shoppingcart` VALUES ('11', '10', '26', '1', '828.00', 'USER', '2018-04-21 14:22:35', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `role` int(11) NOT NULL,
  `usersign` varchar(200) DEFAULT NULL,
  `creater` varchar(20) NOT NULL,
  `createdate` datetime NOT NULL,
  `updater` varchar(20) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'lingyu', '111111', '143wee4545@qq.com', '1', '23', '18322698594', '0', '如风如雨', 'REGISTER', '2018-04-01 02:58:43', null, null);
INSERT INTO `user` VALUES ('10', 'fengyu', '111111', '34343434545@qq.com', '2', '23', '15210259635', '0', '再见为了下一次相遇', 'REGISTER', '2018-04-01 03:03:20', null, null);
INSERT INTO `user` VALUES ('11', 'admin', 'admin', '14567676545@qq.com', '1', '44', '15825789685', '1', '开开心心就好', 'admin', '2018-04-01 03:35:17', null, null);
INSERT INTO `user` VALUES ('12', 'suhong', '111111', '14676004545@qq.com', '1', '22', '13958642589', '0', '无心无为', 'REGISTER', '2018-04-01 03:03:20', '', '2018-04-19 23:03:41');

/*
Navicat MySQL Data Transfer

Source Server         : File
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : file

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-30 21:29:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_gameinformation
-- ----------------------------
DROP TABLE IF EXISTS `b_gameinformation`;
CREATE TABLE `b_gameinformation` (
  `ID` varchar(50) NOT NULL,
  `attribute_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `Datetime` datetime NOT NULL,
  `EvaluationPeople` char(20) NOT NULL,
  `EvaluationPoint` float(10,0) NOT NULL,
  `PublishManifestation` char(10) DEFAULT NULL,
  `Evaluation_Potential Grade` char(10) NOT NULL,
  `ManifestationExplain` varchar(255) NOT NULL,
  `QualityGoods_cultivate` char(40) DEFAULT NULL,
  `QualityGoods_combat` char(40) DEFAULT NULL,
  `EvaluationReport` char(80) NOT NULL,
  `CSV_name` char(80) NOT NULL,
  `GameName` char(40) NOT NULL,
  `Developer` char(40) NOT NULL,
  `Publisher` char(40) NOT NULL,
  `GameType` char(40) NOT NULL,
  `GameTheme` char(40) NOT NULL COMMENT '游戏题材',
  `IsAuthorization` tinyint(1) DEFAULT NULL,
  `InstallationSize` float(10,0) NOT NULL,
  `Platform` char(20) NOT NULL,
  `Completeness` int(10) NOT NULL,
  `GameClassify` int(1) NOT NULL,
  `ScreenDimension` int(10) NOT NULL,
  `PaintingStyle` int(10) NOT NULL,
  `DegreeOfPlay` int(10) NOT NULL,
  `Out_GameType` int(10) NOT NULL,
  `Paytype` int(10) NOT NULL,
  `Privilege` int(10) NOT NULL,
  `EvaluationModel` int(10) NOT NULL,
  `Retestcondition` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_gameinformation
-- ----------------------------

-- ----------------------------
-- Table structure for c_attribute
-- ----------------------------
DROP TABLE IF EXISTS `c_attribute`;
CREATE TABLE `c_attribute` (
  `attribute_id` varchar(50) NOT NULL,
  `attribute_index_name` varchar(255) DEFAULT NULL,
  `attribute_ranking` int(11) DEFAULT NULL,
  `attribute_name` varchar(500) DEFAULT NULL,
  `attribute_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_attribute
-- ----------------------------
INSERT INTO `c_attribute` VALUES ('1', 'scene', '1', '场景', '2D');
INSERT INTO `c_attribute` VALUES ('10', 'pay_type', '4', '付费方式', '未知');
INSERT INTO `c_attribute` VALUES ('11', 'favorable_type', '1', '付费优惠类型', '多倍');
INSERT INTO `c_attribute` VALUES ('12', 'favorable_type', '2', '付费优惠类型', '百分比');
INSERT INTO `c_attribute` VALUES ('13', 'retest_status', '1', '复测情况', '首测');
INSERT INTO `c_attribute` VALUES ('14', 'retest_status', '2', '复测情况', '二测');
INSERT INTO `c_attribute` VALUES ('15', 'retest_status', '3', '复测情况', '三测');
INSERT INTO `c_attribute` VALUES ('16', 'painting_style_1', '1', '画风1', 'Q版');
INSERT INTO `c_attribute` VALUES ('17', 'painting_style_1', '2', '画风1', '写实');
INSERT INTO `c_attribute` VALUES ('18', 'painting_style_2', '1', '画风2', '日韩');
INSERT INTO `c_attribute` VALUES ('19', 'painting_style_2', '2', '画风2', '欧美');
INSERT INTO `c_attribute` VALUES ('2', 'scene', '2', '场景', '3D');
INSERT INTO `c_attribute` VALUES ('20', 'painting_style_2', '3', '画风2', '中国风');
INSERT INTO `c_attribute` VALUES ('21', 'platform_type', '1', '平台', 'Android');
INSERT INTO `c_attribute` VALUES ('22', 'platform_type', '2', '平台', 'IOS');
INSERT INTO `c_attribute` VALUES ('23', 'evaluate_mode', '1', '评测模式', '独代');
INSERT INTO `c_attribute` VALUES ('24', 'evaluate_mode', '2', '评测模式', '联运');
INSERT INTO `c_attribute` VALUES ('25', 'evaluate_mode', '3', '评测模式', '其他');
INSERT INTO `c_attribute` VALUES ('26', 'show_person_type', '1', '人物', '2D');
INSERT INTO `c_attribute` VALUES ('27', 'show_person_type', '2', '人物', '3D');
INSERT INTO `c_attribute` VALUES ('28', 'game_type', '1', '游戏类型', '单机');
INSERT INTO `c_attribute` VALUES ('29', 'game_type', '2', '游戏类型', '网游');
INSERT INTO `c_attribute` VALUES ('3', 'out_test_type_1', '1', '对外测试类型1', '删档');
INSERT INTO `c_attribute` VALUES ('30', 'game_type', '3', '游戏类型', '弱联网单据');
INSERT INTO `c_attribute` VALUES ('31', 'playing_method', '1', '游戏玩法', '轻度');
INSERT INTO `c_attribute` VALUES ('32', 'playing_method', '2', '游戏玩法', '中度');
INSERT INTO `c_attribute` VALUES ('33', 'playing_method', '3', '游戏玩法', '重度');
INSERT INTO `c_attribute` VALUES ('4', 'out_test_type_1', '2', '对外测试类型1', '不删档');
INSERT INTO `c_attribute` VALUES ('5', 'out_test_type_2', '1', '对外测试类型2', '付费');
INSERT INTO `c_attribute` VALUES ('6', 'out_test_type_2', '2', '对外测试类型2', '不付费');
INSERT INTO `c_attribute` VALUES ('7', 'pay_type', '1', '付费方式', 'SDK');
INSERT INTO `c_attribute` VALUES ('8', 'pay_type', '2', '付费方式', '短代');
INSERT INTO `c_attribute` VALUES ('9', 'pay_type', '3', '付费方式', '第三方');

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `user_id` varchar(50) NOT NULL,
  `account` varchar(100) NOT NULL DEFAULT '0000' COMMENT '用户编号，默认0000',
  `password` varchar(500) NOT NULL,
  `username` varchar(500) NOT NULL,
  `userstatus` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=已删除；1=正常',
  `userright` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0=普通用户；1=管理员',
  `createDateTime` datetime NOT NULL,
  `modifyDateTime` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('0dd7bfcf1bf3', '444', '202cb962ac59075b964b07152d234b70', '李四', '1', '1', '2015-08-25 00:22:23', '2015-08-25 01:25:41');
INSERT INTO `c_user` VALUES ('3366584bdf8a', '555', '6074c6aa3488f3c2dddff2a7ca821aab', '王五', '1', '0', '2015-08-25 00:24:31', '2015-08-25 01:24:56');
INSERT INTO `c_user` VALUES ('7adfa845c45c', '333', '81dc9bdb52d04dc20036dbd8313ed055', '张三', '0', '0', '2015-08-23 11:04:22', '2015-08-23 11:04:26');
INSERT INTO `c_user` VALUES ('b71353591a85', '111', '698d51a19d8a121ce581499d7b701668', '赵一', '1', '0', '2015-08-25 00:13:32', '2015-08-29 13:44:31');
INSERT INTO `c_user` VALUES ('c79e8683b224', '222', 'bcbe3365e6ac95ea2c0343a2395834dd', '钱二', '1', '1', '2015-08-25 00:17:38', '2015-08-25 01:25:16');

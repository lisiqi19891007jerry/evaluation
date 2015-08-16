/*
Navicat MySQL Data Transfer

Source Server         : File
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : file

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-08-16 15:09:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_gameinformation
-- ----------------------------
DROP TABLE IF EXISTS `b_gameinformation`;
CREATE TABLE `b_gameinformation` (
  `ID` int(50) NOT NULL AUTO_INCREMENT,
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
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_index_name` varchar(255) DEFAULT NULL,
  `attribute_name` char(20) DEFAULT NULL,
  `attribute_value` char(20) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_attribute
-- ----------------------------
INSERT INTO `c_attribute` VALUES ('1', 'scene', '场景', '2D');
INSERT INTO `c_attribute` VALUES ('2', 'scene', '场景', '3D');
INSERT INTO `c_attribute` VALUES ('3', 'out_test_type_1', '对外测试类型1', '删档');
INSERT INTO `c_attribute` VALUES ('4', 'out_test_type_1', '对外测试类型1', '不删档');
INSERT INTO `c_attribute` VALUES ('5', 'out_test_type_2', '对外测试类型2', '付费');
INSERT INTO `c_attribute` VALUES ('6', 'out_test_type_2', '对外测试类型2', '不付费');
INSERT INTO `c_attribute` VALUES ('7', 'pay_type', '付费方式', 'SDK');
INSERT INTO `c_attribute` VALUES ('8', 'pay_type', '付费方式', '短代');
INSERT INTO `c_attribute` VALUES ('9', 'pay_type', '付费方式', '第三方');
INSERT INTO `c_attribute` VALUES ('10', 'pay_type', '付费方式', '未知');
INSERT INTO `c_attribute` VALUES ('11', 'favorable_type', '付费优惠类型', '多倍');
INSERT INTO `c_attribute` VALUES ('12', 'favorable_type', '付费优惠类型', '百分比');
INSERT INTO `c_attribute` VALUES ('13', 'retest_status', '复测情况', '首测');
INSERT INTO `c_attribute` VALUES ('14', 'retest_status', '复测情况', '二测');
INSERT INTO `c_attribute` VALUES ('15', 'retest_status', '复测情况', '三测');
INSERT INTO `c_attribute` VALUES ('16', 'painting_style_1', '画风1', 'Q版');
INSERT INTO `c_attribute` VALUES ('17', 'painting_style_1', '画风1', '写实');
INSERT INTO `c_attribute` VALUES ('18', 'painting_style_2', '画风2', '日韩');
INSERT INTO `c_attribute` VALUES ('19', 'painting_style_2', '画风2', '欧美');
INSERT INTO `c_attribute` VALUES ('20', 'painting_style_2', '画风2', '中国风');
INSERT INTO `c_attribute` VALUES ('21', 'platform_type', '平台', 'Android');
INSERT INTO `c_attribute` VALUES ('22', 'platform_type', '平台', 'IOS');
INSERT INTO `c_attribute` VALUES ('23', 'evaluate_mode', '评测模式', '独代');
INSERT INTO `c_attribute` VALUES ('24', 'evaluate_mode', '评测模式', '联运');
INSERT INTO `c_attribute` VALUES ('25', 'evaluate_mode', '评测模式', '其他');
INSERT INTO `c_attribute` VALUES ('26', 'show_person_type', '人物', '2D');
INSERT INTO `c_attribute` VALUES ('27', 'show_person_type', '人物', '3D');
INSERT INTO `c_attribute` VALUES ('28', 'game_type', '游戏类型', '单机');
INSERT INTO `c_attribute` VALUES ('29', 'game_type', '游戏类型', '网游');
INSERT INTO `c_attribute` VALUES ('30', 'game_type', '游戏类型', '弱联网单据');
INSERT INTO `c_attribute` VALUES ('31', 'playing_method', '游戏玩法', '轻度');
INSERT INTO `c_attribute` VALUES ('32', 'playing_method', '游戏玩法', '中度');
INSERT INTO `c_attribute` VALUES ('33', 'playing_method', '游戏玩法', '重度');

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `user_id` int(50) NOT NULL AUTO_INCREMENT,
  `account` int(20) NOT NULL DEFAULT '0',
  `password` char(40) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userstatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('1', '101', '81dc9bdb52d04dc20036dbd8313ed055', 'test1', '1');
INSERT INTO `c_user` VALUES ('2', '102', '81dc9bdb52d04dc20036dbd8313ed055', 'test2', '1');
INSERT INTO `c_user` VALUES ('3', '103', '81dc9bdb52d04dc20036dbd8313ed055', 'test3', '0');
INSERT INTO `c_user` VALUES ('4', '104', '81dc9bdb52d04dc20036dbd8313ed055', 'test4', '1');
INSERT INTO `c_user` VALUES ('5', '105', '81dc9bdb52d04dc20036dbd8313ed055', 'test5', '1');

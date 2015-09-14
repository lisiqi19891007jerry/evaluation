/*
Navicat MySQL Data Transfer

Source Server         : File
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : file

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-15 00:12:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_gameinformation
-- ----------------------------
DROP TABLE IF EXISTS `b_gameinformation`;
CREATE TABLE `b_gameinformation` (
  `ID` int(50) NOT NULL AUTO_INCREMENT,
  `Datetime` datetime NOT NULL,
  `EvaluationPeople` char(20) NOT NULL,
  `EvaluationPoint` float(10,0) NOT NULL,
  `PublishManifestation` char(10) DEFAULT NULL,
  `Classified_Evaluate` char(10) DEFAULT NULL,
  `Evaluation_Potential_Grade` char(10) DEFAULT NULL,
  `ManifestationExplain` varchar(80) NOT NULL,
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
  `Scene` int(1) NOT NULL,
  `Show_person_type` int(1) NOT NULL,
  `Painting_style_1` int(1) NOT NULL,
  `Painting_style_2` int(1) NOT NULL,
  `DegreeOfPlay` int(10) NOT NULL,
  `Out_test_type_1` int(1) NOT NULL,
  `Out_test_type_2` int(1) NOT NULL,
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
-- Table structure for b_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `b_upload_file`;
CREATE TABLE `b_upload_file` (
  `file_id` varchar(50) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_extension` varchar(50) NOT NULL,
  `file_upload_time` datetime NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_upload_file
-- ----------------------------
INSERT INTO `b_upload_file` VALUES ('57d514542090', 'test', '20150915001125_员工自带电脑申请表', 'E:/test/test//201509/20150915001125_员工自带电脑申请表.doc', 'doc', '2015-09-15 00:11:25');

-- ----------------------------
-- Table structure for c_attribute
-- ----------------------------
DROP TABLE IF EXISTS `c_attribute`;
CREATE TABLE `c_attribute` (
  `attribute_id` varchar(50) NOT NULL,
  `attribute_index_name` varchar(255) DEFAULT NULL,
  `attribute_show_name` varchar(255) DEFAULT NULL,
  `attribute_ranking` int(11) DEFAULT NULL,
  `attribute_name` varchar(500) DEFAULT NULL,
  `attribute_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_attribute
-- ----------------------------
INSERT INTO `c_attribute` VALUES ('01', 'scene', '场景', '1', '2D', '0');
INSERT INTO `c_attribute` VALUES ('02', 'scene', '场景', '2', '3D', '1');
INSERT INTO `c_attribute` VALUES ('03', 'out_test_type_1', '对外测试类型1', '1', '删档', '1');
INSERT INTO `c_attribute` VALUES ('04', 'out_test_type_1', '对外测试类型1', '2', '不删档', '2');
INSERT INTO `c_attribute` VALUES ('05', 'out_test_type_2', '对外测试类型2', '1', '付费', '1');
INSERT INTO `c_attribute` VALUES ('06', 'out_test_type_2', '对外测试类型2', '2', '不付费', '2');
INSERT INTO `c_attribute` VALUES ('07', 'pay_type', '付费方式', '1', 'SDK', '0');
INSERT INTO `c_attribute` VALUES ('08', 'pay_type', '付费方式', '2', '短代', '1');
INSERT INTO `c_attribute` VALUES ('09', 'pay_type', '付费方式', '3', '第三方', '2');
INSERT INTO `c_attribute` VALUES ('11', 'favorable_type', '付费优惠类型', '1', '多倍', '0');
INSERT INTO `c_attribute` VALUES ('12', 'favorable_type', '付费优惠类型', '2', '百分比', '1');
INSERT INTO `c_attribute` VALUES ('13', 'retest_status', '复测情况', '1', '首测', '0');
INSERT INTO `c_attribute` VALUES ('14', 'retest_status', '复测情况', '2', '二测', '1');
INSERT INTO `c_attribute` VALUES ('15', 'retest_status', '复测情况', '3', '三测', '2');
INSERT INTO `c_attribute` VALUES ('16', 'painting_style_1', '绘画', '1', 'Q版', '0');
INSERT INTO `c_attribute` VALUES ('17', 'painting_style_1', '绘画', '2', '写实', '1');
INSERT INTO `c_attribute` VALUES ('18', 'painting_style_2', '风格', '1', '日韩', '0');
INSERT INTO `c_attribute` VALUES ('19', 'painting_style_2', '风格', '2', '欧美', '1');
INSERT INTO `c_attribute` VALUES ('20', 'painting_style_2', '风格', '3', '中国风', '2');
INSERT INTO `c_attribute` VALUES ('21', 'platform_type', '平台', '1', 'Android', '0');
INSERT INTO `c_attribute` VALUES ('22', 'platform_type', '平台', '2', 'IOS', '1');
INSERT INTO `c_attribute` VALUES ('23', 'evaluate_mode', '评测模式', '1', '独代', '0');
INSERT INTO `c_attribute` VALUES ('24', 'evaluate_mode', '评测模式', '2', '联运', '1');
INSERT INTO `c_attribute` VALUES ('25', 'evaluate_mode', '评测模式', '3', '其他', '2');
INSERT INTO `c_attribute` VALUES ('26', 'show_person_type', '人物', '1', '2D', '0');
INSERT INTO `c_attribute` VALUES ('27', 'show_person_type', '人物', '2', '3D', '1');
INSERT INTO `c_attribute` VALUES ('28', 'game_type', '单机or网游', '1', '单机', '0');
INSERT INTO `c_attribute` VALUES ('29', 'game_type', '单机or网游', '2', '网游', '1');
INSERT INTO `c_attribute` VALUES ('30', 'game_type', '单机or网游', '3', '弱联网单据', '2');
INSERT INTO `c_attribute` VALUES ('31', 'playing_method', '游戏玩法轻重度', '1', '轻度', '0');
INSERT INTO `c_attribute` VALUES ('32', 'playing_method', '游戏玩法轻重度', '2', '中度', '1');
INSERT INTO `c_attribute` VALUES ('33', 'playing_method', '游戏玩法轻重度', '3', '重度', '2');
INSERT INTO `c_attribute` VALUES ('34', 'evaluation_person', '测评人', null, '', '');
INSERT INTO `c_attribute` VALUES ('37', 'evaluation_level', '测评评级', '1', 'B', 'B');
INSERT INTO `c_attribute` VALUES ('38', 'evaluation_level', '测评评级', '2', 'B+', 'B+');
INSERT INTO `c_attribute` VALUES ('39', 'evaluation_level', '测评评级', '3', 'A', 'A');
INSERT INTO `c_attribute` VALUES ('40', 'evaluation_level', '测评评级', '4', 'A+', 'A+');
INSERT INTO `c_attribute` VALUES ('41', 'online_level', '上线表现级别', '1', 'B', 'B');
INSERT INTO `c_attribute` VALUES ('42', 'online_level', '上线表现级别', '2', 'B+', 'B+');
INSERT INTO `c_attribute` VALUES ('43', 'online_level', '上线表现级别', '3', 'A', 'A');
INSERT INTO `c_attribute` VALUES ('44', 'online_level', '上线表现级别', '4', 'A+', 'A+');
INSERT INTO `c_attribute` VALUES ('45', 'evaluation_potential_grade', '潜力等级', '1', 'B', 'B');
INSERT INTO `c_attribute` VALUES ('46', 'evaluation_potential_grade', '潜力等级', '2', 'B+', 'B+');
INSERT INTO `c_attribute` VALUES ('47', 'evaluation_potential_grade', '潜力等级', '3', 'A', 'A');
INSERT INTO `c_attribute` VALUES ('48', 'evaluation_potential_grade', '潜力等级', '4', 'A+', 'A+');
INSERT INTO `c_attribute` VALUES ('49', 'is_authorization', '是否IP授权', '1', '是', '1');
INSERT INTO `c_attribute` VALUES ('50', 'is_authorization', '是否IP授权', '2', '否', '0');

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
INSERT INTO `c_user` VALUES ('b71353591a85', '111', '698d51a19d8a121ce581499d7b701668', '赵一', '1', '1', '2015-08-25 00:13:32', '2015-08-29 13:44:31');
INSERT INTO `c_user` VALUES ('c79e8683b224', '222', 'bcbe3365e6ac95ea2c0343a2395834dd', '钱二', '1', '1', '2015-08-25 00:17:38', '2015-08-25 01:25:16');

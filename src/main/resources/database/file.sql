/*
Navicat MySQL Data Transfer

Source Server         : File
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : file

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-09-23 22:34:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_gameinformation
-- ----------------------------
DROP TABLE IF EXISTS `b_gameinformation`;
CREATE TABLE `b_gameinformation` (
  `ID` varchar(50) NOT NULL,
  `Datetime` datetime NOT NULL,
  `EvaluationPeople` varchar(20) NOT NULL,
  `EvaluationPoint` float(20,10) NOT NULL,
  `PublishManifestation` varchar(10) DEFAULT NULL,
  `Classified_Evaluate` varchar(10) DEFAULT NULL,
  `Evaluation_Potential_Grade` varchar(10) DEFAULT NULL,
  `ManifestationExplain` varchar(255) NOT NULL,
  `QualityGoods_cultivate` varchar(255) DEFAULT NULL,
  `QualityGoods_combat` varchar(255) DEFAULT NULL,
  `EvaluationReport` varchar(50) NOT NULL,
  `CSV_name` varchar(50) NOT NULL,
  `GameName` varchar(40) NOT NULL,
  `Developer` varchar(40) NOT NULL,
  `Publisher` varchar(40) NOT NULL,
  `GameType` varchar(40) NOT NULL,
  `GameTheme` varchar(40) NOT NULL COMMENT '游戏题材',
  `IsAuthorization` varchar(1) DEFAULT NULL,
  `InstallationSize` float(20,10) NOT NULL,
  `Platform` varchar(20) NOT NULL,
  `Completeness` float(20,10) NOT NULL,
  `GameClassify` varchar(1) NOT NULL,
  `Scene` varchar(1) NOT NULL,
  `Show_person_type` varchar(1) NOT NULL,
  `Painting_style_1` varchar(1) NOT NULL,
  `Painting_style_2` varchar(1) NOT NULL,
  `DegreeOfPlay` varchar(10) NOT NULL,
  `Out_test_type_1` varchar(1) NOT NULL,
  `Out_test_type_2` varchar(1) NOT NULL,
  `Paytype` varchar(10) NOT NULL,
  `Privilege` varchar(10) NOT NULL,
  `EvaluationModel` varchar(10) NOT NULL,
  `Retestcondition` varchar(10) NOT NULL,
  `createDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_gameinformation
-- ----------------------------
INSERT INTO `b_gameinformation` VALUES ('05f8f69511d0', '2015-09-20 00:00:00', '222', '0.0099999998', 'A+', 'B+', 'A+', '上线表现特殊字符@#%……&×（）&……', '参考竞品特殊字符@#%……&×（）&……', '参考战斗特殊字符@#%……&×（）&……', '', '', '1_特殊字符！@#￥%……&×/n  他', '研发商1', '发行商1', '游戏类型', '游戏题材', '1', '99.9899978638', '0', '100.0000000000', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '', '0', '2015-09-23 21:59:29');
INSERT INTO `b_gameinformation` VALUES ('164f9525d0ec', '2015-09-17 00:00:00', '444', '3.0000000000', 'B+', 'A', 'B', '上线表现评价说明', '参考竞品养成方面', '参考战斗养成方面', '', '', '游戏名', '研发商', '发行商', '游戏类型', '游戏题材', '1', '1.0000000000', '0', '2.0000000000', '0', '0', '0', '1', '0', '2', '1', '1', '1', '1', '2', '2', '2015-09-22 21:59:33');
INSERT INTO `b_gameinformation` VALUES ('1c84b12c8fca', '2015-09-10 00:00:00', '222', '2314.0000000000', 'B', 'B', 'B+', '1234124321', '123412341241', '12431234214', '', 'f7daea9332b4', '123', '321', '111', '222', '333', '0', '444.0000000000', '0', '100.0000000000', '1', '1', '0', '1', '1', '0', '1', '1', '2', '1', '3', '0', '2015-09-23 22:33:29');
INSERT INTO `b_gameinformation` VALUES ('1df5a36ef434', '2015-09-19 00:00:00', '111', '1.0000000000', '', 'B', '', '', '', '', '', '', '只填全部必填信息', '1', '', '游戏类型', '游戏题材', '1', '1.0000000000', '0', '100.0000000000', '0', '0', '0', '0', '0', '0', '2', '2', '', '', '1', '0', '2015-09-23 19:59:42');
INSERT INTO `b_gameinformation` VALUES ('38b86cb077fd', '2015-09-19 00:00:00', '111', '3.0000000000', '', 'A+', '', '', '', '', '', '', '必填信息+评测报告', '', '', '游戏类型', '游戏题材', '0', '1.0000000000', '0', '100.0000000000', '0', '1', '1', '1', '2', '2', '2', '2', '', '', '', '0', '2015-09-14 21:59:48');
INSERT INTO `b_gameinformation` VALUES ('3c641cf93b54', '2015-09-19 00:00:00', '547773', '3.0000000000', '', 'B', '', '', '', '', '', '', '必填信息+评测报告', '', '', '游戏类型', '游戏题材', '1', '1.0000000000', '0', '100.0000000000', '2', '1', '1', '1', '2', '2', '2', '2', '', '', '', '0', '2015-09-18 21:59:51');
INSERT INTO `b_gameinformation` VALUES ('4383c78dd846', '2015-09-10 00:00:00', '222', '321.0000000000', 'A', 'B', 'B+', '离开家的沙发你的卡上', '啊深刻了解对方哈索尼克', '', '', '', '游戏名', '研发商', '发行商', '游戏类型', '游戏题材', '1', '123.0000000000', '0', '22.0000000000', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '2', '0', '2015-09-23 22:04:45');
INSERT INTO `b_gameinformation` VALUES ('53532cacd1f6', '2015-09-19 00:00:00', '111', '3.0000000000', '', 'B', '', '', '', '入口即哈输入东风科技', '', '', '非管理员新增的', '2', '', '游戏类型', '游戏题材', '0', '1.0000000000', '0', '100.0000000000', '0', '0', '0', '1', '1', '0', '2', '2', '', '', '', '0', '2015-09-11 21:59:55');
INSERT INTO `b_gameinformation` VALUES ('a17f0ec63b75', '2015-09-19 00:00:00', '547773', '123.0000000000', '', 'B+', '', '', '', '', '', '', '必填信息+评测报告', '', '', '游戏类型', '游戏题材', '0', '123.0000000000', '1', '100.0000000000', '1', '1', '1', '1', '1', '1', '2', '2', '', '', '', '0', '2015-09-11 22:00:00');
INSERT INTO `b_gameinformation` VALUES ('af4a89ebb471', '2015-09-18 00:00:00', '111', '99.9899978638', 'A+', 'A+', 'A+', '', '', '', '', '', 'test001', '', '2', '游戏类型1', '游戏题材1', '1', '111.0100021362', '0', '100.0000000000', '0', '1', '1', '1', '1', '1', '1', '1', '2', '1', '1', '0', '2015-10-01 22:00:03');
INSERT INTO `b_gameinformation` VALUES ('effed78b6c0a', '2015-09-20 00:00:00', '111', '0.0099999998', '', 'B', '', '', '', '', '', '', '游戏名称长---很长很长，不够长啦啦', '', '1', '游戏类型会有多少个字呢？一般情况下', '游戏题材会有多少个字呢？一般情况下就这', '1', '1.0000000000', '0', '100.0000000000', '0', '0', '1', '1', '0', '0', '2', '2', '', '', '', '0', '2015-09-01 22:00:07');
INSERT INTO `b_gameinformation` VALUES ('ff92c39cf7c5', '2015-09-01 00:00:00', '444', '999.0000000000', '', 'A+', '', '', '', '', '', '', '游戏名', '', '', '游戏类型', '游戏题材', '0', '123.0000000000', '1', '100.0000000000', '1', '1', '1', '1', '1', '1', '2', '2', '', '', '', '1', '2015-09-23 22:00:10');

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
INSERT INTO `b_upload_file` VALUES ('f7daea9332b4', 'play', '20150923223328_员工自带电脑申请表', 'E:/test/play//201509/20150923223328_员工自带电脑申请表.doc', 'doc', '2015-09-23 22:33:29');

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
INSERT INTO `c_attribute` VALUES ('07', 'pay_type', '付费方式', '1', 'SDK', '1');
INSERT INTO `c_attribute` VALUES ('08', 'pay_type', '付费方式', '2', '短代', '2');
INSERT INTO `c_attribute` VALUES ('09', 'pay_type', '付费方式', '3', '第三方', '3');
INSERT INTO `c_attribute` VALUES ('11', 'favorable_type', '付费优惠类型', '1', '多倍', '0');
INSERT INTO `c_attribute` VALUES ('12', 'favorable_type', '付费优惠类型', '2', '百分比', '1');
INSERT INTO `c_attribute` VALUES ('13', 'retest_status', '复测情况', '1', '首测', '0');
INSERT INTO `c_attribute` VALUES ('14', 'retest_status', '复测情况', '2', '二测', '1');
INSERT INTO `c_attribute` VALUES ('15', 'retest_status', '复测情况', '3', '三测及以上', '2');
INSERT INTO `c_attribute` VALUES ('16', 'painting_style_1', '绘画', '1', 'Q版', '0');
INSERT INTO `c_attribute` VALUES ('17', 'painting_style_1', '绘画', '2', '写实', '1');
INSERT INTO `c_attribute` VALUES ('18', 'painting_style_2', '风格', '1', '日韩', '0');
INSERT INTO `c_attribute` VALUES ('19', 'painting_style_2', '风格', '2', '欧美', '1');
INSERT INTO `c_attribute` VALUES ('20', 'painting_style_2', '风格', '3', '中国风', '2');
INSERT INTO `c_attribute` VALUES ('21', 'platform_type', '平台', '1', 'Android', '0');
INSERT INTO `c_attribute` VALUES ('22', 'platform_type', '平台', '2', 'IOS', '1');
INSERT INTO `c_attribute` VALUES ('23', 'evaluate_mode', '评测模式', '1', '独代', '1');
INSERT INTO `c_attribute` VALUES ('24', 'evaluate_mode', '评测模式', '2', '联运', '2');
INSERT INTO `c_attribute` VALUES ('25', 'evaluate_mode', '评测模式', '3', '其他', '3');
INSERT INTO `c_attribute` VALUES ('26', 'show_person_type', '人物', '1', '2D', '0');
INSERT INTO `c_attribute` VALUES ('27', 'show_person_type', '人物', '2', '3D', '1');
INSERT INTO `c_attribute` VALUES ('28', 'game_type', '单机or网游', '1', '单机', '0');
INSERT INTO `c_attribute` VALUES ('29', 'game_type', '单机or网游', '2', '网游', '1');
INSERT INTO `c_attribute` VALUES ('30', 'game_type', '单机or网游', '3', '弱联网单机', '2');
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
INSERT INTO `c_attribute` VALUES ('51', 'online_level', '上线表现级别', '0', '', '');
INSERT INTO `c_attribute` VALUES ('52', 'evaluation_potential_grade', '潜力等级', '0', '', '');
INSERT INTO `c_attribute` VALUES ('53', 'evaluate_mode', '评测模式', '4', '未知', '');
INSERT INTO `c_attribute` VALUES ('54', 'pay_type', '付费方式', '4', '未知', '');
INSERT INTO `c_attribute` VALUES ('55', 'favorable_type', '付费优惠类型', '3', '未知', '');

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
INSERT INTO `c_user` VALUES ('3366584bdf8a', '555', '202cb962ac59075b964b07152d234b70', '王五', '1', '0', '2015-08-25 00:24:31', '2015-09-19 12:58:14');
INSERT INTO `c_user` VALUES ('473556c89437', '547773', '202cb962ac59075b964b07152d234b70', 'lj', '1', '1', '2015-09-18 23:51:42', '2015-09-18 23:51:42');
INSERT INTO `c_user` VALUES ('7adfa845c45c', '333', '81dc9bdb52d04dc20036dbd8313ed055', '张三', '0', '0', '2015-08-23 11:04:22', '2015-08-23 11:04:26');
INSERT INTO `c_user` VALUES ('b71353591a85', '111', '698d51a19d8a121ce581499d7b701668', '赵一', '1', '1', '2015-08-25 00:13:32', '2015-08-29 13:44:31');
INSERT INTO `c_user` VALUES ('c79e8683b224', '222', 'bcbe3365e6ac95ea2c0343a2395834dd', '钱二', '1', '1', '2015-08-25 00:17:38', '2015-08-25 01:25:16');

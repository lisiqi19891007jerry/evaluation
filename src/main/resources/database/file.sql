/*
Navicat MySQL Data Transfer

Source Server         : File
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : file

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2015-10-31 20:21:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_gameinformation
-- ----------------------------
DROP TABLE IF EXISTS `b_gameinformation`;
CREATE TABLE `b_gameinformation` (
  `ID` varchar(50) NOT NULL COMMENT 'ID主键',
  `GameName` varchar(40) NOT NULL COMMENT '游戏名称',
  `Developer` varchar(40) NOT NULL COMMENT '研发商',
  `Publisher` varchar(40) NOT NULL COMMENT '发行商',
  `GameType` varchar(40) NOT NULL COMMENT '游戏类型',
  `GameTheme` varchar(40) NOT NULL COMMENT '游戏题材',
  `InstallationSize` float(20,10) NOT NULL COMMENT '包体大小',
  `Completeness` varchar(1) NOT NULL COMMENT '游戏完成度',
  `IsAuthorization` varchar(1) DEFAULT NULL COMMENT '是否IP授权',
  `GameClassify` varchar(1) NOT NULL COMMENT '游戏分类',
  `Platform` varchar(20) NOT NULL COMMENT '平台',
  `Scene` varchar(1) NOT NULL COMMENT '场景',
  `Show_person_type` varchar(1) NOT NULL COMMENT '人物',
  `Draw` varchar(1) NOT NULL COMMENT '绘画',
  `Style` varchar(1) NOT NULL COMMENT '风格',
  `DegreeOfPlay` varchar(10) NOT NULL COMMENT '游戏玩法轻重度',
  `Area` varchar(50) DEFAULT NULL COMMENT '区域',
  `Retestcondition` varchar(10) NOT NULL COMMENT '复测情况',
  `EvaluationDatetime` datetime NOT NULL COMMENT '测评日期',
  `EvaluationPeople` varchar(20) NOT NULL COMMENT '评测人',
  `EvaluationPoint` float(20,10) NOT NULL COMMENT '测评分',
  `Classified_Evaluate` varchar(10) DEFAULT NULL COMMENT '测评等级',
  `PublishManifestation` varchar(10) DEFAULT NULL COMMENT '上线表现级别',
  `Feature` varchar(255) DEFAULT NULL COMMENT '特色',
  `QualityGoods_combat` varchar(255) DEFAULT NULL COMMENT '参考竞品（战斗方面）',
  `QualityGoods_cultivate` varchar(255) DEFAULT NULL COMMENT '参考竞品（养成方面）',
  `GameComment` varchar(3000) DEFAULT NULL COMMENT '游戏简评',
  `Attachment` varchar(50) DEFAULT NULL COMMENT '附件',
  `Game_icon` varchar(50) DEFAULT NULL COMMENT '游戏图标',
  `createDateTime` datetime DEFAULT NULL COMMENT '数据记录创建时间',
  `modifyCount` int(11) NOT NULL DEFAULT '0' COMMENT '数据更新版本号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_gameinformation
-- ----------------------------
INSERT INTO `b_gameinformation` VALUES ('50177043078f', 'docker游戏名', 'docker研发商', 'docker发行商', 'docker游戏类型', 'docker游戏题材', '4.0000000000', '1', '1', '0', '0', '0', '0', '0', '0', '0', '国内', '1', '2015-10-22 00:00:00', '111', '33.0000000000', 'B+', '', '亮点/特色/创新', '竞品（战斗）', '竞品（养成）', '简评', 'fb7fdcc9f2e5', 'bdadd910a926', '2015-10-31 00:22:11', '1');

-- ----------------------------
-- Table structure for b_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `b_upload_file`;
CREATE TABLE `b_upload_file` (
  `file_id` varchar(50) NOT NULL COMMENT '文件id（主键字段）',
  `game_id` varchar(50) NOT NULL COMMENT '游戏ID',
  `file_type` varchar(255) NOT NULL COMMENT '文件类型',
  `file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `file_path` varchar(500) NOT NULL COMMENT '文件存放路径',
  `file_extension` varchar(50) NOT NULL COMMENT '文件扩展名',
  `file_upload_time` datetime NOT NULL COMMENT '文件上传时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_upload_file
-- ----------------------------
INSERT INTO `b_upload_file` VALUES ('353dc5637c44', '50177043078f', 'img', '20151031002211_Tulips', 'E:/test/images//201510/docker游戏名/20151031002211_Tulips.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('994367e16ab3', '50177043078f', 'img', '20151031002211_Desert', 'E:/test/images//201510/docker游戏名/20151031002211_Desert.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('a6963ff66b23', '50177043078f', 'img', '20151031002211_Penguins', 'E:/test/images//201510/docker游戏名/20151031002211_Penguins.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('bd5549571178', '50177043078f', 'img', '20151031002211_Lighthouse', 'E:/test/images//201510/docker游戏名/20151031002211_Lighthouse.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('bdadd910a926', '50177043078f', 'icon', '20151031002204_Chrysanthemum', 'E:/test/icon//201510/20151031002204_Chrysanthemum.jpg', 'jpg', '2015-10-31 00:22:05');
INSERT INTO `b_upload_file` VALUES ('c2cd2cb55953', '50177043078f', 'img', '20151031002211_Hydrangeas', 'E:/test/images//201510/docker游戏名/20151031002211_Hydrangeas.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('f61d8ca86e94', '50177043078f', 'img', '20151031002211_Jellyfish', 'E:/test/images//201510/docker游戏名/20151031002211_Jellyfish.jpg', 'jpg', '2015-10-31 00:22:11');
INSERT INTO `b_upload_file` VALUES ('fb7fdcc9f2e5', '50177043078f', 'attachment', '20151031002204_oracle_coherence_cookbook', 'E:/test/attachment//201510/20151031002204_oracle_coherence_cookbook.pdf', 'pdf', '2015-10-31 00:22:05');

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
INSERT INTO `c_attribute` VALUES ('0303bea54d1a', 'retest_status', '复测情况', '1', '首测', '0');
INSERT INTO `c_attribute` VALUES ('0a9649560361', 'painting_style_2', '风格', '1', '日韩', '0');
INSERT INTO `c_attribute` VALUES ('0daa808c404e', 'game_type', '分类', '1', '单机', '0');
INSERT INTO `c_attribute` VALUES ('111d9ce87a19', 'platform_type', '平台', '1', 'Android', '0');
INSERT INTO `c_attribute` VALUES ('1afce1f15da7', 'evaluation_level', '测评评级', '1', 'B', 'B');
INSERT INTO `c_attribute` VALUES ('1c102cf8ca7a', 'area', '区域', '2', '海外', '海外');
INSERT INTO `c_attribute` VALUES ('29eec026b050', 'area', '区域', '1', '国内', '国内');
INSERT INTO `c_attribute` VALUES ('2b68bf5f8aeb', 'playing_method', '重度', '1', '轻度', '0');
INSERT INTO `c_attribute` VALUES ('3bde1cbe5409', 'playing_method', '重度', '3', '重度', '2');
INSERT INTO `c_attribute` VALUES ('413ff6f478d2', 'oversea', '海外', '2', '英国', '英国');
INSERT INTO `c_attribute` VALUES ('433cee7d4fbe', 'evaluation_level', '测评评级', '2', 'B+', 'B+');
INSERT INTO `c_attribute` VALUES ('4601dbba1b92', 'retest_status', '复测情况', '2', '二测', '1');
INSERT INTO `c_attribute` VALUES ('462793d3ac29', 'oversea', '海外', '4', '澳大利亚', '澳大利亚');
INSERT INTO `c_attribute` VALUES ('48b3cf6e4fe5', 'evaluation_level', '测评评级', '3', 'A', 'A');
INSERT INTO `c_attribute` VALUES ('5d16474376b2', 'oversea', '海外', '5', '香港', '香港');
INSERT INTO `c_attribute` VALUES ('5df3186898ed', 'online_level', '上线表现级别', '4', 'A', 'A');
INSERT INTO `c_attribute` VALUES ('6b269077b4a5', 'online_level', '上线表现级别', '5', 'A+', 'A+');
INSERT INTO `c_attribute` VALUES ('740cc79def27', 'platform_type', '平台', '2', 'IOS', '1');
INSERT INTO `c_attribute` VALUES ('78d14d0c1092', 'retest_status', '复测情况', '3', '三测及以上', '2');
INSERT INTO `c_attribute` VALUES ('790c7025b101', 'online_level', '上线表现级别', '2', 'B', 'B');
INSERT INTO `c_attribute` VALUES ('8810b313b2d0', 'scene', '场景', '2', '3D', '1');
INSERT INTO `c_attribute` VALUES ('91fc8d5ea09e', 'game_complete', '游戏完成度', '2', '残缺版', '2');
INSERT INTO `c_attribute` VALUES ('9414d32da85b', 'scene', '场景', '1', '2D', '0');
INSERT INTO `c_attribute` VALUES ('962f860ecea1', 'oversea', '海外', '3', '加拿大', '加拿大');
INSERT INTO `c_attribute` VALUES ('9792abbc0d6f', 'online_level', '上线表现级别', '1', '', '');
INSERT INTO `c_attribute` VALUES ('989a5e6f5326', 'game_type', '分类', '3', '弱联网单机', '2');
INSERT INTO `c_attribute` VALUES ('aea15b30f974', 'show_person_type', '人物', '2', '3D', '1');
INSERT INTO `c_attribute` VALUES ('aedeb3df2ee6', 'online_level', '上线表现级别', '3', 'B+', 'B+');
INSERT INTO `c_attribute` VALUES ('b3a91473b000', 'playing_method', '重度', '2', '中度', '1');
INSERT INTO `c_attribute` VALUES ('b5d5ac6d5f53', 'game_complete', '游戏完成度', '1', '完整版', '1');
INSERT INTO `c_attribute` VALUES ('b7626dab1d42', 'oversea', '海外', '6', '台湾', '台湾');
INSERT INTO `c_attribute` VALUES ('b847a639ebd5', 'painting_style_2', '风格', '3', '中国风', '2');
INSERT INTO `c_attribute` VALUES ('b8b5fcbdf6c9', 'oversea', '海外', '1', '美国', '美国');
INSERT INTO `c_attribute` VALUES ('bba3d4f683a2', 'is_authorization', '是否IP授权', '1', '是', '1');
INSERT INTO `c_attribute` VALUES ('cd130b922d35', 'painting_style_1', '绘画', '1', 'Q版', '0');
INSERT INTO `c_attribute` VALUES ('ce06a3447467', 'is_authorization', '是否IP授权', '2', '否', '0');
INSERT INTO `c_attribute` VALUES ('dc686550a974', 'painting_style_1', '绘画', '2', '写实', '1');
INSERT INTO `c_attribute` VALUES ('e39361b1c11f', 'oversea', '海外', '0', '', '');
INSERT INTO `c_attribute` VALUES ('e39361b1c41f', 'show_person_type', '人物', '1', '2D', '0');
INSERT INTO `c_attribute` VALUES ('e67903eb7bad', 'painting_style_2', '风格', '2', '欧美', '1');
INSERT INTO `c_attribute` VALUES ('ec0d79cbafe3', 'game_type', '分类', '2', '网游', '1');
INSERT INTO `c_attribute` VALUES ('f913ce46734d', 'evaluation_level', '测评评级', '4', 'A+', 'A+');

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

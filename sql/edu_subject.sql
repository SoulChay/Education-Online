/*
 Navicat Premium Data Transfer

 Source Server         : Soul
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : guli

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 29/05/2022 12:56:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程类别ID',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES ('1', '凯老师的仰卧起坐课堂', '0', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('10', '胖c观察', '9', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('11', '自己才是素材', '9', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('2', '霸王色缠绕', '1', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('3', '流樱武装色', '1', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('4', '果实觉醒强化训练', '1', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('5', '埼玉老师的一拳课堂', '0', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('6', '10公里跑', '5', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('7', '100俯卧撑', '5', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('8', '100深蹲', '5', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');
INSERT INTO `edu_subject` VALUES ('9', '埃罗芒阿的插画课堂', '0', 0, '2022-03-21 16:45:32', '2022-03-21 16:45:32');

SET FOREIGN_KEY_CHECKS = 1;

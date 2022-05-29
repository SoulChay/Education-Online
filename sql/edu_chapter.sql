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

 Date: 29/05/2022 12:55:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES ('1528540876253487105', '1528540827406622721', '练下手', 1, '2022-05-23 08:58:38', '2022-05-23 09:29:50');
INSERT INTO `edu_chapter` VALUES ('1528541850724524034', '1528541780587372545', '霸王色缠绕', 1, '2022-05-23 09:02:31', '2022-05-23 09:02:31');
INSERT INTO `edu_chapter` VALUES ('1528542386186149889', '1528542266120003586', '流樱！', 1, '2022-05-23 09:04:38', '2022-05-23 09:04:38');
INSERT INTO `edu_chapter` VALUES ('1528542993756250114', '1528542938630512641', '自己才是素材哇！', 1, '2022-05-23 09:07:03', '2022-05-23 09:07:03');
INSERT INTO `edu_chapter` VALUES ('1528543490269569025', '1528543422443479042', '果实觉醒训练！', 1, '2022-05-23 09:09:02', '2022-05-23 09:09:02');

SET FOREIGN_KEY_CHECKS = 1;

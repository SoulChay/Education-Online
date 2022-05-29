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

 Date: 29/05/2022 12:55:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `teacher_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程讲师ID',
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程专业ID',
  `subject_parent_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程专业父级ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '总课时',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程封面图片路径',
  `buy_count` bigint(10) UNSIGNED NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint(10) UNSIGNED NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint(20) UNSIGNED NULL DEFAULT 1 COMMENT '乐观锁',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Draft' COMMENT '课程状态 Draft未发布  Normal已发布',
  `is_deleted` tinyint(3) NULL DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES ('1528540827406622721', '2', '6', '5', '一拳！', 0.00, 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/qy.jpg', 0, 0, 1, 'Normal', NULL, '2022-05-23 08:58:27', '2022-05-23 09:56:47');
INSERT INTO `edu_course` VALUES ('1528541780587372545', '3', '2', '1', '霸王色！', 0.00, 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', 0, 0, 1, 'Normal', NULL, '2022-05-23 09:02:14', '2022-05-23 09:03:20');
INSERT INTO `edu_course` VALUES ('1528542266120003586', '3', '3', '1', '流樱武装色', 0.01, 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', 0, 0, 1, 'Normal', NULL, '2022-05-23 09:04:10', '2022-05-23 09:05:18');
INSERT INTO `edu_course` VALUES ('1528542938630512641', '1', '11', '9', '插画！', 0.02, 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/alma.jpg', 0, 0, 1, 'Normal', NULL, '2022-05-23 09:06:50', '2022-05-23 09:07:34');
INSERT INTO `edu_course` VALUES ('1528543422443479042', '3', '4', '1', '果实觉醒！', 0.05, 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', 0, 0, 1, 'Normal', NULL, '2022-05-23 09:08:46', '2022-05-23 09:09:53');

SET FOREIGN_KEY_CHECKS = 1;

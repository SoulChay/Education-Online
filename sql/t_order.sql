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

 Date: 29/05/2022 12:56:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员邮箱',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint(3) NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1509185051491942402', '20220330230529190', '1508456948369006593', '测试⑤', 'https://pic3.zhimg.com/80/v2-2dfc1f82a20a1c892dcbbf16d0e64124_720w.jpg?source=1940ef5c', '狗铭', '1508987344433205249', 'soulChay', '1837522825@qq.com', 0.01, 1, 1, 0, '2022-03-30 23:05:30', '2022-03-30 23:05:48');
INSERT INTO `t_order` VALUES ('1528719663704375298', '20220523204903852', '1528542266120003586', '流樱武装色', 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', '凯老师', '1508987344433205249', 'soulChay', '1837522825@qq.com', 0.01, 1, 1, 0, '2022-05-23 20:49:05', '2022-05-23 20:49:26');
INSERT INTO `t_order` VALUES ('1530180191534465025', '20220527213240277', '1528542266120003586', '流樱武装色', 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', '凯老师', '1508987344433205249', 'soulChay', '1837522825@qq.com', 0.01, 1, 0, 0, '2022-05-27 21:32:42', '2022-05-27 21:32:42');
INSERT INTO `t_order` VALUES ('1530180191534465026', '20220527213240110', '1528542266120003586', '流樱武装色', 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', '凯老师', '1508987344433205249', 'soulChay', '1837522825@qq.com', 0.01, 1, 0, 0, '2022-05-27 21:32:42', '2022-05-27 21:32:42');
INSERT INTO `t_order` VALUES ('1530180194277539841', '20220527213242838', '1528542266120003586', '流樱武装色', 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/cover/kd.jpg', '凯老师', '1508987344433205249', 'soulChay', '1837522825@qq.com', 0.01, 1, 0, 0, '2022-05-27 21:32:42', '2022-05-27 21:32:42');

SET FOREIGN_KEY_CHECKS = 1;

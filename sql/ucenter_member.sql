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

 Date: 29/05/2022 12:56:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_member`;
CREATE TABLE `ucenter_member`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(2) UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint(3) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用 1（true）已禁用，  0（false）未禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ucenter_member
-- ----------------------------
INSERT INTO `ucenter_member` VALUES ('1508260375043338241', 'o3_SC57aeJZ6BeXfCaAj0gjm8P2U', '', NULL, '陈沉淀', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Pd236cyWSicFuxTqky6qBudVFYZxnDV6lcibFXQ1T9yv0ciaUbicbPMboEfM8QibEwCH4JfpcywQciatKLs0eDgoxInw/132', NULL, 0, 0, '2022-03-28 09:51:10', '2022-03-28 09:51:10');
INSERT INTO `ucenter_member` VALUES ('1508987344433205249', NULL, '1837522825@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'soulChay', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Pd236cyWSicFuxTqky6qBudVFYZxnDV6lcibFXQ1T9yv0ciaUbicbPMboEfM8QibEwCH4JfpcywQciatKLs0eDgoxInw/132', NULL, 0, 0, '2022-03-30 09:59:53', '2022-03-30 09:59:53');

SET FOREIGN_KEY_CHECKS = 1;

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

 Date: 29/05/2022 12:56:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '讲师姓名',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `level` int(10) UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '讲师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES ('1', '埃罗芒阿老师', '使用埃罗芒阿老师这一笔名做着插画师的工作。\n重度家里蹲，只要家里有别人在就不会出房间。\n有看胖c的奇怪癖好，其实是因为不想画自己没见过的东西，所以有时（总是）也拿自己当素材', '超人气老师', 2, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/avatar/alma.png', 0, 0, '2022-03-13 21:56:46', '2022-05-22 20:31:24');
INSERT INTO `edu_teacher` VALUES ('2', '埼玉老师', '埼玉，英雄名：秃头披风侠。又名一拳超人。\n拥有着无法估量的强大实力，力量和速度均处于天花板，远超正式登场的其他所有英雄和怪人。学生时代因为自己的弱小而对自己的未来产生了怀疑。\n进入社会后，一度陷入失业的颓废状态中，但在与螃蟹人的战斗中，找回了小时候想成为英雄的趣味所在而开始努力锻炼身体（每天100个俯卧撑、100个仰卧起坐、100个深蹲、10公里长跑，并且再热也不能开空调），并在锻炼身体的过程中击败各式各样的怪人。\n3年后，埼玉拥有了绝对强大的力量，作为代价他失去了很多（像恐惧之类的感情在不断磨灭，头发掉光）。注：激情应该是因为没有遇到旗鼓相当的对手而没有表现出来。\n', '超人气老师', 2, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/5/avatar/qy.png', 1, 0, '2022-03-18 20:36:50', '2022-05-23 16:53:45');
INSERT INTO `edu_teacher` VALUES ('3', '凯老师', '人称“百兽”凯多，百兽海贼团总督，新世界的“四皇”之一。\n实力极其强悍，拥有超乎想象的防御力和生命力，被称为“最强的生物” 。\n悬赏金46亿1110万贝里  ，鱼鱼果实·幻兽种·青龙形态能力者  。\n沃卡王国出身，过去是洛克斯海贼团的见习海贼，后脱离洛克斯海贼团解散后实力不降反升，仅凭着自身强劲的实力使众多海贼臣服  。', '人气老师', 1, 'https://edu-online-soulchay.oss-cn-beijing.aliyuncs.com/2022/05/23/40c2b2de33c045b7bb6d78d11bb9d319file.png', 2, 0, '2022-03-18 20:37:16', '2022-05-23 16:52:07');

SET FOREIGN_KEY_CHECKS = 1;

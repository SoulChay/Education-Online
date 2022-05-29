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

 Date: 29/05/2022 12:56:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_course_description
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_description`;
CREATE TABLE `edu_course_description`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课程简介',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程简介' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_course_description
-- ----------------------------
INSERT INTO `edu_course_description` VALUES ('1528540827406622721', '<pre>埼玉，英雄名：秃头披风侠。又名一拳超人。<br />拥有着无法估量的强大实力，力量和速度均处于天花板，远超正式登场的其他所有英雄和怪人。学生时代因为自己的弱小而对自己的未来产生了怀疑。<br />进入社会后，一度陷入失业的颓废状态中，但在与螃蟹人的战斗中，找回了小时候想成为英雄的趣味所在而开始努力锻炼身体（每天100个俯卧撑、100个仰卧起坐、100个深蹲、10公里长跑，并且再热也不能开空调），并在锻炼身体的过程中击败各式各样的怪人。<br />3年后，埼玉拥有了绝对强大的力量，作为代价他失去了很多（像恐惧之类的感情在不断磨灭，头发掉光）。</pre>', '2022-05-23 08:58:27', '2022-05-23 09:56:47');
INSERT INTO `edu_course_description` VALUES ('1528541780587372545', '<pre>人称&ldquo;百兽&rdquo;凯多，百兽海贼团总督，新世界的&ldquo;四皇&rdquo;之一。<br />实力极其强悍，拥有超乎想象的防御力和生命力，被称为&ldquo;最强的生物&rdquo; 。<br />悬赏金46亿1110万贝里  ，鱼鱼果实&middot;幻兽种&middot;青龙形态能力者 。</pre>', '2022-05-23 09:02:14', '2022-05-23 09:02:14');
INSERT INTO `edu_course_description` VALUES ('1528542266120003586', '<pre>人称&ldquo;百兽&rdquo;凯多，百兽海贼团总督，新世界的&ldquo;四皇&rdquo;之一。<br />实力极其强悍，拥有超乎想象的防御力和生命力，被称为&ldquo;最强的生物&rdquo; 。<br />悬赏金46亿1110万贝里  ，鱼鱼果实&middot;幻兽种&middot;青龙形态能力者 。</pre>', '2022-05-23 09:04:10', '2022-05-23 09:04:29');
INSERT INTO `edu_course_description` VALUES ('1528542938630512641', '<pre>使用埃罗芒阿老师这一笔名做着插画师的工作。<br />重度家里蹲，只要家里有别人在就不会出房间。<br />有看胖c的奇怪癖好，其实是因为不想画自己没见过的东西，所以有时（总是）也拿自己当素材</pre>', '2022-05-23 09:06:50', '2022-05-23 09:06:50');
INSERT INTO `edu_course_description` VALUES ('1528543422443479042', '<pre>人称&ldquo;百兽&rdquo;凯多，百兽海贼团总督，新世界的&ldquo;四皇&rdquo;之一。<br />实力极其强悍，拥有超乎想象的防御力和生命力，被称为&ldquo;最强的生物&rdquo; 。<br />悬赏金46亿1110万贝里  ，鱼鱼果实&middot;幻兽种&middot;青龙形态能力者 。</pre>', '2022-05-23 09:08:46', '2022-05-23 09:08:46');

SET FOREIGN_KEY_CHECKS = 1;

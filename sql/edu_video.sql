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

 Date: 29/05/2022 12:56:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频ID',
  `course_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程ID',
  `chapter_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点名称',
  `video_source_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '云端视频资源',
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Empty' COMMENT 'Empty未上传 Transcoding转码中  Normal正常',
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `gmt_create` datetime(0) NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id`) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES ('1528541451611332609', '1528540827406622721', '1528540876253487105', '第一节', '12be44b873fe4017820185a214168cf2', 'qy.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-05-23 09:00:56', '2022-05-23 09:00:56');
INSERT INTO `edu_video` VALUES ('1528542032182697986', '1528541780587372545', '1528541850724524034', '第一节', '48a0f3bda3d546869c0d80e4ab5a2f13', 'kd.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-05-23 09:03:14', '2022-05-23 09:03:14');
INSERT INTO `edu_video` VALUES ('1528542538170949633', '1528542266120003586', '1528542386186149889', '第一节', '82be550607804aa2bbcb56d314bb3e55', 'kd.mp4', 0, 0, 0, 0, 'Empty', 0, 1, '2022-05-23 09:05:15', '2022-05-23 09:05:15');
INSERT INTO `edu_video` VALUES ('1528543105949687810', '1528542938630512641', '1528542993756250114', '第一节', '6b4e423a0e49463d83130a1ce7463606', 'alma.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-05-23 09:07:30', '2022-05-23 09:07:30');
INSERT INTO `edu_video` VALUES ('1528543691621326850', '1528543422443479042', '1528543490269569025', '第一节', '919830071173429e823c89bd6304440f', 'kd.mp4', 1, 0, 0, 0, 'Empty', 0, 1, '2022-05-23 09:09:50', '2022-05-23 09:09:50');

SET FOREIGN_KEY_CHECKS = 1;

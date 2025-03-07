/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : knowledge_base

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 07/03/2025 19:02:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_message
-- ----------------------------
DROP TABLE IF EXISTS `ai_message`;
CREATE TABLE `ai_message`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `edited_time` datetime(6) NOT NULL,
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `editor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息类型(用户/助手/系统)',
  `text_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `medias` json NULL COMMENT '媒体内容如图片链接、语音链接',
  `ai_session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会话id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ai_message_ai_session_id_fk`(`ai_session_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_message
-- ----------------------------
INSERT INTO `ai_message` VALUES ('05c523bf586b422e8f19d32a6bab17b6', '2024-06-23 22:08:33.529844', '2024-06-23 22:08:33.529844', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'ASSISTANT', '今天的日期是2024年06月23日。', NULL, 'b495186b9259494792a9fe4ce8807f25');
INSERT INTO `ai_message` VALUES ('17e160cd287b478691ffd0f6b0488435', '2025-02-13 16:04:55.436670', '2025-02-13 16:04:55.436670', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', 'USER', '今天晚上发生了什么事情', '[]', 'b4a13dd3d6ea4664b3e0f968071c9cfe');
INSERT INTO `ai_message` VALUES ('1d14d513ae8c4ffda0fb50df6e24ba77', '2024-06-20 22:08:28.389711', '2024-06-20 22:08:28.389711', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'USER', 'C:\\Users\\Administrator\\Desktop\\2023年工作总结及2024年工作展望-林家成.docx，这份文档的内容是什么？', '[]', 'c4d192c4b2de48bcae585f5b9672cd1d');
INSERT INTO `ai_message` VALUES ('34d65ad69e4b470794da11732fe44a7d', '2024-06-23 22:08:33.337776', '2024-06-23 22:08:33.337776', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'USER', '今天的日期是多少？', '[]', 'b495186b9259494792a9fe4ce8807f25');
INSERT INTO `ai_message` VALUES ('400d8cd1a627456eaf867e2b7c35d07b', '2025-03-06 16:08:52.040148', '2025-03-06 16:08:52.040148', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', 'TOOL', 'Excepteur', NULL, '50');
INSERT INTO `ai_message` VALUES ('468df139efa745c3af9280d9929fce25', '2025-03-06 09:35:11.623577', '2025-03-06 09:35:11.623577', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', 'ASSISTANT', '你好！有什么我可以帮助你的吗？', '[]', '409c653317684e80be3fbe3194a2a0e5');
INSERT INTO `ai_message` VALUES ('81b68c7ca19e4317ad7e78015647742c', '2025-03-06 16:16:06.300956', '2025-03-06 16:16:06.300956', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', 'TOOL', 'laborum nulla incididunt in', NULL, '17');
INSERT INTO `ai_message` VALUES ('9ef68077420343f885678b1e6f7ff556', '2025-02-13 16:05:08.262419', '2025-02-13 16:05:08.262419', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', 'ASSISTANT', '0^pc_search_result_base2&utm_term=quartus%E4%B8%8Em根据您odelsim%E6提供的上下文信息%80%，看起来您遇到了一些关于ModelSim和Quart8E%E4%B9%8us软件安装及使用的问题。这里有几个建议可能对您有帮助：\n\n8%E5%1. **直接85%B3安装ModelSim 10%E8%8.5出现蓝屏**：根据1%94您的描述，尝试&spm=1018.将`hard`文件夹重命名可能会解决2226这个问题。如果这.3001.41没有帮助，建议87)。\n\n希望这些信息对检查系统兼容性或者您有帮助！考虑升级到更新版本的ModelSim。\n\n2. **如果您还有其他具体ModelSim仿真软件破解版安装问题，请告诉我。**：您提到的文章链接提供了如何安装ModelSim破解版的方法。但请注意，使用非官方渠道获取或破解软件可能存在法律风险，并且可能带来安全问题。推荐尽可能通过官方途径获取软件授权以确保稳定性和安全性。\n\n3. **Quartus破解软件报错“Current license file does not support”**：该错误提示通常意味着当前使用的许可证文件不支持所运行的功能。您可以参考给定链接中的指南来解决问题。同样地，鼓励采用合法方式获得所需工具的支持和服务。\n\n4. **Quartus与ModelSim联合失败**：最后一个链接提供了一些关于如何正确配置Quartus以便它可以与ModelSim一起工作的指导。请仔细阅读并按照步骤操作。如果您仍然遇到困难，请考虑查阅更多在线资源或是联系技术支持寻求进一步的帮助。\n\n至于您散步的经历听起来非常愉快！保持积极的生活态度和适量的身体活动对于身心健康都是非常有益的。希望我的回答能够帮到您。如果有其他具体技术问题需要解答，请随时告知！不过，根据您给出的信息，我没有看到任何直接相关于FPGA的具体技术询问，因此上述回复基于已有的背景信息进行了概括。如果您有关于FPGA设计或其他特定方面的需求，请提供更多细节，我会尽力提供帮助。', '[]', '0546faa66df4407ea0020ec19ed71da5');
INSERT INTO `ai_message` VALUES ('a37f4c9d7615466fa2fac5e0408f6c2c', '2025-03-06 16:09:40.210325', '2025-03-06 16:09:40.209813', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', 'TOOL', 'Excepteur', NULL, '50');
INSERT INTO `ai_message` VALUES ('a5549ff5636b4b17bd056a624140b1dd', '2025-02-13 16:05:08.012218', '2025-02-13 16:05:08.012218', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', 'USER', 'FPGA', '[]', '0546faa66df4407ea0020ec19ed71da5');
INSERT INTO `ai_message` VALUES ('b35a911019ec48f9a2c49804e80821a9', '2025-03-06 09:35:11.598388', '2025-03-06 09:35:11.598388', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', 'USER', '你好', '[]', '409c653317684e80be3fbe3194a2a0e5');
INSERT INTO `ai_message` VALUES ('ba161500bec84b388a6501b3be333b45', '2024-06-20 22:08:28.649439', '2024-06-20 22:08:28.649439', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'ASSISTANT', '2023年的工作总结及2024年工作展望文档内容概要如下：\n\n1、**工作回顾重点：**\n   - 成功运用Python脚本在一经上云项目中实现Oracle脚本批量迁移、实体批量登记等，极大提升了工作效率（速度提升70倍以上），并提前完成年度工作任务。\n   - 领导新智慧工厂项目的前端与后端框架搭建，采用更高效、安全的技术栈，促进团队快速投入业务开发。重构并优化了基础功能模块，如菜单框架、租户管理等，封装为易用组件。\n   - 开发了脚本依赖分析工具，通过SQL语法树解析等技术，有效辅助故障检测、代码规范检查及开发效率，与部门其他系统（如指标库、报表系统）集成，增强功能实用性。\n\n2、**个人成长与进步：**\n   - 今年最大的成就是深入学习了数据开发知识，综合软件开发能力使自己更能满足用户需求，相比同行具有更全面的技能组合。\n\n3、**应对挑战的方法：**\n   - 面对SQL语法解析等高难度任务，通过自学源码、复习理论基础，成功开发出工具，体现了自我驱动力和解决问题的能力。\n\n4、**反思与改进空间：**\n   - 希望能在项目中实践深度学习、机器学习技术，这是未来努力的一个方向。\n\n5、**提质增效的建议：**\n   - 强调代码审查和个人技能提升，鼓励使用先进技术和工具，以及创建持续学习的环境，以保持竞争力。\n\n6、**对当前开发工作的建议：**\n   - 提倡技术分享会议，打破知识孤岛，促进新老员工间的技术交流和学习，平衡稳定与创新的需求。\n\n7、**其他建议：**\n   - 加强跨部门合作，以新智慧工厂项目为范例，推动更多跨领域协作成果。\n\n对于2024年的展望虽未详细展开，但基于上述总结，可能包括深化技术应用、促进团队协作、继续个人技能升级等方面。', NULL, 'c4d192c4b2de48bcae585f5b9672cd1d');

-- ----------------------------
-- Table structure for ai_session
-- ----------------------------
DROP TABLE IF EXISTS `ai_session`;
CREATE TABLE `ai_session`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `edited_time` datetime(6) NOT NULL,
  `creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `editor_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会话名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_session
-- ----------------------------
INSERT INTO `ai_session` VALUES ('08289ea0986d48ff8126bc05e7503e98', '2025-03-07 11:00:00.410508', '2025-03-07 11:00:00.410508', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('409c653317684e80be3fbe3194a2a0e5', '2025-02-13 16:05:08.493942', '2025-02-13 16:05:08.493942', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('57bdd9cc44844156818dd75aa6cad6c2', '2025-03-07 10:59:58.825566', '2025-03-07 10:59:58.825566', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('746b171525f84d91ae8c79948445b806', '2025-03-07 10:59:56.337912', '2025-03-07 10:59:56.337912', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('b495186b9259494792a9fe4ce8807f25', '2024-06-18 22:01:51.459293', '2024-06-18 22:01:51.459293', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', '新的聊天');
INSERT INTO `ai_session` VALUES ('b5a04062309a42999ddbe31f3f125093', '2025-03-07 10:59:53.564811', '2025-03-07 10:59:53.564811', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('c4d192c4b2de48bcae585f5b9672cd1d', '2024-06-18 22:01:45.819825', '2024-06-18 22:01:45.819317', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', '新的聊天');
INSERT INTO `ai_session` VALUES ('dbd9873a902e4f6db212003de635e82e', '2025-03-06 09:35:05.534509', '2025-03-06 09:35:05.534509', '7a8247c5661f46668a7f92335c76a9fc', '7a8247c5661f46668a7f92335c76a9fc', '新的聊天');
INSERT INTO `ai_session` VALUES ('dc0c0f9743f24cb89bf50b3eab72d031', '2025-03-07 16:39:19.501071', '2025-03-07 16:39:19.501071', '1c5c17e0fd2b4e3c9d40a6420663627e', '1c5c17e0fd2b4e3c9d40a6420663627e', '新的聊天');
INSERT INTO `ai_session` VALUES ('dcd32fd9f7fc4d0fb9a5b7dc9ff0dbc8', '2024-06-18 21:57:09.390651', '2024-06-18 21:57:09.390651', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', 'fe3d0d7d6eb34eb7a6b7985426cf8af7', '新的聊天');
INSERT INTO `ai_session` VALUES ('e04119984bc74795aaf7926d84dd8cf8', '2025-03-06 16:56:38.761885', '2025-03-06 16:56:38.761885', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', '新的聊天');
INSERT INTO `ai_session` VALUES ('f31446e88411431b8a317e0c6c7e444f', '2025-03-07 16:37:05.474159', '2025-03-07 16:37:05.474159', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', '新的聊天');

-- ----------------------------
-- Table structure for personlity
-- ----------------------------
DROP TABLE IF EXISTS `personlity`;
CREATE TABLE `personlity`  (
  `created_time` datetime(6) NULL DEFAULT NULL,
  `edited_time` datetime(6) NULL DEFAULT NULL,
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creator_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `editor_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `con` int(4) NULL DEFAULT NULL,
  `ext` int(4) NULL DEFAULT NULL,
  `ope` int(4) NULL DEFAULT NULL,
  `neu` int(4) NULL DEFAULT NULL,
  `agr` int(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personlity
-- ----------------------------
INSERT INTO `personlity` VALUES ('2025-03-07 10:51:03.000000', '2025-03-07 10:50:56.000000', '123', 'c21571d4de1d44388e5d2edb98bb2abd', 'c21571d4de1d44388e5d2edb98bb2abd', 'c21571d4de1d44388e5d2edb98bb2abd', 0, 0, 0, 0, 0);
INSERT INTO `personlity` VALUES ('2025-03-15 16:40:29.000000', '2025-03-27 16:40:25.000000', '666', '1c5c17e0fd2b4e3c9d40a6420663627e', '1c5c17e0fd2b4e3c9d40a6420663627e', '1c5c17e0fd2b4e3c9d40a6420663627e', 1, 1, 1, 1, 1);
INSERT INTO `personlity` VALUES ('2025-03-06 16:47:44.312080', '2025-03-06 16:47:44.312080', '7239752b343e4484a6aff93f5a6eece0', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', 0, 1, 0, 0, 1);
INSERT INTO `personlity` VALUES ('2025-03-06 16:34:49.670788', '2025-03-06 16:34:49.670788', 'f654282a763744d79e3d9ac4f0962fbf', '6abe8b165a0b480793f958a88a28b2ea', '6abe8b165a0b480793f958a88a28b2ea', NULL, 1, 0, 1, 0, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `edited_time` datetime(6) NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1c5c17e0fd2b4e3c9d40a6420663627e', '2025-03-07 16:39:19.314724', '2025-03-07 16:39:19.314724', NULL, NULL, NULL, '13834928052', '$2a$10$N/PUS0Wt/iUMCLYdJCpGneU343/KaD9H6MBCIaqXzubXsT8Par8b6');
INSERT INTO `user` VALUES ('6abe8b165a0b480793f958a88a28b2ea', '2025-03-06 14:46:18.670625', '2025-03-06 14:46:18.670625', NULL, NULL, NULL, '18699169241', '$2a$10$v32WcJ10WeqHd6oPIy/W0OMXlBEqb6tETRZfhvu3woSozvPEW.zSe');
INSERT INTO `user` VALUES ('7a8247c5661f46668a7f92335c76a9fc', '2025-02-04 20:14:20.623268', '2025-02-04 20:14:20.623268', NULL, NULL, NULL, '18235657495', '$2a$10$2CHHwjjRXfiLU2N8tbwvCOqL3whZ8YMKMu7zYA1qvGfVFuzkN3saC');
INSERT INTO `user` VALUES ('c21571d4de1d44388e5d2edb98bb2abd', '2025-03-07 10:40:13.952943', '2025-03-07 10:40:13.952943', NULL, NULL, NULL, '03695046652', '$2a$10$1sJBSafaZiZX/8I610a.EehVaxMCS.dwGkL464iItVN9fmPie/zAK');
INSERT INTO `user` VALUES ('dcd256e2412f4162a6a5fcbd5cfedc84', '2024-05-01 16:52:43.364225', '2024-05-19 21:30:34.686818', '起凡', 'https://my-community.oss-cn-qingdao.aliyuncs.com/20240501203628ptwondCGhItP67eb5ac72554b07800b22c542245e457.jpeg', 'MALE', '11111111111', '$2a$10$o/DHIt/eAMR175TgDV/PeeuEOpqW1N4Klft6obvs2zqBuiwMgLWOW');
INSERT INTO `user` VALUES ('fe3d0d7d6eb34eb7a6b7985426cf8af7', '2024-06-06 13:23:46.130879', '2024-06-06 13:23:46.130817', '默认用户', NULL, NULL, '13656987994', '$2a$10$q7pey1P1/b3lO9nzFLKOb.ISrX7.lkktMjghwhgvNqvA.EjZZ2mg2');

SET FOREIGN_KEY_CHECKS = 1;

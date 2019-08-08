/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50522
Source Host           : localhost:3306
Source Database       : bomaccounting

Target Server Type    : MYSQL
Target Server Version : 50522
File Encoding         : 65001

Date: 2019-08-08 00:34:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(225) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `resource_type` varchar(225) DEFAULT NULL,
  `url` varchar(225) DEFAULT NULL,
  `permission` varchar(225) DEFAULT NULL,
  `available` varchar(225) DEFAULT NULL,
  `parent_id` varchar(225) DEFAULT NULL,
  `parent_ids` varchar(225) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `order_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('06f0c8b82d544f8085691913687df551', '角色删除', 'button', '/sysrole/deleteById', 'sysrole:delete', '1', '66185a14828b47828c4eaf40ae45e1d7', '', '2019-04-18 00:00:00', '2');
INSERT INTO `sys_permission` VALUES ('5739f65164444011bde4833c86354f93', '权限编辑', 'button', '/syspermission/edit', 'syspermission:edit', '1', '6880007dcce0491b8511753dd5ee1a5e', '', '2019-04-18 00:00:00', '1');
INSERT INTO `sys_permission` VALUES ('66185a14828b47828c4eaf40ae45e1d7', '角色管理', 'menu', 'sysrole/list', 'sysrole:view', '1', '0', '', '2019-04-18 00:00:00', '1');
INSERT INTO `sys_permission` VALUES ('6880007dcce0491b8511753dd5ee1a5e', '权限管理', 'menu', 'syspermission/list', 'syspermission:view', '1', '0', '', '2019-04-18 00:00:00', '2');
INSERT INTO `sys_permission` VALUES ('88aac459b3484a0296201d8d19b59210', '用户管理', 'menu', 'sysuser/list', 'sysuser:view', '1', '0', '', '2019-04-18 00:00:00', '3');
INSERT INTO `sys_permission` VALUES ('a3080c70b61a4180ac5ab4dd16d42b61', '权限删除', 'button', '/syspermission/deleteById', 'syspermission:delete', '1', '6880007dcce0491b8511753dd5ee1a5e', '', '2019-04-18 00:00:00', '2');
INSERT INTO `sys_permission` VALUES ('aaedf1eee04d47f9819449749399603a', '用户删除', 'button', 'sysuser/deleteById', 'sysuser:delete', '1', '88aac459b3484a0296201d8d19b59210', '', '2019-04-18 00:00:00', '2');
INSERT INTO `sys_permission` VALUES ('aaedf1eee04d47f9819449749399603c', '用户编辑', 'button', 'sysuser/edit', 'sysuser:edit', '1', '88aac459b3484a0296201d8d19b59210', '', '2019-04-18 00:00:00', '1');
INSERT INTO `sys_permission` VALUES ('c2cf6721c69d47528663e238ee947bfe', '角色编辑', 'button', '/sysrole/edit', 'sysrole:edit', '1', '66185a14828b47828c4eaf40ae45e1d7', '', '2019-04-18 00:00:00', '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(225) NOT NULL,
  `role` varchar(225) DEFAULT NULL,
  `description` varchar(225) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', '权限管理', '1', '2019-04-28 00:00:00');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `permission_id` varchar(225) NOT NULL,
  `role_id` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('06f0c8b82d544f8085691913687df551', '1');
INSERT INTO `sys_role_permission` VALUES ('5739f65164444011bde4833c86354f93', '1');
INSERT INTO `sys_role_permission` VALUES ('66185a14828b47828c4eaf40ae45e1d7', '1');
INSERT INTO `sys_role_permission` VALUES ('6880007dcce0491b8511753dd5ee1a5e', '1');
INSERT INTO `sys_role_permission` VALUES ('88aac459b3484a0296201d8d19b59210', '1');
INSERT INTO `sys_role_permission` VALUES ('a3080c70b61a4180ac5ab4dd16d42b61', '1');
INSERT INTO `sys_role_permission` VALUES ('aaedf1eee04d47f9819449749399603a', '1');
INSERT INTO `sys_role_permission` VALUES ('aaedf1eee04d47f9819449749399603c', '1');
INSERT INTO `sys_role_permission` VALUES ('c2cf6721c69d47528663e238ee947bfe', '1');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(225) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `nick_name` varchar(225) DEFAULT NULL,
  `state` char(1) DEFAULT NULL COMMENT '用户状态,0:创建未认证（比如没有激活，没有输入验证码等等）--等待验证的用户 , 1:正常状态,2：用户被锁定.',
  `create_time` datetime DEFAULT NULL,
  `create_user` double(225,0) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '928bfd2577490322a6e19b793691467e', '管理员', '0', '2019-04-28 00:00:00', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `role_id` varchar(225) NOT NULL,
  `user_id` varchar(225) NOT NULL,
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');

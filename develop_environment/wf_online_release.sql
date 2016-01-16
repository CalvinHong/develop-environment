/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : wf_online

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-06-08 17:51:36
*/
-- -----------------------------
-- CREATE Database
-- -----------------------------
CREATE DATABASE IF NOT EXISTS wf_online DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_digest
-- ----------------------------
DROP TABLE IF EXISTS `app_digest`;
CREATE TABLE `app_digest` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_type_id` tinyint(3) unsigned NOT NULL COMMENT '对应文件类型(file_type)]表的id 或文件表(file)表中的type',
  `app_digest` varchar(64) NOT NULL COMMENT 'app的MD5摘要，64byte的字符串（注意是显示字符） ',
  `description` varchar(255) NOT NULL COMMENT 'app的说明 ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_digest` (`app_digest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='进程指纹';

-- ----------------------------
-- Records of app_digest
-- ----------------------------

-- ----------------------------
-- Table structure for ci_sessions
-- ----------------------------
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) CHARACTER SET latin1 NOT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ci_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('86', '中国');

-- ----------------------------
-- Table structure for file_traces
-- ----------------------------
DROP TABLE IF EXISTS `file_traces`;
CREATE TABLE `file_traces` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '//id',
  `actor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '产生事件的主体，若是文件所有者，则对应其uid，否则为空',
  `event` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '事件',
  `start` varchar(32) NOT NULL DEFAULT '' COMMENT '//修改前',
  `end` varchar(32) NOT NULL DEFAULT '' COMMENT '//修改后',
  `relation` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '事件关联',
  `ts` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '记录时间',
  `unsafe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为不安全记录',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `file_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属文件ID',
  `actor_ip` varchar(39) NOT NULL DEFAULT '' COMMENT '//产生事件的IP',
  `actor_city` varchar(64) NOT NULL DEFAULT '' COMMENT 'ip地址的城市',
  `user_agent`  varchar(255) NOT NULL DEFAULT '' COMMENT '客户端标识',
  PRIMARY KEY (`id`),
  KEY `actor` (`actor`) USING BTREE,
  KEY `file_id` (`file_id`) USING BTREE,
  KEY `ts` (`ts`) USING BTREE,
  KEY `relation` (`relation`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_traces
-- ----------------------------

-- ----------------------------
-- Table structure for file_type
-- ----------------------------
DROP TABLE IF EXISTS `file_type`;
CREATE TABLE `file_type` (
  `id` smallint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ext_name` varchar(16) NOT NULL,
  `group` smallint(11) NOT NULL,
  `mime_type` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ext_name` (`ext_name`),
  KEY `group` (`group`),
  KEY `mime_type` (`mime_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_type
-- ----------------------------
INSERT INTO `file_type` VALUES ('1', 'doc', '1', 'application/msword', 'MS Word');
INSERT INTO `file_type` VALUES ('2', 'docx', '1', 'application/msword', 'MS Word');
INSERT INTO `file_type` VALUES ('3', 'ppt', '2', 'application/vnd.ms-powerpoint', 'MS PowerPoint');
INSERT INTO `file_type` VALUES ('4', 'pptx', '2', 'application/vnd.ms-powerpoint', 'MS PowerPoint');
INSERT INTO `file_type` VALUES ('5', 'xls', '3', 'application/vnd.ms-excel', 'MS Excel');
INSERT INTO `file_type` VALUES ('6', 'xlsx', '3', 'application/vnd.ms-excel', 'MS Excel');
INSERT INTO `file_type` VALUES ('7', 'jpg', '4', 'image/jpeg', 'JPEG Image');
INSERT INTO `file_type` VALUES ('8', 'jpeg', '4', 'image/jpeg', 'JPEG Image');
INSERT INTO `file_type` VALUES ('9', 'bmp', '4', 'image/bmp', 'BMP Image');
INSERT INTO `file_type` VALUES ('10', 'gif', '4', 'image/gif', 'GIF Image');
INSERT INTO `file_type` VALUES ('11', 'png', '4', 'image/png', 'PNG Image');
INSERT INTO `file_type` VALUES ('12', 'txt', '5', 'text/plain', 'Plain Text');
INSERT INTO `file_type` VALUES ('13', 'pdf', '6', 'application/pdf', 'PDF');
INSERT INTO `file_type` VALUES ('14', 'dwg', '7', 'application/x-auto-cad', 'AutoCAD');
INSERT INTO `file_type` VALUES ('15', 'psd', '8', 'image/vnd.adobe.photoshop', 'Adobe PS');
INSERT INTO `file_type` VALUES ('16', 'ai', '9', 'application/x-adobe-ai', 'Adobe Illustrator');
INSERT INTO `file_type` VALUES ('17', 'cdr', '10', 'application/x-corel-draw', 'CorelDraw');
INSERT INTO `file_type` VALUES ('18', 'mp4', '11', 'video/mp4', 'mp4');
INSERT INTO `file_type` VALUES ('19', '3gp', '11', 'video/3gpp', '3gp');
INSERT INTO `file_type` VALUES ('20', 'rmvb', '11', 'video/vnd.rn-realvideo', 'rmvb');
INSERT INTO `file_type` VALUES ('21', 'mpg', '11', 'video/mpg', 'mpg');
INSERT INTO `file_type` VALUES ('22', 'avi', '11', 'video/avi', 'avi');
INSERT INTO `file_type` VALUES ('23', 'mp3', '12', 'audio/mp3', 'mp3');
INSERT INTO `file_type` VALUES ('24', 'wav', '12', 'audio/x-wav', 'wav');
INSERT INTO `file_type` VALUES ('25', 'wma', '12', 'audio/x-ms-wma', 'wma');
INSERT INTO `file_type` VALUES ('26', 'flac', '12', 'application/x-flac', 'flac');

-- ----------------------------
-- Table structure for helpcenter
-- ----------------------------
DROP TABLE IF EXISTS `helpcenter`;
CREATE TABLE `helpcenter` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of helpcenter
-- ----------------------------
INSERT INTO `helpcenter` VALUES ('1', '外发无忧支持哪些文件类型的文件上传？', '<p>支持word、excel、PowerPoint、记事本、photoshop、CAD、Adobe reader、Coredraw、 Illustrator、windows图片查看器、QQ影音播放器、暴风影音播放器等软件，对应的文件类型有：doc、docx、xls、xlsx、ppt、pptx、jpg、 jpeg、bmp、gif、png、txt、psd、dwg、cdr、ai、pdf、mp4、3gp、rmvb、mpg、avi、mp3、wav、wma、flac等。</p>');
INSERT INTO `helpcenter` VALUES ('2', '受控文件支持在哪些操作系统上查阅？', '受控文件支持以下操作系统：windows xp 32 bit、windows 7  32bit/64bit 、windows 8 32bit/64bit。');
INSERT INTO `helpcenter` VALUES ('3', '我没有安装flash插件或者flash插件被禁止，怎么复制链接或者查阅密码到剪贴板？', '<p>如没有安装flash，请点击“https://get2.adobe.com/cn/flashplayer/ &nbsp;“下载最新版本flash插件并安装，安装后可直接点击“复制”按钮自动复制链接或密码到剪贴板，这样更方便快捷推荐采用此方式；也可以选择不安装flash，通过右键“复制”或者“ctrl+c”将链接或者密码复制到剪贴板；如flash插件被禁止，请先开启flash插件才能自动复制。</p>');
INSERT INTO `helpcenter` VALUES ('4', '我上传的文件和接收者下载的文件有什么区别？', '您上传的文件为“源文件”，接收者下载的文件为“受控文件”；受控文件与源文件内容相同，两者最大的区别是受控文件分享出去后查阅次数、查阅时间或阅后销毁是可控的，而源文件直接分享出去是不可控，因此如果您想防止文件扩散泄密，请将文件上传到易控后再分享给其他人。');
INSERT INTO `helpcenter` VALUES ('5', '受控文件的合法打开程序有哪些？', '<table data-sort=\"sortDisabled\"><tbody><tr class=\"firstRow\"><td style=\"word-break: break-all;\" width=\"220\">文件类型<br/></td><td>应用程序名称</td><td>应用程序版本</td></tr><tr><td rowspan=\"2\" colspan=\"1\"><p>doc/docx/xls/xlsx/ppt/pptx</p></td><td>Microsoft Office</td><td>2003、2007、2010、2013</td></tr><tr><td>WPS Office</td><td>2013抢鲜版</td></tr><tr><td>txt</td><td>MS Notepad</td><td>系统自带任意版本</td></tr><tr><td style=\"word-break: break-all;\">jpg/jpeg/bmp/png/gif</td><td>windows 图片查看器</td><td>系统自带任意版本</td></tr><tr><td rowspan=\"3\" colspan=\"1\"><p>pdf</p></td><td>AdobeReader</td><td>9、10.0简体中文版、XI 11.0</td></tr><tr><td>Adobe acrobat</td><td>9 Pro、XI Pro 10.1.0简体中文版、XI Pro 11</td></tr><tr><td>福昕</td><td>5.1.0、6.1.3、7.0.4</td></tr><tr><td colspan=\"1\" rowspan=\"1\">psd</td><td colspan=\"1\" rowspan=\"1\">Adobe Photoshop</td><td colspan=\"1\" rowspan=\"1\">CS4、CS5、CS6、CC 2014</td></tr><tr><td colspan=\"1\" rowspan=\"1\">ai</td><td colspan=\"1\" rowspan=\"1\">Adobe Illustrator</td><td colspan=\"1\" rowspan=\"1\">CS4、CS5、CS6、CC 2014</td></tr><tr><td colspan=\"1\" rowspan=\"1\">cdr</td><td colspan=\"1\" rowspan=\"1\">CORELDRAW</td><td colspan=\"1\" rowspan=\"1\">X4、X5、X6、Graphics Suite X7</td></tr><tr><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"2\">mp3/wav/wma/flac/mp4/3gp/rmvb/mpg/avi</td><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\">QQ影音播放器</td><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\">3.8 897(最新版）<br/></td></tr><tr><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\">暴风影音播放器</td><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\"><span class=\"mInfo\">5.46.0212.2422</span>（最新版）</td></tr><tr><td colspan=\"1\" rowspan=\"3\"><p><br/></p><p>dwg</p></td><td colspan=\"1\" rowspan=\"1\">Auto CAD</td><td colspan=\"1\" rowspan=\"1\">2004、2007、2008、2010、2011、2012、2013、2014、2015</td></tr><tr><td colspan=\"1\" rowspan=\"1\">天正 CAD</td><td colspan=\"1\" rowspan=\"1\">2013、2014</td></tr><tr><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\">中望CAD +</td><td style=\"word-break: break-all;\" colspan=\"1\" rowspan=\"1\"><p>机械版2014、建筑版2014、2015</p><p><br/></p></td></tr></tbody></table>');

-- ----------------------------
-- Table structure for oauth_user
-- ----------------------------
DROP TABLE IF EXISTS `oauth_user`;
CREATE TABLE `oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` tinyint(20) NOT NULL DEFAULT '1' COMMENT '用户来源 1:QQ 2:微信',
  `name` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `creation_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bind_ts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `lasttime` int(11) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(39) CHARACTER SET utf8 NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0:禁用 1:开启',
  `access_token` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '访问接口的token',
  `expires_date` int(12) unsigned NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '第三方用户id',
  `refresh_token` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '刷新token',
  `unionid` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用于微信公众号',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `access_token` (`access_token`),
  KEY `openid` (`openid`),
  KEY `unionid` (`unionid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for source_files
-- ----------------------------
DROP TABLE IF EXISTS `source_files`;
CREATE TABLE `source_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '文件md5值的time33哈希值，为了提高查询速度',
  `guid` varchar(500) NOT NULL DEFAULT '' COMMENT '全局id，对应存储系统的文件id',
  `creation_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `md5` (`md5`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of source_files
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL DEFAULT '',
  `n_email` varchar(64) NOT NULL DEFAULT '' COMMENT '未验证的邮箱',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `n_mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '未验证的手机号码',
  `mobile_country` smallint(255) unsigned NOT NULL DEFAULT '86' COMMENT '国家代码',
  `password` varchar(32) NOT NULL DEFAULT '',
  `uniqid` varchar(64) NOT NULL DEFAULT '' COMMENT 'cookie防伪code',
  `capacity` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户空间',
  `used_space` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户已用空间',
  `account_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0:试用用户 1:邮箱用户 2:手机用户',
  `regtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `regip` varchar(39) NOT NULL DEFAULT '' COMMENT '注册ip',
  `verify` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '正式注册的用户是否通过验证',
  `nickname` varchar(40) NOT NULL DEFAULT '' COMMENT '//昵称',
  `sex` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '//公司名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户的状态 0:禁用 1:启用',
  `rank` tinyint(255) NOT NULL DEFAULT '1' COMMENT '用户等级',
  `lastip` varchar(39) NOT NULL,
  `lasttime` int(11) unsigned NOT NULL,
  `lastpaytime` int(11) unsigned NOT NULL DEFAULT '0',
  `image` varchar(200) NOT NULL DEFAULT '' COMMENT '//头像',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`),
  KEY `country` (`mobile_country`),
  KEY `password` (`password`),
  KEY `uniqid` (`uniqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for u_check_log
-- ----------------------------
DROP TABLE IF EXISTS `u_check_log`;
CREATE TABLE `u_check_log` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(255) NOT NULL DEFAULT '1' COMMENT '记录类型(用于判断同一ip或同一设备注册或登录行为的限制) 1:注册记录 2:登录记录',
  `data` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(39) NOT NULL COMMENT '注册IP(md5)ipv4或者ipv6',
  `ip_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT 'ip的time33哈希值',
  `device_md5` char(32) NOT NULL DEFAULT '' COMMENT '用户设备md5值',
  `device_hash` bigint(32) unsigned NOT NULL DEFAULT '0' COMMENT '用户设备的md5值的time33哈希值',
  `num` tinyint(2) NOT NULL COMMENT '注册次数',
  `lasttime` int(11) unsigned NOT NULL COMMENT '最后注册时间',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `ip_hash` (`ip_hash`),
  KEY `device_md5` (`device_md5`),
  KEY `device_hash` (`device_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_check_log
-- ----------------------------

-- ----------------------------
-- Table structure for u_files
-- ----------------------------
DROP TABLE IF EXISTS `u_files`;
CREATE TABLE `u_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(39) NOT NULL DEFAULT '' COMMENT '文件逻辑的全局id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '文件类型，对应Type表中的ID ',
  `ext_name` varchar(20) NOT NULL DEFAULT '' COMMENT '后缀名',
  `access_denied` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被禁止访问 ',
  `downloaded` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经下载',
  `creation_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除 ',
  `shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经被分享',
  `deleted_ts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述或备注 ',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '指向拥有该文件的用户，对应用户表中的ID ',
  `folder_id` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '文件夹id',
  `source_guid` varchar(500) NOT NULL DEFAULT '' COMMENT '源文件uuid，对应文件系统里的uuid',
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `creation_ts` (`creation_ts`) USING BTREE,
  KEY `deleted_ts` (`deleted_ts`) USING BTREE,
  KEY `folder_id` (`folder_id`) USING BTREE,
  KEY `modify_ts` (`modify_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_files
-- ----------------------------

-- ----------------------------
-- Table structure for u_folders
-- ----------------------------
DROP TABLE IF EXISTS `u_folders`;
CREATE TABLE `u_folders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '目录ID ',
  `uid` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '目录名称 ',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父目录ID（如果是在根目录，即无父目录，则填0）',
  `level` smallint(255) unsigned NOT NULL DEFAULT '1' COMMENT '文件夹层级',
  `path` varchar(5000) NOT NULL DEFAULT '0' COMMENT '文件夹路径',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '备注 ',
  `access_denied` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被禁止访问 ',
  `creation_ts` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '目录的创建时间 ',
  `modify_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '目录是否被删除 ',
  `deleted_ts` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '目录的删除时间 ',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `creation_ts` (`creation_ts`),
  KEY `pid` (`pid`),
  KEY `deleted_ts` (`deleted_ts`),
  KEY `uid` (`uid`),
  KEY `path` (`path`(333)) USING BTREE,
  KEY `modify_ts` (`modify_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件夹';

-- ----------------------------
-- Records of u_folders
-- ----------------------------

-- ----------------------------
-- Table structure for u_login_log
-- ----------------------------
DROP TABLE IF EXISTS `u_login_log`;
CREATE TABLE `u_login_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `session_id` varchar(40) NOT NULL DEFAULT '' COMMENT '会话id',
  `login_ts` int(11) unsigned NOT NULL DEFAULT '0',
  `logout_ts` int(11) unsigned NOT NULL DEFAULT '0',
  `regular` tinyint(1) unsigned NOT NULL,
  `from` tinyint(3) unsigned NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `device_md5` char(32) NOT NULL DEFAULT '' COMMENT '用户设备hash(md5)',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `session_id` (`session_id`),
  KEY `login_ts` (`login_ts`),
  KEY `logout_ts` (`logout_ts`),
  KEY `ip` (`ip`),
  KEY `device_hash` (`device_md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for u_orders
-- ----------------------------
DROP TABLE IF EXISTS `u_orders`;
CREATE TABLE `u_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `guid` varchar(50) NOT NULL DEFAULT '' COMMENT '订单全局id，面向支付接口的id',
  `guid_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT 'guid的time33哈希值',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `type` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '订单类型 1:购买空间 ',
  `way` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '支付渠道（1：支付宝；2：微信；） ',
  `money` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '金额 ',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '交易状态（1：支付中；2：支付失败：3：支付成功 4:交易取消）',
  `creation_ts` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单创建时间',
  `modify_ts` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单最后修改时间',
  `space` bigint(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买空间大小 (字节)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '订单描述',
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `guid_hash` (`guid_hash`),
  KEY `uid` (`uid`),
  KEY `creation_ts` (`creation_ts`),
  KEY `modify_ts` (`modify_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_orders
-- ----------------------------

-- ----------------------------
-- Table structure for u_policies
-- ----------------------------
DROP TABLE IF EXISTS `u_policies`;
CREATE TABLE `u_policies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '策略归属者',
  `ftype` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1:文件 2:文件夹',
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件或文件夹的id',
  `data` text NOT NULL COMMENT '策略的具体内容（json形式存储）',
  `is_global` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '是否为该文件的全局策略（面向任意查看者）',
  `creation_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `expiration_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `expired` tinyint(255) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经过期',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fid` (`fid`),
  KEY `creation_ts` (`creation_ts`),
  KEY `overdue_ts` (`expiration_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_policies
-- ----------------------------

-- ----------------------------
-- Table structure for u_policy_lookers
-- ----------------------------
DROP TABLE IF EXISTS `u_policy_lookers`;
CREATE TABLE `u_policy_lookers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `policy_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '策略id',
  `looker_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '查看者用户id',
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`),
  KEY `looker_id` (`looker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_policy_lookers
-- ----------------------------

-- ----------------------------
-- Table structure for u_secure_files
-- ----------------------------
DROP TABLE IF EXISTS `u_secure_files`;
CREATE TABLE `u_secure_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `type` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '受控文件类型（1：exe方式，2：简单加解密方式）',
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '对应用户文件的id',
  `guid` varchar(500) NOT NULL DEFAULT '' COMMENT '受控文件的全局id，对应文件存储系统的文件id',
  `cipher` varchar(50) NOT NULL DEFAULT '' COMMENT '用来加密受控副本的密钥 ',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5值',
  `md5_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '文件md5值的time33哈希值',
  `creation_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  KEY `uuid` (`guid`(333)),
  KEY `md5` (`md5`),
  KEY `md5_hash` (`md5_hash`),
  KEY `creation_ts` (`creation_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_secure_files
-- ----------------------------

-- ----------------------------
-- Table structure for u_share_link
-- ----------------------------
DROP TABLE IF EXISTS `u_share_link`;
CREATE TABLE `u_share_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `share_code` char(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分享链接的分享码',
  `share_code_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '分享码的time33哈希值',
  `list_md5` char(32) NOT NULL DEFAULT '' COMMENT '分享列表md5值',
  `list_md5_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '分享列表time33算法（重复率为1/2000）',
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分享链接名',
  `creation_ts` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `password` char(4) NOT NULL DEFAULT '' COMMENT '分享密码',
  `download_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载数',
  `visited_count` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `name` (`name`),
  KEY `creation_ts` (`creation_ts`),
  KEY `list_md5` (`list_md5`),
  KEY `share_code` (`share_code`) USING BTREE,
  KEY `password` (`password`) USING BTREE,
  KEY `list_md5_hash` (`list_md5_hash`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




-- ----------------------------
-- Records of u_share_link
-- ----------------------------

-- ----------------------------
-- Table structure for u_share_list
-- ----------------------------
DROP TABLE IF EXISTS `u_share_list`;
CREATE TABLE `u_share_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '链接表id',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '标识内容类型（1:文件；2：目录）',
  `fid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件或目录的id',
  PRIMARY KEY (`id`),
  KEY `lid` (`lid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_share_list
-- ----------------------------

-- ----------------------------
-- Table structure for u_share_receivers
-- ----------------------------
DROP TABLE IF EXISTS `u_share_receivers`;
CREATE TABLE `u_share_receivers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(255) unsigned NOT NULL DEFAULT '1' COMMENT '分享链接接收者的类型 1:邮箱 2:短信',
  `receiver` text NOT NULL COMMENT '接收者账号列表（邮箱或者手机）',
  `creation_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_ts` int(255) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_share_receivers
-- ----------------------------

-- ----------------------------
-- Table structure for u_verify
-- ----------------------------
DROP TABLE IF EXISTS `u_verify`;
CREATE TABLE `u_verify` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `process` tinyint(255) NOT NULL COMMENT '认证流程 1:注册流程验证 2:找回密码流程验证 3:更换手机号码',
  `way` tinyint(255) NOT NULL DEFAULT '1' COMMENT '认证方式 1:邮件 2:手机',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '验证码',
  `code_hash` bigint(255) unsigned NOT NULL DEFAULT '0' COMMENT '校验码的time33哈希值',
  `receiver` varchar(64) NOT NULL DEFAULT '' COMMENT '接受校验信息方（手机号或者email账号）',
  `num` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发送认证信息次数',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后认证时间',
  `session_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `code` (`code`) USING BTREE,
  KEY `receiver` (`receiver`) USING BTREE,
  KEY `session_id` (`session_id`),
  KEY `time` (`time`),
  KEY `code_hash` (`code_hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of u_verify
-- ----------------------------

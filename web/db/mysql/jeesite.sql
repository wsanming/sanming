/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : jeesite

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2019-10-22 12:09:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for js_filemanager_folder
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_folder`;
CREATE TABLE `js_filemanager_folder` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `folder_name` varchar(100) NOT NULL COMMENT '文件夹名',
  `group_type` varchar(64) NOT NULL COMMENT '文件分组类型',
  `office_code` varchar(64) DEFAULT NULL COMMENT '部门编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_tree_pc` (`parent_code`),
  KEY `idx_sys_file_tree_ts` (`tree_sort`),
  KEY `idx_sys_file_tree_tss` (`tree_sorts`),
  KEY `idx_sys_file_tree_gt` (`group_type`),
  KEY `idx_sys_file_tree_oc` (`office_code`),
  KEY `idx_sys_file_tree_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理文件夹';

-- ----------------------------
-- Records of js_filemanager_folder
-- ----------------------------

-- ----------------------------
-- Table structure for js_filemanager_shared
-- ----------------------------
DROP TABLE IF EXISTS `js_filemanager_shared`;
CREATE TABLE `js_filemanager_shared` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `folder_id` varchar(64) DEFAULT NULL COMMENT '文件夹编码',
  `file_upload_id` varchar(64) DEFAULT NULL COMMENT '文件上传编码',
  `file_name` varchar(500) NOT NULL COMMENT '文件或文件夹名',
  `receive_user_code` varchar(100) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(200) NOT NULL COMMENT '接收者用户名称',
  `click_num` decimal(10,0) DEFAULT NULL COMMENT '点击次数',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_share_ruc` (`receive_user_code`),
  KEY `idx_sys_file_share_cb` (`create_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件管理共享表';

-- ----------------------------
-- Records of js_filemanager_shared
-- ----------------------------

-- ----------------------------
-- Table structure for js_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table`;
CREATE TABLE `js_gen_table` (
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `class_name` varchar(100) NOT NULL COMMENT '实体类名称',
  `comments` varchar(500) NOT NULL COMMENT '表说明',
  `parent_table_name` varchar(64) DEFAULT NULL COMMENT '关联父表的表名',
  `parent_table_fk_name` varchar(64) DEFAULT NULL COMMENT '本表关联父表的外键名',
  `data_source_name` varchar(64) DEFAULT NULL COMMENT '数据源名称',
  `tpl_category` varchar(200) DEFAULT NULL COMMENT '使用的模板',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(200) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(50) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_base_dir` varchar(1000) DEFAULT NULL COMMENT '生成基础路径',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`table_name`),
  KEY `idx_gen_table_ptn` (`parent_table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表';

-- ----------------------------
-- Records of js_gen_table
-- ----------------------------
INSERT INTO `js_gen_table` VALUES ('test_data', 'TestData', '测试数据', null, null, null, 'crud', 'com.jeesite.modules', 'test', '', '测试数据', '数据', 'ThinkGem', null, '{\"isHaveDelete\":\"1\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null);
INSERT INTO `js_gen_table` VALUES ('test_data_child', 'TestDataChild', '测试数据子表', 'test_data', 'test_data_id', null, 'crud', 'com.jeesite.modules', 'test', '', '测试子表', '数据', 'ThinkGem', null, null, 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null);
INSERT INTO `js_gen_table` VALUES ('test_tree', 'TestTree', '测试树表', null, null, null, 'treeGrid', 'com.jeesite.modules', 'test', '', '测试树表', '数据', 'ThinkGem', null, '{\"treeViewName\":\"tree_name\",\"isHaveDelete\":\"1\",\"treeViewCode\":\"tree_code\",\"isFileUpload\":\"1\",\"isHaveDisableEnable\":\"1\",\"isImageUpload\":\"1\"}', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null);

-- ----------------------------
-- Table structure for js_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `js_gen_table_column`;
CREATE TABLE `js_gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `table_name` varchar(64) NOT NULL COMMENT '表名',
  `column_name` varchar(64) NOT NULL COMMENT '列名',
  `column_sort` decimal(10,0) DEFAULT NULL COMMENT '列排序（升序）',
  `column_type` varchar(100) NOT NULL COMMENT '类型',
  `column_label` varchar(50) DEFAULT NULL COMMENT '列标签名',
  `comments` varchar(500) NOT NULL COMMENT '列备注说明',
  `attr_name` varchar(200) NOT NULL COMMENT '类的属性名',
  `attr_type` varchar(200) NOT NULL COMMENT '类的属性类型',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否插入字段',
  `is_update` char(1) DEFAULT NULL COMMENT '是否更新字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `show_type` varchar(200) DEFAULT NULL COMMENT '表单类型',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  PRIMARY KEY (`id`),
  KEY `idx_gen_table_column_tn` (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成表列';

-- ----------------------------
-- Records of js_gen_table_column
-- ----------------------------
INSERT INTO `js_gen_table_column` VALUES ('1186494591164370944', 'test_data', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591193731072', 'test_data', 'test_input', '20', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591202119680', 'test_data', 'test_textarea', '30', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591218896896', 'test_data', 'test_select', '40', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591231479808', 'test_data', 'test_select_multiple', '50', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591244062720', 'test_data', 'test_radio', '60', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591256645632', 'test_data', 'test_checkbox', '70', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591269228544', 'test_data', 'test_date', '80', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591298588672', 'test_data', 'test_datetime', '90', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591311171584', 'test_data', 'test_user_code', '100', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591327948800', 'test_data', 'test_office_code', '110', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591336337408', 'test_data', 'test_area_code', '120', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591374086144', 'test_data', 'test_area_name', '130', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591386669056', 'test_data', 'status', '140', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591399251968', 'test_data', 'create_by', '150', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591411834880', 'test_data', 'create_date', '160', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591420223488', 'test_data', 'update_by', '170', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591437000704', 'test_data', 'update_date', '180', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591445389312', 'test_data', 'remarks', '190', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591638327296', 'test_data_child', 'id', '10', 'varchar(64)', '编号', '编号', 'id', 'String', '1', '0', '1', null, null, null, null, '1', 'hidden', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591650910208', 'test_data_child', 'test_sort', '20', 'int(11)', '排序号', '排序号', 'testSort', 'Long', null, '1', '1', '1', '1', '1', null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591659298816', 'test_data_child', 'test_data_id', '30', 'varchar(64)', '父表主键', '父表主键', 'testData', 'String', null, '1', '1', '1', '1', '1', null, '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591667687424', 'test_data_child', 'test_input', '40', 'varchar(200)', '单行文本', '单行文本', 'testInput', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591680270336', 'test_data_child', 'test_textarea', '50', 'varchar(200)', '多行文本', '多行文本', 'testTextarea', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591688658944', 'test_data_child', 'test_select', '60', 'varchar(10)', '下拉框', '下拉框', 'testSelect', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591697047552', 'test_data_child', 'test_select_multiple', '70', 'varchar(200)', '下拉多选', '下拉多选', 'testSelectMultiple', 'String', null, '1', '1', '1', '1', '1', null, '1', 'select_multiple', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591705436160', 'test_data_child', 'test_radio', '80', 'varchar(10)', '单选框', '单选框', 'testRadio', 'String', null, '1', '1', '1', '1', '1', null, '1', 'radio', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591713824768', 'test_data_child', 'test_checkbox', '90', 'varchar(200)', '复选框', '复选框', 'testCheckbox', 'String', null, '1', '1', '1', '1', '1', null, '1', 'checkbox', '{\"dictName\":\"sys_menu_type\",\"dictType\":\"sys_menu_type\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591726407680', 'test_data_child', 'test_date', '100', 'datetime', '日期选择', '日期选择', 'testDate', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'date', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591734796288', 'test_data_child', 'test_datetime', '110', 'datetime', '日期时间', '日期时间', 'testDatetime', 'java.util.Date', null, '1', '1', '1', '1', '1', 'BETWEEN', '1', 'datetime', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591743184896', 'test_data_child', 'test_user_code', '120', 'varchar(64)', '用户选择', '用户选择', 'testUser', 'com.jeesite.modules.sys.entity.User', null, '1', '1', '1', '1', '1', null, '1', 'userselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591755767808', 'test_data_child', 'test_office_code', '130', 'varchar(64)', '机构选择', '机构选择', 'testOffice', 'com.jeesite.modules.sys.entity.Office', null, '1', '1', '1', '1', '1', null, '1', 'officeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591768350720', 'test_data_child', 'test_area_code', '140', 'varchar(64)', '区域选择', '区域选择', 'testAreaCode|testAreaName', 'String', null, '1', '1', '1', '1', '1', null, '1', 'areaselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591776739328', 'test_data_child', 'test_area_name', '150', 'varchar(100)', '区域名称', '区域名称', 'testAreaName', 'String', null, '1', '1', '1', '1', '0', 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591973871616', 'test_tree', 'tree_code', '10', 'varchar(64)', '节点编码', '节点编码', 'treeCode', 'String', '1', '0', '1', null, null, null, null, '1', 'input', '{\"fieldValid\":\"abc\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494591982260224', 'test_tree', 'parent_code', '20', 'varchar(64)', '父级编号', '父级编号', 'parentCode|parentName', 'This', null, '0', '1', '1', null, null, null, null, 'treeselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494591990648832', 'test_tree', 'parent_codes', '30', 'varchar(1000)', '所有父级编号', '所有父级编号', 'parentCodes', 'String', null, '0', '1', '1', null, null, 'LIKE', '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592003231744', 'test_tree', 'tree_sort', '40', 'decimal(10,0)', '本级排序号', '本级排序号（升序）', 'treeSort', 'Integer', null, '0', '1', '1', '1', null, null, '1', 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494592011620352', 'test_tree', 'tree_sorts', '50', 'varchar(1000)', '所有级别排序号', '所有级别排序号', 'treeSorts', 'String', null, '0', '1', '1', '0', null, null, '0', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592024203264', 'test_tree', 'tree_leaf', '60', 'char(1)', '是否最末级', '是否最末级', 'treeLeaf', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592032591872', 'test_tree', 'tree_level', '70', 'decimal(4,0)', '层次级别', '层次级别', 'treeLevel', 'Integer', null, '0', '1', '1', null, null, null, null, 'input', '{\"fieldValid\":\"digits\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494592045174784', 'test_tree', 'tree_names', '80', 'varchar(1000)', '全节点名', '全节点名', 'treeNames', 'String', null, '0', '1', '1', null, '1', 'LIKE', null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592053563392', 'test_tree', 'tree_name', '90', 'varchar(200)', '节点名称', '节点名称', 'treeName', 'String', null, '0', '1', '1', '1', '1', 'LIKE', '1', 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592066146304', 'test_tree', 'status', '100', 'char(1)', '状态', '状态（0正常 1删除 2停用）', 'status', 'String', null, '0', '1', '0', '1', '1', null, null, 'select', '{\"dictName\":\"sys_search_status\",\"dictType\":\"sys_search_status\"}');
INSERT INTO `js_gen_table_column` VALUES ('1186494592078729216', 'test_tree', 'create_by', '110', 'varchar(64)', '创建者', '创建者', 'createBy', 'String', null, '0', '1', null, null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592091312128', 'test_tree', 'create_date', '120', 'datetime', '创建时间', '创建时间', 'createDate', 'java.util.Date', null, '0', '1', null, null, null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592103895040', 'test_tree', 'update_by', '130', 'varchar(64)', '更新者', '更新者', 'updateBy', 'String', null, '0', '1', '1', null, null, null, null, 'input', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592112283648', 'test_tree', 'update_date', '140', 'datetime', '更新时间', '更新时间', 'updateDate', 'java.util.Date', null, '0', '1', '1', '1', null, null, null, 'dateselect', null);
INSERT INTO `js_gen_table_column` VALUES ('1186494592124866560', 'test_tree', 'remarks', '150', 'varchar(500)', '备注信息', '备注信息', 'remarks', 'String', null, '1', '1', '1', '1', '1', 'LIKE', '1', 'textarea', '{\"isNewLine\":\"1\",\"gridRowCol\":\"12/2/10\"}');

-- ----------------------------
-- Table structure for js_job_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_blob_triggers`;
CREATE TABLE `js_job_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_calendars
-- ----------------------------
DROP TABLE IF EXISTS `js_job_calendars`;
CREATE TABLE `js_job_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_cron_triggers`;
CREATE TABLE `js_job_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_fired_triggers`;
CREATE TABLE `js_job_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_job_details
-- ----------------------------
DROP TABLE IF EXISTS `js_job_job_details`;
CREATE TABLE `js_job_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_locks
-- ----------------------------
DROP TABLE IF EXISTS `js_job_locks`;
CREATE TABLE `js_job_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_locks
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `js_job_paused_trigger_grps`;
CREATE TABLE `js_job_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `js_job_scheduler_state`;
CREATE TABLE `js_job_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simple_triggers`;
CREATE TABLE `js_job_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_simprop_triggers`;
CREATE TABLE `js_job_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `js_job_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `js_job_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_job_triggers
-- ----------------------------
DROP TABLE IF EXISTS `js_job_triggers`;
CREATE TABLE `js_job_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `js_job_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `js_job_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of js_job_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_area
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_area`;
CREATE TABLE `js_sys_area` (
  `area_code` varchar(100) NOT NULL COMMENT '区域编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `area_name` varchar(100) NOT NULL COMMENT '区域名称',
  `area_type` char(1) DEFAULT NULL COMMENT '区域类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`area_code`),
  KEY `idx_sys_area_pc` (`parent_code`),
  KEY `idx_sys_area_ts` (`tree_sort`),
  KEY `idx_sys_area_status` (`status`),
  KEY `idx_sys_area_pcs` (`parent_codes`),
  KEY `idx_sys_area_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of js_sys_area
-- ----------------------------
INSERT INTO `js_sys_area` VALUES ('370000', '0', '0,', '370000', '0000370000,', '0', '0', '山东省', '山东省', '1', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370100', '370000', '0,370000,', '370100', '0000370000,0000370100,', '0', '1', '山东省/济南市', '济南市', '2', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370102', '370100', '0,370000,370100,', '370102', '0000370000,0000370100,0000370102,', '1', '2', '山东省/济南市/历下区', '历下区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370103', '370100', '0,370000,370100,', '370103', '0000370000,0000370100,0000370103,', '1', '2', '山东省/济南市/市中区', '市中区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370104', '370100', '0,370000,370100,', '370104', '0000370000,0000370100,0000370104,', '1', '2', '山东省/济南市/槐荫区', '槐荫区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370105', '370100', '0,370000,370100,', '370105', '0000370000,0000370100,0000370105,', '1', '2', '山东省/济南市/天桥区', '天桥区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370112', '370100', '0,370000,370100,', '370112', '0000370000,0000370100,0000370112,', '1', '2', '山东省/济南市/历城区', '历城区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370113', '370100', '0,370000,370100,', '370113', '0000370000,0000370100,0000370113,', '1', '2', '山东省/济南市/长清区', '长清区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370114', '370100', '0,370000,370100,', '370114', '0000370000,0000370100,0000370114,', '1', '2', '山东省/济南市/章丘区', '章丘区', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370124', '370100', '0,370000,370100,', '370124', '0000370000,0000370100,0000370124,', '1', '2', '山东省/济南市/平阴县', '平阴县', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370125', '370100', '0,370000,370100,', '370125', '0000370000,0000370100,0000370125,', '1', '2', '山东省/济南市/济阳县', '济阳县', '3', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370126', '370100', '0,370000,370100,', '370126', '0000370000,0000370100,0000370126,', '1', '2', '山东省/济南市/商河县', '商河县', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370200', '370000', '0,370000,', '370200', '0000370000,0000370200,', '0', '1', '山东省/青岛市', '青岛市', '2', '0', 'system', '2019-10-22 12:08:34', 'system', '2019-10-22 12:08:34', null);
INSERT INTO `js_sys_area` VALUES ('370202', '370200', '0,370000,370200,', '370202', '0000370000,0000370200,0000370202,', '1', '2', '山东省/青岛市/市南区', '市南区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370203', '370200', '0,370000,370200,', '370203', '0000370000,0000370200,0000370203,', '1', '2', '山东省/青岛市/市北区', '市北区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370211', '370200', '0,370000,370200,', '370211', '0000370000,0000370200,0000370211,', '1', '2', '山东省/青岛市/黄岛区', '黄岛区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370212', '370200', '0,370000,370200,', '370212', '0000370000,0000370200,0000370212,', '1', '2', '山东省/青岛市/崂山区', '崂山区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370213', '370200', '0,370000,370200,', '370213', '0000370000,0000370200,0000370213,', '1', '2', '山东省/青岛市/李沧区', '李沧区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370214', '370200', '0,370000,370200,', '370214', '0000370000,0000370200,0000370214,', '1', '2', '山东省/青岛市/城阳区', '城阳区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370281', '370200', '0,370000,370200,', '370281', '0000370000,0000370200,0000370281,', '1', '2', '山东省/青岛市/胶州市', '胶州市', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370282', '370200', '0,370000,370200,', '370282', '0000370000,0000370200,0000370282,', '1', '2', '山东省/青岛市/即墨区', '即墨区', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370283', '370200', '0,370000,370200,', '370283', '0000370000,0000370200,0000370283,', '1', '2', '山东省/青岛市/平度市', '平度市', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);
INSERT INTO `js_sys_area` VALUES ('370285', '370200', '0,370000,370200,', '370285', '0000370000,0000370200,0000370285,', '1', '2', '山东省/青岛市/莱西市', '莱西市', '3', '0', 'system', '2019-10-22 12:08:35', 'system', '2019-10-22 12:08:35', null);

-- ----------------------------
-- Table structure for js_sys_company
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company`;
CREATE TABLE `js_sys_company` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '公司代码',
  `company_name` varchar(200) NOT NULL COMMENT '公司名称',
  `full_name` varchar(200) NOT NULL COMMENT '公司全称',
  `area_code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`company_code`),
  KEY `idx_sys_company_cc` (`corp_code`),
  KEY `idx_sys_company_pc` (`parent_code`),
  KEY `idx_sys_company_ts` (`tree_sort`),
  KEY `idx_sys_company_status` (`status`),
  KEY `idx_sys_company_vc` (`view_code`),
  KEY `idx_sys_company_pcs` (`parent_codes`),
  KEY `idx_sys_company_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of js_sys_company
-- ----------------------------
INSERT INTO `js_sys_company` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', null, '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '1', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', null, '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_company` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '1', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', null, '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_company_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_company_office`;
CREATE TABLE `js_sys_company_office` (
  `company_code` varchar(64) NOT NULL COMMENT '公司编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  PRIMARY KEY (`company_code`,`office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司部门关联表';

-- ----------------------------
-- Records of js_sys_company_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_config`;
CREATE TABLE `js_sys_config` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `config_name` varchar(100) NOT NULL COMMENT '名称',
  `config_key` varchar(100) NOT NULL COMMENT '参数键',
  `config_value` varchar(1000) DEFAULT NULL COMMENT '参数值',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_config_key` (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of js_sys_config
-- ----------------------------
INSERT INTO `js_sys_config` VALUES ('1186494534117642240', '研发工具-代码生成默认包名', 'gen.defaultPackageName', 'com.jeesite.modules', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '新建项目后，修改该键值，在生成代码的时候就不要再修改了');
INSERT INTO `js_sys_config` VALUES ('1186494534402854912', '主框架页-桌面仪表盘首页地址', 'sys.index.desktopUrl', '/desktop', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '主页面的第一个页签首页桌面地址');
INSERT INTO `js_sys_config` VALUES ('1186494534574821376', '主框架页-主导航菜单显示风格', 'sys.index.menuStyle', '1', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '1：菜单全部在左侧；2：根菜单显示在顶部');
INSERT INTO `js_sys_config` VALUES ('1186494534746787840', '主框架页-侧边栏的默认显示样式', 'sys.index.sidebarStyle', '1', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '1：默认显示侧边栏；2：默认折叠侧边栏');
INSERT INTO `js_sys_config` VALUES ('1186494534931337216', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue-light2', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', 'skin-black-light、skin-black、skin-blue-light、skin-blue、skin-green-light、skin-green、skin-purple-light、skin-purple、skin-red-light、skin-red、skin-yellow-light、skin-yellow');
INSERT INTO `js_sys_config` VALUES ('1186494535182995456', '用户登录-登录失败多少次数后显示验证码', 'sys.login.failedNumAfterValidCode', '100', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '设置为0强制使用验证码登录');
INSERT INTO `js_sys_config` VALUES ('1186494535497568256', '用户登录-登录失败多少次数后锁定账号', 'sys.login.failedNumAfterLockAccount', '200', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '登录失败多少次数后锁定账号');
INSERT INTO `js_sys_config` VALUES ('1186494535749226496', '用户登录-登录失败多少次数后锁定账号的时间', 'sys.login.failedNumAfterLockMinute', '20', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '锁定账号的时间（单位：分钟）');
INSERT INTO `js_sys_config` VALUES ('1186494535946358784', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '是否开启注册用户功能');
INSERT INTO `js_sys_config` VALUES ('1186494536118325248', '账号自助-允许自助注册的用户类型', 'sys.account.registerUser.userTypes', '-1', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '允许注册的用户类型（多个用逗号隔开，如果注册时不选择用户类型，则第一个为默认类型）');
INSERT INTO `js_sys_config` VALUES ('1186494536315457536', '账号自助-验证码有效时间（分钟）', 'sys.account.validCodeTimeout', '10', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '找回密码时，短信/邮件验证码有效时间（单位：分钟，0表示不限制）');
INSERT INTO `js_sys_config` VALUES ('1186494536483229696', '用户管理-账号默认角色-员工类型', 'sys.user.defaultRoleCodes.employee', 'default', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '所有员工用户都拥有的角色权限（适用于菜单授权查询）');
INSERT INTO `js_sys_config` VALUES ('1186494536667779072', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '创建用户和重置密码的时候用户的密码');
INSERT INTO `js_sys_config` VALUES ('1186494536894271488', '用户管理-初始密码修改策略', 'sys.user.initPasswordModify', '1', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '0：初始密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作');
INSERT INTO `js_sys_config` VALUES ('1186494537053655040', '用户管理-账号密码修改策略', 'sys.user.passwordModify', '1', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '0：密码修改策略关闭，没有任何提示；1：提醒用户，如果未修改初始密码，则在登录时和点击菜单就会提醒修改密码对话框；2：强制实行初始密码修改，登录后若不修改密码则不能进行系统操作。');
INSERT INTO `js_sys_config` VALUES ('1186494537292730368', '用户管理-账号密码修改策略验证周期', 'sys.user.passwordModifyCycle', '30', '0', 'system', '2019-10-22 12:08:36', 'system', '2019-10-22 12:08:36', '密码安全修改周期是指定时间内提醒或必须修改密码（例如设置30天）的验证时间（天），超过这个时间登录系统时需，提醒用户修改密码或强制修改密码才能继续使用系统。单位：天，如果设置30天，则第31天开始强制修改密码');
INSERT INTO `js_sys_config` VALUES ('1186494538727182336', '用户管理-密码修改多少次内不允许重复', 'sys.user.passwordModifyNotRepeatNum', '1', '0', 'system', '2019-10-22 12:08:37', 'system', '2019-10-22 12:08:37', '默认1次，表示不能与上次密码重复；若设置为3，表示并与前3次密码重复');
INSERT INTO `js_sys_config` VALUES ('1186494539909976064', '用户管理-账号密码修改最低安全等级', 'sys.user.passwordModifySecurityLevel', '0', '0', 'system', '2019-10-22 12:08:37', 'system', '2019-10-22 12:08:37', '0：不限制等级（用户在修改密码的时候不进行等级验证）\r；1：限制最低等级为很弱\r；2：限制最低等级为弱\r；3：限制最低等级为安全\r；4：限制最低等级为很安全');

-- ----------------------------
-- Table structure for js_sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_data`;
CREATE TABLE `js_sys_dict_data` (
  `dict_code` varchar(64) NOT NULL COMMENT '字典编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `dict_label` varchar(100) NOT NULL COMMENT '字典标签',
  `dict_value` varchar(100) NOT NULL COMMENT '字典键值',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '系统内置（1是 0否）',
  `description` varchar(500) DEFAULT NULL COMMENT '字典描述',
  `css_style` varchar(500) DEFAULT NULL COMMENT 'css样式（如：color:red)',
  `css_class` varchar(500) DEFAULT NULL COMMENT 'css类名（如：red）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`dict_code`),
  KEY `idx_sys_dict_data_cc` (`corp_code`),
  KEY `idx_sys_dict_data_dt` (`dict_type`),
  KEY `idx_sys_dict_data_pc` (`parent_code`),
  KEY `idx_sys_dict_data_status` (`status`),
  KEY `idx_sys_dict_data_pcs` (`parent_codes`),
  KEY `idx_sys_dict_data_ts` (`tree_sort`),
  KEY `idx_sys_dict_data_tss` (`tree_sorts`),
  KEY `idx_sys_dict_data_dv` (`dict_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of js_sys_dict_data
-- ----------------------------
INSERT INTO `js_sys_dict_data` VALUES ('1186494549246496768', '0', '0,', '30', '0000000030,', '1', '0', '是', '是', '1', 'sys_yes_no', '1', '', '', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494549670121472', '0', '0,', '40', '0000000040,', '1', '0', '否', '否', '0', 'sys_yes_no', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494549733036032', '0', '0,', '20', '0000000020,', '1', '0', '正常', '正常', '0', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494549787561984', '0', '0,', '30', '0000000030,', '1', '0', '删除', '删除', '1', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494549963722752', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550030831616', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550219575296', '0', '0,', '60', '0000000060,', '1', '0', '待审', '待审', '4', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550492205056', '0', '0,', '70', '0000000070,', '1', '0', '驳回', '驳回', '5', 'sys_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550643200000', '0', '0,', '80', '0000000080,', '1', '0', '草稿', '草稿', '9', 'sys_status', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550714503168', '0', '0,', '30', '0000000030,', '1', '0', '显示', '显示', '1', 'sys_show_hide', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550769029120', '0', '0,', '40', '0000000040,', '1', '0', '隐藏', '隐藏', '0', 'sys_show_hide', '1', '', 'color:#aaa;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550819360768', '0', '0,', '30', '0000000030,', '1', '0', '简体中文', '简体中文', 'zh_CN', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550869692416', '0', '0,', '40', '0000000040,', '1', '0', 'English', 'English', 'en', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550932606976', '0', '0,', '60', '0000000060,', '1', '0', '日本語', '日本語', 'ja_JP', 'sys_lang_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494550978744320', '0', '0,', '30', '0000000030,', '1', '0', 'PC电脑', 'PC电脑', 'pc', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551037464576', '0', '0,', '40', '0000000040,', '1', '0', '手机APP', '手机APP', 'mobileApp', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551167488000', '0', '0,', '50', '0000000050,', '1', '0', '手机Web', '手机Web', 'mobileWeb', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551259762688', '0', '0,', '60', '0000000060,', '1', '0', '微信设备', '微信设备', 'weixin', 'sys_device_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551343648768', '0', '0,', '30', '0000000030,', '1', '0', '主导航菜单', '主导航菜单', 'default', 'sys_menu_sys_code', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551410757632', '0', '0,', '30', '0000000030,', '1', '0', '菜单', '菜单', '1', 'sys_menu_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551473672192', '0', '0,', '40', '0000000040,', '1', '0', '权限', '权限', '2', 'sys_menu_type', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551536586752', '0', '0,', '30', '0000000030,', '1', '0', '默认权重', '默认权重', '20', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551595307008', '0', '0,', '40', '0000000040,', '1', '0', '二级管理员', '二级管理员', '40', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551645638656', '0', '0,', '50', '0000000050,', '1', '0', '系统管理员', '系统管理员', '60', 'sys_menu_weight', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551691776000', '0', '0,', '60', '0000000060,', '1', '0', '超级管理员', '超级管理员', '80', 'sys_menu_weight', '1', '', 'color:#c243d6;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551733719040', '0', '0,', '30', '0000000030,', '1', '0', '国家', '国家', '0', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551779856384', '0', '0,', '40', '0000000040,', '1', '0', '省份直辖市', '省份直辖市', '1', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551830188032', '0', '0,', '50', '0000000050,', '1', '0', '地市', '地市', '2', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551888908288', '0', '0,', '60', '0000000060,', '1', '0', '区县', '区县', '3', 'sys_area_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494551947628544', '0', '0,', '30', '0000000030,', '1', '0', '省级公司', '省级公司', '1', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552127983616', '0', '0,', '40', '0000000040,', '1', '0', '市级公司', '市级公司', '2', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552287367168', '0', '0,', '50', '0000000050,', '1', '0', '部门', '部门', '3', 'sys_office_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552346087424', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_search_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552400613376', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_search_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552476110848', '0', '0,', '30', '0000000030,', '1', '0', '男', '男', '1', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552547414016', '0', '0,', '40', '0000000040,', '1', '0', '女', '女', '2', 'sys_user_sex', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552597745664', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_user_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552643883008', '0', '0,', '40', '0000000040,', '1', '0', '停用', '停用', '2', 'sys_user_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552690020352', '0', '0,', '50', '0000000050,', '1', '0', '冻结', '冻结', '3', 'sys_user_status', '1', '', 'color:#fa0;', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552786489344', '0', '0,', '30', '0000000030,', '1', '0', '员工', '员工', 'employee', 'sys_user_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552870375424', '0', '0,', '40', '0000000040,', '1', '0', '会员', '会员', 'member', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494552929095680', '0', '0,', '50', '0000000050,', '1', '0', '单位', '单位', 'btype', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553012981760', '0', '0,', '60', '0000000060,', '1', '0', '个人', '个人', 'persion', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553163976704', '0', '0,', '70', '0000000070,', '1', '0', '专家', '专家', 'expert', 'sys_user_type', '1', '', '', '', '2', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553235279872', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553294000128', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553344331776', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553390469120', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_role_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553436606464', '0', '0,', '30', '0000000030,', '1', '0', '未设置', '未设置', '0', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553478549504', '0', '0,', '40', '0000000040,', '1', '0', '全部数据', '全部数据', '1', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553533075456', '0', '0,', '50', '0000000050,', '1', '0', '自定义数据', '自定义数据', '2', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553579212800', '0', '0,', '60', '0000000060,', '1', '0', '本部门数据', '本部门数据', '3', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553726013440', '0', '0,', '70', '0000000070,', '1', '0', '本公司数据', '本公司数据', '4', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553889591296', '0', '0,', '80', '0000000080,', '1', '0', '本部门和本公司数据', '本部门和本公司数据', '5', 'sys_role_data_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494553956700160', '0', '0,', '30', '0000000030,', '1', '0', '组织管理', '组织管理', 'office_user', 'sys_role_biz_scope', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554086723584', '0', '0,', '30', '0000000030,', '1', '0', '高管', '高管', '1', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554158026752', '0', '0,', '40', '0000000040,', '1', '0', '中层', '中层', '2', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554212552704', '0', '0,', '50', '0000000050,', '1', '0', '基层', '基层', '3', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554262884352', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'sys_post_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554309021696', '0', '0,', '30', '0000000030,', '1', '0', '接入日志', '接入日志', 'access', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554355159040', '0', '0,', '40', '0000000040,', '1', '0', '修改日志', '修改日志', 'update', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554405490688', '0', '0,', '50', '0000000050,', '1', '0', '查询日志', '查询日志', 'select', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554455822336', '0', '0,', '60', '0000000060,', '1', '0', '登录登出', '登录登出', 'loginLogout', 'sys_log_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554506153984', '0', '0,', '30', '0000000030,', '1', '0', '默认', '默认', 'DEFAULT', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554569068544', '0', '0,', '40', '0000000040,', '1', '0', '系统', '系统', 'SYSTEM', 'sys_job_group', '1', '', '', '', '0', 'system', '2019-10-22 12:08:40', 'system', '2019-10-22 12:08:40', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554673926144', '0', '0,', '30', '0000000030,', '1', '0', '错过计划等待本次计划完成后立即执行一次', '错过计划等待本次计划完成后立即执行一次', '1', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554741035008', '0', '0,', '40', '0000000040,', '1', '0', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '本次执行时间根据上次结束时间重新计算（时间间隔方式）', '2', 'sys_job_misfire_instruction', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554824921088', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494554971721728', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555022053376', '0', '0,', '50', '0000000050,', '1', '0', '暂停', '暂停', '2', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555072385024', '0', '0,', '30', '0000000030,', '1', '0', '完成', '完成', '3', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555126910976', '0', '0,', '40', '0000000040,', '1', '0', '错误', '错误', '4', 'sys_job_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555189825536', '0', '0,', '50', '0000000050,', '1', '0', '运行', '运行', '5', 'sys_job_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555256934400', '0', '0,', '30', '0000000030,', '1', '0', '计划日志', '计划日志', 'scheduler', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555584090112', '0', '0,', '40', '0000000040,', '1', '0', '任务日志', '任务日志', 'job', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494555907051520', '0', '0,', '50', '0000000050,', '1', '0', '触发日志', '触发日志', 'trigger', 'sys_job_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494556003520512', '0', '0,', '30', '0000000030,', '1', '0', '计划创建', '计划创建', 'jobScheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494556171292672', '0', '0,', '40', '0000000040,', '1', '0', '计划移除', '计划移除', 'jobUnscheduled', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494556796243968', '0', '0,', '50', '0000000050,', '1', '0', '计划暂停', '计划暂停', 'triggerPaused', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494556863352832', '0', '0,', '60', '0000000060,', '1', '0', '计划恢复', '计划恢复', 'triggerResumed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494556922073088', '0', '0,', '70', '0000000070,', '1', '0', '调度错误', '调度错误', 'schedulerError', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557173731328', '0', '0,', '80', '0000000080,', '1', '0', '任务执行', '任务执行', 'jobToBeExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557270200320', '0', '0,', '90', '0000000090,', '1', '0', '任务结束', '任务结束', 'jobWasExecuted', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557328920576', '0', '0,', '100', '0000000100,', '1', '0', '任务停止', '任务停止', 'jobExecutionVetoed', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557425389568', '0', '0,', '110', '0000000110,', '1', '0', '触发计划', '触发计划', 'triggerFired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557484109824', '0', '0,', '120', '0000000120,', '1', '0', '触发验证', '触发验证', 'vetoJobExecution', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557538635776', '0', '0,', '130', '0000000130,', '1', '0', '触发完成', '触发完成', 'triggerComplete', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557593161728', '0', '0,', '140', '0000000140,', '1', '0', '触发错过', '触发错过', 'triggerMisfired', 'sys_job_event', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557639299072', '0', '0,', '30', '0000000030,', '1', '0', 'PC', 'PC', 'pc', 'sys_msg_type', '1', '消息类型', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557706407936', '0', '0,', '40', '0000000040,', '1', '0', 'APP', 'APP', 'app', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557765128192', '0', '0,', '50', '0000000050,', '1', '0', '短信', '短信', 'sms', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557840625664', '0', '0,', '60', '0000000060,', '1', '0', '邮件', '邮件', 'email', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557890957312', '0', '0,', '70', '0000000070,', '1', '0', '微信', '微信', 'weixin', 'sys_msg_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557937094656', '0', '0,', '30', '0000000030,', '1', '0', '待推送', '待推送', '0', 'sys_msg_push_status', '1', '推送状态', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494557987426304', '0', '0,', '30', '0000000030,', '1', '0', '成功', '成功', '1', 'sys_msg_push_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494558071312384', '0', '0,', '40', '0000000040,', '1', '0', '失败', '失败', '2', 'sys_msg_push_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494558197141504', '0', '0,', '30', '0000000030,', '1', '0', '未送达', '未送达', '0', 'sys_msg_read_status', '1', '读取状态', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494558381690880', '0', '0,', '40', '0000000040,', '1', '0', '已读', '已读', '1', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494558759178240', '0', '0,', '50', '0000000050,', '1', '0', '未读', '未读', '2', 'sys_msg_read_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:41', 'system', '2019-10-22 12:08:41', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494558851452928', '0', '0,', '30', '0000000030,', '1', '0', '普通', '普通', '1', 'msg_inner_content_level', '1', '内容级别', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559069556736', '0', '0,', '40', '0000000040,', '1', '0', '一般', '一般', '2', 'msg_inner_content_level', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559124082688', '0', '0,', '50', '0000000050,', '1', '0', '紧急', '紧急', '3', 'msg_inner_content_level', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559170220032', '0', '0,', '30', '0000000030,', '1', '0', '公告', '公告', '1', 'msg_inner_content_type', '1', '内容类型', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559224745984', '0', '0,', '40', '0000000040,', '1', '0', '新闻', '新闻', '2', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559283466240', '0', '0,', '50', '0000000050,', '1', '0', '会议', '会议', '3', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559342186496', '0', '0,', '60', '0000000060,', '1', '0', '其它', '其它', '4', 'msg_inner_content_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559392518144', '0', '0,', '30', '0000000030,', '1', '0', '全部', '全部', '0', 'msg_inner_receiver_type', '1', '接受类型', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559434461184', '0', '0,', '30', '0000000030,', '1', '0', '用户', '用户', '1', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559480598528', '0', '0,', '40', '0000000040,', '1', '0', '部门', '部门', '2', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559522541568', '0', '0,', '50', '0000000050,', '1', '0', '角色', '角色', '3', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559564484608', '0', '0,', '60', '0000000060,', '1', '0', '岗位', '岗位', '4', 'msg_inner_receiver_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559606427648', '0', '0,', '30', '0000000030,', '1', '0', '正常', '正常', '0', 'msg_inner_msg_status', '1', '消息状态', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559648370688', '0', '0,', '40', '0000000040,', '1', '0', '删除', '删除', '1', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559690313728', '0', '0,', '50', '0000000050,', '1', '0', '审核', '审核', '4', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559728062464', '0', '0,', '60', '0000000060,', '1', '0', '驳回', '驳回', '5', 'msg_inner_msg_status', '1', '', 'color:#f00;', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559770005504', '0', '0,', '70', '0000000070,', '1', '0', '草稿', '草稿', '9', 'msg_inner_msg_status', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559828725760', '0', '0,', '30', '0000000030,', '1', '0', '公共文件柜', '公共文件柜', 'global', 'filemanager_group_type', '1', '文件组类型', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559879057408', '0', '0,', '40', '0000000040,', '1', '0', '个人文件柜', '个人文件柜', 'self', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_dict_data` VALUES ('1186494559921000448', '0', '0,', '50', '0000000050,', '1', '0', '部门文件柜', '部门文件柜', 'office', 'filemanager_group_type', '1', '', '', '', '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_dict_type`;
CREATE TABLE `js_sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `dict_name` varchar(100) NOT NULL COMMENT '字典名称',
  `dict_type` varchar(100) NOT NULL COMMENT '字典类型',
  `is_sys` char(1) NOT NULL COMMENT '是否系统字典',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_dict_type_is` (`is_sys`),
  KEY `idx_sys_dict_type_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of js_sys_dict_type
-- ----------------------------
INSERT INTO `js_sys_dict_type` VALUES ('1186494545769418752', '是否', 'sys_yes_no', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494545932996608', '状态', 'sys_status', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494545970745344', '显示隐藏', 'sys_show_hide', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546008494080', '国际化语言类型', 'sys_lang_type', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546050437120', '客户端设备类型', 'sys_device_type', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546088185856', '菜单归属系统', 'sys_menu_sys_code', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546155294720', '菜单类型', 'sys_menu_type', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546201432064', '菜单权重', 'sys_menu_weight', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546243375104', '区域类型', 'sys_area_type', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546276929536', '机构类型', 'sys_office_type', '1', '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546318872576', '查询状态', 'sys_search_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546352427008', '用户性别', 'sys_user_sex', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546385981440', '用户状态', 'sys_user_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546415341568', '用户类型', 'sys_user_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546457284608', '角色分类', 'sys_role_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546503421952', '角色数据范围', 'sys_role_data_scope', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546541170688', '角色业务范围', 'sys_role_biz_scope', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546583113728', '岗位分类', 'sys_post_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546633445376', '日志类型', 'sys_log_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546725720064', '作业分组', 'sys_job_group', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546805411840', '作业错过策略', 'sys_job_misfire_instruction', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546843160576', '作业状态', 'sys_job_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546876715008', '作业任务类型', 'sys_job_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546910269440', '作业任务事件', 'sys_job_event', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546948018176', '消息类型', 'sys_msg_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494546981572608', '推送状态', 'sys_msg_push_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547019321344', '读取状态', 'sys_msg_read_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547048681472', '内容级别', 'msg_inner_content_level', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547082235904', '内容类型', 'msg_inner_content_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547115790336', '接受类型', 'msg_inner_receiver_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547149344768', '消息状态', 'msg_inner_msg_status', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);
INSERT INTO `js_sys_dict_type` VALUES ('1186494547187093504', '文件组类型', 'filemanager_group_type', '1', '0', 'system', '2019-10-22 12:08:39', 'system', '2019-10-22 12:08:39', null);

-- ----------------------------
-- Table structure for js_sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee`;
CREATE TABLE `js_sys_employee` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `emp_name` varchar(100) NOT NULL COMMENT '员工姓名',
  `emp_name_en` varchar(100) DEFAULT NULL COMMENT '英文名',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `company_code` varchar(64) DEFAULT NULL COMMENT '公司编码',
  `company_name` varchar(200) DEFAULT NULL COMMENT '公司名称',
  `status` char(1) NOT NULL COMMENT '状态（0在职 1删除 2离职）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`emp_code`),
  KEY `idx_sys_employee_cco` (`company_code`),
  KEY `idx_sys_employee_cc` (`corp_code`),
  KEY `idx_sys_employee_ud` (`update_date`),
  KEY `idx_sys_employee_oc` (`office_code`),
  KEY `idx_sys_employee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of js_sys_employee
-- ----------------------------
INSERT INTO `js_sys_employee` VALUES ('user10_pya1', '用户10', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user11_vtqr', '用户11', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user12_2ogj', '用户12', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user13_gxr4', '用户13', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user14_mngl', '用户14', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user15_ot4j', '用户15', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user16_vpop', '用户16', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user17_horn', '用户17', null, 'SDQD01', '企管部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user18_2em4', '用户18', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user19_yxor', '用户19', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user1_28aq', '用户01', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user20_ewur', '用户20', null, 'SDQD02', '财务部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user21_yfxs', '用户21', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user22_htis', '用户22', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user23_5z1d', '用户23', null, 'SDQD03', '研发部', 'SDQD', '青岛公司', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user2_l99s', '用户02', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user3_9hll', '用户03', null, 'SDJN01', '企管部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user4_l4hb', '用户04', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user5_zeoq', '用户05', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user6_hr37', '用户06', null, 'SDJN02', '财务部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user7_d7qw', '用户07', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user8_a1is', '用户08', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');
INSERT INTO `js_sys_employee` VALUES ('user9_zugk', '用户09', null, 'SDJN03', '研发部', 'SDJN', '济南公司', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_employee_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_office`;
CREATE TABLE `js_sys_employee_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `post_code` varchar(64) DEFAULT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`office_code`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工附属机构关系表';

-- ----------------------------
-- Records of js_sys_employee_office
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_employee_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_employee_post`;
CREATE TABLE `js_sys_employee_post` (
  `emp_code` varchar(64) NOT NULL COMMENT '员工编码',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  PRIMARY KEY (`emp_code`,`post_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工与岗位关联表';

-- ----------------------------
-- Records of js_sys_employee_post
-- ----------------------------
INSERT INTO `js_sys_employee_post` VALUES ('user10_pya1', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user11_vtqr', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user12_2ogj', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user13_gxr4', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user14_mngl', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user15_ot4j', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user16_vpop', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user17_horn', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user18_2em4', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user19_yxor', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user1_28aq', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user20_ewur', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user21_yfxs', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user22_htis', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user23_5z1d', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user2_l99s', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user3_9hll', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user4_l4hb', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user5_zeoq', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user6_hr37', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user7_d7qw', 'dept');
INSERT INTO `js_sys_employee_post` VALUES ('user8_a1is', 'user');
INSERT INTO `js_sys_employee_post` VALUES ('user9_zugk', 'user');

-- ----------------------------
-- Table structure for js_sys_file_entity
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_entity`;
CREATE TABLE `js_sys_file_entity` (
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_md5` varchar(64) NOT NULL COMMENT '文件MD5',
  `file_path` varchar(1000) NOT NULL COMMENT '文件相对路径',
  `file_content_type` varchar(200) NOT NULL COMMENT '文件内容类型',
  `file_extension` varchar(100) NOT NULL COMMENT '文件后缀扩展名',
  `file_size` decimal(31,0) NOT NULL COMMENT '文件大小(单位B)',
  `file_meta` varchar(255) DEFAULT NULL COMMENT '文件信息(JSON格式)',
  PRIMARY KEY (`file_id`),
  KEY `idx_sys_file_entity_md5` (`file_md5`),
  KEY `idx_sys_file_entity_size` (`file_size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件实体表';

-- ----------------------------
-- Records of js_sys_file_entity
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_file_upload
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_file_upload`;
CREATE TABLE `js_sys_file_upload` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `file_id` varchar(64) NOT NULL COMMENT '文件编号',
  `file_name` varchar(500) NOT NULL COMMENT '文件名称',
  `file_type` varchar(20) NOT NULL COMMENT '文件分类（image、media、file）',
  `file_sort` decimal(10,0) DEFAULT NULL COMMENT '文件排序（升序）',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_file_biz_ft` (`file_type`),
  KEY `idx_sys_file_biz_fi` (`file_id`),
  KEY `idx_sys_file_biz_status` (`status`),
  KEY `idx_sys_file_biz_cb` (`create_by`),
  KEY `idx_sys_file_biz_ud` (`update_date`),
  KEY `idx_sys_file_biz_bt` (`biz_type`),
  KEY `idx_sys_file_biz_bk` (`biz_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

-- ----------------------------
-- Records of js_sys_file_upload
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_job
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job`;
CREATE TABLE `js_sys_job` (
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `description` varchar(100) NOT NULL COMMENT '任务描述',
  `invoke_target` varchar(1000) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) NOT NULL COMMENT 'Cron执行表达式',
  `misfire_instruction` decimal(1,0) NOT NULL COMMENT '计划执行错误策略',
  `concurrent` char(1) NOT NULL COMMENT '是否并发执行',
  `instance_name` varchar(64) NOT NULL DEFAULT 'JeeSiteScheduler' COMMENT '集群的实例名字',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2暂停）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`job_name`,`job_group`),
  KEY `idx_sys_job_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度表';

-- ----------------------------
-- Records of js_sys_job
-- ----------------------------
INSERT INTO `js_sys_job` VALUES ('MsgLocalMergePushTask', 'SYSTEM', '消息推送服务 (合并推送)', 'msgLocalMergePushTask.execute()', '0 0/30 * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null);
INSERT INTO `js_sys_job` VALUES ('MsgLocalPushTask', 'SYSTEM', '消息推送服务 (实时推送)', 'msgLocalPushTask.execute()', '0/3 * * * * ?', '2', '0', 'JeeSiteScheduler', '2', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null);

-- ----------------------------
-- Table structure for js_sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_job_log`;
CREATE TABLE `js_sys_job_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `job_type` varchar(50) DEFAULT NULL COMMENT '日志类型',
  `job_event` varchar(200) DEFAULT NULL COMMENT '日志事件',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_job_log_jn` (`job_name`),
  KEY `idx_sys_job_log_jg` (`job_group`),
  KEY `idx_sys_job_log_t` (`job_type`),
  KEY `idx_sys_job_log_e` (`job_event`),
  KEY `idx_sys_job_log_ie` (`is_exception`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业调度日志表';

-- ----------------------------
-- Records of js_sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_lang
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_lang`;
CREATE TABLE `js_sys_lang` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) NOT NULL COMMENT '归属模块',
  `lang_code` varchar(500) NOT NULL COMMENT '语言编码',
  `lang_text` varchar(500) NOT NULL COMMENT '语言译文',
  `lang_type` varchar(50) NOT NULL COMMENT '语言类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_lang_code` (`lang_code`),
  KEY `idx_sys_lang_type` (`lang_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='国际化语言';

-- ----------------------------
-- Records of js_sys_lang
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_log`;
CREATE TABLE `js_sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `log_title` varchar(500) NOT NULL COMMENT '日志标题',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_by_name` varchar(100) NOT NULL COMMENT '用户名称',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `request_uri` varchar(500) DEFAULT NULL COMMENT '请求URI',
  `request_method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_params` longtext COMMENT '操作提交的数据',
  `diff_modify_data` text COMMENT '新旧数据比较结果',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `remote_addr` varchar(255) NOT NULL COMMENT '操作IP地址',
  `server_addr` varchar(255) NOT NULL COMMENT '请求服务器地址',
  `is_exception` char(1) DEFAULT NULL COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `user_agent` varchar(500) DEFAULT NULL COMMENT '用户代理',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名称/操作系统',
  `browser_name` varchar(100) DEFAULT NULL COMMENT '浏览器名称',
  `execute_time` decimal(19,0) DEFAULT NULL COMMENT '执行时间',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`id`),
  KEY `idx_sys_log_cb` (`create_by`),
  KEY `idx_sys_log_cc` (`corp_code`),
  KEY `idx_sys_log_lt` (`log_type`),
  KEY `idx_sys_log_bk` (`biz_key`),
  KEY `idx_sys_log_bt` (`biz_type`),
  KEY `idx_sys_log_ie` (`is_exception`),
  KEY `idx_sys_log_cd` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of js_sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_menu`;
CREATE TABLE `js_sys_menu` (
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `menu_name` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) NOT NULL COMMENT '菜单类型（1菜单 2权限 3开发）',
  `menu_href` varchar(1000) DEFAULT NULL COMMENT '链接',
  `menu_target` varchar(20) DEFAULT NULL COMMENT '目标',
  `menu_icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `menu_color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `menu_title` varchar(100) DEFAULT NULL COMMENT '菜单标题',
  `permission` varchar(1000) DEFAULT NULL COMMENT '权限标识',
  `weight` decimal(4,0) DEFAULT NULL COMMENT '菜单权重',
  `is_show` char(1) NOT NULL COMMENT '是否显示（1显示 0隐藏）',
  `sys_code` varchar(64) NOT NULL COMMENT '归属系统（default:主导航菜单、mobileApp:APP菜单）',
  `module_codes` varchar(500) NOT NULL COMMENT '归属模块（多个用逗号隔开）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`menu_code`),
  KEY `idx_sys_menu_pc` (`parent_code`),
  KEY `idx_sys_menu_ts` (`tree_sort`),
  KEY `idx_sys_menu_status` (`status`),
  KEY `idx_sys_menu_mt` (`menu_type`),
  KEY `idx_sys_menu_pss` (`parent_codes`),
  KEY `idx_sys_menu_tss` (`tree_sorts`),
  KEY `idx_sys_menu_sc` (`sys_code`),
  KEY `idx_sys_menu_is` (`is_show`),
  KEY `idx_sys_menu_mcs` (`module_codes`),
  KEY `idx_sys_menu_wt` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of js_sys_menu
-- ----------------------------
INSERT INTO `js_sys_menu` VALUES ('1186494565067411456', '0', '0,', '9000', '0000009000,', '0', '0', '系统管理', '系统管理', '1', '', '', 'icon-settings', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494565432315904', '1186494565067411456', '0,1186494565067411456,', '300', '0000009000,0000000300,', '0', '1', '系统管理/组织管理', '组织管理', '1', '', '', 'icon-grid', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494565566533632', '1186494565432315904', '0,1186494565067411456,1186494565432315904,', '40', '0000009000,0000000300,0000000040,', '0', '2', '系统管理/组织管理/用户管理', '用户管理', '1', '/sys/empUser/index', '', 'icon-user', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494565696557056', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '30', '0000009000,0000000300,0000000040,0000000030,', '1', '3', '系统管理/组织管理/用户管理/查看', '查看', '2', '', '', '', '', null, 'sys:empUser:view', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494565830774784', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '40', '0000009000,0000000300,0000000040,0000000040,', '1', '3', '系统管理/组织管理/用户管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:empUser:edit', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494565977575424', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/分配角色', '分配角色', '2', '', '', '', '', null, 'sys:empUser:authRole', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566300536832', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '50', '0000009000,0000000300,0000000040,0000000050,', '1', '3', '系统管理/组织管理/用户管理/分配数据', '分配数据', '2', '', '', '', '', null, 'sys:empUser:authDataScope', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566413783040', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '60', '0000009000,0000000300,0000000040,0000000060,', '1', '3', '系统管理/组织管理/用户管理/停用启用', '停用启用', '2', '', '', '', '', null, 'sys:empUser:updateStatus', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566585749504', '1186494565566533632', '0,1186494565067411456,1186494565432315904,1186494565566533632,', '70', '0000009000,0000000300,0000000040,0000000070,', '1', '3', '系统管理/组织管理/用户管理/重置密码', '重置密码', '2', '', '', '', '', null, 'sys:empUser:resetpwd', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566694801408', '1186494565432315904', '0,1186494565067411456,1186494565432315904,', '50', '0000009000,0000000300,0000000050,', '0', '2', '系统管理/组织管理/机构管理', '机构管理', '1', '/sys/office/index', '', 'icon-grid', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566820630528', '1186494566694801408', '0,1186494565067411456,1186494565432315904,1186494566694801408,', '30', '0000009000,0000000300,0000000050,0000000030,', '1', '3', '系统管理/组织管理/机构管理/查看', '查看', '2', '', '', '', '', null, 'sys:office:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494566954848256', '1186494566694801408', '0,1186494565067411456,1186494565432315904,1186494566694801408,', '40', '0000009000,0000000300,0000000050,0000000040,', '1', '3', '系统管理/组织管理/机构管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:office:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567072288768', '1186494565432315904', '0,1186494565067411456,1186494565432315904,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/公司管理', '公司管理', '1', '/sys/company/list', '', 'icon-fire', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567202312192', '1186494567072288768', '0,1186494565067411456,1186494565432315904,1186494567072288768,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/公司管理/查看', '查看', '2', '', '', '', '', null, 'sys:company:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567298781184', '1186494567072288768', '0,1186494565067411456,1186494565432315904,1186494567072288768,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/公司管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:company:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567391055872', '1186494565432315904', '0,1186494565067411456,1186494565432315904,', '70', '0000009000,0000000300,0000000070,', '0', '2', '系统管理/组织管理/岗位管理', '岗位管理', '1', '/sys/post/list', '', 'icon-trophy', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567474941952', '1186494567391055872', '0,1186494565067411456,1186494565432315904,1186494567391055872,', '30', '0000009000,0000000300,0000000070,0000000030,', '1', '3', '系统管理/组织管理/岗位管理/查看', '查看', '2', '', '', '', '', null, 'sys:post:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567554633728', '1186494567391055872', '0,1186494565067411456,1186494565432315904,1186494567391055872,', '40', '0000009000,0000000300,0000000070,0000000040,', '1', '3', '系统管理/组织管理/岗位管理/编辑', '编辑', '2', '', '', '', '', null, 'sys:post:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567630131200', '1186494565067411456', '0,1186494565067411456,', '400', '0000009000,0000000400,', '0', '1', '系统管理/权限管理', '权限管理', '1', '', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567705628672', '1186494567630131200', '0,1186494565067411456,1186494567630131200,', '30', '0000009000,0000000400,0000000030,', '1', '2', '系统管理/权限管理/角色管理', '角色管理', '1', '/sys/role/list', '', 'icon-people', '', null, 'sys:role', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567793709056', '1186494567630131200', '0,1186494565067411456,1186494567630131200,', '40', '0000009000,0000000400,0000000040,', '1', '2', '系统管理/权限管理/二级管理员', '二级管理员', '1', '/sys/secAdmin/list', '', 'icon-user-female', '', null, 'sys:secAdmin', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567885983744', '1186494567630131200', '0,1186494565067411456,1186494567630131200,', '50', '0000009000,0000000400,0000000050,', '1', '2', '系统管理/权限管理/系统管理员', '系统管理员', '1', '/sys/corpAdmin/list', '', 'icon-badge', '', null, 'sys:corpAdmin', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494567995035648', '1186494565067411456', '0,1186494565067411456,', '500', '0000009000,0000000500,', '0', '1', '系统管理/系统设置', '系统设置', '1', '', '', 'icon-settings', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568116670464', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '30', '0000009000,0000000500,0000000030,', '1', '2', '系统管理/系统设置/菜单管理', '菜单管理', '1', '/sys/menu/list', '', 'icon-book-open', '', null, 'sys:menu', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568204750848', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '40', '0000009000,0000000500,0000000040,', '1', '2', '系统管理/系统设置/模块管理', '模块管理', '1', '/sys/module/list', '', 'icon-grid', '', null, 'sys:module', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568297025536', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '50', '0000009000,0000000500,0000000050,', '1', '2', '系统管理/系统设置/参数设置', '参数设置', '1', '/sys/config/list', '', 'icon-wrench', '', null, 'sys:config', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568380911616', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '60', '0000009000,0000000500,0000000060,', '0', '2', '系统管理/系统设置/字典管理', '字典管理', '1', '/sys/dictType/list', '', 'icon-social-dropbox', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568473186304', '1186494568380911616', '0,1186494565067411456,1186494567995035648,1186494568380911616,', '30', '0000009000,0000000500,0000000060,0000000030,', '1', '3', '系统管理/系统设置/字典管理/类型查看', '类型查看', '2', '', '', '', '', null, 'sys:dictType:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568569655296', '1186494568380911616', '0,1186494565067411456,1186494567995035648,1186494568380911616,', '40', '0000009000,0000000500,0000000060,0000000040,', '1', '3', '系统管理/系统设置/字典管理/类型编辑', '类型编辑', '2', '', '', '', '', null, 'sys:dictType:edit', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568691290112', '1186494568380911616', '0,1186494565067411456,1186494567995035648,1186494568380911616,', '50', '0000009000,0000000500,0000000060,0000000050,', '1', '3', '系统管理/系统设置/字典管理/数据查看', '数据查看', '2', '', '', '', '', null, 'sys:dictData:view', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568783564800', '1186494568380911616', '0,1186494565067411456,1186494567995035648,1186494568380911616,', '60', '0000009000,0000000500,0000000060,0000000060,', '1', '3', '系统管理/系统设置/字典管理/数据编辑', '数据编辑', '2', '', '', '', '', null, 'sys:dictData:edit', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568871645184', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '70', '0000009000,0000000500,0000000070,', '1', '2', '系统管理/系统设置/行政区划', '行政区划', '1', '/sys/area/list', '', 'icon-map', '', null, 'sys:area', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494568989085696', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '80', '0000009000,0000000500,0000000080,', '1', '2', '系统管理/系统设置/国际化管理', '国际化管理', '1', '/sys/lang/list', '', 'icon-globe', '', null, 'sys:lang', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569060388864', '1186494567995035648', '0,1186494565067411456,1186494567995035648,', '90', '0000009000,0000000500,0000000090,', '1', '2', '系统管理/系统设置/产品许可信息', '产品许可信息', '1', '//licence', '', 'icon-paper-plane', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569119109120', '1186494565067411456', '0,1186494565067411456,', '600', '0000009000,0000000600,', '0', '1', '系统管理/系统监控', '系统监控', '1', '', '', 'icon-ghost', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569186217984', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '40', '0000009000,0000000600,0000000040,', '1', '2', '系统管理/系统监控/访问日志', '访问日志', '1', '/sys/log/list', '', 'fa fa-bug', '', null, 'sys:log', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569265909760', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '50', '0000009000,0000000600,0000000050,', '1', '2', '系统管理/系统监控/数据监控', '数据监控', '1', '//druid/index.html', '', 'icon-disc', '', null, 'sys:state:druid', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569395933184', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '60', '0000009000,0000000600,0000000060,', '1', '2', '系统管理/系统监控/缓存监控', '缓存监控', '1', '/state/cache/index', '', 'icon-social-dribbble', '', null, 'sys:stste:cache', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569496596480', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '70', '0000009000,0000000600,0000000070,', '1', '2', '系统管理/系统监控/服务器监控', '服务器监控', '1', '/state/server/index', '', 'icon-speedometer', '', null, 'sys:state:server', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569584676864', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '80', '0000009000,0000000600,0000000080,', '1', '2', '系统管理/系统监控/作业监控', '作业监控', '1', '/job/list', '', 'icon-notebook', '', null, 'sys:job', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569681145856', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '90', '0000009000,0000000600,0000000090,', '1', '2', '系统管理/系统监控/在线用户', '在线用户', '1', '/sys/online/list', '', 'icon-social-twitter', '', null, 'sys:online', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569781809152', '1186494569119109120', '0,1186494565067411456,1186494569119109120,', '100', '0000009000,0000000600,0000000100,', '1', '2', '系统管理/系统监控/在线文档', '在线文档', '1', '//swagger-ui.html', '', 'icon-book-open', '', null, 'sys:swagger', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494569953775616', '1186494565067411456', '0,1186494565067411456,', '700', '0000009000,0000000700,', '0', '1', '系统管理/消息推送', '消息推送', '1', '', '', 'icon-envelope-letter', '', null, '', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570054438912', '1186494569953775616', '0,1186494565067411456,1186494569953775616,', '30', '0000009000,0000000700,0000000030,', '1', '2', '系统管理/消息推送/未完成消息', '未完成消息', '1', '/msg/msgPush/list', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570243182592', '1186494569953775616', '0,1186494565067411456,1186494569953775616,', '40', '0000009000,0000000700,0000000040,', '1', '2', '系统管理/消息推送/已完成消息', '已完成消息', '1', '/msg/msgPush/list?pushed=true', '', '', '', null, 'msg:msgPush', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570335457280', '1186494569953775616', '0,1186494565067411456,1186494569953775616,', '50', '0000009000,0000000700,0000000050,', '1', '2', '系统管理/消息推送/消息模板管理', '消息模板管理', '1', '/msg/msgTemplate/list', '', '', '', null, 'msg:msgTemplate', '60', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570452897792', '1186494565067411456', '0,1186494565067411456,', '900', '0000009000,0000000900,', '0', '1', '系统管理/研发工具', '研发工具', '1', '', '', 'fa fa-code', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570553561088', '1186494570452897792', '0,1186494565067411456,1186494570452897792,', '30', '0000009000,0000000900,0000000030,', '1', '2', '系统管理/研发工具/代码生成工具', '代码生成工具', '1', '/gen/genTable/list', '', 'fa fa-code', '', null, 'gen:genTable', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570654224384', '1186494570452897792', '0,1186494565067411456,1186494570452897792,', '100', '0000009000,0000000900,0000000100,', '0', '2', '系统管理/研发工具/代码生成实例', '代码生成实例', '1', '', '', 'icon-social-dropbox', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570746499072', '1186494570654224384', '0,1186494565067411456,1186494570452897792,1186494570654224384,', '30', '0000009000,0000000900,0000000100,0000000030,', '1', '3', '系统管理/研发工具/代码生成实例/单表_主子表', '单表/主子表', '1', '/test/testData/list', '', '', '', null, 'test:testData', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494570935242752', '1186494570654224384', '0,1186494565067411456,1186494570452897792,1186494570654224384,', '40', '0000009000,0000000900,0000000100,0000000040,', '1', '3', '系统管理/研发工具/代码生成实例/树表_树结构表', '树表/树结构表', '1', '/test/testTree/list', '', '', '', null, 'test:testTree', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571014934528', '1186494570452897792', '0,1186494565067411456,1186494570452897792,', '200', '0000009000,0000000900,0000000200,', '0', '2', '系统管理/研发工具/数据表格实例', '数据表格实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571241426944', '1186494571014934528', '0,1186494565067411456,1186494570452897792,1186494571014934528,', '30', '0000009000,0000000900,0000000200,0000000030,', '1', '3', '系统管理/研发工具/数据表格实例/多表头分组小计合计', '多表头分组小计合计', '1', '/demo/dataGrid/groupGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:44', 'system', '2019-10-22 12:08:44', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571430170624', '1186494571014934528', '0,1186494565067411456,1186494570452897792,1186494571014934528,', '40', '0000009000,0000000900,0000000200,0000000040,', '1', '3', '系统管理/研发工具/数据表格实例/编辑表格多行编辑', '编辑表格多行编辑', '1', '/demo/dataGrid/editGrid', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571660857344', '1186494570452897792', '0,1186494565067411456,1186494570452897792,', '300', '0000009000,0000000900,0000000300,', '0', '2', '系统管理/研发工具/表单组件实例', '表单组件实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571757326336', '1186494571660857344', '0,1186494565067411456,1186494570452897792,1186494571660857344,', '30', '0000009000,0000000900,0000000300,0000000030,', '1', '3', '系统管理/研发工具/表单组件实例/组件应用实例', '组件应用实例', '1', '/demo/form/editForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494571862183936', '1186494571660857344', '0,1186494565067411456,1186494570452897792,1186494571660857344,', '40', '0000009000,0000000900,0000000300,0000000040,', '1', '3', '系统管理/研发工具/表单组件实例/栅格布局实例', '栅格布局实例', '1', '/demo/form/layoutForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572092870656', '1186494571660857344', '0,1186494565067411456,1186494570452897792,1186494571660857344,', '50', '0000009000,0000000900,0000000300,0000000050,', '1', '3', '系统管理/研发工具/表单组件实例/表格表单实例', '表格表单实例', '1', '/demo/form/tableForm', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572222894080', '1186494570452897792', '0,1186494565067411456,1186494570452897792,', '400', '0000009000,0000000900,0000000400,', '0', '2', '系统管理/研发工具/前端界面实例', '前端界面实例', '1', '', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572310974464', '1186494572222894080', '0,1186494565067411456,1186494570452897792,1186494572222894080,', '30', '0000009000,0000000900,0000000400,0000000030,', '1', '3', '系统管理/研发工具/前端界面实例/图标样式查找', '图标样式查找', '1', '//tags/iconselect', '', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572424220672', '1186494565067411456', '0,1186494565067411456,', '999', '0000009000,0000000999,', '0', '1', '系统管理/JeeSite社区', 'JeeSite社区', '1', '', '', 'icon-directions', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572512301056', '1186494572424220672', '0,1186494565067411456,1186494572424220672,', '30', '0000009000,0000000999,0000000030,', '1', '2', '系统管理/JeeSite社区/官方网站', '官方网站', '1', 'http://jeesite.com', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572600381440', '1186494572424220672', '0,1186494565067411456,1186494572424220672,', '50', '0000009000,0000000999,0000000050,', '1', '2', '系统管理/JeeSite社区/作者博客', '作者博客', '1', 'https://my.oschina.net/thinkgem', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572684267520', '1186494572424220672', '0,1186494565067411456,1186494572424220672,', '40', '0000009000,0000000999,0000000040,', '1', '2', '系统管理/JeeSite社区/问题反馈', '问题反馈', '1', 'https://gitee.com/thinkgem/jeesite4/issues', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572797513728', '1186494572424220672', '0,1186494565067411456,1186494572424220672,', '60', '0000009000,0000000999,0000000060,', '1', '2', '系统管理/JeeSite社区/开源社区', '开源社区', '1', 'http://jeesite.net', '_blank', '', '', null, '', '80', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494572923342848', '0', '0,', '9060', '0000009060,', '0', '0', '我的工作', '我的工作', '1', '', '', 'icon-screen-desktop', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573019811840', '1186494572923342848', '0,1186494572923342848,', '500', '0000009060,0000000500,', '0', '1', '我的工作/文件管理', '文件管理', '1', '', '', 'icon-folder', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573116280832', '1186494573019811840', '0,1186494572923342848,1186494573019811840,', '30', '0000009060,0000000500,0000000030,', '1', '2', '我的工作/文件管理/文件管理', '文件管理', '1', '/filemanager/index', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573242109952', '1186494573019811840', '0,1186494572923342848,1186494573019811840,', '50', '0000009060,0000000500,0000000050,', '1', '2', '我的工作/文件管理/文件分享', '文件分享', '1', '/filemanager/filemanagerShared/list', '', '', '', null, 'filemanager', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573338578944', '1186494572923342848', '0,1186494572923342848,', '600', '0000009060,0000000600,', '0', '1', '我的工作/站内消息', '站内消息', '1', '/msg/msgInner/list', '', 'icon-speech', '', null, '', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573422465024', '1186494573338578944', '0,1186494572923342848,1186494573338578944,', '30', '0000009060,0000000600,0000000030,', '1', '2', '我的工作/站内消息/查看', '查看', '2', '', '', '', '', null, 'msg:msgInner:view', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573493768192', '1186494573338578944', '0,1186494572923342848,1186494573338578944,', '40', '0000009060,0000000600,0000000040,', '1', '2', '我的工作/站内消息/编辑', '编辑', '2', '', '', '', '', null, 'msg:msgInner:edit', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_menu` VALUES ('1186494573581848576', '1186494573338578944', '0,1186494572923342848,1186494573338578944,', '50', '0000009060,0000000600,0000000050,', '1', '2', '我的工作/站内消息/审核', '审核', '2', '', '', '', '', null, 'msg:msgInner:auth', '40', '1', 'default', 'core', '0', 'system', '2019-10-22 12:08:45', 'system', '2019-10-22 12:08:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_module
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_module`;
CREATE TABLE `js_sys_module` (
  `module_code` varchar(64) NOT NULL COMMENT '模块编码',
  `module_name` varchar(100) NOT NULL COMMENT '模块名称',
  `description` varchar(500) DEFAULT NULL COMMENT '模块描述',
  `main_class_name` varchar(500) DEFAULT NULL COMMENT '主类全名',
  `current_version` varchar(50) DEFAULT NULL COMMENT '当前版本',
  `upgrade_info` varchar(300) DEFAULT NULL COMMENT '升级信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`module_code`),
  KEY `idx_sys_module_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of js_sys_module
-- ----------------------------
INSERT INTO `js_sys_module` VALUES ('cms', '内容管理', '网站、站点、栏目、文章、链接、评论、留言板', 'com.jeesite.modules.cms.web.CmsController', '4.0.0', null, '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_module` VALUES ('core', '核心模块', '用户、角色、组织、模块、菜单、字典、参数', 'com.jeesite.modules.sys.web.LoginController', '4.1.7', null, '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);
INSERT INTO `js_sys_module` VALUES ('filemanager', '文件管理', '公共文件柜、个人文件柜、文件分享', 'com.jeesite.modules.filemanager.web.FilemanagerController', '4.1.5', null, '0', 'system', '2019-10-22 12:08:38', 'system', '2019-10-22 12:08:38', null);

-- ----------------------------
-- Table structure for js_sys_msg_inner
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner`;
CREATE TABLE `js_sys_msg_inner` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `content_level` char(1) NOT NULL COMMENT '内容级别（1普通 2一般 3紧急）',
  `content_type` char(1) DEFAULT NULL COMMENT '内容类型（1公告 2新闻 3会议 4其它）',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `receive_type` char(1) NOT NULL COMMENT '接受者类型（0全部 1用户 2部门 3角色 4岗位）',
  `receive_codes` text COMMENT '接受者字符串',
  `receive_names` text COMMENT '接受者名称字符串',
  `send_user_code` varchar(64) DEFAULT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) DEFAULT NULL COMMENT '发送者用户姓名',
  `send_date` datetime DEFAULT NULL COMMENT '发送时间',
  `is_attac` char(1) DEFAULT NULL COMMENT '是否有附件',
  `notify_types` varchar(100) DEFAULT NULL COMMENT '通知类型（PC APP 短信 邮件 微信）多选',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 4审核 5驳回 9草稿）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_cb` (`create_by`),
  KEY `idx_sys_msg_inner_status` (`status`),
  KEY `idx_sys_msg_inner_cl` (`content_level`),
  KEY `idx_sys_msg_inner_sc` (`send_user_code`),
  KEY `idx_sys_msg_inner_sd` (`send_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息';

-- ----------------------------
-- Records of js_sys_msg_inner
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_inner_record
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_inner_record`;
CREATE TABLE `js_sys_msg_inner_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_inner_id` varchar(64) NOT NULL COMMENT '所属消息',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `read_status` char(1) NOT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '阅读时间',
  `is_star` char(1) DEFAULT NULL COMMENT '是否标星',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_inner_r_mi` (`msg_inner_id`),
  KEY `idx_sys_msg_inner_r_ruc` (`receive_user_code`),
  KEY `idx_sys_msg_inner_r_status` (`read_status`),
  KEY `idx_sys_msg_inner_r_star` (`is_star`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部消息发送记录表';

-- ----------------------------
-- Records of js_sys_msg_inner_record
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_push
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_push`;
CREATE TABLE `js_sys_msg_push` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_push_type` (`msg_type`),
  KEY `idx_sys_msg_push_rc` (`receive_code`),
  KEY `idx_sys_msg_push_uc` (`receive_user_code`),
  KEY `idx_sys_msg_push_suc` (`send_user_code`),
  KEY `idx_sys_msg_push_pd` (`plan_push_date`),
  KEY `idx_sys_msg_push_ps` (`push_status`),
  KEY `idx_sys_msg_push_rs` (`read_status`),
  KEY `idx_sys_msg_push_bk` (`biz_key`),
  KEY `idx_sys_msg_push_bt` (`biz_type`),
  KEY `idx_sys_msg_push_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送表';

-- ----------------------------
-- Records of js_sys_msg_push
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_pushed
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_pushed`;
CREATE TABLE `js_sys_msg_pushed` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `msg_type` varchar(16) NOT NULL COMMENT '消息类型（PC APP 短信 邮件 微信）',
  `msg_title` varchar(200) NOT NULL COMMENT '消息标题',
  `msg_content` text NOT NULL COMMENT '消息内容',
  `biz_key` varchar(64) DEFAULT NULL COMMENT '业务主键',
  `biz_type` varchar(64) DEFAULT NULL COMMENT '业务类型',
  `receive_code` varchar(64) NOT NULL COMMENT '接受者账号',
  `receive_user_code` varchar(64) NOT NULL COMMENT '接受者用户编码',
  `receive_user_name` varchar(100) NOT NULL COMMENT '接受者用户姓名',
  `send_user_code` varchar(64) NOT NULL COMMENT '发送者用户编码',
  `send_user_name` varchar(100) NOT NULL COMMENT '发送者用户姓名',
  `send_date` datetime NOT NULL COMMENT '发送时间',
  `is_merge_push` char(1) DEFAULT NULL COMMENT '是否合并推送',
  `plan_push_date` datetime DEFAULT NULL COMMENT '计划推送时间',
  `push_number` int(11) DEFAULT NULL COMMENT '推送尝试次数',
  `push_return_content` text COMMENT '推送返回的内容信息',
  `push_return_code` varchar(200) DEFAULT NULL COMMENT '推送返回结果码',
  `push_return_msg_id` varchar(200) DEFAULT NULL COMMENT '推送返回消息编号',
  `push_status` char(1) DEFAULT NULL COMMENT '推送状态（0未推送 1成功  2失败）',
  `push_date` datetime DEFAULT NULL COMMENT '推送时间',
  `read_status` char(1) DEFAULT NULL COMMENT '读取状态（0未送达 1已读 2未读）',
  `read_date` datetime DEFAULT NULL COMMENT '读取时间',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_pushed_type` (`msg_type`),
  KEY `idx_sys_msg_pushed_rc` (`receive_code`),
  KEY `idx_sys_msg_pushed_uc` (`receive_user_code`),
  KEY `idx_sys_msg_pushed_suc` (`send_user_code`),
  KEY `idx_sys_msg_pushed_pd` (`plan_push_date`),
  KEY `idx_sys_msg_pushed_ps` (`push_status`),
  KEY `idx_sys_msg_pushed_rs` (`read_status`),
  KEY `idx_sys_msg_pushed_bk` (`biz_key`),
  KEY `idx_sys_msg_pushed_bt` (`biz_type`),
  KEY `idx_sys_msg_pushed_imp` (`is_merge_push`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息已推送表';

-- ----------------------------
-- Records of js_sys_msg_pushed
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_msg_template
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_msg_template`;
CREATE TABLE `js_sys_msg_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `module_code` varchar(64) DEFAULT NULL COMMENT '归属模块',
  `tpl_key` varchar(100) NOT NULL COMMENT '模板键值',
  `tpl_name` varchar(100) NOT NULL COMMENT '模板名称',
  `tpl_type` varchar(16) NOT NULL COMMENT '模板类型',
  `tpl_content` text NOT NULL COMMENT '模板内容',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`),
  KEY `idx_sys_msg_tpl_key` (`tpl_key`),
  KEY `idx_sys_msg_tpl_type` (`tpl_type`),
  KEY `idx_sys_msg_tpl_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息模板';

-- ----------------------------
-- Records of js_sys_msg_template
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_office
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_office`;
CREATE TABLE `js_sys_office` (
  `office_code` varchar(64) NOT NULL COMMENT '机构编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `view_code` varchar(100) NOT NULL COMMENT '机构代码',
  `office_name` varchar(100) NOT NULL COMMENT '机构名称',
  `full_name` varchar(200) NOT NULL COMMENT '机构全称',
  `office_type` char(1) NOT NULL COMMENT '机构类型',
  `leader` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`office_code`),
  KEY `idx_sys_office_cc` (`corp_code`),
  KEY `idx_sys_office_pc` (`parent_code`),
  KEY `idx_sys_office_pcs` (`parent_codes`),
  KEY `idx_sys_office_status` (`status`),
  KEY `idx_sys_office_ot` (`office_type`),
  KEY `idx_sys_office_vc` (`view_code`),
  KEY `idx_sys_office_ts` (`tree_sort`),
  KEY `idx_sys_office_tss` (`tree_sorts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

-- ----------------------------
-- Records of js_sys_office
-- ----------------------------
INSERT INTO `js_sys_office` VALUES ('SD', '0', '0,', '40', '0000000040,', '0', '0', '山东公司', 'SD', '山东公司', '山东公司', '1', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN', 'SD', '0,SD,', '30', '0000000040,0000000030,', '0', '1', '山东公司/济南公司', 'SDJN', '济南公司', '山东济南公司', '2', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN01', 'SDJN', '0,SD,SDJN,', '30', '0000000040,0000000030,0000000030,', '1', '2', '山东公司/济南公司/企管部', 'SDJN01', '企管部', '山东济南企管部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN02', 'SDJN', '0,SD,SDJN,', '40', '0000000040,0000000030,0000000040,', '1', '2', '山东公司/济南公司/财务部', 'SDJN02', '财务部', '山东济南财务部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDJN03', 'SDJN', '0,SD,SDJN,', '50', '0000000040,0000000030,0000000050,', '1', '2', '山东公司/济南公司/研发部', 'SDJN03', '研发部', '山东济南研发部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD', 'SD', '0,SD,', '40', '0000000040,0000000040,', '0', '1', '山东公司/青岛公司', 'SDQD', '青岛公司', '山东青岛公司', '2', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD01', 'SDQD', '0,SD,SDQD,', '30', '0000000040,0000000040,0000000030,', '1', '2', '山东公司/青岛公司/企管部', 'SDQD01', '企管部', '山东青岛企管部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD02', 'SDQD', '0,SD,SDQD,', '40', '0000000040,0000000040,0000000040,', '1', '2', '山东公司/青岛公司/财务部', 'SDQD02', '财务部', '山东青岛财务部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_office` VALUES ('SDQD03', 'SDQD', '0,SD,SDQD,', '50', '0000000040,0000000040,0000000050,', '1', '2', '山东公司/青岛公司/研发部', 'SDQD03', '研发部', '山东青岛研发部', '3', null, null, null, null, null, '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_post
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_post`;
CREATE TABLE `js_sys_post` (
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_type` varchar(100) DEFAULT NULL COMMENT '岗位分类（高管、中层、基层）',
  `post_sort` decimal(10,0) DEFAULT NULL COMMENT '岗位排序（升序）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  PRIMARY KEY (`post_code`),
  KEY `idx_sys_post_cc` (`corp_code`),
  KEY `idx_sys_post_status` (`status`),
  KEY `idx_sys_post_ps` (`post_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工岗位表';

-- ----------------------------
-- Records of js_sys_post
-- ----------------------------
INSERT INTO `js_sys_post` VALUES ('ceo', '总经理', null, '1', '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('cfo', '财务经理', null, '2', '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('dept', '部门经理', null, '2', '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('hrm', '人力经理', null, '2', '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite');
INSERT INTO `js_sys_post` VALUES ('user', '普通员工', null, '3', '0', 'system', '2019-10-22 12:08:47', 'system', '2019-10-22 12:08:47', null, '0', 'JeeSite');

-- ----------------------------
-- Table structure for js_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role`;
CREATE TABLE `js_sys_role` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_type` varchar(100) DEFAULT NULL COMMENT '角色分类（高管、中层、基层、其它）',
  `role_sort` decimal(10,0) DEFAULT NULL COMMENT '角色排序（升序）',
  `is_sys` char(1) DEFAULT NULL COMMENT '系统内置（1是 0否）',
  `user_type` varchar(16) DEFAULT NULL COMMENT '用户类型（employee员工 member会员）',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围设置（0未设置  1全部数据 2自定义数据）',
  `biz_scope` varchar(255) DEFAULT NULL COMMENT '适应业务范围（不同的功能，不同的数据权限支持）',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`role_code`),
  KEY `idx_sys_role_cc` (`corp_code`),
  KEY `idx_sys_role_is` (`is_sys`),
  KEY `idx_sys_role_status` (`status`),
  KEY `idx_sys_role_rs` (`role_sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of js_sys_role
-- ----------------------------
INSERT INTO `js_sys_role` VALUES ('corpAdmin', '系统管理员', null, '200', '1', 'none', '0', null, '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', '客户方使用的管理员角色，客户方管理员，集团管理员', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('default', '默认角色', null, '100', '1', 'none', '0', null, '0', 'system', '2019-10-22 12:08:43', 'system', '2019-10-22 12:08:43', '非管理员用户，共有的默认角色，在参数配置里指定', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('dept', '部门经理', null, '40', '0', 'employee', '0', null, '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', '部门经理', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_role` VALUES ('user', '普通员工', null, '50', '0', 'employee', '0', null, '0', 'system', '2019-10-22 12:08:42', 'system', '2019-10-22 12:08:42', '普通员工', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_role_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_data_scope`;
CREATE TABLE `js_sys_role_data_scope` (
  `role_code` varchar(64) NOT NULL COMMENT '控制角色编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`role_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据权限表';

-- ----------------------------
-- Records of js_sys_role_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_role_menu`;
CREATE TABLE `js_sys_role_menu` (
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  `menu_code` varchar(64) NOT NULL COMMENT '菜单编码',
  PRIMARY KEY (`role_code`,`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单关联表';

-- ----------------------------
-- Records of js_sys_role_menu
-- ----------------------------
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565067411456');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565432315904');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565566533632');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565696557056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565830774784');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494565977575424');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566300536832');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566413783040');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566585749504');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566694801408');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566820630528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494566954848256');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567072288768');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567202312192');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567298781184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567391055872');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567474941952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567554633728');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567630131200');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567705628672');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567793709056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567885983744');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494567995035648');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568116670464');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568204750848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568297025536');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568380911616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568473186304');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568569655296');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568691290112');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568783564800');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568871645184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494568989085696');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569060388864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569119109120');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569186217984');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569265909760');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569395933184');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569496596480');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569584676864');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569681145856');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569781809152');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494569953775616');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570054438912');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570243182592');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570335457280');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570452897792');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570553561088');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570654224384');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570746499072');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494570935242752');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571014934528');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571241426944');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571430170624');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571660857344');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571757326336');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494571862183936');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572092870656');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572222894080');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572310974464');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572424220672');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572512301056');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572600381440');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572684267520');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572797513728');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494572923342848');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573019811840');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573116280832');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573242109952');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573338578944');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573422465024');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573493768192');
INSERT INTO `js_sys_role_menu` VALUES ('corpAdmin', '1186494573581848576');

-- ----------------------------
-- Table structure for js_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user`;
CREATE TABLE `js_sys_user` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `login_code` varchar(100) NOT NULL COMMENT '登录账号',
  `user_name` varchar(100) NOT NULL COMMENT '用户昵称',
  `password` varchar(100) NOT NULL COMMENT '登录密码',
  `email` varchar(300) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(100) DEFAULT NULL COMMENT '办公电话',
  `sex` char(1) DEFAULT NULL COMMENT '用户性别',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '头像路径',
  `sign` varchar(200) DEFAULT NULL COMMENT '个性签名',
  `wx_openid` varchar(100) DEFAULT NULL COMMENT '绑定的微信号',
  `mobile_imei` varchar(100) DEFAULT NULL COMMENT '绑定的手机串号',
  `user_type` varchar(16) NOT NULL COMMENT '用户类型',
  `ref_code` varchar(64) DEFAULT NULL COMMENT '用户类型引用编号',
  `ref_name` varchar(100) DEFAULT NULL COMMENT '用户类型引用姓名',
  `mgr_type` char(1) NOT NULL COMMENT '管理员类型（0非管理员 1系统管理员  2二级管理员）',
  `pwd_security_level` decimal(1,0) DEFAULT NULL COMMENT '密码安全级别（0初始 1很弱 2弱 3安全 4很安全）',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `pwd_update_record` varchar(1000) DEFAULT NULL COMMENT '密码修改记录',
  `pwd_question` varchar(200) DEFAULT NULL COMMENT '密保问题',
  `pwd_question_answer` varchar(200) DEFAULT NULL COMMENT '密保问题答案',
  `pwd_question_2` varchar(200) DEFAULT NULL COMMENT '密保问题2',
  `pwd_question_answer_2` varchar(200) DEFAULT NULL COMMENT '密保问题答案2',
  `pwd_question_3` varchar(200) DEFAULT NULL COMMENT '密保问题3',
  `pwd_question_answer_3` varchar(200) DEFAULT NULL COMMENT '密保问题答案3',
  `pwd_quest_update_date` datetime DEFAULT NULL COMMENT '密码问题修改时间',
  `last_login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `freeze_date` datetime DEFAULT NULL COMMENT '冻结时间',
  `freeze_cause` varchar(200) DEFAULT NULL COMMENT '冻结原因',
  `user_weight` decimal(8,0) DEFAULT '0' COMMENT '用户权重（降序）',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1删除 2停用 3冻结）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `corp_code` varchar(64) NOT NULL DEFAULT '0' COMMENT '租户代码',
  `corp_name` varchar(100) NOT NULL DEFAULT 'JeeSite' COMMENT '租户名称',
  `extend_s1` varchar(500) DEFAULT NULL COMMENT '扩展 String 1',
  `extend_s2` varchar(500) DEFAULT NULL COMMENT '扩展 String 2',
  `extend_s3` varchar(500) DEFAULT NULL COMMENT '扩展 String 3',
  `extend_s4` varchar(500) DEFAULT NULL COMMENT '扩展 String 4',
  `extend_s5` varchar(500) DEFAULT NULL COMMENT '扩展 String 5',
  `extend_s6` varchar(500) DEFAULT NULL COMMENT '扩展 String 6',
  `extend_s7` varchar(500) DEFAULT NULL COMMENT '扩展 String 7',
  `extend_s8` varchar(500) DEFAULT NULL COMMENT '扩展 String 8',
  `extend_i1` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 1',
  `extend_i2` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 2',
  `extend_i3` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 3',
  `extend_i4` decimal(19,0) DEFAULT NULL COMMENT '扩展 Integer 4',
  `extend_f1` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 1',
  `extend_f2` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 2',
  `extend_f3` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 3',
  `extend_f4` decimal(19,4) DEFAULT NULL COMMENT '扩展 Float 4',
  `extend_d1` datetime DEFAULT NULL COMMENT '扩展 Date 1',
  `extend_d2` datetime DEFAULT NULL COMMENT '扩展 Date 2',
  `extend_d3` datetime DEFAULT NULL COMMENT '扩展 Date 3',
  `extend_d4` datetime DEFAULT NULL COMMENT '扩展 Date 4',
  PRIMARY KEY (`user_code`),
  KEY `idx_sys_user_lc` (`login_code`),
  KEY `idx_sys_user_email` (`email`),
  KEY `idx_sys_user_mobile` (`mobile`),
  KEY `idx_sys_user_wo` (`wx_openid`),
  KEY `idx_sys_user_imei` (`mobile_imei`),
  KEY `idx_sys_user_rt` (`user_type`),
  KEY `idx_sys_user_rc` (`ref_code`),
  KEY `idx_sys_user_mt` (`mgr_type`),
  KEY `idx_sys_user_us` (`user_weight`),
  KEY `idx_sys_user_ud` (`update_date`),
  KEY `idx_sys_user_status` (`status`),
  KEY `idx_sys_user_cc` (`corp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of js_sys_user
-- ----------------------------
INSERT INTO `js_sys_user` VALUES ('admin', 'admin', '系统管理员', 'ab75ad5ad645ec6f1fdc099349bd065030cd684764b9686885dea89d', null, null, null, null, null, null, null, null, 'none', null, null, '1', '1', '2019-10-22 12:08:46', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', '客户方使用的系统管理员，用于一些常用的基础数据配置。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('system', 'system', '超级管理员', 'c753dda329551205cefadff8dc26b56cbaead9f9fb8c267dbe2063e5', null, null, null, null, null, null, null, null, 'none', null, null, '0', '1', '2019-10-22 12:08:46', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:46', 'system', '2019-10-22 12:08:46', '开发者使用的最高级别管理员，主要用于开发和调试。', '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user10_pya1', 'user10', '用户10', '89d796dcc022e1557de21007f3f7d42805412ad57f53496735f92e8c', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user10_pya1', '用户10', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user11_vtqr', 'user11', '用户11', '006b5e9c0a00b5f24b37165ce91419798364aec35d138a46b29802bb', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user11_vtqr', '用户11', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user12_2ogj', 'user12', '用户12', '94a852861d4878729ba42b3e01e5bee5c5801898ec46a10ea0563cce', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user12_2ogj', '用户12', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user13_gxr4', 'user13', '用户13', 'ac2d2ae632abb1652bd61971b01439513f66ca7106e6c8edf5427747', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user13_gxr4', '用户13', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user14_mngl', 'user14', '用户14', 'f76e6bf5d841cf97206724a5944a6864505b375186432dc83e872709', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user14_mngl', '用户14', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user15_ot4j', 'user15', '用户15', 'ad72b5a6c02b52e61b318c4b8232c747c9ffa6f8d991902548880f35', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user15_ot4j', '用户15', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user16_vpop', 'user16', '用户16', 'a5602ab16af7b2c6ddf6bb86061250d4d33c9416f4573d69138c82ca', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user16_vpop', '用户16', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user17_horn', 'user17', '用户17', '121ded716fa9458a604bfbe2d56021ce2aa069a57322b04c6ba48fe0', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user17_horn', '用户17', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user18_2em4', 'user18', '用户18', '869a1bf683e214d717e3e534504629f0a584040b9976e345dd0f1cf2', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user18_2em4', '用户18', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user19_yxor', 'user19', '用户19', 'fd7d1c24b8ae778a4207123b1f5290ad71ce8d1376ca1ab249addaec', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user19_yxor', '用户19', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user1_28aq', 'user1', '用户01', '76e0f7e300d709dd441e7bd00c1e9a022201057484245d9cbc9de752', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user1_28aq', '用户01', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user20_ewur', 'user20', '用户20', '50025afc0a8b93f341faadd1c42bde4e83ce7730c2c6d9cf24481113', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user20_ewur', '用户20', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user21_yfxs', 'user21', '用户21', '599c330c39f02d1be224bbb2e9d33ac95af92dfee250a30faf626d57', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user21_yfxs', '用户21', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user22_htis', 'user22', '用户22', '2024a8aced5b6df590c905dc77bc880a441a88ed96247d55c69178ab', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user22_htis', '用户22', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user23_5z1d', 'user23', '用户23', '24e51b9bdb7acb9b776443c0163f7a2d9843fd5b2208bc099596d1b1', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user23_5z1d', '用户23', '0', '0', '2019-10-22 12:08:49', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:49', 'system', '2019-10-22 12:08:49', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user2_l99s', 'user2', '用户02', 'b95b7f8acb658bdfe4c503449e52609dcd4e1f9aaf38ac9d359ecc71', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user2_l99s', '用户02', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user3_9hll', 'user3', '用户03', 'fd54ccf632d758a3e1c6229f57c95fcb614cf77d219740f28d6814a7', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user3_9hll', '用户03', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user4_l4hb', 'user4', '用户04', 'ba9b552461827744920d4a1517319c10957cf67483f651df528c8e86', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user4_l4hb', '用户04', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user5_zeoq', 'user5', '用户05', 'c7d30bb220b64f01ee6fb3664fad02cdcf1cfd2fdb745c4f36ea8460', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user5_zeoq', '用户05', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user6_hr37', 'user6', '用户06', '7b6c4acb8f4c0c06b40f62a2280b22f15d8df7a2725c6716bc8ee95a', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user6_hr37', '用户06', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user7_d7qw', 'user7', '用户07', '1a742b72164845aeea99324e9cc8b72909de9b930060744b4ac2b807', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user7_d7qw', '用户07', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user8_a1is', 'user8', '用户08', '4ac3b83cca681a149304eb4c8e181a5050acfc4088793fd784273fc6', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user8_a1is', '用户08', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `js_sys_user` VALUES ('user9_zugk', 'user9', '用户09', '7ec13042613763354f92680315e590ff6971495072a9a65fb8e1e686', 'user@test.com', '18555555555', '053188888888', null, null, null, null, null, 'employee', 'user9_zugk', '用户09', '0', '0', '2019-10-22 12:08:48', null, null, null, null, null, null, null, null, null, null, null, null, '0', '0', 'system', '2019-10-22 12:08:48', 'system', '2019-10-22 12:08:48', null, '0', 'JeeSite', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for js_sys_user_data_scope
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_data_scope`;
CREATE TABLE `js_sys_user_data_scope` (
  `user_code` varchar(100) NOT NULL COMMENT '控制用户编码',
  `ctrl_type` varchar(20) NOT NULL COMMENT '控制类型',
  `ctrl_data` varchar(64) NOT NULL COMMENT '控制数据',
  `ctrl_permi` varchar(64) NOT NULL COMMENT '控制权限',
  PRIMARY KEY (`user_code`,`ctrl_type`,`ctrl_data`,`ctrl_permi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户数据权限表';

-- ----------------------------
-- Records of js_sys_user_data_scope
-- ----------------------------

-- ----------------------------
-- Table structure for js_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `js_sys_user_role`;
CREATE TABLE `js_sys_user_role` (
  `user_code` varchar(100) NOT NULL COMMENT '用户编码',
  `role_code` varchar(64) NOT NULL COMMENT '角色编码',
  PRIMARY KEY (`user_code`,`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关联表';

-- ----------------------------
-- Records of js_sys_user_role
-- ----------------------------
INSERT INTO `js_sys_user_role` VALUES ('user10_pya1', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user11_vtqr', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user12_2ogj', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user13_gxr4', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user14_mngl', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user15_ot4j', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user16_vpop', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user17_horn', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user18_2em4', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user19_yxor', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user1_28aq', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user20_ewur', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user21_yfxs', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user22_htis', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user23_5z1d', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user2_l99s', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user3_9hll', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user4_l4hb', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user5_zeoq', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user6_hr37', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user7_d7qw', 'dept');
INSERT INTO `js_sys_user_role` VALUES ('user8_a1is', 'user');
INSERT INTO `js_sys_user_role` VALUES ('user9_zugk', 'user');

-- ----------------------------
-- Table structure for test_data
-- ----------------------------
DROP TABLE IF EXISTS `test_data`;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据';

-- ----------------------------
-- Records of test_data
-- ----------------------------

-- ----------------------------
-- Table structure for test_data_child
-- ----------------------------
DROP TABLE IF EXISTS `test_data_child`;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_sort` int(11) DEFAULT NULL COMMENT '排序号',
  `test_data_id` varchar(64) DEFAULT NULL COMMENT '父表主键',
  `test_input` varchar(200) DEFAULT NULL COMMENT '单行文本',
  `test_textarea` varchar(200) DEFAULT NULL COMMENT '多行文本',
  `test_select` varchar(10) DEFAULT NULL COMMENT '下拉框',
  `test_select_multiple` varchar(200) DEFAULT NULL COMMENT '下拉多选',
  `test_radio` varchar(10) DEFAULT NULL COMMENT '单选框',
  `test_checkbox` varchar(200) DEFAULT NULL COMMENT '复选框',
  `test_date` datetime DEFAULT NULL COMMENT '日期选择',
  `test_datetime` datetime DEFAULT NULL COMMENT '日期时间',
  `test_user_code` varchar(64) DEFAULT NULL COMMENT '用户选择',
  `test_office_code` varchar(64) DEFAULT NULL COMMENT '机构选择',
  `test_area_code` varchar(64) DEFAULT NULL COMMENT '区域选择',
  `test_area_name` varchar(100) DEFAULT NULL COMMENT '区域名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试数据子表';

-- ----------------------------
-- Records of test_data_child
-- ----------------------------

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree` (
  `tree_code` varchar(64) NOT NULL COMMENT '节点编码',
  `parent_code` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_codes` varchar(1000) NOT NULL COMMENT '所有父级编号',
  `tree_sort` decimal(10,0) NOT NULL COMMENT '本级排序号（升序）',
  `tree_sorts` varchar(1000) NOT NULL COMMENT '所有级别排序号',
  `tree_leaf` char(1) NOT NULL COMMENT '是否最末级',
  `tree_level` decimal(4,0) NOT NULL COMMENT '层次级别',
  `tree_names` varchar(1000) NOT NULL COMMENT '全节点名',
  `tree_name` varchar(200) NOT NULL COMMENT '节点名称',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态（0正常 1删除 2停用）',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`tree_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试树表';

-- ----------------------------
-- Records of test_tree
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : timemaster

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-12-28 11:19:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for employee_message
-- ----------------------------
DROP TABLE IF EXISTS `employee_message`;
CREATE TABLE `employee_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employeename` varchar(255) NOT NULL,
  `employeesex` varchar(255) NOT NULL,
  `employeeage` varchar(255) NOT NULL,
  `employeeschool` varchar(255) NOT NULL,
  `employeetele` varchar(255) DEFAULT NULL,
  `employeeemail` varchar(255) DEFAULT NULL,
  `employeeintroduction` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employee_message
-- ----------------------------
INSERT INTO `employee_message` VALUES ('1', 'employee', '男', '22', '湖南中医药大学', '13888888888', 'employee@163.com', '吃苦耐劳');
INSERT INTO `employee_message` VALUES ('2', 'demo', '女', '22', '湖南中医药大学', '138', '138@qq.com', 'demo');

-- ----------------------------
-- Table structure for employer_message
-- ----------------------------
DROP TABLE IF EXISTS `employer_message`;
CREATE TABLE `employer_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employersex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employerage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employercompany` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `employertele` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `employeremail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `employerintroduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of employer_message
-- ----------------------------
INSERT INTO `employer_message` VALUES ('1', 'employer', '男', '30', '轩宇医疗', '18888888888', 'employer@163.com', '我是您的伯乐');
INSERT INTO `employer_message` VALUES ('2', 'demo', '女', '30', 'demo', '188', '188@qq.com', 'demo');

-- ----------------------------
-- Table structure for jobdescribe
-- ----------------------------
DROP TABLE IF EXISTS `jobdescribe`;
CREATE TABLE `jobdescribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `describesA` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of jobdescribe
-- ----------------------------
INSERT INTO `jobdescribe` VALUES ('1', '大专', '1');
INSERT INTO `jobdescribe` VALUES ('31', '中专/中技', '6');
INSERT INTO `jobdescribe` VALUES ('2', '完成文件筛选', '1');
INSERT INTO `jobdescribe` VALUES ('3', '完成数据提取工作', '1');
INSERT INTO `jobdescribe` VALUES ('4', '医疗保险', '1');
INSERT INTO `jobdescribe` VALUES ('7', '本科', '2');
INSERT INTO `jobdescribe` VALUES ('5', '五险一金', '1');
INSERT INTO `jobdescribe` VALUES ('6', '年终奖', '1');
INSERT INTO `jobdescribe` VALUES ('8', '测定眼视力程度及眼器官各组织的功能状态', '2');
INSERT INTO `jobdescribe` VALUES ('9', '做好患者的病历档案', '2');
INSERT INTO `jobdescribe` VALUES ('10', '五险一金', '2');
INSERT INTO `jobdescribe` VALUES ('11', '定期体检', '2');
INSERT INTO `jobdescribe` VALUES ('12', '节日福利', '2');
INSERT INTO `jobdescribe` VALUES ('13', '大专', '3');
INSERT INTO `jobdescribe` VALUES ('14', '能出差，上进心强', '3');
INSERT INTO `jobdescribe` VALUES ('15', '管理好客户的能力', '3');
INSERT INTO `jobdescribe` VALUES ('16', '五险一金', '3');
INSERT INTO `jobdescribe` VALUES ('17', '带薪年假', '3');
INSERT INTO `jobdescribe` VALUES ('18', '员工旅游', '3');
INSERT INTO `jobdescribe` VALUES ('19', '大专', '4');
INSERT INTO `jobdescribe` VALUES ('20', '学习医药代表相关知识', '4');
INSERT INTO `jobdescribe` VALUES ('21', '完成规定实习任务', '4');
INSERT INTO `jobdescribe` VALUES ('22', '住房补贴500-2000每月', '4');
INSERT INTO `jobdescribe` VALUES ('23', '通过评估转正', '4');
INSERT INTO `jobdescribe` VALUES ('24', '基本工资+交通通讯补贴+奖金', '4');
INSERT INTO `jobdescribe` VALUES ('25', '大专', '5');
INSERT INTO `jobdescribe` VALUES ('26', '负责日常宠物门诊工作', '5');
INSERT INTO `jobdescribe` VALUES ('27', '持有执业兽医证', '5');
INSERT INTO `jobdescribe` VALUES ('28', '有完善的晋升渠道', '5');
INSERT INTO `jobdescribe` VALUES ('29', '购买五险', '5');
INSERT INTO `jobdescribe` VALUES ('30', '每月提成加餐补', '5');
INSERT INTO `jobdescribe` VALUES ('32', '吃苦耐劳', '6');
INSERT INTO `jobdescribe` VALUES ('33', '有团队合作精神', '6');
INSERT INTO `jobdescribe` VALUES ('34', '加班补助', '6');
INSERT INTO `jobdescribe` VALUES ('35', null, '6');
INSERT INTO `jobdescribe` VALUES ('36', null, '6');
INSERT INTO `jobdescribe` VALUES ('37', '大专', '7');
INSERT INTO `jobdescribe` VALUES ('38', '涉及到临床实验的各个方面', '7');
INSERT INTO `jobdescribe` VALUES ('39', '有较强地沟通协调能力，组织策划能力，抗压力', '7');
INSERT INTO `jobdescribe` VALUES ('40', '五险一金', '7');
INSERT INTO `jobdescribe` VALUES ('41', '年终奖', '7');
INSERT INTO `jobdescribe` VALUES ('42', '交通/通讯补助', '7');
INSERT INTO `jobdescribe` VALUES ('43', '大专', '8');
INSERT INTO `jobdescribe` VALUES ('44', '负责输液和妇科治疗的管理', '8');
INSERT INTO `jobdescribe` VALUES ('45', '要求中级以上职称，能变更注册', '8');
INSERT INTO `jobdescribe` VALUES ('46', '五险一金', '8');
INSERT INTO `jobdescribe` VALUES ('47', '包吃包住', '8');
INSERT INTO `jobdescribe` VALUES ('48', '节日福利', '8');
INSERT INTO `jobdescribe` VALUES ('49', '本科', '9');
INSERT INTO `jobdescribe` VALUES ('50', '根据研究具体的指导方针，进行影像质控，提供专业影像支持', '9');
INSERT INTO `jobdescribe` VALUES ('51', '与客户、医院、CRO及其他项目供应商沟通，含国内外差旅，以确保获取高质量影像数据和成果交付', '9');
INSERT INTO `jobdescribe` VALUES ('52', '五险一金', '9');
INSERT INTO `jobdescribe` VALUES ('53', '年终奖', '9');
INSERT INTO `jobdescribe` VALUES ('54', '定期体检', '9');
INSERT INTO `jobdescribe` VALUES ('55', '大专', '10');
INSERT INTO `jobdescribe` VALUES ('56', '负责调研、选择、提供试验中心和研究者相关信息。根据试验进度及时提供试验相关信息', '10');
INSERT INTO `jobdescribe` VALUES ('57', '组织筹备和参加研究者会议并在会上作相应的会议记录，负责本中心研究者的联络与接待工作', '10');
INSERT INTO `jobdescribe` VALUES ('58', '五险一金', '10');
INSERT INTO `jobdescribe` VALUES ('59', '全勤奖', '10');
INSERT INTO `jobdescribe` VALUES ('60', '带薪年假', '10');
INSERT INTO `jobdescribe` VALUES ('61', '本科', '11');
INSERT INTO `jobdescribe` VALUES ('62', '根据GCP和研究方案要求，协助监查员完成临床试验的监查工作', '11');
INSERT INTO `jobdescribe` VALUES ('63', '协助监查员对研究中心的工作进行管理', '11');
INSERT INTO `jobdescribe` VALUES ('64', '五险一金', '11');
INSERT INTO `jobdescribe` VALUES ('65', '员工旅游', '11');
INSERT INTO `jobdescribe` VALUES ('66', '年终奖', '11');
INSERT INTO `jobdescribe` VALUES ('67', '大专', '12');
INSERT INTO `jobdescribe` VALUES ('68', '根据实验室质量要求进行日常检验工作', '12');
INSERT INTO `jobdescribe` VALUES ('69', '试剂耗材领用、登记、盘点，损耗记录', '12');
INSERT INTO `jobdescribe` VALUES ('70', '五险一金', '12');
INSERT INTO `jobdescribe` VALUES ('71', '餐补', '12');
INSERT INTO `jobdescribe` VALUES ('72', '交通补助', '12');
INSERT INTO `jobdescribe` VALUES ('73', '学历不限', '13');
INSERT INTO `jobdescribe` VALUES ('74', '熟悉门诊药房工作流程，有扎实的药学综合知识水平和业务能力', '13');
INSERT INTO `jobdescribe` VALUES ('75', '熟悉药库工作流程，工作仔细，认真负责', '13');
INSERT INTO `jobdescribe` VALUES ('76', '全勤奖', '13');
INSERT INTO `jobdescribe` VALUES ('77', '员工旅游', '13');
INSERT INTO `jobdescribe` VALUES ('78', '餐补', '13');
INSERT INTO `jobdescribe` VALUES ('79', '大专', '14');
INSERT INTO `jobdescribe` VALUES ('80', '负责本科室医疗仪器的使用保养，要做到专人负责，定期维护。保证仪器的正常运转', '14');
INSERT INTO `jobdescribe` VALUES ('81', '做好口腔器械及药品(包括毒麻药品)的管理，妥善保管，建立账目', '14');
INSERT INTO `jobdescribe` VALUES ('82', '', '14');
INSERT INTO `jobdescribe` VALUES ('83', null, '14');
INSERT INTO `jobdescribe` VALUES ('84', null, '14');
INSERT INTO `jobdescribe` VALUES ('85', '大专', '15');
INSERT INTO `jobdescribe` VALUES ('86', '开发所负责区域或行业的市场渠道和信息', '15');
INSERT INTO `jobdescribe` VALUES ('87', '执行市场策略及计划，帮助区域代理商达成销售及利润目标', '15');
INSERT INTO `jobdescribe` VALUES ('88', '五险一金', '15');
INSERT INTO `jobdescribe` VALUES ('89', '员工旅游', '15');
INSERT INTO `jobdescribe` VALUES ('90', '交通补助', '15');

-- ----------------------------
-- Table structure for positions
-- ----------------------------
DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `Jobtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `worktime` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of positions
-- ----------------------------
INSERT INTO `positions` VALUES ('1', '医学实习生', '阿米巴生物', '4-7k', '实习生', '无要求', '6天/周·2个月', '长沙市芙蓉区马王堆', '临床数据分析');
INSERT INTO `positions` VALUES ('2', '眼科医生', '轩宇医疗', '8-9k', '应届生', '医院临床工作经验', '6天/周·1年以内', '长沙市芙蓉区任命中路', '医生');
INSERT INTO `positions` VALUES ('8', '门诊护士长', '深圳怡康妇产医院', '8-10k', '不限', '护士长相关工作从业1年', '6天/周·1年以内', '深圳罗湖区怡康妇产医院', '护士长');
INSERT INTO `positions` VALUES ('3', '医药代表', '金赛药业', '5-10k', '不限', '2-3年以内医药销售经验', '5天/周·1-3年', '长沙开福区中南大学湘雅医院', '医药代表');
INSERT INTO `positions` VALUES ('4', '医药代表实习生', '金赛药业', '170-200/天', '实习生', '无要求', '4天/周·6个月', '长沙市 芙蓉区 定王大厦', '医药代表');
INSERT INTO `positions` VALUES ('7', 'CDR 临床协调', '联斯达', '120-170元/天', '实习生', '无要求', '3天/周·5个月', '上海交通大学医学院附属瑞金医院', '临床协调');
INSERT INTO `positions` VALUES ('5', '宠物医师', '淘淘动物医院', '5-8k', '不限', '有相关坐诊经验以及持有执业兽医证', '6天/周·1年以内', '昆明官渡区淘淘动物医院', '医生');
INSERT INTO `positions` VALUES ('6', '口腔护士', '洁美口腔', '4-8k', '应届生', '热爱口腔护理工作', '6天/周·1年以内', '北京市东城区', '护士');
INSERT INTO `positions` VALUES ('9', '影像专员', '太美医疗科技', '5-8K·15薪', '应届生', '熟悉医学影像设备使用', '1年以内', '杭州市萧山区', 'B超医生');
INSERT INTO `positions` VALUES ('10', '临床项目经理', '秦鲁药业科技有限公司', '15-30K', '应届生', '有临床医学背景优先', '1年以内', '济南市市中区', '临床项目经理');
INSERT INTO `positions` VALUES ('11', '临床研究助理(CTA)', '翰兰德医药科技发展有限公司', '4-7K', '应届生', '在医院有工作经验者（医疗护理或临床研究）优先', '1年以内', '武汉市武昌区', '临床研究');
INSERT INTO `positions` VALUES ('12', '医学检验技术员', '南京兰卫医学检验所', '4-5K', '应届生', '医学检验专业大专及以上学历（专业必须相符）', '七小时工作制', '南京兰卫医学检验所有限公司', '检验科医师');
INSERT INTO `positions` VALUES ('13', '药剂师·药士', '福州初心堂健康管理有限公司', '5-7K·13薪', '不限', '有1年工作经验以上', '1年以内', '泉州丰泽区', '药剂师');
INSERT INTO `positions` VALUES ('14', '牙科医生', '红旗中医研究院', '6-11K', '应届生', '工作认真负责', '1年以内', '济南市 天桥区', '牙科医生');
INSERT INTO `positions` VALUES ('15', '医疗器械销售经理', '武汉华瑞生物科技', '4-8K', '应届生', '3年或以上市场、医疗器械产品推广工作经验', '1年以内', '长沙市 芙蓉区', '医疗器械');
INSERT INTO `positions` VALUES ('0', '测试', '测试', '测试', '测试', null, '测试', '测试', '测试');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `idcard` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `intentionLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `others` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `otherDescribe` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES ('1', '22211111', '22211111', '22211111', '22211111', '22211111', '22211111', '22211111', '22211111', '22211111', '22211111');
INSERT INTO `resume` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1', '1', null);
INSERT INTO `resume` VALUES ('5', '11', '11', '11', '11', '11', '11', '11', '11', '1', null);

-- ----------------------------
-- Table structure for tuijian
-- ----------------------------
DROP TABLE IF EXISTS `tuijian`;
CREATE TABLE `tuijian` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tuijian
-- ----------------------------
INSERT INTO `tuijian` VALUES ('1', '临床试验', '0');
INSERT INTO `tuijian` VALUES ('2', '医生', '0');
INSERT INTO `tuijian` VALUES ('3', '护士护理', '0');
INSERT INTO `tuijian` VALUES ('4', '医疗器械', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '0');
INSERT INTO `user` VALUES ('2', 'employee', '123456', '1');
INSERT INTO `user` VALUES ('3', 'employer', '123456', '2');

-- ----------------------------
-- Table structure for user_positions
-- ----------------------------
DROP TABLE IF EXISTS `user_positions`;
CREATE TABLE `user_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `positions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_positions
-- ----------------------------
INSERT INTO `user_positions` VALUES ('1', '1', '1');
INSERT INTO `user_positions` VALUES ('2', '1', '2');

-- ----------------------------
-- Table structure for user_resume
-- ----------------------------
DROP TABLE IF EXISTS `user_resume`;
CREATE TABLE `user_resume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `resume_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_resume
-- ----------------------------
INSERT INTO `user_resume` VALUES ('1', '1', '1');

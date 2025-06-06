-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- 在线考试系统数据库结构
-- ------------------------------------------------------
-- 数据库名称: qtdb
-- 服务器版本: 5.6.22-log
-- 说明: 本文件包含在线考试系统所需的所有数据表结构和初始数据

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- 教师管理员表结构 `manager`
-- 用于存储教师/管理员的基本信息
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `teacherid` int(11) NOT NULL,         -- 教师ID，主键
  `name` varchar(45) DEFAULT NULL,      -- 教师姓名
  `password` varchar(45) DEFAULT NULL,  -- 登录密码
  PRIMARY KEY (`teacherid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (12345,'浚','12345');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 客观题答案表结构 `obanswers`
-- 用于存储学生的客观题答案
--

DROP TABLE IF EXISTS `obanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obanswers` (
  `fpaperid` int(11) NOT NULL DEFAULT '0',    -- 试卷ID
  `studentid` varchar(11) NOT NULL DEFAULT '', -- 学生ID
  `answers` varchar(100) DEFAULT NULL,         -- 答案字符串
  PRIMARY KEY (`fpaperid`,`studentid`),
  KEY `ob-uers` (`studentid`),
  KEY `fpaper` (`fpaperid`),
  CONSTRAINT `FK_obanswers_papermark` FOREIGN KEY (`fpaperid`, `studentid`) REFERENCES `papermark` (`fpaperid`, `fuserid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obanswers`
--

LOCK TABLES `obanswers` WRITE;
/*!40000 ALTER TABLE `obanswers` DISABLE KEYS */;
INSERT INTO `obanswers` VALUES (5,'20102100007',NULL),(5,'20102100009',NULL),(5,'20102100011',NULL),(5,'20102100014',NULL),(5,'20112100001','D-,D-,A-,A-,A-,'),(5,'20112100004','A-,D-,D-,A-,D-,'),(8,'12344',NULL),(8,'12346',NULL);
/*!40000 ALTER TABLE `obanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 客观题题库表结构 `obquestions`
-- 用于存储客观题题目信息
--

DROP TABLE IF EXISTS `obquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obquestions` (
  `obid` int(11) NOT NULL AUTO_INCREMENT,  -- 题目ID，自增
  `title` mediumtext,                      -- 题目内容
  `answer` varchar(4) DEFAULT NULL,        -- 正确答案
  `type` int(11) DEFAULT NULL,            -- 题目类型（对应科目）
  `diffculty` int(11) DEFAULT NULL,       -- 难度等级
  `average` int(5) DEFAULT NULL,          -- 平均得分
  PRIMARY KEY (`obid`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obquestions`
--

LOCK TABLES `obquestions` WRITE;
/*!40000 ALTER TABLE `obquestions` DISABLE KEYS */;
INSERT INTO `obquestions` VALUES (114,'“对内整顿朝政，对外'尊王攘夷'。终于成就了春秋之首的伟业。"材料中这位历史人物是（  ）@a齐桓公@b晋文公@c宋襄公@d楚庄王','A-',2,NULL,NULL),(115,'比较评价历史人物，是历史学科能力要求之一。华盛顿、拿破仑作为资产阶级政治家，其历史作用的相同之处是（  ） @a赢得了民族独立@b维护了国家统一 @c打击了封建势力@d推动了资产阶级民主政治进程 ','D-',2,NULL,NULL),(116,'英国资产阶级革命、美国独立战争、法国大革命的共同点是（  ）@a确立了三权分立的原则@b确立了资产阶级的君主立宪制@c建立了资产阶级共和国@d改变了原来社会的性质','D-',2,NULL,NULL),(117,'有人说他是疯子，也有人说他是英雄，但谁也无法否认他对欧洲所产生的巨大影响，他因战争起家，也因战争而倒台，更因一部法典而名扬欧洲。这位名震一时的枭雄是（  ）@a拿破仑       @b 查理一世@c华盛顿@d亚历山大','A-',2,NULL,NULL),(118,'1931年，一位科学家病重将要离世的消息牵动着世界人民的心，几十名记者为他守夜，每隔一个小时就对外发布一次消息："灯"还亮着。这位科学家是（  ）@a瓦特@b法拉第  @c爱迪生@d爱因斯坦','C-',2,NULL,NULL),(119,'莎士比亚在作品中赞叹道："人是一件多么了不起的杰作！在理性上多么高贵！在才能上多么无限！"如果列夫·托尔斯泰这位杰出人物的成就来证明的话，下列哪一选项符合@a出版了《物种起源》@b撰写了《战争与和平》@c创作了《向日葵》@d谱写了《英雄交响曲》','A-',2,NULL,NULL),(120,'美苏争霸的两极解体的标志是（   ） @a东欧剧变、苏联解体@b"一 超多强"局面的暂时形成@c世界政治格局多极化趋势的发展@d第三世界国家的奋起','A-',2,NULL,NULL),(121,'2011年8月12日，第（）  届世界大学生夏季运动会在中国  （）开幕。本届大运会的口号为"从这里开始"，中国代表队最终夺75金创造新纪录。@a23   香港 @b24  合肥@c25  广州 @d26  深圳','D-',3,NULL,NULL),(122,'2011年11月3日和11月14日，     和     成功实现了两次交会对接，而掌握空间交会对接技术是我国载人航天又一次历史性的突破和重大的技术跨越。   @a天宫一号   神州六号 @b嫦娥一号   神州六号  @c天宫一号  神州八号 @d嫦娥二号  神州八号','C-',3,NULL,NULL),(123,'雷锋曾说"不经风雨，长不成大树；不受百炼，难以成钢。"启示我们要     （    ）@a自尊自信  @b自立自强@c互助互爱@d无私奉献','B-',3,NULL,NULL),(124,'美国商界有句名言："如果你不能战胜对手，就加入到他们中间去。"现代竞争，不再是"你死我活"，而是更高层次的竞争与合作，现代企业追求的不再是"单赢"而是"双赢"和"多赢"。 说明 @a当今世界只有合作，不存在竞争@b互相竞争才能成就伟大事业@c合作是新形势下实现共同发展的必由之路   @d合作比竞争更重要','C-',3,NULL,NULL),(125,'甘肃庆阳校车事故发生后，安徽省省长王三运就做好学校交通安全工作作出重要指示。要求公安、教育等部门立即开展全省中小学幼儿园交通安全专项检查，查找薄弱环节，提出整改要求，建立长效机制，切实较强学校及周边道路交通安全管理，全面做好中小学校和幼儿园交通安全各项工作。这体现对未成年人的哪方面保护         @a社会保护  @b学校保护   @c司法保护@d家庭保护','A-',3,NULL,NULL),(157,'在每个C++程序中都必须包含有这样一个函数，该函数的函数名为 （）@amain@bMAIN@cMain@d任意标识符','A-',4,NULL,NULL),(158,'关于C++与C语言的关系的描述中，（）是错误的。@aC语言是C++的一个子集;@bC语言与C++是兼容的;@cC++对C语言进行了一些改进;@dC++和C语言都是面向对象的','D-',4,NULL,NULL),(159,'存储以下数据，占用存储字节最多的是（）@a0@b'0'@c"0"@d0.0','D-',4,NULL,NULL),(160,'以下说法中正确的是（）@aC++程序总是从第一个定义的函数开始执行@bC++程序总是从main函数开始执行 @cC++函数必须有返回值，否则不能使用函数@dC++程序中有调用关系的所有函数必须放在同一个程序文件中','B-',4,NULL,NULL),(161,'下面有关构造函数的描述中，正确的是（）@a构造函数可以带有返回值@b构造函数的名字与类名完全相同 @c构造函数必须带有参数@d构造函数必须定义，不能缺省','B-',4,NULL,NULL),(162,'在声明类时，下面的说法正确的是（）@a可以在类的声明中给数据成员赋初值 @b数据成员的数据类型可以是register @cprivate，public，protected可以按任意顺序出现@d没有用private，public，protected定义的数据成员是公有成员','C-',4,NULL,NULL),(163,'构造函数是在（）时被执行的。@a程序编译@b创建对象@c创建类@d程序装入内存 ','B-',4,NULL,NULL),(164,'下面有关静态成员函数的描述中，正确的是（）@a在静态成员函数中可以使用this指针 @b在建立对象前，就可以为静态数据成员赋值@c静态成员函数在类外定义是，要用static前缀@d静态成员函数只能在类外定义','B-',4,NULL,NULL),(165,'下面有关友员函数的描述中，真确的说法是（）@a友员函数是独立于当前类的外部函数@b一个友员函数不可以同时定义为两个类的友员函数@c友员函数必须在类的外部进行定义 @d在类的外部定义友员函数时必须加上friend关键字','A-',4,NULL,NULL),(166,'友员的作用之一是（）@a提高程序的运行效率@b加强类的封装 @c实现数据的隐蔽性@d增加成员函数的种类','A-',4,NULL,NULL),(167,'假定一条定义语句为"int a[10]， x， *p=a;"，若要把数组a中下标为3的元素值赋给x，则不正确的语句为（）@ax=p[3];@bx=*(a+3); @cx=a[3]; @dx=*p+3; ','D-',4,NULL,NULL),(168,'假定变量m定义为"int m=7;"，则定义变量p的正确语句（）@aint p=&m;@bint *p=&m;@cint &p=*m;@dint *p=m;','B-',4,NULL,NULL),(169,'假定AB为一个类，则()为该类的拷贝构造函数的原型说明。@aAB(AB x);@bAB(int x);@cAB(AB& x);@dvoid AB(AB& x);','C-',4,NULL,NULL),(170,'有以下程序 \n#include <iostream.h> \nvoid main( ) \n { char *p[10]={"abc"，"aabdfg"，"dcdbe"，"abbd"，"cd"}; cout<<p[3]<<endl; }  \n执行后输出结果是  () @adcdbe @babbd @cabc @dabb ','B-',4,NULL,NULL);
/*!40000 ALTER TABLE `obquestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 试卷表结构 `paper`
-- 用于存储试卷基本信息
--

DROP TABLE IF EXISTS `paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paper` (
  `paperid` int(11) NOT NULL AUTO_INCREMENT,  -- 试卷ID，自增
  `obquids` varchar(100) DEFAULT NULL,        -- 客观题ID列表
  `subquids` varchar(100) DEFAULT NULL,       -- 主观题ID列表
  `totalmark` int(11) DEFAULT NULL,           -- 总分
  `percent` int(11) DEFAULT NULL,             -- 及格线
  `description` varchar(100) DEFAULT NULL,     -- 试卷描述
  `time` int(11) DEFAULT NULL,                -- 考试时长（分钟）
  `subject` int(11) DEFAULT NULL,             -- 科目
  `obmarks` varchar(100) DEFAULT NULL,        -- 客观题分数分配
  `submarks` varchar(100) DEFAULT NULL,       -- 主观题分数分配
  PRIMARY KEY (`paperid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paper`
--

LOCK TABLES `paper` WRITE;
/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` VALUES (5,'115,116,117,119,120,','23,24,25,26,27,',100,30,'alan',600,2,'5,6,7,8,4,','12,13,14,15,16,'),(6,'114,115,116,117,118,','23,24,',100,50,'a1',600,2,'10,10,10,10,10,','25,25,'),(7,'121,122,123,124,','29,30,31,33,',100,40,'alan',600,3,'10,10,10,10,','15,15,15,15,'),(8,'114,115,116,','23,',50,30,'aaa',600,2,'10,10,10,','20,');
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 成绩表结构 `papermark`
-- 用于存储学生考试成绩信息
--

DROP TABLE IF EXISTS `papermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `papermark` (
  `obqumark` varchar(100) DEFAULT NULL,      -- 客观题得分
  `subqumark` varchar(100) DEFAULT NULL,     -- 主观题得分
  `totalmark` int(11) DEFAULT NULL,          -- 总分
  `fpaperid` int(11) NOT NULL,               -- 试卷ID
  `fuserid` varchar(11) NOT NULL,            -- 学生ID
  `done` varchar(10) DEFAULT NULL,           -- 完成状态
  `finish` varchar(10) DEFAULT NULL,         -- 批改状态
  `date` varchar(50) DEFAULT NULL,           -- 考试日期
  PRIMARY KEY (`fpaperid`,`fuserid`),
  KEY `user` (`fuserid`),
  KEY `fpaperid` (`fpaperid`),
  CONSTRAINT `FK_papermark_paper` FOREIGN KEY (`fpaperid`) REFERENCES `paper` (`paperid`),
  CONSTRAINT `FK_papermark_user` FOREIGN KEY (`fuserid`) REFERENCES `student` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papermark`
--

LOCK TABLES `papermark` WRITE;
/*!40000 ALTER TABLE `papermark` DISABLE KEYS */;
INSERT INTO `papermark` VALUES (NULL,NULL,0,5,'20102100007','未完成',NULL,NULL),(NULL,NULL,0,5,'20102100009','未完成',NULL,NULL),(NULL,NULL,0,5,'20102100011','未完成',NULL,NULL),(NULL,NULL,0,5,'20102100014','未完成',NULL,NULL),('5,6,7,8,4,','12,13,14,15,0,',84,5,'20112100001','已完成','已批改','周一 三月 9 2015'),('6,6,6,6,0,','7,7,7,7,7,',59,5,'20112100004','已完成','已批改','周二 二月 3 2015'),(NULL,NULL,0,8,'12344','未完成',NULL,NULL),(NULL,NULL,0,8,'12346','未完成',NULL,NULL);
/*!40000 ALTER TABLE `papermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 科目类型表结构 `serveridtype`
-- 用于存储考试科目信息
--

DROP TABLE IF EXISTS `serveridtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serveridtype` (
  `id` int(11) NOT NULL,                -- 科目ID
  `type` varchar(45) NOT NULL,          -- 科目名称
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveridtype`
--

LOCK TABLES `serveridtype` WRITE;
/*!40000 ALTER TABLE `serveridtype` DISABLE KEYS */;
INSERT INTO `serveridtype` VALUES (1,'管理员'),(2,'历史'),(3,'政治'),(4,'C++');
/*!40000 ALTER TABLE `serveridtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serveruser`
--

DROP TABLE IF EXISTS `serveruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serveruser` (
  `userid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serveruser`
--

LOCK TABLES `serveruser` WRITE;
/*!40000 ALTER TABLE `serveruser` DISABLE KEYS */;
INSERT INTO `serveruser` VALUES (111,'alan','111',1),(123,'lan','123',4),(222,'alan','111',3);
/*!40000 ALTER TABLE `serveruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 学生用户表结构 `student`
-- 用于存储学生基本信息
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `userid` varchar(11) NOT NULL,         -- 学生ID（学号）
  `name` varchar(45) NOT NULL,           -- 学生姓名
  `password` varchar(45) NOT NULL,       -- 登录密码
  `class` varchar(45) DEFAULT NULL,      -- 班级
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('12344','123',2,2,'1234'),('12346','123',2,3,'1234'),('20102100001','小鸣',1,1,'123'),('20102100002','张晓',1,1,'123'),('20102100003','王明',1,1,'123'),('20102100004','李刚',1,1,'123'),('20102100007','小鸣',1,1,'123'),('20102100009','张晓',1,1,'123'),('20102100011','王明',1,1,'123'),('20102100014','李刚',1,1,'123'),('20112100001','lan',1,1,'123'),('20112100004','alan',1,1,'123'),('20112100011','lan',1,1,'123'),('20112100014','alan',1,1,'123'),('431','lan',1,2,'123'),('987','alan',1,1,'123');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 主观题答案表结构 `subanswers`
-- 用于存储学生的主观题答案
--

DROP TABLE IF EXISTS `subanswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subanswers` (
  `fpaperid` int(11) NOT NULL DEFAULT '0',    -- 试卷ID
  `studentid` varchar(11) NOT NULL DEFAULT '', -- 学生ID
  `answers` mediumtext,                        -- 答案内容
  PRIMARY KEY (`fpaperid`,`studentid`),
  KEY `sub-users` (`studentid`),
  KEY `sub-paper` (`fpaperid`),
  CONSTRAINT `FK_subanswers_papermark` FOREIGN KEY (`fpaperid`, `studentid`) REFERENCES `papermark` (`fpaperid`, `fuserid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subanswers`
--

LOCK TABLES `subanswers` WRITE;
/*!40000 ALTER TABLE `subanswers` DISABLE KEYS */;
INSERT INTO `subanswers` VALUES (5,'20102100007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'20102100009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'20102100011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'20102100014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'20112100001','asdfsadfasdf','asdfas','asdfas','asdfas','asdfasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'20112100004','12\n','12','12','12','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'12344',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'12346',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subanswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 主观题题库表结构 `subquestions`
-- 用于存储主观题题目信息
--

DROP TABLE IF EXISTS `subquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subquestions` (
  `subid` int(11) NOT NULL AUTO_INCREMENT,  -- 题目ID，自增
  `title` mediumtext,                       -- 题目内容
  `answer` mediumtext,                      -- 参考答案
  `type` int(11) DEFAULT NULL,             -- 题目类型（对应科目）
  `diffculty` int(11) DEFAULT NULL,        -- 难度等级
  `average` int(5) DEFAULT NULL,           -- 平均得分
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subquestions`
--

LOCK TABLES `subquestions` WRITE;
/*!40000 ALTER TABLE `subquestions` DISABLE KEYS */;
INSERT INTO `subquestions` VALUES (23,'日本在近代史上发动了哪两次侵华战争？请你举出日本侵略者屠杀中国人民所制造的个惨案。',2),(24,'在经济领域开启中国近代化的事件是什么？',2),(25,'中国近代民族工业发展的黄金时期是在哪一时期？请列举出得以发展的内因和外因。',2),(26,'20世纪50年代末，在中国探索建设社会主义道路中，出现了违背客观经济规律、超越社会发展阶段的哪两大运动？该错误得到彻底纠正是在哪次会议上？20世纪80年代我国农村改革的主要内容是什么？',2),(27,'1929年资本主义世界爆发了经济大危机，美国是如何应对的？面对当前金融危机的影响，当年美国的做法中最值得我们借鉴的地方是？',2),(28,'当今世界经济格局发展呈何趋势？请举出中国积极顺应该趋势的最重大活动。',2),(29,'如何把握生产力与生产关系的矛盾运动和演变规律？',3),(30,'为什么说私人劳动与社会劳动的矛盾是简单商品生产的基本矛盾？',3),(31,'为什么说商品是使用价值和价值的矛盾统一体？',3),(33,'马克思主义政治经济学的研究对象有什么特点？',3);
/*!40000 ALTER TABLE `subquestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

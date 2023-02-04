/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `blog`;

/*Table structure for table `wll_admin` */

DROP TABLE IF EXISTS `wll_admin`;

CREATE TABLE `wll_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_admin` */

insert  into `wll_admin`(`id`,`username`,`password`) values (1,'admin','$2a$10$rQGHAn/LlB2xW7m/dLNy9ekT7CguiCjdRKQeEPwYuvo3n9hIAq90m'),(2,'person','$2a$10$rQGHAn/LlB2xW7m/dLNy9ekT7CguiCjdRKQeEPwYuvo3n9hIAq90m');

/*Table structure for table `wll_admin_permission` */

DROP TABLE IF EXISTS `wll_admin_permission`;

CREATE TABLE `wll_admin_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL,
  `permission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_admin_permission` */

insert  into `wll_admin_permission`(`id`,`admin_id`,`permission_id`) values (1,1,1),(2,2,9),(3,2,1);

/*Table structure for table `wll_article` */

DROP TABLE IF EXISTS `wll_article`;

CREATE TABLE `wll_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_counts` int(11) DEFAULT NULL COMMENT '评论数量',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `summary` varchar(255) DEFAULT NULL COMMENT '简介',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `view_counts` int(11) DEFAULT NULL COMMENT '浏览数量',
  `weight` int(11) NOT NULL COMMENT '是否置顶',
  `author_id` bigint(20) DEFAULT NULL COMMENT '作者id',
  `body_id` bigint(20) DEFAULT NULL COMMENT '内容id',
  `category_id` int(11) DEFAULT NULL COMMENT '类别id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1613145944537288707 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_article` */

insert  into `wll_article`(`id`,`comment_counts`,`create_date`,`summary`,`title`,`view_counts`,`weight`,`author_id`,`body_id`,`category_id`) values (1,3,1571797394812,'通过Spring Boot实现的服务，只需要依靠一个Java类，把它打包成jar，并通过`java -jar`命令就可以运行起来。\r\n\r\n这一切相较于传统Spring应用来说，已经变得非常的轻便、简单。','springboot介绍以及入门案例',170,1,1,1,2),(9,0,1471797394812,'Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。','Vue.js 到底是什么',18,0,1,20,2),(10,2,1661791394812,'本节将介绍如何在项目中使用 Element。','Element相关',28,0,1,21,2),(1606260810798080002,0,1671797394812,'文章1','文章1',24,0,1,1606260810819051524,3),(1606948353877241857,0,1671961317867,'图片上传七牛云测试','七牛云文件上传存储',22,0,1,1606948353877241860,5),(1612752433396703233,1,1673345118265,'一个个人博客项目10','一个个人博客项目',86,0,1,1617338258016993281,3),(1613145944537288706,0,1673438938644,'王五的第一篇文章','曾的第一篇文章',12,0,1404446129264832513,1613159110457544706,3);

/*Table structure for table `wll_article_body` */

DROP TABLE IF EXISTS `wll_article_body`;

CREATE TABLE `wll_article_body` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `content_html` longtext,
  `article_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1617338258016993282 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_article_body` */

insert  into `wll_article_body`(`id`,`content`,`content_html`,`article_id`) values (1,'# 1. Spring Boot介绍\r\n\r\n## 1.1 简介\r\n\r\n在您第1次接触和学习Spring框架的时候，是否因为其繁杂的配置而退却了？\r\n\r\n在你第n次使用Spring框架的时候，是否觉得一堆反复黏贴的配置有一些厌烦？\r\n\r\n那么您就不妨来试试使用Spring Boot来让你更易上手，更简单快捷地构建Spring应用！\r\n\r\nSpring Boot让我们的Spring应用变的更轻量化。\r\n\r\n我们不必像以前那样繁琐的构建项目、打包应用、部署到Tomcat等应用服务器中来运行我们的业务服务。\r\n\r\n通过Spring Boot实现的服务，只需要依靠一个Java类，把它打包成jar，并通过`java -jar`命令就可以运行起来。\r\n\r\n这一切相较于传统Spring应用来说，已经变得非常的轻便、简单。\r\n\r\n**总结一下Spring Boot的主要优点：**\r\n\r\n1. 为所有Spring开发者更快的入门\r\n2. 开箱即用，提供各种默认配置来简化项目配置\r\n3. 内嵌式容器简化Web项目\r\n4. 没有冗余代码生成和XML配置的要求\r\n5. 统一的依赖管理\r\n6. 自动装配，更易使用，更易扩展\r\n\r\n## 1.2 使用版本说明\r\n\r\nSpringboot版本：使用最新的2.5.0版本\r\n\r\n教程参考了官方文档进行制作，权威。\r\n\r\n其他依赖版本：\r\n\r\n	1. Maven  需求：3.5+\r\n\r\n   	2. JDK 需求  8+\r\n   	3. Spring Framework 5.3.7以上版本\r\n   	4. Tomcat 9.0\r\n   	5. Servlet版本 4.0  但是可以部署到Servlet到3.1+的容器中\r\n\r\n# 2. 快速入门\r\n\r\n快速的创建一个Spring Boot应用，并且实现一个简单的Http请求处理。通过这个例子对Spring Boot有一个初步的了解，并体验其结构简单、开发快速的特性。\r\n\r\n教程使用的Idea版本：2019.3\r\n\r\n## 2.1 创建基础项目\r\n\r\n**第一步：** 创建maven项目\r\n\r\npom.xml :\r\n\r\n~~~xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<project xmlns=\"http://maven.apache.org/POM/4.0.0\"\r\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n         xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd\">\r\n    <modelVersion>4.0.0</modelVersion>\r\n\r\n    <groupId>com.xiaopizhu</groupId>\r\n    <artifactId>helloSpringBoot</artifactId>\r\n    <version>1.0-SNAPSHOT</version>\r\n	<!--springboot的父工程其中定义了常用的依赖，并且无依赖冲突-->\r\n    <parent>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-parent</artifactId>\r\n        <version>2.5.0</version>\r\n    </parent>\r\n</project>\r\n~~~\r\n\r\n注意上方的parent必须加，其中定义了springboot官方支持的n多依赖，基本上常用的已经有了，所以接下来导入依赖的时候，绝大部分都可以不加版本号。\r\n\r\n此时的工程结构为：\r\n\r\n![image-20210523173241557](img/image-20210523173241557.png)\r\n\r\n**第二步：** 添加web依赖\r\n\r\n~~~xml\r\n<dependencies>\r\n    <dependency>\r\n        <groupId>org.springframework.boot</groupId>\r\n        <artifactId>spring-boot-starter-web</artifactId>\r\n    </dependency>\r\n</dependencies>\r\n~~~\r\n\r\n添加上方的web依赖，其中间接依赖了spring-web，spring-webmvc，spring-core等spring和springmvc的包，并且集成了tomcat。\r\n\r\n**第三步：** 编写启动类\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot;\r\n\r\nimport org.springframework.boot.SpringApplication;\r\nimport org.springframework.boot.autoconfigure.SpringBootApplication;\r\n\r\n@SpringBootApplication\r\npublic class HelloApp {\r\n\r\n    public static void main(String[] args) {\r\n        SpringApplication.run(HelloApp.class,args);\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n@SpringBootApplication注解标识了HelloApp为启动类，也是Spring Boot的核心。\r\n\r\n**第四步：** 运行启动类的main方法\r\n\r\n![image-20210523173712142](img/image-20210523173712142.png)\r\n\r\n看到如上配置，证明启动成功，tomcat端口号默认为8080。\r\n\r\n**第五步：**  如果想要修改端口号，可以在resources目录下新建application.properties\r\n\r\n~~~properties\r\nserver.port=8082\r\n~~~\r\n\r\n**第六步：** 重新运行\r\n\r\n![image-20210523174011613](img/image-20210523174011613.png)\r\n\r\n此时的项目结构为：\r\n\r\n![image-20210523174032053](img/image-20210523174032053.png)\r\n\r\n**src/main/java :**  编写java代码，注意启动类需要放在项目的根包下。\r\n\r\n**src/main/resources:**  放置资源的目录，比如springboot的配置文件，静态文件，mybatis配置，日志配置等。\r\n\r\n**src/test/java:**  测试代码\r\n\r\n## 2.2 编写一个Http接口\r\n\r\n**第一步：**创建`HelloController`类，内容如下：\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.springframework.web.bind.annotation.GetMapping;\r\nimport org.springframework.web.bind.annotation.RequestMapping;\r\nimport org.springframework.web.bind.annotation.RestController;\r\n\r\n@RestController\r\n@RequestMapping(\"hello\")\r\npublic class HelloController {\r\n\r\n    @GetMapping(\"boot\")\r\n    public String hello(){\r\n        return \"hello spring boot\";\r\n    }\r\n\r\n}\r\n\r\n~~~\r\n\r\n**注意包名，必须在启动类所在的包名下。**\r\n\r\n**第二步：**重启程序，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.3 编写单元测试用例\r\n\r\n**第一步：**添加spring boot测试依赖\r\n\r\n~~~xml\r\n		<dependency>\r\n            <groupId>org.springframework.boot</groupId>\r\n            <artifactId>spring-boot-starter-test</artifactId>\r\n            <scope>test</scope>\r\n        </dependency>\r\n~~~\r\n\r\n**第二步：**在src/test 下，编写测试用例\r\n\r\n~~~java\r\npackage com.xiaopizhu.springboot.controller;\r\n\r\nimport org.junit.jupiter.api.BeforeAll;\r\nimport org.junit.jupiter.api.BeforeEach;\r\nimport org.junit.jupiter.api.Test;\r\nimport org.springframework.boot.test.context.SpringBootTest;\r\nimport org.springframework.http.MediaType;\r\nimport org.springframework.test.web.servlet.MockMvc;\r\nimport org.springframework.test.web.servlet.request.MockMvcRequestBuilders;\r\nimport org.springframework.test.web.servlet.setup.MockMvcBuilders;\r\n\r\nimport static org.hamcrest.Matchers.equalTo;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;\r\nimport static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;\r\n\r\n@SpringBootTest\r\npublic class TestHelloController {\r\n\r\n    private MockMvc mockMvc;\r\n\r\n    @BeforeEach\r\n    public void beforeEach(){\r\n        mockMvc = MockMvcBuilders.standaloneSetup(new HelloController()).build();\r\n    }\r\n    @Test\r\n    public void testHello() throws Exception {\r\n        mockMvc.perform(MockMvcRequestBuilders.get(\"/hello/boot\")\r\n                .accept(MediaType.APPLICATION_JSON))\r\n                .andExpect(status().isOk())\r\n                .andExpect(content().string(equalTo(\"hello spring boot\")));\r\n    }\r\n}\r\n\r\n~~~\r\n\r\n上面的测试用例，是构建一个空的`WebApplicationContext`，并且在before中加载了HelloController，得以在测试用例中mock调用，模拟请求。\r\n\r\n## 2.4 打包为jar运行\r\n\r\n**第一步：**添加打包(maven构建springboot)插件\r\n\r\n~~~xml\r\n  <build>\r\n        <plugins>\r\n            <plugin>\r\n                <groupId>org.springframework.boot</groupId>\r\n                <artifactId>spring-boot-maven-plugin</artifactId>\r\n            </plugin>\r\n        </plugins>\r\n    </build>\r\n~~~\r\n\r\n在idea的右侧 maven中，使用package来打包程序，打包完成后，在target目录下生成helloSpringBoot-1.0-SNAPSHOT.jar\r\n\r\n![image-20210523181737720](img/image-20210523181737720.png)\r\n\r\n**第二步：**打开cmd：找到jar对应的目录\r\n\r\n输入命令\r\n\r\n~~~shell\r\njava -jar helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n![image-20210523182426404](img/image-20210523182426404.png)\r\n\r\n**第三步：**测试，使用postman或者直接在浏览器输入http://localhost:8082/hello/boot\r\n\r\n得到结果：hello spring boot\r\n\r\n## 2.5 查看jar包内容\r\n\r\n~~~shell\r\njar tvf helloSpringBoot-1.0-SNAPSHOT.jar\r\n~~~\r\n\r\n# 3. 小结\r\n\r\n1. 通过Maven构建了一个空白Spring Boot项目，再通过引入web模块实现了一个简单的请求处理。\r\n2. 通过修改配置文件，更改端口号\r\n3. 编写了测试用例\r\n4. 打包jar包运行\r\n\r\n','<h2>2018-01-04</h2>\n<pre><code class=\"lang-\"># 使用vue的Webpack模板生成脚手架\n</code></pre>\n<h2>2018-01-05</h2>\n<pre><code class=\"lang-\"># 引入ElementUI\n\n# babel-plugin-component自定义主题\n# 首页\n# 登陆页\n# 注册页面\n# 日志页\n</code></pre>\n<h2>2018-01-07</h2>\n<pre><code class=\"lang-\"># 调整底部栏始终固定在底部\n# 日志页 添加时间轴\n# 首页的文章列表\n</code></pre>\n<h2>2018-01-08</h2>\n<pre><code class=\"lang-\"># 使用组件-博客作者tab页 \n# 添加第三方图标\n</code></pre>\n<h2>2018-01-09</h2>\n<pre><code class=\"lang-\"># 调整顶部导航栏：激活文字颜色，click点击\n# 组件-最新文章tab页\n\n# 最新文章、最热文章使用相同组件\n# 底部栏设计\n# 页面与两边边距改为100\n</code></pre>\n<h2>2018-01-10</h2>\n<pre><code class=\"lang-\"># 写博客 引入mavonEditor编辑器\n# 顶部导航栏都放入一个Menu中\n# 写文章页面\n#　mavonEditor局部引入\n\n#　页面的中间区域固定宽度，自动居中\n# 发布和取消\n# 发布dialog\n\n</code></pre>\n<h2>2018-01-11</h2>\n<pre><code class=\"lang-\"># 文章组件用守卫来改变body背景色\n# 调整登陆和注册页面，使其居中\n\n#子页面调整根元素为div\n#文章详情页\n\n</code></pre>\n<h2>2018-01-12</h2>\n<pre><code class=\"lang-\"># 文章详情页  内容  评论等\n\n</code></pre>\n<h2>2018-01-13</h2>\n<pre><code class=\"lang-\">## 重新调整页面结构	\n#顶部和底部 抽成  BaseHeader BaseFooter 组件\n#BlogView为单独页，以前是Home的子路由\n\n</code></pre>\n<h2>2018-01-15</h2>\n<pre><code class=\"lang-\"># 文章分类去掉子级\n# 将首页的文章列表抽成 ArticleItem组件\n# 增加文章的评论展示\n# 增加文章分类、标签页\n\n</code></pre>\n<h2>2018-01-15  2</h2>\n<pre><code class=\"lang-\"># 回到顶部去掉过渡动画（影响顶部导航栏）\n# 顶部导航栏 增加登录后菜单\n# 首页增加 最热标签\n# 增加 文章分类 标签的详情页\n# 将文章详情页、 文章分类标签页 改为Home的子路由（以前单独页）\n# Home组件增加路由判断：更正导航栏的状态、条件显示底部栏\n\n</code></pre>\n<h2>2018-01-16</h2>\n<pre><code class=\"lang-\"># 将写文章的顶部Header合并到BaseHeader中\n# 图片都放到了static目录下\n\n</code></pre>\n<h2>2018-01-24</h2>\n<pre><code class=\"lang-\"># 将自定义的theme放到assets下\n# 加入axios\n# 加入vuex\n# 实现登录\n# 实现退出\n\n</code></pre>\n<h2>2018-01-25</h2>\n<pre><code class=\"lang-\"># 实现注册逻辑\n# 写文章功能实现\n# 写文章时支持插入图片\n\n</code></pre>\n<h2>2018-01-26</h2>\n<pre><code class=\"lang-\"># 引入lodash工具类\n# 优化写文章的工具栏：滚动时固定顶部\n# 写文章 后台获取文章分类和标签\n\n# 首页的文章列表\n\n</code></pre>\n<h2>2018-01-27</h2>\n<pre><code class=\"lang-\"># 修改首页文章列表的样式\n# 首页加载文章功能\n# 文章查看功能\n# 文章分类和标签功能列表\n\n</code></pre>\n<h2>2018-01-28</h2>\n<pre><code class=\"lang-\"># 文章分类和标签详情\n\n</code></pre>\n<h2>2018-01-29</h2>\n<pre><code class=\"lang-\"># 文章分类和标签的文章数\n# 首页最热文章\n# 首页最新文章\n# 首页最热标签\n\n</code></pre>\n<h2>2018-01-30</h2>\n<pre><code class=\"lang-\"># BaseHeader放回views中\n# 修改Axios后置拦截，全局处理错误\n# 将登录 退出 和头像 放到一起\n\n</code></pre>\n',1),(20,'Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。\n\n如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。\n\n# 起步\n\n> 官方指南假设你已了解关于 HTML、CSS 和 JavaScript 的中级知识。如果你刚开始学习前端开发，将框架作为你的第一步可能不是最好的主意——掌握好基础知识再来吧！之前有其它框架的使用经验会有帮助，但这不是必需的。\n\n尝试 Vue.js 最简单的方法是使用 JSFiddle 上的 Hello World 例子。你可以在浏览器新标签页中打开它，跟着例子学习一些基础用法。或者你也可以创建一个 .html 文件，然后通过如下方式引入 Vue：\n\n```javascript\n<script src=\"https://cdn.jsdelivr.net/npm/vue\"></script>\n\n```\n安装教程给出了更多安装 Vue 的方式。请注意我们不推荐新手直接使用 vue-cli，尤其是在你还不熟悉基于 Node.js 的构建工具时。\n\n# 声明式渲染\nVue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统：\n```javascript\n<div id=\"app\">\n  {{ message }}\n</div>\n\n```\n```javascript\nvar app = new Vue({\n  el: \'#app\',\n  data: {\n    message: \'Hello Vue!\'\n  }\n})\n\n```\n我们已经成功创建了第一个 Vue 应用！看起来这跟渲染一个字符串模板非常类似，但是 Vue 在背后做了大量工作。现在数据和 DOM 已经被建立了关联，所有东西都是响应式的。我们要怎么确认呢？打开你的浏览器的 JavaScript 控制台 (就在这个页面打开)，并修改 app.message 的值，你将看到上例相应地更新。\n\n除了文本插值，我们还可以像这样来绑定元素特性：\n\n\n\n\n\n\n','<p>Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。Vue 的核心库只关注视图层，不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与现代化的工具链以及各种支持类库结合使用时，Vue 也完全能够为复杂的单页应用提供驱动。</p>\n<p>如果你想在深入学习 Vue 之前对它有更多了解，我们制作了一个视频，带您了解其核心概念和一个示例工程。<br />\n如果你已经是有经验的前端开发者，想知道 Vue 与其它库/框架有哪些区别，请查看对比其它框架。</p>\n<h1>起步</h1>\n<blockquote>\n<p>官方指南假设你已了解关于 HTML、CSS 和 JavaScript 的中级知识。如果你刚开始学习前端开发，将框架作为你的第一步可能不是最好的主意——掌握好基础知识再来吧！之前有其它框架的使用经验会有帮助，但这不是必需的。</p>\n</blockquote>\n<p>尝试 Vue.js 最简单的方法是使用 JSFiddle 上的 Hello World 例子。你可以在浏览器新标签页中打开它，跟着例子学习一些基础用法。或者你也可以创建一个 .html 文件，然后通过如下方式引入 Vue：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;script src=<span class=\"hljs-string\">\"https://cdn.jsdelivr.net/npm/vue\"</span>&gt;<span class=\"xml\"><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">script</span>&gt;</span></span>\n\n</code></div></pre>\n<p>安装教程给出了更多安装 Vue 的方式。请注意我们不推荐新手直接使用 vue-cli，尤其是在你还不熟悉基于 Node.js 的构建工具时。</p>\n<h1>声明式渲染</h1>\n<p>Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;div id=<span class=\"hljs-string\">\"app\"</span>&gt;\n  {{ message }}\n&lt;<span class=\"hljs-regexp\">/div&gt;\n\n</span></code></div></pre>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">var</span> app = <span class=\"hljs-keyword\">new</span> Vue({\n  <span class=\"hljs-attr\">el</span>: <span class=\"hljs-string\">\'#app\'</span>,\n  <span class=\"hljs-attr\">data</span>: {\n    <span class=\"hljs-attr\">message</span>: <span class=\"hljs-string\">\'Hello Vue!\'</span>\n  }\n})\n\n</code></div></pre>\n<p>我们已经成功创建了第一个 Vue 应用！看起来这跟渲染一个字符串模板非常类似，但是 Vue 在背后做了大量工作。现在数据和 DOM 已经被建立了关联，所有东西都是响应式的。我们要怎么确认呢？打开你的浏览器的 JavaScript 控制台 (就在这个页面打开)，并修改 app.message 的值，你将看到上例相应地更新。</p>\n<p>除了文本插值，我们还可以像这样来绑定元素特性：</p>\n',9),(21,'## 快速上手\n\n本节将介绍如何在项目中使用 Element。\n\n### 使用 Starter Kit\n我们提供了通用的项目模板，你可以直接使用。对于 Laravel 用户，我们也准备了相应的模板，同样可以直接下载使用。\n\n如果不希望使用我们提供的模板，请继续阅读。\n\n### 使用 vue-cli\n\n我们还可以使用 vue-cli 初始化项目，命令如下：\n\n```language\n> npm i -g vue-cli\n> mkdir my-project && cd my-project\n> vue init webpack\n> npm i && npm i element-ui\n```\n\n### 引入 Element\n你可以引入整个 Element，或是根据需要仅引入部分组件。我们先介绍如何引入完整的 Element。\n\n#### 完整引入\n在 main.js 中写入以下内容：\n```javascript\nimport Vue from \'vue\'\nimport ElementUI from \'element-ui\'\nimport \'element-ui/lib/theme-chalk/index.css\'\nimport App from \'./App.vue\'\n\nVue.use(ElementUI)\n\nnew Vue({\n  el: \'#app\',\n  render: h => h(App)\n})\n\n```\n以上代码便完成了 Element 的引入。需要注意的是，样式文件需要单独引入。\n\n#### 按需引入\n借助 babel-plugin-component，我们可以只引入需要的组件，以达到减小项目体积的目的。\n\n首先，安装 babel-plugin-component：\n\n','<h2>快速上手</h2>\n<p>本节将介绍如何在项目中使用 Element。</p>\n<h3>使用 Starter Kit</h3>\n<p>我们提供了通用的项目模板，你可以直接使用。对于 Laravel 用户，我们也准备了相应的模板，同样可以直接下载使用。</p>\n<p>如果不希望使用我们提供的模板，请继续阅读。</p>\n<h3>使用 vue-cli</h3>\n<p>我们还可以使用 vue-cli 初始化项目，命令如下：</p>\n<pre><code class=\"lang-language\">&gt; npm i -g vue-cli\n&gt; mkdir my-project &amp;&amp; cd my-project\n&gt; vue init webpack\n&gt; npm i &amp;&amp; npm i element-ui\n</code></pre>\n<h3>引入 Element</h3>\n<p>你可以引入整个 Element，或是根据需要仅引入部分组件。我们先介绍如何引入完整的 Element。</p>\n<h4>完整引入</h4>\n<p>在 main.js 中写入以下内容：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> Vue <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'vue\'</span>\n<span class=\"hljs-keyword\">import</span> ElementUI <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'element-ui\'</span>\n<span class=\"hljs-keyword\">import</span> <span class=\"hljs-string\">\'element-ui/lib/theme-chalk/index.css\'</span>\n<span class=\"hljs-keyword\">import</span> App <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">\'./App.vue\'</span>\n\nVue.use(ElementUI)\n\n<span class=\"hljs-keyword\">new</span> Vue({\n  <span class=\"hljs-attr\">el</span>: <span class=\"hljs-string\">\'#app\'</span>,\n  <span class=\"hljs-attr\">render</span>: <span class=\"hljs-function\"><span class=\"hljs-params\">h</span> =&gt;</span> h(App)\n})\n\n</code></div></pre>\n<p>以上代码便完成了 Element 的引入。需要注意的是，样式文件需要单独引入。</p>\n<h4>按需引入</h4>\n<p>借助 babel-plugin-component，我们可以只引入需要的组件，以达到减小项目体积的目的。</p>\n<p>首先，安装 babel-plugin-component：</p>\n',10),(1606260810819051524,'文章一内容','<p>文章一内容</p>\n',1606260810798080002),(1606948353877241860,'本文章用于七牛云文件上传存储功能测试\n![QQ浏览器截图20220821110917.png](http://rne8ljdao.hd-bkt.clouddn.com/d1b14fff-a836-4f4f-a592-987f36f2f4b0.png)','<p>本文章用于七牛云文件上传存储功能测试<br />\n<img src=\"http://rne8ljdao.hd-bkt.clouddn.com/d1b14fff-a836-4f4f-a592-987f36f2f4b0.png\" alt=\"QQ浏览器截图20220821110917.png\" /></p>\n',1606948353877241857),(1612752433639972866,'个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)','<p>个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /></p>\n',1612752433396703233),(1612797494666764290,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /></p>\n',1612752433396703233),(1612797928752062469,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /></p>\n',1612752433396703233),(1612798070595035139,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /></p>\n',1612752433396703233),(1613145944604397570,'王五的第一篇文章','<p>王五的第一篇文章</p>\n',1613145944537288706),(1613159110457544706,'曾的第一篇文章','<p>曾的第一篇文章</p>\n',1613145944537288706),(1614938698963550212,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下</p>\n',1612752433396703233),(1614940030378180613,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下1','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下1</p>\n',1612752433396703233),(1615318504834072579,'一个个人博客项目!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下2','<p>一个个人博客项目!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下2</p>\n',1612752433396703233),(1615321750663348226,'一个个人博客项目3!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下3','<p>一个个人博客项目3!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下3</p>\n',1612752433396703233),(1615322100766126082,'一个个人博客项目4!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下4','<p>一个个人博客项目4!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下4</p>\n',1612752433396703233),(1615325669032521732,'一个个人博客项目333!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下333','<p>一个个人博客项目333!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下333</p>\n',1612752433396703233),(1615326985930723329,'一个个人博客项目666!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下666','<p>一个个人博客项目666!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下666</p>\n',1612752433396703233),(1615327765928685570,'一个个人博客项目888!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下888','<p>一个个人博客项目888!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下888</p>\n',1612752433396703233),(1615328649957912581,'一个个人博客项目8!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下8','<p>一个个人博客项目8!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下8</p>\n',1612752433396703233),(1615329469764005894,'一个个人博客项目9!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下9','<p>一个个人博客项目9!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下9</p>\n',1612752433396703233),(1617338258016993281,'一个个人博客项目10!![v25a15e41facdcacfe788546d6f7840439_r.jpg](http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg)\n测试一下10','<p>一个个人博客项目10!<img src=\"http://www.wllblog.top/572d7daa-0448-4ec8-8481-10cdc10d9cf0.jpg\" alt=\"v25a15e41facdcacfe788546d6f7840439_r.jpg\" /><br />\n测试一下10</p>\n',1612752433396703233);

/*Table structure for table `wll_article_tag` */

DROP TABLE IF EXISTS `wll_article_tag`;

CREATE TABLE `wll_article_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `article_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE,
  KEY `tag_id` (`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1617338257857609731 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_article_tag` */

insert  into `wll_article_tag`(`id`,`article_id`,`tag_id`) values (1,1,7),(2,1,5),(3,1,8),(4,9,7),(5,10,7),(6,10,8),(7,10,5),(8,10,6),(1606260810819051522,1606260810798080002,8),(1606260810819051523,1606260810798080002,6),(1606948353877241858,1606948353877241857,8),(1606948353877241859,1606948353877241857,6),(1612752433572864002,1612752433396703233,5),(1612752433572864003,1612752433396703233,6),(1612752433572864004,1612752433396703233,7),(1612752433639972865,1612752433396703233,8),(1612797494561906689,1612752433396703233,5),(1612797494599655425,1612752433396703233,6),(1612797494599655426,1612752433396703233,7),(1612797494666764289,1612752433396703233,8),(1612797928743673857,1612752433396703233,5),(1612797928752062466,1612752433396703233,6),(1612797928752062467,1612752433396703233,7),(1612797928752062468,1612752433396703233,8),(1612798070527926273,1612752433396703233,5),(1612798070527926274,1612752433396703233,6),(1612798070527926275,1612752433396703233,7),(1612798070595035138,1612752433396703233,8),(1613145944604397569,1613145944537288706,8),(1613159110457544705,1613145944537288706,8),(1614938698846109697,1612752433396703233,5),(1614938698900635650,1612752433396703233,6),(1614938698963550210,1612752433396703233,7),(1614938698963550211,1612752433396703233,8),(1614940030378180609,1612752433396703233,5),(1614940030378180610,1612752433396703233,6),(1614940030378180611,1612752433396703233,7),(1614940030378180612,1612752433396703233,8),(1615318504766963714,1612752433396703233,5),(1615318504766963715,1612752433396703233,6),(1615318504834072577,1612752433396703233,7),(1615318504834072578,1612752433396703233,8),(1615321750608822273,1612752433396703233,5),(1615321750608822274,1612752433396703233,6),(1615321750608822275,1612752433396703233,7),(1615321750608822276,1612752433396703233,8),(1615322100719988738,1612752433396703233,5),(1615322100719988739,1612752433396703233,6),(1615322100719988740,1612752433396703233,7),(1615322100719988741,1612752433396703233,8),(1615325669015744513,1612752433396703233,5),(1615325669032521729,1612752433396703233,6),(1615325669032521730,1612752433396703233,7),(1615325669032521731,1612752433396703233,8),(1615326985884585986,1612752433396703233,5),(1615326985897168898,1612752433396703233,6),(1615326985897168899,1612752433396703233,7),(1615326985897168900,1612752433396703233,8),(1615327765903519746,1612752433396703233,5),(1615327765903519747,1612752433396703233,6),(1615327765903519748,1612752433396703233,7),(1615327765928685569,1612752433396703233,8),(1615328649936941058,1612752433396703233,5),(1615328649957912578,1612752433396703233,6),(1615328649957912579,1612752433396703233,7),(1615328649957912580,1612752433396703233,8),(1615329469764005890,1612752433396703233,5),(1615329469764005891,1612752433396703233,6),(1615329469764005892,1612752433396703233,7),(1615329469764005893,1612752433396703233,8),(1617338257857609730,1612752433396703233,8);

/*Table structure for table `wll_category` */

DROP TABLE IF EXISTS `wll_category`;

CREATE TABLE `wll_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_category` */

insert  into `wll_category`(`id`,`avatar`,`category_name`,`description`) values (1,'/static/category/front.png','前端','前端是什么，大前端'),(2,'/static/category/back.png','后端','后端最牛叉'),(3,'/static/category/lift.jpg','生活','生活趣事'),(4,'/static/category/database.png','数据库','没数据库，啥也不管用'),(5,'/static/category/language.png','编程语言','好多语言，该学哪个？');

/*Table structure for table `wll_comment` */

DROP TABLE IF EXISTS `wll_comment`;

CREATE TABLE `wll_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `article_id` bigint(30) DEFAULT NULL,
  `author_id` bigint(20) NOT NULL,
  `parent_id` bigint(255) NOT NULL,
  `to_uid` bigint(255) NOT NULL,
  `level` varchar(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1621434461860233219 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_comment` */

insert  into `wll_comment`(`id`,`content`,`create_date`,`article_id`,`author_id`,`parent_id`,`to_uid`,`level`) values (1606193588142649345,'写得可以',1671781367710,10,1,0,0,'1'),(1606193640793747457,'+1',1671781380260,10,1,1606193588142649345,1,'2'),(1613114780803928066,'写得好',1673431508623,1,1,0,0,'1'),(1613120010614476801,'同意',1673432755517,1,1,1613114780803928066,1,'2'),(1613145767759958018,'写得不错',1673438896487,1,1404446129264832513,0,0,'1'),(1621434461860233218,'12',1675415075156,1612752433396703233,1,0,0,'1');

/*Table structure for table `wll_permission` */

DROP TABLE IF EXISTS `wll_permission`;

CREATE TABLE `wll_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_permission` */

insert  into `wll_permission`(`id`,`name`,`path`,`description`) values (1,'查询权限列表','/admin/permission/permissionList','查询权限列表'),(2,'2','2','2'),(3,'3','3','3'),(9,'新增权限','/admin/permission/add','新增权限');

/*Table structure for table `wll_sys_user` */

DROP TABLE IF EXISTS `wll_sys_user`;

CREATE TABLE `wll_sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '账号',
  `admin` bit(1) DEFAULT NULL COMMENT '是否管理员',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_date` bigint(20) DEFAULT NULL COMMENT '注册时间',
  `deleted` bit(1) DEFAULT NULL COMMENT '是否删除',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `last_login` bigint(20) DEFAULT NULL COMMENT '最后登录时间',
  `mobile_phone_number` varchar(20) DEFAULT NULL COMMENT '手机号',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '加密盐',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1404446129264832514 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_sys_user` */

insert  into `wll_sys_user`(`id`,`account`,`admin`,`avatar`,`create_date`,`deleted`,`email`,`last_login`,`mobile_phone_number`,`nickname`,`password`,`salt`,`status`) values (1,'12','','/static/img/logo.png',20210622223122,'\0','11',20210630223130,'12','万','e8f5a0bfbc2d2236afa73b435b5b7ac0','12','1'),(1404446129264832513,'12','','/static/img/logo.png',1623681025218,'\0','',1623681025218,NULL,'曾','e8f5a0bfbc2d2236afa73b435b5b7ac0','','');

/*Table structure for table `wll_tag` */

DROP TABLE IF EXISTS `wll_tag`;

CREATE TABLE `wll_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `wll_tag` */

insert  into `wll_tag`(`id`,`avatar`,`tag_name`) values (5,'/static/tag/java.png','springboot'),(6,'/static/tag/java.png','spring'),(7,'/static/tag/java.png','springmvc'),(8,'/static/tag/css.png','java');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

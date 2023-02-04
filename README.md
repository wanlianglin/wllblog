# wllblog

#### 介绍
基于B站码神之路博客视频写的一个个人博客项目

#### 软件架构

前端：使用vue

后端：使用springboot+mybatisplus+redis+mysql

部署：购买阿里云服务器，在云服务器中安装docker，使用docker启动容器，使用Nginx反向代理，实现部署。

网站地址：[个人博客首页 (wllblog.top)](http://www.wllblog.top/#/)

1.使用jwt + redis

​	token令牌的登录方式，访问认证速度快，session共享，安全性

​    redis做了令牌和用户信息的对应管理，1.进一步增加了安全性⒉登录用户做了缓存3.灵活控制用户的过期(续      

​    期，踢掉线等)

2.threadLocal使用了保存用户信息，请求的线程之内，可以随时获取登录的用户，做了线程隔离

3.在使用完 ThreadLocal之后，做了value的删除，防止了内存泄漏

4.线程安全- update table set value = newValue where id=1 and value=oldValue

5.线程池

6.统一缓存处理（使用消息队列） 


#### 安装教程

1.  前端和后端代码分别存放在仓库的前端和后端文件夹中
2.  打包好的前后端文件存放在部署文件夹
3.  数据库的数据（blog.sql）也在部署文件夹中

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

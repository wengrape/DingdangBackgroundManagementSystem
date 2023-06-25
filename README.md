# 大专毕业设计
## 用到的技术
Vue:

vuex 全局事件总线 nextTick 本地存储 vue-router 路由守卫

Element-ui:

自定义主题 Container 布局容器 Icon 图标 Button 按钮 Form 表单 Switch 开关

Table 表格 Tag 标签 Pagination 分页 NavMenu 导航菜单 Tabs 标签页 Card 卡片

Breadcrumb 面包屑 Dropdown 下拉菜单 Carousel 走马灯 Drawer 抽屉

Axios:

get、post、put、delete 请求方式 rest API 改变一些配置项

Javascipt：

一些数组方法

mysql：

创建表 插入数据 连接外键

node.js：

express cors bcryptjs包进行加密 JWT body的数据类型

Echarts:

折线图 饼形图 柱形图

## 实施步骤：
1.设计总体技术框架:
VUE+ELEMENT-UI+EXPRESS
创建VUE-CLI脚手架，用ELEMENT-UI中的组件container布局，实现页面布局。

2.系统功能分析:
单页面构建，系统切换主题，可视化数据，管理员个人中心的修改，管理员的登入与注册，管理员对所管理的事务有增改删查的权限，动态面包屑，分页处理，路由守卫，权限管理，炫酷的动画效果
3.数据库设计与实现:
创建五个表格，让4个表格连接一个表格，被连接的那一个表格中book_name字段设为主键，其他的4个表格中book_name为外键连接。分别给5个表插入数据。外键里的数据要与主键里的数据要有一样的。

4.后端功能的设计与实现：
用EXPRESS框架编写几个简单的WEB服务器或API接口,使接口为restful风格的API。可以连接前端和数据库。用CORS来解决接口跨域问题。用户登录和注册时，后端进行身份认证，用JWT认证机制。对密码进行加密和解密，服务器还原Token字符串的形式来认证用户的身份。让后端为一个桥梁，使得前端与数据库相通，让数据库中的数据可以展示到前端上。后端写几个增改删查命令行。对数据库进行处理。封装好每个共用的代码，实现模块化。

5.前端功能设计与实现：
创建VUE-CLI脚手架，搭建项目基本结构，自动配置WEBPACK打包工具，
用ELEMENT-UI搭建项目实现首页布局。实现组件化。用VUEROUTER构建单页面。通过路由守卫实现登入拦截。封装ECHARTS实现可视化。用VUEX实现组件间通信。在VUE中集中式管理数据。用ELEMENT-UI的各种组件实现各种样式效果，用LESS,CSS,SASS自定义一些样式。二次封装AXIOS，使用拦截器和请求取消，在用AXIOS发请求。与后端连接。把后端数据展示到前端上。

## 运行项目
前端项目已经上线，打包好了，只用管后台(运行此项目要安装node.js)

打开一个终端 ,进入目录finalcode ,初始化，安装项目需要的包,(输入命令：npm init )

导入mysql (没导也没事，一个页面本连接mysql,但没有连，就是为了更加直观看功能的实现，但登录和注册mysql，要导入，或自己建个表，不然进不去)

打开一个终端

进入目录finalcode

运行命令：nodemon ./app.js

再打开一个终端

进入目录finalcode后再进入book_lending

运行命令：nodemon ./seek.js

​

没有意外的话，项目可以完美运行！

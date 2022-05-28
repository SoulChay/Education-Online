## 1.  项目介绍

本项目属于在线教育项目，包括包括前台系统以及后台管理系统，采用B2B模式，基于 SpringCloud、MyBatisPlus、Redis、SpringBoot实现。前台系统包括：用户登录注册、名师列表、名师详情、课程列表、课程详情、视频在线播放等模块。后台管理系统包括：首页、讲师分类、课程分类、课程管理、统计分析等模块。

后端的主要技术架构是：SpringBoot + SpringCloud + MyBatisPlus + MySQL + HttpClient + Maven + Nacos + Nginx + Redis + EasyExcel + 阿里云OSS + 阿里云视频点播。

前端的主要技术架构是：NodeJS + Vue + Element UI + NUXT + ECharts。

前端部分代码：<a href="https://github.com/SoulChay/Education-Onlien-Front">我的动漫英雄学院<a/>

### 1.1 后端部分

```
动漫英雄学院
├─common
│  ├─common_utils	--公共工具模块
│  └─service_base	--基本功能模块
├─infrastructure
│  └─api_gateway	--网关模块
└─service
    ├─service_cms	--轮播图管理模块
    ├─service_edu	--老师&课程模块
    ├─service_order	--订单模块
    ├─service_oss	--阿里云oss模块
    ├─service_ucenter	--用户登录模块
    └─service_vod	--阿里云视频点播模块
```

### 1.2 前端部分

````
动漫英雄学院
├─ vue-admin-1010  -- 后台UI
└─ vue-front-1010  -- 前台UI
````

## 2. 项目展示

### 2.1 主页展示

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/1.png"></img>



<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/2.png"></img>



<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/3.png"></img>

### 2.2 课程页面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/4.png"></img>

### 2.3 名师页面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/5.png"></img>

### 2.4 注册页面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/6.png"></img>

### 2.5 登录页面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/7.png"></img>

### 2.6 课程具体页面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/8.png"></img>

### 2.7 评论功能

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/9.png"></img>

### 2.8 购买界面

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/10.png"></img>



<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/11.png"></img>

### 2.9 付款后页面

会发现付完款后原本的 `立即购买` 变成了 `立即播放`

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/12.png"></img>

### 2.10 视频播放

这里只实现了功能，没有进一步的美化

放了我最喜欢的凯老师教学前先试一下王路飞的水平的视频（😎）

<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/13.png"></img>


<img src="http://fastly.jsdelivr.net/gh/SoulChay/figureBed/depository/EducationOnline/14.png"></img>

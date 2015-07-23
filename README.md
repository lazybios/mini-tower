README
=======
一个微型Todo-List


部署
=======
* 克隆仓库 `git clone https://github.com/lazybios/mini-tower.git`
* 安装Nginx将config文件夹下的nginx.conf配置修改后软链到`\etc\nginx\site-enabled`目录下,重启nginx
* 修改config目录下的`unicorn.rb`后手动`unicorn  -D -c application_location_path/config/unicorn.rb -E production`启动，或者可以通过修改`unicorn_init.sh`后，建立软链到`/etc/init.d/unicorn`,通过`service unicorn start|stop|restart`操作

在线DEMO
========
[http://minitower.omgm4j.com/](http://minitower.omgm4j.com/)

![demo iamge 1](http://7j1z9l.com1.z0.glb.clouddn.com/dmeo2.png)
![demo iamge 2](http://7j1z9l.com1.z0.glb.clouddn.com/demo1.png)

Todo
========
+ 完成多用户管理逻辑
+ 完成权限控制逻辑
+ 完善UI界面
+ 增加测试用例


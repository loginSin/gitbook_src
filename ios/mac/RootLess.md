# Mac 关闭 rootless

mac 10.11 之后无法使用root来访问以下路径，可能会出现部分软件无法安装的情况

```
/System
/bin
/sbin
/usr (except /usr/local)
```

如何可以关闭 rootless ？


```
1.restart 电脑

2.按command+r进入安全模式

3.找到实用工具->终端，输入：

csrutil disable #关闭rootless

csrutil enable #开启rootless

4.restart 电脑

5.使用root来进行相关的操作，建议操作完成之后再把rootless开启
```
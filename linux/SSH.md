# ssh 连接远端服务器


## 1.连接远端服务

```
ssh 用户名@ip地址
```

如：ssh jenkins@10.10.10.10

## 2.从远程拷贝文件夹到本地

```
scp -r 用户名@ip地址:路径/文件名/ ~/
```

第一个路径为远端路径，第二个路径为本地路径

如： scp -r jenkins@10.10.0.0:~/Desktop/test.txt ./Desktop/

## 3.ssh 免密登录

//TODO
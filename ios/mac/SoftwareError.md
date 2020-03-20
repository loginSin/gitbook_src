# Mac 部分软件打包报已损坏

终端进入 `Application`目录，并执行下面命令

检查软件权限
```
ls -la xxx.app
```

```
xattr -rc xxx.app
```
去除 `drwxr-xr-x@` 中的 `@`
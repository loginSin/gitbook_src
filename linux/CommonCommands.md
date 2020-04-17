# Linux 常用命令

> 查看电脑磁盘使用量

```
df -h
```

> 查看当前目录所有文件磁盘使用量

```
du -sh *
```

> 后台运行 shell 脚本

```
nohup ./test.sh &
```

> IFS 恢复

```
export IFS=$'\040\t\n'

或者 

IFS_old=$IFS

#do something

IFS=$IFS_old
```

> 查看文件夹中多个日志文件中含有特定关键字的次数

```
cat -n * | grep "get_start" -c
```
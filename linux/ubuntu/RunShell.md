# Ubuntu 运行 shell 出现 Bad substitution

```
#!/bin/bash

Comment="测试 SDK 2.9.3"

com=""
if [ ${#Comment}>0 ]; then
	com=${${Comment}// /-}
fi

echo $com
```

### 方式1：
```
sh test.sh
```
ubuntu 环境下会报 com=${${Comment}// /-} Bad substitution

### 方式2：
```
bash test.sh
```
正常

### 方式3：
```
./test.sh
```
正常


说明：Ubuntu 和其他系统的 sh 不太一样，有可能在 mac 或者 centos 写的脚本，在 Ubuntu 上使用 `sh` 命令执行会出现问题，那么试着用 `bash` 命令执行
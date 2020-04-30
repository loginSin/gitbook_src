# Jenkins 6.保存输出

Jenkins 打包可能会需要保存一下输出，比如打好的安装包或者 zip/txt 等文件

分两步

```
1.build.sh 中打好安装包，并将其移动到指定目录，如手动创建的 output 目录
2.Jenkins 配置页面，配置输出路径为上一步的指定目录
```

具体示例如下

1.在 build.sh 脚本中写如下代码

```
#!/bin/bash
echo "start build.sh"
# 创建 output 目录
mkdir output
# 创建 out.txt，伪装成打包好的内容
touch out.txt
# 往 out.txt 写入文字
echo "test" > out.txt
# 将 out.txt 移动到 output 目录
mv out.txt output
```

2.进入 Jenkins 配置页面，指定打包目录为 `output`

![](../images/jenkins/chapter6.1.png)

![](../images/jenkins/chapter6.2.png)

![](../images/jenkins/chapter6.3.png)

3.打包成功之后即可看到第 1 步中说的 out.txt

![](../images/jenkins/chapter6.4.png)
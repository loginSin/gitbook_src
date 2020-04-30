# Jenkins 5.编译脚本分离

之前讲解的读取参数的脚本是在 Jenkins 配置页面写的，不够灵活，如何解决这个问题？

这就要用到上节讲到的 Jenkins 目录结构了，我们可以在 `workspace/{project_name}` 下写好脚本，然后在 Jenkins 配置页面直接调用写好的脚本即可

1.进入 `~/.jenkins/workspace/{project_name}` 创建一个 build.sh 脚本，里面写如下内容

```
#!/bin/bash
echo "start build.sh"
```

2.进入 Jenkins 项目配置页面，调用 build.sh

![](../images/jenkins/chapter5.1.png)

3.编译结果如下

![](../images/jenkins/chapter5.2.png)

`最好脚本使用 git 管理，这样可以查看每次的修改`
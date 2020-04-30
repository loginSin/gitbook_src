# Jenkins 打包配置参数

进入 jenkins 项目配置页面可以进行参数配置，jenkins 较常使用的参数类型有`单选参数`,`布尔参数`,`字符串参数` 等

![](../images/jenkins/chapter2.1.png)

此处新增一个 String 参数，取名为 `Version`，代表版本号

![](../images/jenkins/chapter2.2.png)

新增一个 Boolean 参数，取名为 `Opened`，代表开关的打开与否

![](../images/jenkins/chapter2.3.png)

新增一个 Choice 参数，取名为 `Env`，代表打包的环境

![](../images/jenkins/chapter2.4.png)

在 shell 命令中打印这个参数的值，注意：`参数的名称与 shell 脚本中使用的名称要完全一致`

![](../images/jenkins/chapter2.5.png)

当设置有参数之后，`Build Now` 会变成 `Build with Parameters`，点击进入打包页面

![](../images/jenkins/chapter2.6.png)

填写好打包参数，并打包

![](../images/jenkins/chapter2.7.png)

打包完成后可以在输出的结果中看到刚输入的版本号

![](../images/jenkins/chapter2.8.png)
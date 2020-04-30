# 创建一个简单的 Jenkins 项目

## 1.New Item

点击左侧栏的 `New Item`

![](../images/jenkins/chapter1.1.png)

## 2.输入项目名称并创建 Freestyle Project

![](../images/jenkins/chapter1.2.png)


## 3.Save and Build Now

![](../images/jenkins/chapter1.3.png)

如此一个 jenkins 工程就创建完成了


## 4.执行 shell 脚本

点击 Configure，进行配置

![](../images/jenkins/chapter1.4.png)

滚动到页面最底部的 `Build` 项目，选择 `Execute shell`

![](../images/jenkins/chapter1.5.png)

然后在输入框写入 shell 命令

![](../images/jenkins/chapter1.6.png)

保存配置，重新启动 jenkins，就可以看到脚本中输出的信息

![](../images/jenkins/chapter1.7.png)
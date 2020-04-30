# Jenkins 7.参数读取 git 分支

如果有参数是 git 仓库分支，想要动态获取，怎么处理？

这个需要下载 `Extended Choice Parameter` 插件

需要说明，进行如下配置之后，Jenkins 打包页面会先通过 Groovy 脚本读取 git 分支，所以会比静态参数加载要慢很多，更严重的如果 git 仓库挂了，可能就没法打开 Jenkins 打包页面

1.下载插件，下载完成之后重启 Jenkins

![](../images/jenkins/chapter7.1.png)

2.配置参数

![](../images/jenkins/chapter7.2.png)

![](../images/jenkins/chapter7.3.png)

其中的 Groovy 脚本内容如下

```
def gitURL = "git@github.com:loginSin/gitbook_src.git"
def command = "git ls-remote -h $gitURL"

def proc = command.execute()
proc.waitFor()         

if ( proc.exitValue() != 0 ) {
    return  ["dev", "master"]
}     

def branches = proc.in.text.readLines().collect {
    it.replaceAll(/[a-z0-9]*\trefs\/heads\//, '') 
}
branches -= ["dev", "master"]
branches = ["dev", "master"] + branches
return branches.join(",")

```
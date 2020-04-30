# Jenkins 4.内部目录讲解

默认 Jenkins 会在系统根目录创建隐藏目录 `.jenkins`

顺序执行下面命令即可进入 jenkins 隐藏目录

```
$ cd
$ cd .jenkins
$ ls
```

可以看到两个核心的目录 `workspace` 和 `jobs`

`workspace` 是整个项目编译目录，所有 Jenkins 项目都在此目录中存在，这个目录意义在于如果项目需要手动初始化（比如第一次拉取 git 仓库），可以手动该目录的对应项目路径下手动执行

```
示例路径
~/.jenkins/workspace/{project_name}
```


`jobs` 是整个项目输出目录，项目编译完之后都会把数据同步到该目录下对应的项目中，编译完的数据包含 `log`,`build.xml`,`输出物`，其中输出物可能有(比如安装包)，可能没有，后续会讲如何让 Jenkins 产生输出物

```
示例路径
~/.jenkins/jobs/{project_name}/builds/{build_number}/
```
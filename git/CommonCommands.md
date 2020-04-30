# Git 常用命令

> 仓库迁移

```
$ git clone --bare git@gitlab.company.net/username/project.git
$ cd project
// 创建新远程仓库
$ git push --mirror git@gitlab2.company.net/username/newproject.git
```

> 彻底清除历史记录

```
git reset --hard HEAD^ 
git push --force
```

> 将远端分支与本地分支绑定
```
git branch --set-upstream-to=origin/master master 
```

> git clone 将 submodule clone 下来

执行 git clone，默认不 clone submodule，需要进入 submodule 的目录执行

```
//初始化本地配置文件
$ git submodule init

// 检出父仓库列出的commit
$ git submodule update
```

或者 git clone 加 `--recursive` 参数

```
git clone --recursive git_url
```

> 获取当前分支
```
 br=`git branch | grep "*"`
 echo ${br/* /}
```

> 获取 commitId

```
完整 id
echo `git rev-parse HEAD`
 
短 id
echo `git rev-parse --short HEAD`
```

> 管理 github 大文件

[git-lfs](https://git-lfs.github.com/)

> 查看某个节点所属分支

```
git branch --contains 779c97c7c
```

> 查看具体的节点信息

```
git show 779c97c7c
```
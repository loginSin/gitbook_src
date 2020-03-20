# Git 常用命令

仓库迁移

```
$ git clone --bare git@gitlab.rongcloud.net/username/project.git
$ cd project
// 创建新远程仓库
$ git push --mirror git@gitlab2.rongcloud.net/username/newproject.git
```

彻底清除历史记录

```
git reset --hard HEAD^ 
git push --force
```

将远端分支与本地分支绑定
```
git branch --set-upstream-to=origin/master master 
```

git clone 的 submodule 没有被 clone 下来，进入 submodule 的目录执行
```
// 初始化本地配置文件
$ git submodule init

// 检出父仓库列出的commit
$ git submodule update
```

或者执行下面命令将子模块同时 clone 下载下来

`git clone --recursive git_url`
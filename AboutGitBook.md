# 关于 GitBook

[官网](https://www.gitbook.com/)

[安装](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)

## 在 github 上搭建 gitbook 文档

```
入门须知：
熟悉 github，git 命令，gitbook 命令，shell，md 编写
```

> github 准备

1.注册好账号

2.创建两个 git 仓库，分别命名为 `gitbook_src` 和 `gitbook`

```
gitbook_src 负责保存原始 md 文档，并将生成的 html 文档同步到 gitbook 中
gitbook 负责保存方便查看的 html 文档，文档服务就搭在了这个仓库
```

> gitbook 准备

根据上面文档在本地安装好 gitbook 

> 正片开始

1.把 `gitbook_src 仓库`和 `gitbook 仓库` clone 到同一级目录下

2.进入 `gitbook_src` 目录，执行 `gitbook init` 命令，生成原始 md 文档的框架

3.任意编写 `SUMMARY.md` 文件

4.把 `gitbook_src` 的改动提交到 `github`

5.在 `gitbook_src` 目录执行 `gitbook build` 命令， md 文档就会变成 html 文档保存在 `_book` 目录中

6.将 `_book` 目录的所有文件都复制到 `gitbook 仓库`，会有一个 `index.html` 在 gitbook 仓库根目录

7.将 gitbook 仓库文档提交

8.进入 gitbook 仓库在 github 的地址，点击 `Settings` ，往下有 `GitHub Pages 模块`，`Source 功能选 master branch`，之后页面会出现如下字样 `Your site is published at https://loginsin.github.io/gitbook/`，那么你就可以用这个地址存放的文档地址

9.需要增加新文档那么按需编写文档，并重复 4~7 步

上述 5~7 步的固定命令已经写在了本仓库 `sync_gitbook.sh` 中

`preview.sh` 脚本负责本地预览，执行完成之后最后会出现 `http://localhost:4000` ，这个地址就是本地文档地址
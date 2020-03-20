# 创建多个 git 账号

如何使自己本地电脑同时存在多个 git 账号？如 github，gitee，gitlab？

## 1.生成多个 ssh 秘钥

以下命令的 163 邮箱更换为自己的邮箱

```
ssh-keygen -t rsa -C "testgithub@163.com" -f ~/.ssh/github-rsa
```

```
ssh-keygen -t rsa -C "testgitlab@163.com" -f ~/.ssh/gitlab-rsa
```

```
ssh-keygen -t rsa -C "testgitee@163.com" -f ~/.ssh/gitee-rsa
```

## 2.配置不同的 git

在系统根目录的 `.ssh` 目录下创建名字为 `config` 的文件，然后仿照下面填写配置

```
# github

Host github.com

    HostName github.com

    PreferredAuthentications publickey

    IdentityFile ~/.ssh/github-rsa

# gitlab

Host gitlab.com

    HostName gitlab.com

    PreferredAuthentications publickey

    IdentityFile ~/.ssh/gitlab-rsa
```

其中 `Host`,`HostName` 和 `IdentityFile` 如实填写
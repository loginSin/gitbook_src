# centos 安装 git

centos中默认仓库有git，最简单的是:

```
yum install git
```

但是这种情况下git一般是旧版本（1.7.1），而jenkins需要支持到2.7.4以上

所以需要用自己编译源码来安装git

1.给centos下载安装编译工具

```
sudo yum groupinstall "Development Tools"

sudo yum install autoconf
```

2.安装一下git构建或执行时需要的其他依赖

```
sudo yum install zlib-devel perl-ExtUtils-MakeMaker asciidoc xmlto openssl-devel
```
3. 下载 git 最新版本的源代码

git配置

源码安装

检测当前Git版本是否是2.7.4以上

```
git --version
```
如果没有安装git直接源码安装即可，如果安装了先删除原来的git。

```
yum -y remove git
```
先安装编译git需要的包。

```
yum install zlib-devel perl-CPAN gettext curl-devel expat-devel gettext-devel openssl-devel
```
下载&安装，在终端下依次输入下面的命令

```
mkdir /tmp/git && cd /tmp/git
curl --progress https://www.kernel.org/pub/software/scm/git/git-2.9.0.tar.gz | tar xz
cd git-2.9.0
autoconf

./configure
make
make prefix=/usr/local install
```
查看git安装到什么地方

```
which git
```
可以看到git安装在如下目录

```
/usr/local/bin/git
```
查看git所在的路径：
```
which git
git: /usr/local/bin/git
```
即是git的路径
```
vi /etc/profile
```

在最后加：

```
export PATH=/usr/local/bin/git:$PATH
```
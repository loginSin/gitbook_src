# 解压 iOS 静态库

> .a 静态库的处理

```
1.进入.a所在的文件夹

2.查看.a包含的架构

   使用命令：file lib.a 或者 lipo -info lib.a

3.破解必须剥离出单一架构的静态库，比如所armv7的，所以暂时将抽出的armv7命名为v7.a

   使用命令：lipo lib.a -thin armv7 -output v7.a

4.此时文件夹中应该多了一个v7.a，抽离.a文件的object

   使用命令：ar -x v7.a

5.文件中会多若干.o文件，比如多了一个View.o文件

   使用命令：nm View.o > View.m

   然后看看.m的内容,里面只有方法的声明和属性
```

> .framework 静态库的的处理

```
跟 .a 处理方式一致，只不过把 .a 文件改为 framework 的二进制文件
```
# iOS 崩溃日志分析

本文档的前提是从 iPhone 手机中导出了 .crash 的崩溃文件，并且保留有对应的符号表

## 1 找到symbolicatecrash文件

symbolicatecrash 是一个隐藏工具，将 crashlog 的符号化，在终端输入下面命令可以找到 symbolicatecrash 的位置

```
find /Applications/Xcode.app -name symbolicatecrash -type f
```

## 2

将`symbolicatecrash文件`、`dSYM文件`、`crashlog` 放在同一个文件夹下

如果是使用 Jenkins 打包的话，可以将 dSYM 文件输出到 Jenkins 里面

## 3
在终端输入下面命令

```
./symbolicatecrash xxx.crash xxx.app.dSYM > test.log
```

注意.app.dSYM后面没有“/”

## 4

如果报了下面的错误

```
Error: "DEVELOPER_DIR" is not defined at ./symbolicatecrash line 69.
```

在终端输入

```
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
```

如果是下面的错误

```
2016-12-14 19:56:57.612 xcodebuild[17126:1224726] [MT] PluginLoading: Required plug-in compatibility UUID 8A66E736-A720-4B3C-92F1-33D9962C69DF for plug-in at path '~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/VVDocumenter-Xcode.xcplugin' not present in DVTPlugInCompatibilityUUIDs
```

说明某个插件失效了，参考 [这个链接](http://joeshang.github.io/2015/04/10/fix-xcode-upgrade-plugin-invalid/)
# Jenkins 打包参数原理

通过上一篇文档了解到设置好参数之后，就可以直接在脚本中使用，本篇就来讲解一下背后的实现原理

以下内容只针对 `Linux 系统` 和 `macOS 系统`

打开终端，依次输入以下命令

```
export ver="1.2.3"
echo $ver
```

就可以看到终端输出了 1.2.3 ，所以可以将 Jenkins 设置的参数的并使用的过程简单理解为 ` Jenkins 会把所有参数通过  `export` 命令`保存到系统内部，shell 脚本可以直接通过参数名获取该参数的值

## 各类型参数的使用

参数类型|变量名|使用|说明
:----|:----|:----|:---
String|Version|参见下方使用|版本号
Boolean|Opened|参见下方使用|是否打开开关
Choice|Env|参见下方使用|选择打包环境，如 Dev，Test，Online

```
String 使用
ver=$Version
echo $ver
```

```
Boolean 使用
if [ ${Opened} = "true" ]; then
    echo "opened"
fi
```

```
Choice 使用
if [ ${Env} = "Dev" ]; then
    echo "开发环境"
fi
```

相关连接

[export 命令](https://www.runoob.com/linux/linux-comm-export.html)

[shell 变量](https://www.runoob.com/linux/linux-shell-variable.html)
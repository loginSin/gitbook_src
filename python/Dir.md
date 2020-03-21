```
import os

#获取当前目录
os.getcwd()

#创建文件夹
os.makedirs('path')

#返回绝对路径
os.path.abspath(path)

#是否是绝对路径
os.path.isabs(path)

#返回从start路径到path 的相对路径
os.path.relpath(path,start)

#返回最后一个斜杠后的内容
os.path.basename(path)

#返回最后一个斜杠前的路径
os.path.dirname(path)

#返回path中文件的字节数
os.path.getsize(path)

#返回文件名字符串列表
os.listdir(path)

检查有效性
#文件或者文件夹是否存在
os.path.exists(path)

#文件是否存在
os.path.isfile(path)

#文件夹是否存在
os.path.isdir(path)
```
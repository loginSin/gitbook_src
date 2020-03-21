# python 获取 shell 简单参数

```
python replace_str.py source_text_path target_app_path

执行上面的命令有 三个 参数
参数0，脚本名称
参数1，source_text_path
参数2，target_app_path

if __name__ == '__main__':
	if len(sys.argv) != 3:
		print('use : python replace_str.py source_text_path target_app_path')
		exit()

	source_path = sys.argv[1]
	target_path = sys.argv[2]
```
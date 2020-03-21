# 带参 python 脚本

```
usage: tool_tmp.py -i <ip> -p <port>

向脚本中传递参数：IP地址和端口

#coding=utf-8

import sys,getopt

IP_KEY='ip'
PORT_KEY='port'

def main(argv):
	# 接收的参数：
	# 短参：	
	#				-h （无参，所以后面没有 : ）
	#				-i <ip> （带参：所以后面有 : ）
	#				-p <port>（带参：所以后面有 : ）

	# 长参：
	#				--help （无参，所以后面没有 = ）
	#				--ip=<ip>（带参：所以后面有 = ）
	#				--port=<port>（带参：所以后面有 = ）
	try:
		options,args = getopt.getopt(argv,"hi:p:",["help","ip=","port="])
	except getopt.GetoptError:
		usage()
		sys.exit(2)

	param = {}
	for opt ,arg in options:
		# 如果是 -h 或者 --help ，说明是查看帮助
		if opt in ("-h","--help"):
			usage()
		# 如果是 -i 或者 --ip ，说明传递的参数是 ip 地址
		if opt in ("-i","--ip"):
			param[IP_KEY] = arg
		# 如果是 -p 或者 --port ，说明传递的参数是 端口
		if opt in ("-p","--port"):
			param[PORT_KEY] = arg
	#至此 参数解析完毕

	#开始处理参数
	print("ip = %s ; port = %s" %(__get_safe_value(param,IP_KEY),__get_safe_value(param,PORT_KEY)))

def usage():
	print('%s -i <ip> -p <port>' % sys.argv[0])

def __get_safe_value(dict,key):
	if dict.has_key(key):
		return dict[key]
	return None

if __name__ == '__main__':
	if len(sys.argv) < 2:
		usage()
		sys.exit(2)

	main(sys.argv[1:])
```
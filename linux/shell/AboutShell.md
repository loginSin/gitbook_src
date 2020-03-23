# Shell 相关

查看当前使用的 shell

```
$ echo $SHELL
```

查看当前系统支持的 shell 列表

```
$ cat /etc/shells
```

切换当前 shell

```
$ chsh -s /bin/bash
```

# For 循环

```
repos=("game-Workspace" "ios-workspace" "iOS-development")

for repo in ${repos[*]};
do
	from_repo="git@github.com:ios-team/"$repo".git"
	to_repo="git@github.com:ios/"$repo".git"
	git clone --bare $from_repo
	cd $repo".git"
	git push --mirror $to_repo
	cd ../
done
```

# Function

#无参数，无返回值
```
function func(){
	echo "func"
}
```
调用

`
func
`

#含参数，无返回值
```
function funcWithParam(){
	key=$1
	echo ${key}
}
```

调用

`
funcWithParam param
`

#无参数，有返回值，返回值只能是数字类型
```
function funcWithReturn(){
	aNum=1
	return $aNum
}
```

调用

`
funcWithReturn
`

echo $?
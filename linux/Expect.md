# expect 快捷登录

jenkins.exp

```

#!/usr/bin/expect -f

set timeout 10
set passwd "password"

spawn ssh jenkins@10.10.10.10

expect "*Password:*"  {send "${passwd}\r"}

interact
```

该脚本在非 shell 交互逻辑下执行，即 不能使用 sh jenkins.exp 而需要使用 ./jenkins.exp
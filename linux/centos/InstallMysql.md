# centos mysql 安装使用

wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm

rpm -ivh mysql80-community-release-el7-3.noarch.rpm

sudo yum install -y  mysql mysql-server mysql-devel

启动

service mysqld start

查看原始密码

sudo grep 'temporary password' /var/log/mysqld.log


mysql -uroot -peejVY2MLgS+e


mysql> UPDATE user SET Password = password ( '123456' ) WHERE User = 'root' ;

修改：密码最小长度策略

mysql> set global validate_password.length=0;
 

修改：密码强度检查等级策略，0/LOW、1/MEDIUM、2/STRONG

mysql> set global validate_password.policy=0;
 

　　修改密码

mysql> ALTER user 'root'@'localhost' IDENTIFIED BY '123456';

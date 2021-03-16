-- 将root数据库，密码为123456：
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456';

flush privileges;
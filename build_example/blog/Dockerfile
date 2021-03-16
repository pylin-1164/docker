FROM mysql:5.7

MAINTAINER gancy "pyl1164@163.com"

#时区
ENV TIMEZONE Asia/Shanghai
#设置免密登录
ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

RUN apt-get update && apt-get install sysv-rc-conf -y &&  apt-get install procps -y && apt-get install vim -y

#将所需文件放到容器中,存在依赖，顺序执行
COPY tale.sql /docker-entrypoint-initdb.d/1_tale.sql

COPY privileges.sql /docker-entrypoint-initdb.d/2_privileges.sql

COPY setup_blog.sh /docker-entrypoint-initdb.d/3_setup.sh

COPY setup_blog.sh /blog/setup.sh

COPY BlogService /etc/init.d/Blog

#安装JDK8
ADD jdk-8u281-linux-x64.tar.gz /usr/local/java

#配置环境变量
ENV JAVA_HOME /usr/local/java/jdk1.8.0_281
ENV PATH $JAVA_HOME/bin:$PATH
ENV CLASSPATH .:$JAVA_HOME/lib

#安装博客系统

COPY my-blog-3.0.1-SNAPSHOT.war /blog/

#目录权限设置
RUN	mkdir /blog/logs \
	&& chmod -R 777 /blog \
	&& chmod 777 /etc/init.d/Blog \
	&& update-rc.d Blog defaults \
	&& sed -i 's/mouse=a/mouse-=a/g' /usr/share/vim/vim81/defaults.vim

WORKDIR /blog

#RUN sysv-rc-conf blog_setup.sh on

#端口映射
EXPOSE 8081
EXPOSE 3309




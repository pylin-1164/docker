## Blog

由于工作中经常需要搭建一个WEB应用来测试，经常需要临时搭建相关mysql和jdk环境比较麻烦，于是打算用Docker一键安装使用，也方便其他同事使用。

* WEB应用使用的时github上分享的一个[博客系统](https://github.com/ZHENFENG13/My-Blog)

#### Docker部署

* JDK使用的 [jdk-8u281-linux-x64.tar.gz](https://javadl.oracle.com/webapps/download/GetFile/1.8.0_281-b09/89d678f2be164786b292527658ca1605/linux-i586/jdk-8u281-linux-x64.tar.gz) ；由于oracle下载JDK已增加登录验证限制，如果不能直接下载请自行到官网下载
* my-blog-3.0.1-SNAPSHOT.war 已提供在项目中，可直接使用
    
*   打包镜像
    
    ``` shell
        #cd到DockerFile文件所在目录
        docker build -t blog:pyl .
    ```

*   运行博客系统

    ``` 
        #对容器mysql和web端口映射
        docker run -it -p 3306:3306 -p 8080:8081 --name blog blog:pyl 
   
        #启动博客系统;第一次安装镜像时默认启动,后面容器启动后手动启动
        service Blog restart
    ```
    

#### 依赖环境和使用

*   环境：  
            mysql57    
            jdbc:  root  123456  tale

*   手动启动：
   ```
    java -jar /blog/my-blog-3.0.1-SNAPSHOT.war --spring.active.profile=jdbc
   ```
   
*   博客系统容器访问地址：  
    http://localhost:8081/admin


*   默认账号密码：  
    admin   123456    
    

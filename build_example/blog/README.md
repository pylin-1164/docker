## Blog

#### Docker部署

*   下载JDK  
    由于oracle下载JDK需要登陆，请自行下载JDK。脚本中采用的 jdk-8u281-linux-x64.tar.gz   
    下载到于DockerFile平级目录即可  
    
*   打包镜像
    
    ``` shell
        #cd到DockerFile文件所在目录
        docker build -t blog:pyl .
    ```

*   运行博客系统

    ``` shell script
        #对容器mysql和web端口映射
        docker run -it -p 3306:3306 -p 8080:8081 --name blog blog:pyl 
   
        #启动博客系统;第一次安装镜像时默认启动,后面容器启动后手动启动
        service Blog restart
    ```
    

#### 系统环境和使用

*   环境：  
            mysql57    
            jdbc:  root  123456  tale

*   启动：
   ```shell script
    java -jar /blog/my-blog-3.0.1-SNAPSHOT.war --spring.active.profile=jdbc
   
   ```
   
*   访问地址：  
    http://localhost:8081/admin


*   默认账号密码：  
    admin   123456    
    

#!/bin/bash

nohup java -jar /blog/my-blog-3.0.1-SNAPSHOT.war --spring.active.profile=jdbc > /blog/logs/blog_start.log 2>&1 &


echo 'start blog web success [http://127.0.0.1:8081/admin] default user: admin  password: 123456  '
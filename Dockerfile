ARG version=latest
FROM redhat/ubi8
LABEL description="This is a test image"
MAINTAINER awscloudrockers@gmail.com
RUN yum update -y && yum install httpd -y #tomcat java php php-mysql git docker -y
ENV dir /var/www/html
VOLUME /home/ec2-user/data_backup:/var/www/html
COPY ./index.html $dir
ADD https://wordpress.org/latest.tar.gz $dir
ARG file
RUN touch $file
WORKDIR $dir
RUN mkdir test && cd /var/www/html/test && echo "This is a test" > test.html
RUN touch index.php
Run touch index.py
#ARG folder
RUN mkdir folder-1
EXPOSE 8081
ONBUILD RUN mkdir onbuild
ONBUILD RUN cd /var/www/html/onbuild
ONBUILD RUN touch onbuild.html
ONBUILD RUN echo "This a onbuild instruction" > onbuild.html
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
HEALTHCHECK CMD curl -f http://52.86.148.178:8081/ || exit 1
CMD ["/bin/bash"]

FROM  centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

RUN yum install -y httpd \
 zip\
 unzip
COPY photogenic /var/www/html/
WORKDIR /var/www/html/
RUN ls -lrt
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22

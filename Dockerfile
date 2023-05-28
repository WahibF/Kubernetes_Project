FROM centos:latest
LABEL MAINTAINER="wahibx@gmail.com"

RUN yum update -y \
    && yum install -y epel-release \
    && yum update -y \
    && yum install -y httpd \
    && yum install -y zip \
    && yum install -y unzip \
    && yum clean all

RUN sed -i '/appstream/s/enabled=1/enabled=0/' /etc/yum.repos.d/CentOS-Linux-AppStream.repo \
    && yum update -y --exclude=centos-linux-appstream \
    && yum clean all

ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip photogenic.zip \
    && cp -rvf photogenic/* . \
    && rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 22






# FROM  centos:latest
# MAINTAINER wahibx@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80

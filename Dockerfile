FROM centos:8.4.2105

LABEL MAINTAINER="wahibx@gmail.com"

# Modify the repository configuration
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* \
    && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Update and install packages
RUN yum update -y \
    && yum install -y epel-release \
    && yum install -y httpd \
    && yum install -y zip \
    && yum install -y unzip \
    && yum clean all

# Add the required files to the image
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

# Extract the contents of the zip file
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

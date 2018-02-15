FROM    centos:7

RUN  yum install -y \
	httpd \
	httpd-tools
RUN yum install -y \
	unzip \
	epel-release \
	bind-utils \
	yum-utils \
	which \
	wget \
	sendmail \
        vim
RUN yum install -y php \
	php-mbstring \
	php-soap \
	mysql \
	php-mysql \
	php-gd \
	php-pdo \
	php-cli \
	php-xml \
	php-xmlrpci
#ENV PATH /var/www/html
#COPY ./src/ ./public-html
COPY ./src/ /var/www/html
#COPY ./public-html/ /var/www/html/
#COPY ./config/configuration.php /var/www/html
#COPY ./config/httpd.conf /etc/httpd/conf/
#COPY ./config/vhosts.conf /etc/httpd/conf.d/
#COPY ./test/ /var/vhosts/vanguardaml/
RUN chown -R apache.apache /var/www/html/images/  /var/www/html/cache/  /var/www/html/administrator/cache/ /var/www/html/tmp/ 

EXPOSE  80

CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]

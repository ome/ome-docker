FROM centos6-ruby193-rails32
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

#ENV TARANTULA_VERSION master
ENV TARANTULA_VERSION 2014.26.1

# Utilities
# Runtime requirements for Tarantula
# Requirements for bundle install
# Requirements for compiling passenger
RUN yum install -y unzip supervisor \
	mysql-server httpd cronie \
	libxml2-devel mysql-devel \
	curl-devel httpd-devel apr-devel apr-util-devel

RUN mkdir -p /opt/tarantula /data/attachment_files /data/log /data/tmp
ADD mysql-preinstall.sql /opt/tarantula/
ADD apache-tarantula.conf /opt/tarantula/
ADD database.yml /opt/tarantula/
ADD configure-tarantula /opt/tarantula/
ADD https://github.com/prove/tarantula/archive/$TARANTULA_VERSION.zip /opt/tarantula/
ADD supervisord.conf /etc/supervisord.conf

WORKDIR /opt/tarantula

RUN unzip $TARANTULA_VERSION.zip && \
	ln -s tarantula-$TARANTULA_VERSION rails

RUN cd rails && \
	rm -rf attachment_files log tmp && \
	ln -s /data/attachment_files /data/log /data/tmp . && \
	touch log/production.log && \
	bash -lc "bundle install --deployment"

RUN bash -lc "gem install passenger && \
	passenger-install-apache2-module -a && \
	passenger-install-apache2-module --snippet > \
		/etc/httpd/conf.d/tarantula.conf && \
	cat /opt/tarantula/apache-tarantula.conf >> \
		/etc/httpd/conf.d/tarantula.conf"

# install.sh sets the entire tarantula install to be owned by apache
# in practice it seems to be sufficient to make just config.ru owned
#RUN chown -R apache:apache /opt/tarantula/
RUN chown -R apache:apache rails/config.ru \
	/data/attachment_files /data/log /data/tmp

WORKDIR /opt/tarantula/rails
RUN /etc/init.d/mysqld start && \
	mysql < /opt/tarantula/mysql-preinstall.sql && \
	mv /opt/tarantula/database.yml config/database.yml && \
	bash -lc "cat /opt/tarantula/configure-tarantula | \
		RAILS_ENV=production rake tarantula:install" && \
	/etc/init.d/mysqld stop

RUN cp /opt/tarantula/rails/config/crontab /etc/cron.d/tarantula

EXPOSE 80
CMD ["/usr/bin/supervisord"]


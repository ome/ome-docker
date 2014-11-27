FROM centos6-ruby193-rails32
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

#ENV TARANTULA_VERSION master
ENV TARANTULA_VERSION 2014.26.1

# Utilities
# Runtime requirements for Tarantula
# Requirements for bundle install
# Requirements for compiling passenger
RUN yum install -y unzip supervisor \
	mysql-server httpd \
	libxml2-devel mysql-devel \
	curl-devel httpd-devel apr-devel apr-util-devel

RUN mkdir /home/tarantula
ADD apache-tarantula.conf /home/tarantula/
ADD configure-tarantula /home/tarantula/
ADD https://github.com/prove/tarantula/archive/$TARANTULA_VERSION.zip /home/tarantula/
ADD supervisord.conf /etc/supervisord.conf

WORKDIR /home/tarantula

RUN unzip $TARANTULA_VERSION.zip && \
	ln -s tarantula-$TARANTULA_VERSION rails && \
	mkdir -p attachment_files log tmp/pids

RUN cd rails && \
	rm -rf attachment_files log tmp && \
	ln -s ../attachment_files ../log ../tmp . && \
	touch log/production.log && \
	bash -lc "source /usr/local/rvm/scripts/rvm && \
		bundle install --deployment"

RUN bash -lc "source /usr/local/rvm/scripts/rvm && \
	gem install passenger && \
	passenger-install-apache2-module -a && \
	passenger-install-apache2-module --snippet > \
		/etc/httpd/conf.d/tarantula.conf && \
	cat /home/tarantula/apache-tarantula.conf >> \
		/etc/httpd/conf.d/tarantula.conf"

# install.sh sets the entire tarantula install to be owned by apache
# in practice it seems to be sufficient to make just config.ru owned
RUN chmod a+rx /home/tarantula && \
	chown -R apache:apache rails/config.ru attachment_files log tmp
#	chown -R apache:apache /home/tarantula/

WORKDIR /home/tarantula/rails
RUN /etc/init.d/mysqld start && \
	bash -lc "source /usr/local/rvm/scripts/rvm && \
	cat /home/tarantula/configure-tarantula | \
		RAILS_ENV=production rake tarantula:install" && \
	/etc/init.d/mysqld stop

EXPOSE 80
CMD ["/usr/bin/supervisord"]


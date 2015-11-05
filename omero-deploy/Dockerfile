FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root

RUN apt-get update -y && \
    apt-get install -y \
    openssh-server \
    nginx \
    postgresql \
    supervisor \
    sudo \
    vim

RUN /opt/anaconda/bin/pip install \
    "django<1.9" \
    gunicorn
RUN /opt/anaconda/bin/pip install \
    https://github.com/ome/omego/archive/master.zip

RUN mkdir /var/run/sshd && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' \
    -i /etc/pam.d/sshd

RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/*
RUN echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero

RUN rmdir /var/log/supervisor && \
    ln -s /data/supervisor /var/log/ && \
    ln -s /data/OMERO /

# The following isn't needed since /data should either be an existing volume
# or be created by the startup scripts. However it may be useful if you've
# overridden entrypoint for testing/debugging
RUN mkdir -p /data/supervisor /data/OMERO && \
    chown omero /data/OMERO

ADD supervisord/*.conf /etc/supervisor/conf.d/
ADD ./postgresql /postgresql
ADD ./omero-setup /omero-setup
ADD ./run.sh /run.sh

RUN ln -s /opt/Ice-3.5/bin/* /usr/local/bin/ && \
    ln -s /opt/anaconda/bin/* /usr/local/bin/

RUN chsh -s /bin/bash omero

VOLUME ["/data"]
EXPOSE 22 80 4063 4064

# Pass a single argument "" to disable OMERO.server installation
ENTRYPOINT ["/run.sh"]
CMD ["--release", "latest"]

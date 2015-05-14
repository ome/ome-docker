FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root

RUN apt-get update -y && \
    apt-get install -y \
    openssh-server \
    nginx \
    postgresql \
    python-pip \
    supervisor \
    sudo \
    vim

RUN echo 'omero:omero' | chpasswd omero
RUN /opt/anaconda/bin/pip install omego

RUN mkdir /var/run/sshd && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' \
    -i /etc/pam.d/sshd

RUN echo "daemon off;" >> /etc/nginx/nginx.conf && \
    rm /etc/nginx/sites-enabled/*
RUN echo "omero ALL= (ALL) NOPASSWD: ALL" >> /etc/sudoers.d/omero

ADD supervisord/*.conf /etc/supervisor/conf.d/
ADD ./postgresql /postgresql
ADD ./omero-setup /omero-setup
ADD ./run.sh /run.sh

RUN ln -s /opt/Ice-3.5/bin/* /usr/local/bin/ && \
    ln -s /opt/anaconda/bin/* /usr/local/bin/

VOLUME ["/data"]
EXPOSE 22 80 4063 4064 5432

ENTRYPOINT ["/run.sh"]
# Todo: Change omego to download the latest release automatically
CMD ["https://downloads.openmicroscopy.org/omero/5.1.1/artifacts/OMERO.server-5.1.1-ice35-b43.zip"]

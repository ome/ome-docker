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

ADD ./supervisord.conf /etc/supervisor/conf.d/omero.conf
ADD ./postgresql /postgresql
ADD ./omero-setup /omero-setup

RUN ln -s /opt/Ice-3.5/bin/* /usr/local/bin/ && \
    ln -s /opt/anaconda/bin/* /usr/local/bin/

EXPOSE 22 80 4063 4064 5432

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]

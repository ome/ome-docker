FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN yum -y install epel-release && \
    curl -o /etc/yum.repos.d/zeroc-ice-el7.repo \
        http://download.zeroc.com/Ice/3.5/el7/zeroc-ice-el7.repo && \
    yum -y install http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
    yum -y install \
        unzip wget \
        ice ice-python \
        python-pip \
        numpy scipy python-matplotlib python-pillow python-tables \
        nginx python-gunicorn && \
    yum clean all

RUN pip install 'Django<1.9' omego

RUN useradd omero && \
    rm /etc/nginx/conf.d/* && \
    echo 'daemon off;' >> /etc/nginx/nginx.conf && \
    sed -i 's|/var/|/home/omero/var/|' /etc/nginx/nginx.conf && \
    chown -R omero /etc/nginx/conf.d /var/cache/nginx

ARG OMERO_VERSION=latest
ARG CI_SERVER
ARG OMEGO_ARGS

USER omero
WORKDIR /home/omero
RUN bash -c 'CI=; if [ -n "$CI_SERVER" ]; then CI="--ci $CI_SERVER"; fi; \
    omego download python $CI --release $OMERO_VERSION $OMEGO_ARGS && \
        rm OMERO.py-*.zip && \
        ln -s OMERO.py-*/ OMERO.py'

RUN mkdir -p var/run var/log/nginx

ADD run.sh /home/omero/

EXPOSE 8080
VOLUME ["/var/cache/nginx", "/home/omero/var", "/home/omero/OMERO.server/var"]

# Set the default command to run when starting the container
ENTRYPOINT ["/home/omero/run.sh"]

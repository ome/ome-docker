FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

# TODO: Use separate Nginx container

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
    sed -i -r -e 's|/var/([^/]+)(/nginx)?/|/home/omero/nginx/\1/|' \
        -e '/^user/s/^/#/' /etc/nginx/nginx.conf && \
    rm -rf /var/cache/nginx /var/log/nginx && \
    chown -R omero /etc/nginx/conf.d && \
    ln -sf /home/omero/nginx/cache /var/cache/nginx && \
    ln -sf /home/omero/nginx/log /var/log/nginx
# TODO: Use docker logging instead of log files?
# https://github.com/nginxinc/docker-nginx/blob/master/Dockerfile
    #ln -sf /dev/stdout /var/log/nginx/access.log && \
    #ln -sf /dev/stderr /var/log/nginx/error.log && \

ARG OMERO_VERSION=latest
ARG CI_SERVER
ARG OMEGO_ARGS

USER omero
WORKDIR /home/omero
RUN bash -c 'CI=; if [ -n "$CI_SERVER" ]; then CI="--ci $CI_SERVER"; fi; \
    omego download python $CI --release $OMERO_VERSION $OMEGO_ARGS && \
        rm OMERO.py-*.zip && \
        ln -s OMERO.py-*/ OMERO.server'
# Must create OMERO.server/var because it's marked as a volume and will
# otherwise default to root ownership
RUN mkdir -p nginx/cache nginx/log nginx/run nginx/temp OMERO.server/var

ADD run.sh /home/omero/

EXPOSE 8080
VOLUME ["/home/omero/nginx", "/home/omero/OMERO.server/var"]

# Set the default command to run when starting the container
ENTRYPOINT ["/home/omero/run.sh"]

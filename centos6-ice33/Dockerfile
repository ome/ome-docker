FROM centos:centos6

RUN yum install -y wget unzip
RUN cd /etc/yum.repos.d && wget http://yum.glencoesoftware.com/glencoesoftware.repo
RUN yum --enablerepo=glencoe-dependencies install -y ice ice-{java,libs,python,utils}
RUN yum --enablerepo=glencoe-dependencies install -y java ice-python-devel ice-servers ice-utils


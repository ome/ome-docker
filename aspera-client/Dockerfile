FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

ADD http://download.asperasoft.com/download/sw/ascp-client/3.5.4/ascp-install-3.5.4.102989-linux-64.sh /tmp/

# No https, so verify sha1
RUN test $(sha1sum /tmp/ascp-install-3.5.4.102989-linux-64.sh |cut -f1 -d\ ) = a99a63a85fee418d16000a1a51cc70b489755957 && \
    sh /tmp/ascp-install-3.5.4.102989-linux-64.sh

RUN useradd data
USER data

ENTRYPOINT ["/usr/local/bin/ascp"]

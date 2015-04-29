FROM java:7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get install -y curl
RUN curl -o bftools.zip $(curl -Ls -o /dev/null -w %{url_effective} http://downloads.openmicroscopy.org/latest/bio-formats)/artifacts/bftools.zip

RUN apt-get install -y unzip
RUN unzip -d /opt bftools.zip && rm bftools.zip
RUN chmod a+rx /opt/bftools/*

RUN useradd -m bf

USER bf
RUN echo 'export PATH=/opt/bftools:$PATH' >> /home/bf/.bashrc

ENV HOME /home/bf
WORKDIR /home/bf

CMD bash

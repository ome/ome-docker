FROM joshmoore/openjdk-ice34
MAINTAINER Josh Moore <josh@glencoesoftware.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get install -y bzip2 unzip wget

RUN useradd -m omero

RUN cd /tmp && \
    wget http://repo.continuum.io/miniconda/Miniconda-3.4.2-Linux-x86_64.sh && \
    /bin/bash Miniconda-3.4.2-Linux-x86_64.sh -b -p /opt/anaconda && \
    rm Miniconda-3.4.2-Linux-x86_64.sh

RUN /opt/anaconda/bin/conda install --yes numpy && \
    /opt/anaconda/bin/conda install --yes scipy && \
    /opt/anaconda/bin/conda install --yes matplotlib && \
    /opt/anaconda/bin/conda install --yes ipython && \
    /opt/anaconda/bin/conda install --yes pytables

USER omero
ENV HOME /home/omero
WORKDIR /home/omero
RUN echo 'export PATH=/opt/anaconda/bin:$PATH' >> .bashrc

CMD bash

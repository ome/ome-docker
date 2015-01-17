FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root
RUN cd /opt && \
    apt-get install -y git && \
    /opt/anaconda/bin/pip install git+https://github.com/ome/omego && \
    /opt/anaconda/bin/omego download python --branch=OMERO-5.1-latest && \
    ln -s $(find . -name 'OMERO.py*' -type d) /opt/omero && \
    rm OMERO.py*.zip

USER omero
ENV PYTHONPATH /opt/omero/lib/python
ENV ICE_CONFIG config
WORKDIR /omero-process
CMD ["-c", "/opt/anaconda/bin/python script.run"]
ENTRYPOINT ["/bin/bash"]

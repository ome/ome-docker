FROM joshmoore/omerobase
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root
RUN cd /tmp && \
    wget http://downloads.openmicroscopy.org/omero/5.0.1/artifacts/OMERO.py-5.0.1-ice34-b21.zip && \
    echo '05d60953b4eff3fd7019055ea42ac1f6  OMERO.py-5.0.1-ice34-b21.zip' > OMERO.py-5.0.1-ice34-b21.zip.md5 && \
    md5sum --check OMERO.py-5.0.1-ice34-b21.zip.md5 && \
    unzip -d /opt OMERO.py-5.0.1-ice34-b21.zip && \
    ln -s /opt/OMERO.py-5.0.1-ice34-b21 /opt/omero
RUN apt-get install -yy python-numpy
RUN apt-get install -yy python-imaging

USER omero
ENV PYTHONPATH /opt/omero/lib/python
ENV ICE_CONFIG config
WORKDIR /omero-process
CMD ["-c", "python script.run"]
ENTRYPOINT ["/bin/bash"]

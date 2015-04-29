FROM openmicroscopy/omero-conda
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

USER root
RUN /opt/anaconda/bin/conda install --yes flake8
RUN apt-get install -y git
RUN /opt/anaconda/bin/pip install genshi
RUN /opt/anaconda/bin/pip install pytest

RUN echo 'export PATH=/opt/Ice-3.5/bin:$PATH' >> ~/.bashrc

USER omero
WORKDIR /omero

CMD ["components/tools/travis-build", "build-python"]

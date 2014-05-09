FROM joshmoore/omero-base-conda
MAINTAINER josh@glencoesoftware.com

USER root
RUN /opt/anaconda/bin/conda install --yes flake8
RUN apt-get install -y git
RUN apt-get install -y --no-install-recommends openjdk-7-jdk
RUN /opt/anaconda/bin/conda install --yes pip
RUN /opt/anaconda/bin/pip install genshi

USER omero
WORKDIR /omero

## CMD ["components/tools/travis-build", "build-python"]
## ENTRYPOINT ["/bin/bash"]
CMD bash

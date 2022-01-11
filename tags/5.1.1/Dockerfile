FROM openmicroscopy/tags:5.1.0
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN cd /src/scripts.git && \
	time git fetch \
		https://github.com/ome/scripts/ \
		refs/tags/v5.1.1:refs/tags/v5.1.1

RUN cd /src/omero.git && \
	time git fetch -v --progress --depth=20 \
		https://github.com/openmicroscopy/openmicroscopy/ \
		refs/tags/v5.1.1:refs/tags/v5.1.1

RUN cd /src/bio-formats.git && \
	time git fetch -v --progress --depth=20 \
		https://github.com/openmicroscopy/bioformats/ \
		refs/tags/v5.1.1:refs/tags/v5.1.1

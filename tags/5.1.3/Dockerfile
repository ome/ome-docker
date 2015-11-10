FROM openmicroscopy/tags:5.1.2
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN cd /src/scripts.git && \
	time git fetch \
		git://github.com/ome/scripts/ \
		refs/tags/v5.1.3:refs/tags/v5.1.3

RUN cd /src/omero.git && \
	time git fetch -v --progress --depth=20 \
		git://github.com/openmicroscopy/openmicroscopy/ \
		refs/tags/v5.1.3:refs/tags/v5.1.3

RUN cd /src/bio-formats.git && \
	time git fetch -v --progress --depth=20 \
		git://github.com/openmicroscopy/bioformats/ \
		refs/tags/v5.1.3:refs/tags/v5.1.3

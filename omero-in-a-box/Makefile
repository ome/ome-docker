DOCKER?=docker.io --host=unix:///var/run/docker.sock
OMERO?=/tmp/omero
DATA?=/tmp/data

run:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero -v $(DATA):/data omedocker/omero-in-a-box

nodata:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero                  omedocker/omero-in-a-box

build:
	$(DOCKER) build -t omedocker/omero-in-a-box .

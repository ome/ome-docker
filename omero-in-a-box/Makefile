DOCKER?=docker.io --host=unix:///var/run/docker.sock

# Local directories
OMERO?=/tmp/omero
DATA?=/tmp/data

# Images
D?=openmicroscopy/data
I?=openmicroscopy/omero-in-a-box

# Named containers
C?=data-in-a-box

run: mount
	echo done

mount:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero -v $(DATA):/data $(I)

container:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero --volumes-from $(C) $(I)

nodata:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero $(I)

nomounts:
	$(DOCKER) run --rm -i $(I)

lowmem:
	$(DOCKER) run --rm -i -v $(OMERO):/opt/omero -m=10000000      openmicroscopy/omero-in-a-box

build:
	$(DOCKER) build -t openmicroscopy/omero-in-a-box .

data:
	$(DOCKER) run --name $(C) $(D) mkdir /data/supervisor

.PHONY: run mount container nodata nomounts lowmem build data

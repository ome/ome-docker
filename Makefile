.PHONY: up down all build clean rmdata mkdata datash rmpg mkpg pg pgsh rmomero mkomero mkdb omero omerosh viz

# MAIN
up: pg omero

down:
	sudo docker stop `sudo docker ps -q`


# WRAPPERS
all: build pg mkdb omero

build: mkpg mkomero mkdata
	sudo docker run --volumes-from DATA -e VAR=/data/pg jm/pg sh init.sh

clean: rmpg rmomero rmdata
	rm -f docker.png


# DATA
rmdata:
	sudo docker rm DATA

mkdata: rmdata
	sudo docker build -t jm/data data
	sudo docker run -name DATA jm/data true

datash:
	sudo docker run -t -i --volumes-from DATA jm/data sh


# PG
rmpg:
	sudo docker rm PG

mkpg: rmpg
	sudo docker build -t jm/pg postgresql

pg:
	sudo docker run -d -expose 5432 -name PG -volumes-from DATA -e VAR=/data/pg jm/pg

pgsh:
	sudo docker run -t -i --volumes-from DATA jm/pg bash

# OMERO
rmomero:
	sudo docker rm OMERO

mkomero: rmomero
	sudo docker build -t jm/omero omero

mkdb:
	sudo docker run                             -link PG:PG --volumes-from DATA jm/omero sh init.sh

omero:
	sudo docker run -d -expose 4064 -name OMERO -link PG:PG --volumes-from DATA jm/omero

omerosh:
	sudo docker run -t -i --volumes-from DATA jm/omero bash


# MISC
viz:
	sudo docker images -viz | dot -Tpng -o docker.png


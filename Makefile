# MAIN
up: pg omero

down:
	sudo docker stop `sudo docker ps -q`


# WRAPPERS
build: mkpg mkomero mkdata

clean: rmpg rmomero rmdata
	rm -f docker.png


# DATA
rmdata:
	sudo docker rm DATA

mkdata: rmdata
	sudo docker build -t jm/data data
	sudo docker run -name DATA jm/data true


# PG
rmpg:
	sudo docker rm PG

mkpg: rmpg
	sudo docker build -t jm/pg postgresql

pg:
	sudo docker run -d -expose 5432 -name PG -volumes-from DATA jm/pg


# OMERO
rmomero:
	sudo docker rm OMERO

mkomero: rmomero
	sudo docker build -t jm/omero omero

omero:
	sudo docker run -d -expose 4064 -name OMERO -link PG:PG --volumes-from DATA jm/omero

omerosh:
	sudo docker run -t -i --volumes-from DATA jm/omero bash


# MISC
viz:
	sudo docker images -viz | dot -Tpng -o docker.png

.PHONY: up down pg omero data build mkpg mkomero mkdata clean rmpg rmomero rmdata shomero stopall viz

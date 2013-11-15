startall: pg omero

pg:
	sudo docker rm PG
	sudo docker build -t jm/pg postgresql
	sudo docker run -d -expose 5432 -name PG jm/pg

omero:
	sudo docker rm OMERO
	sudo docker build -t jm/omero omero
	sudo docker run -d -expose 4064 -name OMERO -link PG:PG jm/omero

omerosh:
	sudo docker run    -t -i jm/omero bash

clean:
	rm -f docker.png
	sudo docker rm OMERO
	sudo docker rm PG

stopall:
	sudo docker stop `sudo docker ps -q`

cleanall: stopall
	clean

#
# MISC
#
viz:
	sudo docker images -viz | dot -Tpng -o docker.png

.PHONY: launch omero omerosh pg stopall viz

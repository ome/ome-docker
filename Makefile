startall: pg omero

pg:
	sudo docker run -d -expose 5432 -name PG                                 jm/pg

omero:
	sudo docker run    -expose 4064 -name OMERO -link PG:PG            -t -i jm/omero

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

.PHONY: launch omero pg stopall viz

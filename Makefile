omero:
	sudo docker run -expose 4064 -name OMERO             -t -i jm/pg bash

pg:
	sudo docker run -expose 5432 -name PG    -link OMERO:OMERO jm/pg

clean:
	rm -f docker.png
	sudo docker rm OMERO
	sudo docker rm PG

viz:
	sudo docker images -viz | dot -Tpng -o docker.png

basepg:
	sudo docker run -d -p 5432 -t felix/postgresql /bin/su postgres -c '/usr/lib/postgresql/9.3/bin/postgres  -D /var/lib/postgresql/9.3/main  -c config_file=/etc/postgresql/9.3/main/postgresql.conf'

stopall:
	sudo docker stop `sudo docker ps -q`

.PHONY: launch omero pg stopall viz

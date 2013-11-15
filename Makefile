
viz:
	sudo docker images -viz | dot -Tpng -o docker.png

pg:
	sudo docker run -d -p 5432 -t felix/postgresql /bin/su postgres -c '/usr/lib/postgresql/9.3/bin/postgres  -D /var/lib/postgresql/9.3/main  -c config_file=/etc/postgresql/9.3/main/postgresql.conf'

stopall:
	sudo docker stop `sudo docker ps -q`

.PHONY: viz pg stopall

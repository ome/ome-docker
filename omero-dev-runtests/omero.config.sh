/home/omero/OMERO.server/bin/omero config set omero.data.dir $OMERO_DATA_DIR
/home/omero/OMERO.server/bin/omero config set omero.db.name $OMERO_DB_NAME
/home/omero/OMERO.server/bin/omero config set omero.db.user $OMERO_DB_USER
/home/omero/OMERO.server/bin/omero config set omero.db.pass $OMERO_DB_PASS

/home/omero/OMERO.server/bin/omero config set omero.web.server_list '[["localhost", 4064, "omero"]]'
/home/omero/OMERO.server/bin/omero config set omero.web.application_server wsgi-tcp
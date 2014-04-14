# Postgres with an omero user and empty database
docker build -t manics/omero-grid-db db

# All-in-one OMERO.server with all dependencies, also used as basis for other images
docker build -t manics/omero-grid-omero omero

# OMERO.server excluding Processor
docker build -t manics/omero-grid-omero-server omero-server

# Processor
docker build -t manics/omero-grid-omero-slave omero-slave

# OMERO.web
docker build -t manics/omero-grid-omero-web omero-web


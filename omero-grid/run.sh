docker run -d -p 5432:5432 --name omero-grid-db manics/omero-grid-db

docker run -d -p 4061:4061 -p 4063:4063 -p 4064:4064 --link omero-grid-db:db --name omero-grid-omero-server manics/omero-grid-omero-server

docker run -d --link omero-grid-omero-server:master --name omero-grid-omero-slave manics/omero-grid-omero-slave

docker run -d -p 8080:80 --link omero-grid-omero-server:master --name omero-grid-omero-web manics/omero-grid-omero-web

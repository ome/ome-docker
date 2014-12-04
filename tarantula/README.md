Tarantula Docker image
======================

A [Docker](https://www.docker.com/) image for the [https://github.com/prove/tarantula](Tarantula Test Management Tool).

Example
-------

Build the image, create a data volume and start tarantula (accessible on port 80).

The first time the Tarantula image is run it will create a new database and configure itself using configuration values passed as environment variables (web address of installed Tarantula, admin email, SMTP server address, SMTP port, SMTP domain). On subsequent runs these environment variables will be ignored.

Note that tarantula takes several minutes to initialise due to a pre-compilation step.

    docker build -t tarantula .
    docker run -d --name tarantula-data tarantula \
        echo "Data-only container for tarantula"
    # First time (initialises database using the environment variables)
    docker run -P --volumes-from tarantula-data -e URL=http://localhost/ \
        -e EMAIL=tarantula@example.org -e SMTP_HOST=localhost -e SMTP_PORT=25 \
        -e SMTP_DOMAIN=localhost tarantula
    # Subsequent runs using an existing database
    docker run -P --volumes-from tarantula-data tarantula

To view the tarantula container logs connect to the data volume

    docker run -it --volumes-from tarantula-data centos bash
    $ tail -f /data/log/production.log
    $ tail -f /data/supervisor/tarantula---supervisor-*.log

Issues/RFEs
-----------

- Consider using the [official MySQL Docker image](https://registry.hub.docker.com/_/mysql/)
- Provide some feedback to show when Tarantula has been initialised


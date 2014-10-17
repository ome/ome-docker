Docker image for building OMERO
===============================

For example:

    $ docker build -t omero-build-c6-multienv .
    $ git clone --recursive https://github.com/openmicroscopy/openmicroscopy.git /src/openmicroscopy
    $ docker run -it -v /src/openmicroscopy:/build omero-build-c6-multienv bash -l

    $ groupadd -g <system-group-id> build
    $ useradd -u <system-user-id> build -g build
    $ su - build
    $ cd /build
    $ eval $(/opt/multi-config.sh ice35)
    $ OMERO_BRANCH=x BUILD_NUMBER=0 sh docs/hudson/OMERO.sh

Multiple arguments can be given to multi-config.sh:

  - ice33 ice34 ice35
  - java6 java7
  - python26 python27

E.g. `$ eval $(/opt/multi-config.sh ice35 java7 python27)`
Note Python 2.7 with Ice still needs to be sorted out. PostgreSQL 8.4 and 9.2 are both installed.


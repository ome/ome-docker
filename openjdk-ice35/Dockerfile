FROM felix/openjdk

RUN apt-get install -yy wget
RUN wget http://www.zeroc.com/download/RPM-GPG-KEY-zeroc-release
RUN apt-key add RPM-GPG-KEY-zeroc-release
RUN cd /etc/apt/sources.list.d && wget http://www.zeroc.com/download/Ice/3.5/ubuntu/ice3.5-raring.list
RUN apt-get install -y aptitude
RUN aptitude reinstall libc6
RUN apt-get install -y libc glacier2 ice-utils icegrid icebox libice3.5-python libdb5.3++ libfreeze3.5++ libicestorm3.5 libicestorm3.5


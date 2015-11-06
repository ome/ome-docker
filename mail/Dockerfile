FROM openmicroscopy/omero-base

EXPOSE 2525

RUN wget http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip && \
    unzip fakeSMTP-latest.zip && rm fakeSMTP-latest.zip

CMD java -Djava.awt.headless=true -jar fakeSMTP-1.13.jar -b -s -p 2525

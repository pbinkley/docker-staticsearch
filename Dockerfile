FROM inikolaev/alpine-jdk-ant
MAINTAINER pbinkley <peter.binkley@ualberta.ca>

ADD https://github.com/projectEndings/staticSearch/releases/download/v1.2.0/staticSearch-1.2+2021-03-03.9f0cdfe.zip /opt/staticSearch/

RUN cd /opt/staticSearch ; \
    unzip staticSearch-1.2+2021-03-03.9f0cdfe.zip ; \
    rm staticSearch-1.2+2021-03-03.9f0cdfe.zip ;

RUN apk add --no-cache git

WORKDIR /work

#CMD [ "ant", "-buildfile", "/opt/staticSearch/build.xml", "-DconfigFile=/site" ]

CMD [ "sh" ]

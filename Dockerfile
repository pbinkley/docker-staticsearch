FROM frekele/ant
MAINTAINER pbinkley <peter.binkley@ualberta.ca>

ADD https://github.com/projectEndings/staticSearch/releases/download/v1.2.0/staticSearch-1.2+2021-03-03.9f0cdfe.zip /opt/staticSearch/

RUN cd /opt/staticSearch ; \
    unzip staticSearch-1.2+2021-03-03.9f0cdfe.zip ; \
    rm staticSearch-1.2+2021-03-03.9f0cdfe.zip ;

RUN wget "https://managedway.dl.sourceforge.net/project/ant-contrib/ant-contrib/1.0b3/ant-contrib-1.0b3-bin.tar.gz" ; \
    tar xzf ant-contrib-1.0b3-bin.tar.gz ; \
    mv ant-contrib/ant-contrib-1.0b3.jar /opt/ant/lib/ ; \
    rm -r ant-contrib*

RUN apt update ; \
    apt install -y git-all

WORKDIR /work

CMD [ "ant", "-buildfile", "/opt/staticSearch/build.xml" "-DconfigFile=/site" ]


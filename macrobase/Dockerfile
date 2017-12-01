FROM debian:stretch

RUN apt-get update \
  && apt-get install -y git curl sed vim openjdk-8-jdk python \
  && curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python \
  && pip install psycopg2 \
  && curl -sL http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
   | gunzip \
   | tar x -C /tmp/

RUN ln -svT "/usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture)" /docker-java-home
ENV JAVA_HOME /docker-java-home

RUN cd /opt/ \
  && git clone https://github.com/rockie-yang/macrobase.git \
  && cd macrobase \
  && /tmp/apache-maven-3.3.9/bin/mvn package -DskipTests

## The default sh has some issue e.g. with source
## so explicityly change it to bash as the default
##
RUN ls -al /bin/sh \
	&& rm /bin/sh \
	&& ln -sf /bin/bash /bin/sh

# the frontend require run user as postgres (hand coded)
RUN useradd -ms /bin/bash -p postgres postgres

COPY macrobase.yaml /opt/macrobase/conf/

USER postgres

WORKDIR /opt/macrobase

EXPOSE 8080

CMD ["bin/frontend.sh"]
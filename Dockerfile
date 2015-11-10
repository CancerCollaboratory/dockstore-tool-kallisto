FROM ubuntu:12.04
MAINTAINER help@cancercollaboratory.org
ENV version=0.42.4
RUN apt-get update && apt-get install -y wget
RUN wget --no-check-certificate https://github.com/pachterlab/kallisto/releases/download/v${version}/kallisto_linux-v${version}.tar.gz
RUN tar -xvzf kallisto_linux-v${version}.tar.gz

RUN cp kallisto_linux-v${version}/kallisto /usr/local/bin/
COPY wrapper.sh /opt/kallisto/

RUN mkdir /data && chmod a+wrx /data
WORKDIR /data

USER root
ENTRYPOINT ["sh", "/opt/kallisto/wrapper.sh"]

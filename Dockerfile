# Minecraft Server image

FROM openjdk:8-jre-alpine

LABEL Willem Coetzee <wilco@peachss.co.za>

ENV JAVA_OPTS='-Xmx1024m'
ENV MINECRAFT_FileName='spigot-1.16.3.jar'
ENV MINECRAFT_JAR='https://cdn.getbukkit.org/spigot/'


# Install wget and certificates
RUN     apk update \
    &&  apk add ca-certificates wget bash \
    &&  update-ca-certificates

VOLUME /data
WORKDIR /data

#Download Specified MC version
RUN mkdir -p /opt/minecraft \
&& cd /opt/minecraft \
&&  wget -q -O ${MINECRAFT_FileName} ${MINECRAFT_JAR}${MINECRAFT_FileName}

EXPOSE 25565

ADD ./start.sh /opt
RUN chmod a+x /opt/start.sh

CMD /opt/start.sh
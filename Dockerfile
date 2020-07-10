# Minecraft Server image

FROM openjdk:8-jre-alpine

MAINTAINER Willem Coetzee <wilco@peachss.co.za>

ENV MINECRAFT_FileName=spigot-1.16.1.jar
ENV MINECRAFT_JAR="https://cdn.getbukkit.org/spigot/"

# Install wget and certificates
RUN     apk update \
    &&  apk add ca-certificates wget bash \
    &&  update-ca-certificates

WORKDIR /data
VOLUME /data

RUN cd /data \
    &&  wget -q $MINECRAFT_JAR$MINECRAFT_FileName

EXPOSE 25565

ADD ./minecraft.sh /
RUN chmod a+x /minecraft.sh

RUN echo eula=true > /eula.txt

CMD /data/minecraft.sh
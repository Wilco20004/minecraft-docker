# minecraft-docker

latest version: 1.16.3

To run it you first need to create a data dir (or just mount your existing one into the container): mkdir /minecraft/data

Then you can run this image with a volume containing your data dir, for example:
docker run -d --restart=always -p25565:25565 -v /data/minecraft:/data --name=minecraft wilco20004/docker-minecraft

From 1.14.4, the server accepts also an env variable JAVA_OPTS which can supply configuration to the underlying JVM. This might be used if you wanted your server to have more ram than the default: use it with the -Xmx flag, for example like this: 
docker run -d --restart=always -p25565:25565 -v /data/minecraft:/data -e JAVA_OPTS="-Xmx1024m" --name=minecraft wilco20004/docker-minecraft 
to allow the server to have at most 2Gigs of your ram.

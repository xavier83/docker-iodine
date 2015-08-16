# iodine-docker
Dockerized iodine http://code.kryo.se/iodine/

Update the environment variables in entrypoint.sh before building

sudo docker run -it -p 0.0.0.0:53:53/udp --rm --privileged=true -P --net=host --name iodine xavi/iodine&

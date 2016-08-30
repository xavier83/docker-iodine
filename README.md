# docker-iodine
Dockerized iodine http://code.kryo.se/iodine/

Update the environment variables in "config.env" file before running

Building
=========
`sudo docker build -t xavi/iodine .`

Running
=======
`sudo docker run -d -p 0.0.0.0:53:53/udp --env-file=./config.env --privileged=true -P --net=host --name iodine xavi/iodine`

Retrieving Server details
=========================
`docker logs iodine`

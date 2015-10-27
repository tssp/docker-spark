Yet Another Docker Image for Apache Spark.

## Prerequisites

Follow the instructions on https://docs.docker.com/installation and https://docs.docker.com/compose/install/ to install Docker Engine and Docker Compose.

## Build Docker Container

The container can be build by executing `docker build -t tssp/apache-spark .`.

## Run Modes

Per default the image starts with the Spark Shell for interactive analysis with 2 cores: `docker run -i -t tssp/apache-spark`. 

This can be also overwritten by specifying the command to execute, e.g. `docker run -i -t tssp/apache-spark spark-shell --master local[4]`.

A cluster mode is also supported. For convenience this mode can be started by simply executing `docker-compose up`. This spins up a Spark master and one work with one 1 core and 1gb memory. The cluster can be monitored via the Web-UI on the master: http://<your_host_name>:8080.

The number of workers can be increased by executing the scale command, e.g. `docker-compose scale worker-node=5`. _Note:_ Since all worker nodes run on the same host the Web-UI port can't published on the same port and is therefore omitted. 

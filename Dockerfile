# Yet Another Docker Image for Apache Spark (https://github.com/tssp/docker-spark)
#
# Usage:
#
#  * Standalone: docker pull tssp/apache-spark
#                docker run -d tssp/apache-spark
#
#  * Cluster:    docker-compose up 
#

FROM phusion/baseimage:0.9.17

MAINTAINER tssp <tim@coding-me.com>

# Install necessary packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl openjdk-7-jre && \
    apt-get autoremove -y && \
    apt-get clean


# Prepare environment
ENV SPARK_HOME /opt/apache-spark 
ENV PATH       $SPARK_HOME/sbin:$SPARK_HOME/bin:$PATH

# Download pre-compiled Apache Spark
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz -O /tmp/spark-bin.tgz && \
    tar -xzf /tmp/spark-bin.tgz -C /opt && \
    ln -s /opt/spark-1.5.1-bin-hadoop2.6 $SPARK_HOME && \
    rm -f /tmp/spark-bin.tgz

# Ports for Web-UI and Spark-Master
EXPOSE 8080 8081 7077 6066

# Default mode: Execute Spark Shell
CMD ["spark-shell", "--master","local[2]"]

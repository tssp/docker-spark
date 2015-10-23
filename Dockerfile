# https://github.com/tssp/docker-spark

FROM ubuntu:15.10

MAINTAINER tssp <tim@coding-me.com>

# Update installed packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y wget openjdk-8-jdk

# Cleanup
RUN apt-get autoremove -y && apt-get clean

# Download pre-compiled Apache Spark
RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz -O /tmp/spark-bin.tgz

# Prepare environment
ENV SPARK_HOME /opt/apache-spark 
ENV PATH       $SPARK_HOME/sbin:$SPARK_HOME/bin:$PATH

# Extract and clean up 
RUN tar -xzf /tmp/spark-bin.tgz -C /opt && ln -s /opt/spark-1.5.1-bin-hadoop2.6 $SPARK_HOME && rm -f /tmp/spark-bin.tgz

# Expose ports
EXPOSE 8080 8081 7077

# Default mode: Execute Spark Shell
CMD ["spark-shell", "--master","local[2]"]

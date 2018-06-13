FROM ubuntu:latest

# apt-get install
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

# get dynamodb
RUN mkdir /usr/local/dynamodb
RUN cd /usr/local/dynamodb && \
    wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz && \
    tar zxvf dynamodb_local_latest.tar.gz

# start
RUN mkdir /usr/local/dynamodb/db
CMD ["java", "-Djava.library.path=/usr/local/dynamodb/DynamoDBLocal_lib", "-jar", "/usr/local/dynamodb/DynamoDBLocal.jar", "-dbPath", "/usr/local/dynamodb/db"]
EXPOSE 8000

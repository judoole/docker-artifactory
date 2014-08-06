FROM ubuntu:12.04
MAINTAINER Ole Christian Langfjæran "judoole@gmail.com"

RUN apt-get update && apt-get clean
RUN apt-get install -q -y openjdk-7-jre-headless 
RUN apt-get install -y curl 
RUN apt-get install -y unzip
RUN apt-get clean
RUN apt-get remove
ADD http://dl.bintray.com/content/jfrog/artifactory/artifactory-3.3.0.zip?direct /tmp/artifactory.zip
RUN unzip /tmp/artifactory.zip -d /
RUN rm -rf /tmp/artifactory.zip

RUN ln -s /artifactory-3.3.0/data /data
VOLUME /data
EXPOSE 8081
CMD ["/artifactory-3.3.0/bin/artifactory.sh"]

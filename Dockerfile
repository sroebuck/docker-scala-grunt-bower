FROM ubuntu:14.04
MAINTAINER Stuart Roebuck <stuart.roebuck@gmail.com>

WORKDIR /root

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

# Install add-apt-repository command
RUN apt-get -y install software-properties-common
# Add repository for latest git
RUN add-apt-repository ppa:git-core/ppa
# Add repository for Oracle Java
RUN add-apt-repository ppa:webupd8team/java
# Add repository for node.js & npm
RUN add-apt-repository ppa:chris-lea/node.js

ENV REFRESHED_AT 2014-06-29
RUN apt-get update

# Set default language
ENV LANG en_US.UTF-8

# Install latest git
RUN apt-get -y install git

# Install mg - microscopic GNU Emacs-style editor
RUN apt-get -y install mg

# Accept the Oracle Java license
RUN echo "oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
# Install Oracle Java
RUN apt-get -y install oracle-java7-installer

# Install Scala
RUN wget http://www.scala-lang.org/files/archive/scala-2.10.4.deb
RUN apt-get -y install libjansi-java
RUN dpkg -i scala-2.10.4.deb
RUN apt-get -y install scala

# Install sbt
RUN wget http://dl.bintray.com/sbt/debian/sbt-0.13.5.deb
RUN dpkg -i sbt-0.13.5.deb
RUN apt-get -y install sbt
ENV SBT_OPTS -XX:PermSize=384m -Xmx2G -Xss2M -XX:+DoEscapeAnalysis -XX:+UseCompressedOops -XX:+CMSClassUnloadingEnabled
# Run sbt to pull down and cache the critical dependencies for running sbt on its own
# Disable right now as it was generating a `java.lang.StringIndexOutOfBoundsException: String index out of range: 1` error!
# RUN sbt about

# Install play
RUN wget http://downloads.typesafe.com/play/2.2.3/play-2.2.3.zip
RUN apt-get -y install unzip
RUN unzip play-2.2.3.zip
RUN mv play-2.2.3 /usr/share/play
RUN chmod +x /usr/share/play/play
RUN ln -s /usr/share/play/play /usr/bin/play

# Install node.js & npm
RUN apt-get -y install nodejs

# Install grunt and bower on the command line
RUN npm install -g grunt
RUN npm install -g grunt-cli
RUN npm install -g bower




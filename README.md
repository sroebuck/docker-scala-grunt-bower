docker-scala-grunt-bower
========================

A docker image build on Ubuntu:14.04 with the following installed on top:

    emacs
    Oracle Java 7
    Scala 2.10.4
    sbt 0.14.5
    node.js
    npm
    grunt
    grunt-cli
    bower

It also has the environment set with:

ENV LANG en_US.UTF-8
ENV SBT_OPTS -XX:PermSize=384m -Xmx2G -Xss2M -XX:+DoEscapeAnalysis -XX:+UseCompressedOops -XX:+CMSClassUnloadingEnabled


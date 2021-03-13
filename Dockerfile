FROM alpine:latest

ARG SBT_VERSION=1.3.13

RUN apk add --no-cache bash

ENV JAVA_HOME="/usr/lib/jvm/default-jvm/"
RUN apk add openjdk11-jre
ENV PATH=$PATH:${JAVA_HOME}/bin

RUN \
	wget -O sbt-$SBT_VERSION.tgz https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
  	tar -xzvf sbt-$SBT_VERSION.tgz && \
  	rm sbt-$SBT_VERSION.tgz

ENV PATH=$PATH:sbt/bin/
RUN sbt sbtVersion

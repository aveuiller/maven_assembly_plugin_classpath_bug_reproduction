#!/bin/bash

LOCAL_JAR=AutomatedBuild.jar
LIB_DIR=lib

# TODO: assert that 'mvn package' has been run on the project
if [ ! -e "$LOCAL_JAR" ]; then
  ln -s ../target/TestFatJarUse.jar $LOCAL_JAR
fi

java -jar $LOCAL_JAR

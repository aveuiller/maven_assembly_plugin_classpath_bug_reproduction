#!/bin/bash

LOCAL_JAR=AutomatedBuild.jar
LIB_DIR=lib

# Assert that 'mvn package' has been run on the project
if [ ! -e "$LOCAL_JAR" ]; then
  ln -s ../target/TestFatJarUse.jar $LOCAL_JAR
fi

# Assert that the manual experiment jar is built
if [ ! -e "$LIB_DIR" ]; then
  ln -s ../manual_experiment/lib lib
fi

java -jar $LOCAL_JAR


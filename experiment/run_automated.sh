#!/bin/bash
# This script will retrieve the Maven built package and try the same operation
# as in the manual run script.

LOCAL_JAR=AutomatedBuild.jar

# TODO: assert that 'mvn package' has been run on the project
if [ ! -e "$LOCAL_JAR" ]; then
  ln -s ../target/TestFatJarUse-jar-with-dependencies.jar $LOCAL_JAR
fi

java -jar $LOCAL_JAR

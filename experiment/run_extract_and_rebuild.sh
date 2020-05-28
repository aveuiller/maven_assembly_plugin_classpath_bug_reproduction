#!/bin/bash
# This script will extract the previous jar and rebuild the exact same jar.
# Then try the same command as before

AUTO_JAR="AutomatedBuild.jar"
LOCAL_JAR="Rebuilt.jar"
BUILD_DIR=".rebuild_automated"

if [ ! -e "$AUTO_JAR" ]; then
  echo "Unable rebuild automated jar, run the automated test first."
  exit 1;
fi

# Re-building the same jar file
rm -rf ./$BUILD_DIR; mkdir $BUILD_DIR; cd $BUILD_DIR;
cp ../$AUTO_JAR .
unzip $AUTO_JAR && rm $AUTO_JAR
jar cfm $LOCAL_JAR META-INF/MANIFEST.MF *
cp $LOCAL_JAR ../
cd ..

java -jar $LOCAL_JAR

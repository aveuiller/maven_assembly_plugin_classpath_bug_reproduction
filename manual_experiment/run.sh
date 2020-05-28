#!/bin/bash
# Heavily inspired from https://stackoverflow.com/questions/45361379/jre-not-using-classpath-specified-by-manifest-file-of-runnable-jar

LOCAL_JAR=ManualBuild.jar
LIBRARY_JAR=jar_1.jar
SRC_DIR="../src/main/java/exe"

# Build library jar
javac jar_1/ClassInJar1.java
jar cf "lib/$LIBRARY_JAR" jar_1/ClassInJar1.class

# Build main jar
javac $SRC_DIR/MyMain.java -d .
jar cfm $LOCAL_JAR manifest exe/MyMain.class

# Execute main jar
java -jar $LOCAL_JAR

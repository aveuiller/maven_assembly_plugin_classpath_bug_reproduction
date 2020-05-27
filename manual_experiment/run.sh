#!/bin/bash

# Prepare directory
mkdir lib 

# Build library jar
javac jar_1/ClassInJar1.java
jar cf lib/jar_1.jar jar_1/ClassInJar1.class

# Build main jar
javac exe/myMain.java
jar cfm myJar.jar manifest exe/MyMain.class

# Execute main jar
java -jar myJar.jar

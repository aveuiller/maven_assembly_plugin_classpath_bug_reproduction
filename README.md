# Validate maven assembly jar classpath

During some experiments I found an inconsistent behavior on JAR files with custom classpath
generated using the [maven assembly plugin](https://maven.apache.org/plugins/maven-assembly-plugin/).

This project is here to validate that we can actually build correctly a jar with a custom class-path
entry in the manifest pointing to another jar file.

To try the project, simply run `./try_me_out.sh`. This will run the manual then automated experiments.

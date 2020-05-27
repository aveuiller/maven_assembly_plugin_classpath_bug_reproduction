package exe;

import java.net.*;
import jar_1.ClassInJar1;

public class MyMain {
    public static void main(String[] args) {
        ClassLoader cl = ClassLoader.getSystemClassLoader();
        URL[] urls = ((URLClassLoader) cl).getURLs();
        for (URL url : urls) {
            System.out.println(url.getFile());
        }

        System.out.println("Trying to load...");
        try {
            System.out.println("...jar_1.ClassInJar1...");
            cl.loadClass("jar_1.ClassInJar1");

            System.out.println("...fr.inria.sniffer.tracker.analysis.persistence.SmellCategory...");
           cl.loadClass("fr.inria.sniffer.tracker.analysis.persistence.SmellCategory");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Loaded");

        ClassInJar1.method();
    }
}


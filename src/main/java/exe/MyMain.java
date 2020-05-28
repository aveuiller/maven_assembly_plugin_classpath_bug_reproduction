package exe;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.Collections;
import java.util.List;

public class MyMain {
    public static void main(String[] args) {
        ClassLoader cl = ClassLoader.getSystemClassLoader();

        showClasspath(cl);

        String qualifiedName = "jar_1.ClassInJar1";
        List<String> qualifiedNames = Collections.singletonList(qualifiedName);
        tryImports(cl, qualifiedNames);
    }

    private static void showClasspath(ClassLoader cl) {
        URL[] urls = ((URLClassLoader) cl).getURLs();

        System.out.println("Configured classpath:");
        for (URL url : urls) {
            System.out.println("\t - " + url.getFile());
        }
        System.out.println("----------");
    }

    private static void tryImports(ClassLoader cl, List<String> qualifiedNames) {

        System.out.println("Trying to load...");
        try {
            for (String qualifiedName : qualifiedNames) {
                System.out.println("..." + qualifiedName + "...");
                cl.loadClass(qualifiedName);
            }
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println("Loaded");
    }
}

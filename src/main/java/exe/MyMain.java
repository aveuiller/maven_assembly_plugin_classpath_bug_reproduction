package exe;

import java.net.URL;
import java.net.URLClassLoader;
import java.util.Collections;
import java.util.List;

public class MyMain {
    public static void main(String[] args) {
        ClassLoader cl = ClassLoader.getSystemClassLoader();

        showClasspath(cl);

        String qualifiedName = "fr.inria.sniffer.tracker.analysis.persistence.SmellCategory";
        List<String> qualifiedNames = Collections.singletonList(qualifiedName);
        tryImports(cl, qualifiedNames);
    }

    private static void showClasspath(ClassLoader cl) {
        URL[] urls = ((URLClassLoader) cl).getURLs();
        for (URL url : urls) {
            System.out.println(url.getFile());
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

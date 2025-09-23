/*
 * > kotlinc Hello.kt -d hello.jar
 * > javac -cp hello.jar Main.java
 * > kotlin -cp .:hello.jar Main
 *
 */
public class Main {
    public static void main(String[] args) {
        HelloKt.hello("java");
    }
}


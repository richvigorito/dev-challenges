public class Swap {

    // Java is always pass by value
    public static int[] swapByValue(int a, int b) {
        return new int[] {b, a};  // Return an array with swapped values
    }

    public static void main(String[] args) {
        int a = 5, b = 3;

        System.out.println("Before: a=" + a + ", b=" + b);
        int[] swapped = swapByValue(a, b);
        System.out.println("After swapByValue: a=" + swapped[0] + ", b=" + swapped[1]);
    }
}


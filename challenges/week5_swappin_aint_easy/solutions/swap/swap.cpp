#include <iostream>
#include <array>

void xorswap_by_reference(int &a, int &b) {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}

std::array<int, 2> swap_by_value(int a, int b) {
    return {b, a};
}

int main() {
    int x = 5;
    int y = 3;

    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;

    xorswap_by_reference(x, y);
    std::cout << "After xor swap: x = " << x << ", y = " << y << std::endl;

    auto swapped = swap_by_value(x, y);
    std::cout << "Returned swapped values: x = " << swapped[0] << ", y = " << swapped[1] << std::endl;
    std::cout << "After swap by value: x = " << x << ", y = " << y << std::endl;
    std::cout << "----  note, x havent changed." << std::endl;

    
    return 0;
}

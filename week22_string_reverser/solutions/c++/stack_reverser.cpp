#include <iostream>
#include <stack>
#include <string>
#include <cassert>

std::string reverseString(const std::string &str) {
	
	std::stack<char> tmp;
	std::string reversed;


	for(const char& c : str) {
		tmp.push(c);
	}

	while(!tmp.empty()){
		reversed += tmp.top();
		tmp.pop();
	}


	return reversed;
}

// Test cases for reverseString function
void testReverseString() {
    assert(reverseString("hello") == "olleh");
    assert(reverseString("") == "");
    assert(reverseString("a") == "a");
    assert(reverseString("madam") == "madam");
    assert(reverseString("12345") == "54321");
    assert(reverseString("abc123") == "321cba");

    std::cout << "All tests passed!" << std::endl;
}

int main() {
    testReverseString();
    
    std::string input;
    std::cout << "Enter a string to reverse: ";
    std::cin >> input;
    std::cout << "Reversed string: " << reverseString(input) << std::endl;

    return 0;
}


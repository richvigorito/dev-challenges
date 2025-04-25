# reverse_string.py

import unittest

def reverse_string(s: str) -> str:
    stack = []  # Initialize the stack
    
    # Push all characters onto the stack
    for char in s:
        stack.append(char)
    
    reversed_string = ""  # This will hold the reversed string
    
    # Pop characters from the stack and append to reversed_string
    while stack:
        reversed_string += stack.pop()
    
    return reversed_string

# Unit tests for reverse_string function
class TestReverseString(unittest.TestCase):
    """
    Test case for reverse_string function.
    """

    def test_reverse_hello(self):
        self.assertEqual(reverse_string("hello"), "olleh")

    def test_reverse_empty_string(self):
        self.assertEqual(reverse_string(""), "")

    def test_reverse_single_char(self):
        self.assertEqual(reverse_string("a"), "a")

    def test_reverse_palindrome(self):
        self.assertEqual(reverse_string("madam"), "madam")

    def test_reverse_numbers(self):
        self.assertEqual(reverse_string("12345"), "54321")

    def test_reverse_mixed(self):
        self.assertEqual(reverse_string("abc123"), "321cba")

# Run the tests when the file is executed directly
if __name__ == '__main__':
    unittest.main()

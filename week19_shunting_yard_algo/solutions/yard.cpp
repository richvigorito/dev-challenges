#include <iostream>
#include <stack>
#include <string>
#include <sstream>
#include <cctype>
#include <map>

using namespace std;

bool isOperator(char c) {
    return c == '+' || c == '-' || c == '*' || c == '/' || c == '^';
}

int precedence(char op) {
    switch (op) {
        case '+':
        case '-': return 1;
        case '*':
        case '/': return 2;
        case '^': return 3; 
    }
    return 0;
}

bool isRightAssociative(char op) {
    return op == '^';
}

string shuntingYard(const string& expr) {
    stack<char> opStack;
    stringstream output;

    for (size_t i = 0; i < expr.length(); ++i) {
        char token = expr[i];

        if (isspace(token)) continue;

        if (isdigit(token)) {
            // Read full number
            while (i < expr.length() && (isdigit(expr[i]) || expr[i] == '.')) {
                output << expr[i++];
            }
            output << ' ';
            --i; 
        } else if (isOperator(token)) {
            while (!opStack.empty() && isOperator(opStack.top())) {
                char topOp = opStack.top();
                if ((isRightAssociative(token) && precedence(token) < precedence(topOp)) ||
                    (!isRightAssociative(token) && precedence(token) <= precedence(topOp))) {
                    output << topOp << ' ';
                    opStack.pop();
                } else {
                    break;
                }
            }
            opStack.push(token);
        } else if (token == '(') {
            opStack.push(token);
        } else if (token == ')') {
            while (!opStack.empty() && opStack.top() != '(') {
                output << opStack.top() << ' ';
                opStack.pop();
            }
            if (!opStack.empty()) opStack.pop(); // pop '('
        }
    }

    while (!opStack.empty()) {
        output << opStack.top() << ' ';
        opStack.pop();
    }

    return output.str();
}

int main() {
    string expr;
    cout << "Enter infix expression: ";
    getline(cin, expr);

    string postfix = shuntingYard(expr);
    cout << "Postfix (RPN): " << postfix << endl;

    return 0;
}


#include <iostream>
#include <string>

// if you want a hint for what principles are broken
// decode the following hex strings
// 53 52 50 
// 44 49 50
// 4c 53 50

class Button {
public:
    void render() {
        std::cout << "Rendering Button" << std::endl;
    }

    void onClick() {
        std::cout << "Saving to database directly..." << std::endl;
        // Actual DB logic
    }
};


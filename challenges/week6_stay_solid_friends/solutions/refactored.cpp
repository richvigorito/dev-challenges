#include <iostream>
#include <vector>
#include <memory>
#include <string>

using namespace std;

/* 
 * broken solid principle's:  SRP, DIP, LSP
 *
 *
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
*/

///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////

/*
 * refactored code addresses the following:
 *
 * SRP: Button class no longer responsible for rending AND saving to db 
 * DIP: Button is a highlevel component no longer depends on a low level component (the db). 
 * LSP: The original design made it difficult to extend or substitute behaviors 
 *      (e.g., mocking or stubbing in tests), which limited LSP flexibility
 */
class ClickEvent {
public:
    virtual void clicked(const string& data) const = 0;
    virtual ~ClickEvent() {}
};

class DatabasePersistentClickEvent : public ClickEvent {
public:
    void clicked(const string& data) const override {
        cout << "Saving '" << data << "' to the database..." << endl;
    }
};

class AlertClickEvent : public ClickEvent {
public:
    void clicked(const string& data) const override {
        cout << "ALERT: " << data << endl;
    }
};

class Button {
    vector<shared_ptr<ClickEvent>> clickEvents;

public:
    // Variadic constructor with parameter pack
    template<typename... Events>
    Button(Events... events) {
        (clickEvents.push_back(events), ...);  // Fold expression (C++17)
    }

    void render() const {
        cout << "Rendering Button..." << endl;
    }

    void onClick(const string& data) const {
        for (const auto& event : clickEvents) {
            event->clicked(data);
        }
    }
};

int main() {
    auto dbEvent = make_shared<DatabasePersistentClickEvent>();
    auto alertEvent = make_shared<AlertClickEvent>();

    Button btn(dbEvent, alertEvent);
    btn.render();
    btn.onClick("User clicked submit");

    return 0;
}

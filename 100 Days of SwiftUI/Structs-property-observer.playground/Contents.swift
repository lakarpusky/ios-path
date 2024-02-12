import Cocoa

// TOPIC: How to take action when a property changes

//.. 👀 don't put to much work in your property observers
struct App {
    var contacts = [String]() {
        // .. value is about to change
        willSet {
            print("current value is: \(contacts)")
            print("new value will be: \(newValue)")
        }
        
        // .. value has changed
        didSet {
            print("there are now \(contacts.count) contacts")
            print("old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("adrian")
app.contacts.append("allen")
app.contacts.append("ish")

import Cocoa

// TOPIC: How to limit access to internal data using access control

// .. private: don't let anything outside the struct use this
// .. fileprivate: don't let anything outside the current file use this
// .. public: let anyone, anywhere use this
// .. private(set): let anyone read, but only internal methods to write it

struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        }
        
        return false
    }
}

var account = BankAccount()
account.deposit(amount: 100)
print(account.funds)
account.withdraw(amount: 30)
print(account.funds)

// .. tip: if you have "private" access control its a good chance to create your own initializer

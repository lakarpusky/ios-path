import UIKit


// === How to limit access to internal data using access control === //


struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        }
        
        return false
    }
}

// .. to deposit and withdraw money from a bank account
var account = BankAccount()

account.deposit(amount: 100)
let access =  account.withdraw(amount: 200)

if access {
    print("withdrew money successfully")
} else {
    print("failed to get the money")
}

// .. swift provide us several options, while learning you'll only need a handful

// .. 1. "private": don't let anything outisde the struct use this
// .. 2. "fileprivate": don't let anything outside the current file use this
// .. 3. "public": let aynyone, anywhere use this
// .. 4. "private(set)": let anyone read this property, but only let my methods write it

struct Empty {
    var string: String
    var int: Int
    private var privated = "hell"
    
    init(string: String, int: Int) {
        self.string = string
        self.int = int
    }
}

let empty = Empty(string: "string", int: 2)

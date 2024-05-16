//
//  User.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/13/24.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthData = Date()
    var extraNapkins = false
    var frequentRefills = false
}

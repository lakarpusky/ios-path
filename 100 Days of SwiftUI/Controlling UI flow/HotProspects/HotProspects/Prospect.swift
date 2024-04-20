//
//  Prospects.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/19/24.
//

import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    var icon: String {
        self.isContacted ? "person.crop.circle.fill.badge.checkmark" : "person.crop.circle.badge.xmark"
    }
    
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}

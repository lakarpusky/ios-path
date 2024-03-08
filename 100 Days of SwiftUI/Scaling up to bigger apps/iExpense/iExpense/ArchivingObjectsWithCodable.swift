//
//  ArchivingObjectsWithCodable.swift
//  iExpense
//
//  Created by ☕️ Gabo.montero on 3/7/24.
//

import SwiftUI

// .. :: Codable ::
// .. for archiving and unarchiving data
// .. - converting objects into plain text and back again -
struct User2: Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingObjectsWithCodable: View {
    @State private var user = User2(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingObjectsWithCodable()
}

//
//  IntroductionSwiftData.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/17/24.
//

import SwiftData
import SwiftUI

// .. SwiftData: is an object graph and persistence framework
// .. -
// .. - it let us define objects and properties of those opjects,
// .. then let us read and write them from permanent storage -

// .. How to set up SwiftData by hand

struct IntroductionSwiftData: View {
    // .. retrieving info from SwiftData is done using a (query)
    // .. enough to make SwiftData loads students from its (model container)
    @Query var students: [Student] // .. so we'll just get all of them
    
    // .. we need to access the (model context) that was created earlier
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()
                    let chosenLastName = lastNames.randomElement()
                    
                    let student = Student(
                        id: UUID(),
                        name: "\(String(describing: chosenFirstName)) \(String(describing: chosenLastName))"
                    )
                    
                    // to ask our (model context) to add the new student
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    IntroductionSwiftData()
}

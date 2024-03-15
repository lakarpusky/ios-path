//
//  AddActivityView.swift
//  HabitTracking
//
//  Created by ☕️ Gabo.montero on 3/15/24.
//

import SwiftUI

struct AddActivityView: View {
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Form {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
                .font(.subheadline.bold())
                .padding()
            }
            .navigationTitle("Add New Activity")
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.all, edges: .bottom)
            .toolbar {
                Button("Save") {
                    let item = Activity(title: title, description: description)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let activities = Activities()
    return AddActivityView(activities: activities)
}

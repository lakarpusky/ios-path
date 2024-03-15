//
//  ActivityDetailView.swift
//  HabitTracking
//
//  Created by ☕️ Gabo.montero on 3/15/24.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity
    let activities: Activities
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.description)
                .foregroundStyle(.secondary)
                .font(.title)
            
            HStack {
                Text("Completion Count: \(activity.completionCount)")
                    .foregroundStyle(.brown)
                
                Spacer()
                
                Button {
                    var newActivity = activity
                    newActivity.completionCount += 1 // .. add 1 to its completion count
                    
                    // .. to find where the previous activity was in the class array
                    if let index = activities.items.firstIndex(of: activity) {
                        activities.items[index] = newActivity // .. change it to be the new activity
                    }
                } label: {
                    Image(systemName: "goforward.plus")
                }
            }
            
            Spacer()
        }
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    let activities = Activities()
    let activity = Activity(title: "Title", description: "Description")
    
    return NavigationStack {
        ActivityDetailView(
            activity: activity,
            activities: activities
        )
    }
}

//
//  ContentView.swift
//  HabitTracking
//
//  Created by ☕️ Gabo.montero on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationStack {
            List(activities.items) { activity in
                NavigationLink {
                    ActivityDetailView(
                        activity: activity,
                        activities: activities
                    )
                } label: {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(activity.title)
                            Text(activity.description)
                                .foregroundStyle(.secondary)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        Image(systemName: "\(activity.completionCount).circle")
                            .padding(.horizontal)
                            .font(.title2)
                            .foregroundStyle(.brown)
                    }
                }
            }
            .navigationTitle("Habit ⏱️ Tracking")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddActivity, onDismiss: didDismiss ) {
            AddActivityView(activities: activities)
        }
    }
    
    func didDismiss() {
        showAddActivity = false
    }
}

#Preview {
    ContentView()
}

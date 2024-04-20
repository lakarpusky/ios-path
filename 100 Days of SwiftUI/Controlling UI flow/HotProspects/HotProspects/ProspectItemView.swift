//
//  ProspectItemView.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/20/24.
//

import SwiftUI
import SwiftData
import UserNotifications

struct ProspectItemView: View {
    @Environment(\.modelContext) var modelContext
    var prospect: Prospect
    
    var body: some View {
        NavigationLink(destination: EditProspectView(prospect: prospect)) {
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                
                HStack(alignment: .top) {
                    Spacer()
                    Image(systemName: prospect.icon)
                        .foregroundStyle(prospect.isContacted ? .green : .blue)
                }
            }
        }
        .swipeActions {
            Button("Delete", systemImage: "trash", role: .destructive) {
                modelContext.delete(prospect)
            }
            
            Button("Remaind Me", systemImage: "bell") {
                addNotification(for: prospect)
            }
            .tint(.orange)
            
            if prospect.isContacted {
                Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                    prospect.isContacted.toggle()
                }
                .tint(.blue)
            } else {
                Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                    prospect.isContacted.toggle()
                }
                .tint(.green)
            }
        }
        .tag(prospect) // help Swift UI understand each row corresponds to a single prospect
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9 // .. it will trigger the next time (9am) comes about
            
            // .. for testing purposes:
            // .. shows the alert five seconds from now.
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            //let trigger = UNCalendarNotificationTrigger(
                //dateMatching: dateComponents,
                //repeats: false
            //)
            
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: trigger
            )
            
            center.add(request)
        }
        
        // .. to make sure we only schedule notifications when allowed, will use the (addRequest) closure
        // .. same code can be used if we have permission already of if we ask and have been granted permission.
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    let item = Prospect(
        name: "Gabo.montero",
        emailAddress: "lakarpusky@gmail.com",
        isContacted: false
    )
    
    return NavigationStack {
        ProspectItemView(prospect: item)
            .modelContainer(for: Prospect.self, inMemory: true)
    }
}

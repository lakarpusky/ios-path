//
//  SchedulingLocalNotifications.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/17/24.
//

import SwiftUI
import UserNotifications

struct SchedulingLocalNotifications: View {
    var body: some View {
        VStack {
            // .. using local notifications requires asking the user for permission,
            Button("Request Permission") {
                UNUserNotificationCenter
                    .current()
                    .requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error {
                            print(error.localizedDescription)
                        }
                    }
            }
            .buttonStyle(.bordered)
            .tint(.orange)
            
            // if the user grants permission, then we're all clear to start scheduling notifications
            // .. then actually registering the notifications we want to show.
            Button("Schedule Notification") {
                /**
                 * Apple breaks them down into three parts:
                 * -------
                 * 1. The content is what should be shown, and can be a title, subtitle, sound, image, and so on.
                 *
                 * 2. The trigger determines when the notification should be shown, and can be a number of seconds from now,
                 *   from now, a date and time in the future, or a location.
                 *
                 * 3. The request combines the content and trigger, but also adds a unique identifier so you
                 *   can edit or remove specific alerts latern on.
                 */
                
                // .. when just learning, the easiest trigger type to use is:
                let content = UNMutableNotificationContent()
                // .. which lets us request a notification to be shown in a certain number of seconds from now
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // choose a random identifier
                let request = UNNotificationRequest(
                    // .. if you don't want to edit or remove stuff,
                    identifier: UUID().uuidString, // .. use (UUID().uuidString) to get a random identifier
                    content: content,
                    trigger: trigger
                )
                
                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
            .buttonStyle(.bordered)
            .tint(.blue)
        }
    }
}

#Preview {
    SchedulingLocalNotifications()
}

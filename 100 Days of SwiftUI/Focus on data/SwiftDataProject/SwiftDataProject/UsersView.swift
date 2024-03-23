//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by ☕️ Gabo.montero on 3/23/24.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    
    // .. passing a value into the view using an initializer
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        // .. using that to create the query
        // .. we're trying to change the SwiftData query that produes the array
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate // .. show all users or just user who are joining in the future
        }, sort: sortOrder)
    }
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text(String(user.jobs?.count ?? 0))
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
        }
    }
}

#Preview {
    UsersView(
        minimumJoinDate: .now,
        sortOrder: [SortDescriptor(\User.name)]
    )
    .modelContainer(for: User.self, inMemory: true)
}

//
//  CreatingTabsWithTabViewAndTabItem.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/14/24.
//

import SwiftUI

struct CreatingTabsWithTabViewAndTabItem: View {
    @State private var selectedTab = "One" // to track the current tab
    
    var body: some View {
        // should be the parent view, with the tabs inside it having a (NavigationStack) as necessary
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .tabItem { // lets you customize the way is shown in the tab bar
                    Label("One", systemImage: "star")
                }
                .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two") // we can attach a unique identifier to each view
            
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("Three", systemImage: "map")
            }
            .tag("Three")
        }
    }
}

#Preview {
    CreatingTabsWithTabViewAndTabItem()
}

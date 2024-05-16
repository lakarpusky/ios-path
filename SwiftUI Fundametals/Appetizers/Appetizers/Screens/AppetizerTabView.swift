//
//  ContentView.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

struct AppetizerTabView: View {
    // .. injecting the order from environment
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}

#Preview {
    let order = Order()
    return AppetizerTabView()
        .environmentObject(order)
}

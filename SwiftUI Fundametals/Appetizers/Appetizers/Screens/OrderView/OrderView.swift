//
//  OrderView.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

struct OrderView: View {
    // .. we access the "order" object from the environment
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        //
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandarButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have not items in your order. \nPlease add an appetizer!"
                    )
                }
            }
            .navigationTitle("📝 Order")
        }
    }
}

#Preview {
    let order = Order()
    return OrderView().environmentObject(order)
}

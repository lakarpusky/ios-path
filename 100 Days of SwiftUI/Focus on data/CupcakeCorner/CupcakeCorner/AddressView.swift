//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by ☕️ Gabo.montero on 3/16/24.
//

import SwiftUI

struct AddressView: View {
    // .. we haven't use @State because we aren't creating the class here, we're just receiving it
    // .. so SwiftUI doesn't have access to the same two-way bindings
    // .. -
    // .. we know this class uses the (@Observable) macro
    // .. so what the (@Bindable) wrapper does is create the missing bindings for us
    // .. -
    // .. it produces two-way bindings that are able to work with the (@Observable) macro,
    // .. wtichout having yo use @State to create local data.
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}

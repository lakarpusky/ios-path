//
//  Menu.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI

struct Menu: View {
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        VStack {
            NavigationLink(destination: CartView(homeData: homeData)) {
                HStack(spacing: 15) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundStyle(.pink)
                    
                    Text("Cart")
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Version 0.1")
                    .fontWeight(.bold)
                    .foregroundStyle(.pink)
            }
            .padding(10)
        }
        .padding([.top, .trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}

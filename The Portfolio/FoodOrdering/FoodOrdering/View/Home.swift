//
//  Home.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/4/24.
//

import SwiftUI

struct Home: View {
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation(.easeIn) {
                            HomeModel.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundStyle(.pink)
                    }
                    
                    Text(HomeModel.userLocation == nil ? "Locating... " : "Deliver to")
                        .foregroundStyle(.black)
                    
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                    
                    Spacer(minLength: 0)
                }
                .padding([.horizontal, .top])
                
                Divider()
                
                HStack(spacing: 15) {
                    TextField("Search", text: $HomeModel.search)
                    
                    if HomeModel.search != "" {
                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundStyle(.gray)
                        }
                        .animation(.easeIn, value: HomeModel.search)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Divider()
                
                Spacer()
            }
            
            // .. side menu
            HStack {
                Menu(homeData: HomeModel)
                    // .. move effect from left
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                Spacer(minLength: 0)
            }
            .background(
                Color.black
                    .opacity(HomeModel.showMenu ? 0.3 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            HomeModel.showMenu.toggle()
                        }
                    }
            )
            
            // .. non closable alert if permission denied
            if HomeModel.noLocation {
                Text("Please enable Location Access in Settings to further move on!!!")
                    .foregroundStyle(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
            }
        }
        .onAppear(perform: {
            // .. calling location delegate
            HomeModel.locationManager.delegate = HomeModel
            
        })
    }
}

#Preview {
    Home()
}

//
//  CartView.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    @ObservedObject  var homeData: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundStyle(.black)
                }
                
                Text("My Cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Spacer()
            }
            .padding()
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(homeData.cartItems) { cart in
                        // .. Cart item view
                        HStack(spacing: 15) {
                            WebImage(url: URL(string: cart.item.item_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(cart.item.item_name)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                
                                Text(cart.item.item_details)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                                    .lineLimit(2)
                                
                                HStack(spacing: 15) {
                                    Text(homeData.getPrice(value: Float(truncating: cart.item.item_cost)))
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    
                                    Spacer(minLength: 0)
                                    
                                    // .. Add - Sub button
                                    Button(action: {
                                        if cart.quantity > 1 {
                                            let cartIndex = homeData.getIndex(item: cart.item, isCartIndex: true)
                                            homeData.cartItems[cartIndex].quantity -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundStyle(.black)
                                    }
                                    
                                    Text("\(cart.quantity)")
                                        .fontWeight(.heavy)
                                        .foregroundStyle(.black)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 10)
                                        .background(Color.black.opacity(0.06))
                                    
                                    Button(action: {
                                        let cartIndex = homeData.getIndex(item: cart.item, isCartIndex: true)
                                        homeData.cartItems[cartIndex].quantity += 1
                                    }) {
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundStyle(.black)
                                    }
                                }
                            }
                        }
                        .padding()
                        .contextMenu {
                            // .. for deleting order
                            Button(action: {
                                // .. deleting items from cart
                                let index = homeData.getIndex(item: cart.item, isCartIndex: false)
                                let cartIndex = homeData.getIndex(item: cart.item, isCartIndex: true)
                                
                                homeData.items[index].isAdded = false
                                homeData.filtered[index].isAdded = false
                                homeData.cartItems.remove(at: cartIndex)
                            }) {
                                Text("Remove")
                            }
                        }
                    }
                }
            }
            
            // .. bottom view
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundStyle(.gray)
                    
                    Spacer()
                    // .. calculating Total Price
                    Text(homeData.calculatedTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                }
                .padding([.top, .horizontal])
                
                Button(action: homeData.updateOrder) {
                    Text(homeData.ordered ? "Cancel Order" : "Check Out")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .background(.white)
        }
        //.background(Color.gray.ignoresSafeArea())
        .toolbar(.hidden)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    @ObservedObject var homeData = HomeViewModel()
    return CartView(homeData: homeData)
}

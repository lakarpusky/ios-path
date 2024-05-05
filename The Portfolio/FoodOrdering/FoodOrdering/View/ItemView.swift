//
//  ItemView.swift
//  FoodOrdering
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    var item: Item
    
    var body: some View {
        VStack {
            // .. downloading image from web
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width - 30, height: 250)
            
            HStack(spacing: 8) {
                Text(item.item_name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                
                Spacer(minLength: 0)
                
                // .. ratings view
                ForEach(1...5, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundStyle(
                            index <= Int(item.item_ratings) ?? 0 ? .pink : .gray
                        )
                }
            }
            
            HStack {
                Text(item.item_details)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
                
                Spacer(minLength: 0)
            }
        }
    }
}

//#Preview {
//    ItemView()
//}

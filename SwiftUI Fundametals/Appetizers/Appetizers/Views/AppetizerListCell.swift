//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            // .. ⚠️ DOWN SIDE:
            // .. it doesn't catch the download image
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            } placeholder: {
//                Image("food-placeholder")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text(appetizer.price, format: .currency(code: "USD"))
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}

//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/13/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    // .. it's assuming that because we did this declaration,
    // .. if something is in the environment it will pull from it
    @EnvironmentObject var order: Order // .. it will crash if is not setup properly
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                }
            }
            
            Spacer()
            
            Button {
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandarButtonStyle())
            .padding(.bottom, 30)
        }
        .frame(width: 320, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                isShowingDetail = false
            } label: {
                XDismiss()
            },
            alignment: .topTrailing
        )
    }
}

#Preview {
    AppetizerDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetail: .constant(false)
    )
}

struct NutritionInfo: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
    }
}

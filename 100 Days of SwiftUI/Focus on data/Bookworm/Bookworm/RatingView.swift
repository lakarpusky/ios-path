//
//  RatingView.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/19/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
                // .. to add a meaningful label for each star:
                .accessibilityElement()
                .accessibilityLabel(label) // .. applies the label "Rating"
                .accessibilityValue(rating == 1 ? "1 star" : "\(rating) stars") // .. adds a value based on the current stars
                // .. adjust that rating value to be adjusted up or down using swipes
                .accessibilityAdjustableAction { direction in
                    switch direction {
                    case .increment:
                        if rating < maximumRating {
                            rating += 1
                        }
                    case .decrement:
                        if rating > 1 {
                            rating -= 1
                        }
                    default:
                        break
                    }
                }
            }
        }
        .buttonStyle(.plain) // .. treat each button individually
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}

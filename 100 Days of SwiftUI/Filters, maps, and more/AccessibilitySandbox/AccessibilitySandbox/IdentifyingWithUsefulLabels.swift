//
//  IdentifyingWithUsefulLabels.swift
//  AccessibilitySandbox
//
//  Created by ☕️ Gabo.montero on 4/5/24.
//

import SwiftUI

struct IdentifyingWithUsefulLabels: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulipans",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            // .. allows VoiceOver to read the correct label no matter what image is present
            .accessibilityLabel(labels[selectedPicture])
            // .. describes how the view works, tell our image is also a button (onTapGesture)
            .accessibilityAddTraits(.isButton)
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
        
        // .. it's preferible to use buttons rather thanm (onTapGesture) wherever possible
        Button {
            selectedPicture = Int.random(in: 0...3)
        } label: {
            Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
        }
        .accessibilityLabel(labels[selectedPicture])
    }
}

#Preview {
    IdentifyingWithUsefulLabels()
}

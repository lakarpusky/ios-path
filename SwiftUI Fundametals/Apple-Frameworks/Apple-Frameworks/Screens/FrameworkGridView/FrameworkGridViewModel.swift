//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by ☕️ Gabo.montero on 5/11/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
//    var selectedFramework: Framework? {
//        didSet { // .. anytime the value changed
//            isShowingDetailView = true
//        }
//    }
//    
//    @Published var isShowingDetailView = false
}

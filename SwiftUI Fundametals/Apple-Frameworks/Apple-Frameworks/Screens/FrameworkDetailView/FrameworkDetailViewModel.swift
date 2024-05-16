//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks
//
//  Created by ☕️ Gabo.montero on 5/15/24.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    let framework: Framework
    var isShowingDetailView: Binding<Bool>
    @Published var isShowingSafariView = false
    
    init(framework: Framework, isShowingDetailView: Binding<Bool>) {
        self.framework = framework
        self.isShowingDetailView = isShowingDetailView
    }
}

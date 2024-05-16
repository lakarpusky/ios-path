//
//  FrameworkGridView.swift
//  Apple-Frameworks
//
//  Created by ☕️ Gabo.montero on 5/11/24.
//

import SwiftUI

struct FrameworkGridView: View {
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(
                    viewModel: FrameworkDetailViewModel(
                        framework: viewModel.selectedFramework!,
                        isShowingDetailView: $viewModel.isShowingDetailView
                    )
                )
            }
        }
    }
}

#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

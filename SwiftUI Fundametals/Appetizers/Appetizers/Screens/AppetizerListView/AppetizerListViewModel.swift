//
//  AppetizerViewModel.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import Foundation

// .. @MainActor:
// .. marking our view model as main actor, anything that happends in this view model UI related,
// .. will be re-routed to the main thread

@MainActor final class AppetizerListViewModel: ObservableObject {
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedApperizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            // .. we have to handle the future errors throw by the function
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                // .., if the error is of type "APError"
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
        }
    }

//    func getAppetizers() {
//        isLoading = true
//        // .. we are on a background thread now (networking)
//        NetworkManager.shared.getAppetizers { result in
//            // .. and all the ui updates should be in the main thread
//            DispatchQueue.main.async { [self] in // .. canpture "[self]" explicitly to enable implicit "self." in this closure
//                isLoading = false
//                
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                    
//                case .failure(let error):
//                    switch error {
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
}

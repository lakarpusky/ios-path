//
//  LoadingView.swift
//  Appetizers
//
//  Created by ☕️ Gabo.montero on 5/12/24.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorVIew = UIActivityIndicatorView(style: .large)
        
        activityIndicatorVIew.color = UIColor.brandPrimary
        activityIndicatorVIew.startAnimating()
        
        return activityIndicatorVIew
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all) //⚠️
            
            //ActivityIndicator()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary)) //⚠️
                .scaleEffect(1.5)
        }
    }
}

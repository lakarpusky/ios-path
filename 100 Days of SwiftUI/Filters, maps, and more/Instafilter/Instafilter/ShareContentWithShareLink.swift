//
//  ShareContentWithShareLink.swift
//  Instafilter
//
//  Created by ☕️ Gabo.montero on 3/27/24.
//

import SwiftUI

struct ShareContentWithShareLink: View {
    let url = URL(string: "https://www.hackingwithswift.com")
    let example = Image(.example)
    
    var body: some View {
        VStack(spacing: 20) {
            ShareLink(item: url!)
            
            // .. can attach a subject and message to the shared data
            ShareLink(
                item: url!,
                subject: Text("Lear Swift here"),
                message: Text("Check out the 100 Days of SwiftUI!")
            )
            
            // .. whatever label you want
            ShareLink(item: url!) {
                Label("Spread the word about Swift", systemImage: "swift")
            }
            
            // .. can provide a preview to attach
            ShareLink(
                item: example,
                preview: SharePreview("Signature Airport", image: example)
            ) {
                Label("Click to share", systemImage: "airplane")
            }
        }
    }
}

#Preview {
    ShareContentWithShareLink()
}

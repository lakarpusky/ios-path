//
//  ImageDetailView.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/13/24.
//

import SwiftUI

struct ImageDetailView: View {
    var item: ImageItem
    
    var body: some View {
        VStack(alignment: .center) {
            item.image?
                .resizable()
                .scaledToFill()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea()
    }
}

#Preview {
    let item = ImageItem(
        name: "Imported image",
        image: Image("twitter_GGExoXGWEAArU7e")
    )
    return ImageDetailView(item: item)
}

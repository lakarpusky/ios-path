//
//  ImagePaintView.swift
//  Drawing
//
//  Created by ☕️ Gabo.montero on 10/27/23.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        HStack {
            //.. can be used for view backgrounds
            Text("")
                .frame(width: 100, height: 100)
                //.background(.orange)
                .border(.blue, width: 10)
                .background(Image(systemName: "pencil.tip.crop.circle.badge.plus"))
            
            Text("Hello World")
                .frame(width: 100, height: 100)
                .border(
                    ImagePaint(
                        image: Image(systemName: "pencil.tip.crop.circle.badge.plus"),
                        scale: 0.2
                    ),
                    width: 30
                )
        }
        
        //.. and also shape strokes
        Capsule()
            .strokeBorder(
                ImagePaint(
                    image: Image(systemName: "pencil.tip.crop.circle.badge.plus"),
                    scale: 0.1
                ),
                lineWidth: 20
            )
            .frame(width: 300, height: 300)
    }
}

#Preview {
    ImagePaintView()
}

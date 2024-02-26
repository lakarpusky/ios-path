//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by ☕️ Gabo.montero on 2/25/24.
//

import SwiftUI

// .. to create a custom modifier
// .. - conforms to the "ViewModifier" protocol
// .. - a method called "body" and must return "some View"

// .. custom view modifiers can have their own stored properties,
// .. - whereas extension to "View" cannot

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

// .. to create extension on "View" that make them easier to use
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

// .. can also create new view structure
// .. modifiers return new objects rather than modifying exsiting ones
struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(width text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomModifiers: View {
    var body: some View {
        Text("Hello, world!")
            .modifier(Title()) // .. we can now use that
        
        Text("Hello, tour!")
            .titleStyle()
        
        // .. we can now add a watermark to any view
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(width: "Hacking with Swift!")
    }
}

#Preview {
    CustomModifiers()
}

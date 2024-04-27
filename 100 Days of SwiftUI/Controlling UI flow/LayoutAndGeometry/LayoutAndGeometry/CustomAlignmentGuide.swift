//
//  CustomAlignmentGuide.swift
//  LayoutAndGeometry
//
//  Created by ☕️ Gabo.montero on 4/27/24.
//

import SwiftUI

/**
 * Custom layout guide:
 * ---
 * should be an extension on either `VerticalAlignment` or `HorizontalAlignment`
 * and be a custom type that conforms to the `AlignmentID` protocol
 */
extension VerticalAlignment {
    // .. replacing (struct) with (enum) then you can't make an instance of it any more
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top] // .. using the (.top) view dimension by default
        }
    }
    
    // .. to make the custom alignment easier to use
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        // .. whether you choose an (enum) or a (struct), its usage stays the same:
        // .. set is as the alignment for your stack.
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@lakarpusky")
                    /**
                     * The use `alignmentGuide()` to activate it on any views you want to align tegether
                     * This is only a guide:
                     * - it helps you align views along a single line, but doesn't say: how they should be aligned
                     */
                    .alignmentGuide(.midAccountAndName) {
                        // .. align these view so the center is on the (.midAccountAndName) guide
                        d in d[VerticalAlignment.center]
                    }
                
                Image(.lakarpusky)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("GABO MONTERO")
                    /**
                     * The use `alignmentGuide()` to activate it on any views you want to align tegether
                     * This is only a guide:
                     * - it helps you align views along a single line, but doesn't say: how they should be aligned
                     */
                    .alignmentGuide(.midAccountAndName) {
                        // .. align these view so the center is on the (.midAccountAndName) guide
                        d in d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
        .border(.blue, width: 1)
    }
}

#Preview {
    CustomAlignmentGuide()
}

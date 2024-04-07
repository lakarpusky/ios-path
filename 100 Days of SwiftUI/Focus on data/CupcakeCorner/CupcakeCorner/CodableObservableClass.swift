//
//  CodableObservableClass.swift
//  CupcakeCorner
//
//  Created by ☕️ Gabo.montero on 3/16/24.
//

import SwiftUI

// .. if all the properties of a type conform to "Codable",
// .. then the type itself can conform to "Codable" with not extra work

// .. but things are a little trickier when working with classes that use the "@Observable" macro

@Observable
class User: Codable {
    // .. tell exactly how it should encode and decode our data
    // .. - adding an enum called "CodingKeys"
    // .. - making it have a "String" row value and
    // .. - a conformance to the "CodingKey" protocol
    enum CodingKeys: String, CodingKey {
        // works both ways: when "Codable" sees "name" in some JSON,
        // it will be saved in the "_name" property
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct CodableObservableClass: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User()) // .. encodes an instance of our class
        let str = String(decoding: data, as: UTF8.self)
        print(str) // {"_name":"Taylor","_$observationRegistrar":{}}
    }
}

#Preview {
    CodableObservableClass()
}

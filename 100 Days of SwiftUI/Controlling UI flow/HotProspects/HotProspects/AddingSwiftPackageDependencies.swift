//
//  AddingSwiftPackageDependencies.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/17/24.
//

import SwiftUI
import SamplePackage

// 1. go to the (File) menu and choose (Add Package Dependencies)

struct AddingSwiftPackageDependencies: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    AddingSwiftPackageDependencies()
}

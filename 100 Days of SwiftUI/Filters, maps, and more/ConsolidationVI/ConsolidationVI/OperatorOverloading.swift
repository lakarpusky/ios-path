//
//  OperatorOverloading.swift
//  ConsolidationVI
//
//  Created by ☕️ Gabo.montero on 4/12/24.
//

import Foundation

// example: lets multiply an (Int) and a (Double)
extension Int {
    static func *(lhs: Int, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
}

// if you want to be really complete then extending (Int) is the wrong choice
// we should go up to a protocol that wraps (Int) as well as other integer types

// Swift puts all integer types into a single protocol called (BinaryInteger), and if we write
// an extension on that then (Self) refers to whatever specific types is being used.

extension BinaryInteger {
    static func *(lhs: Self, rhs: Double) -> Double {
        return Double(lhs) * rhs
    }
    
    static func *(lhs: Double, rhs: Self) -> Double {
        return lhs * Double(rhs)
    }
}

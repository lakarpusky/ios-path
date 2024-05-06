//
//  StringExtensions.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/5/24.
//

import Foundation

/**
 * 1. Now we can localize much easier by typing `"StringKey".localized` instead
 *   of `NSLocalizedString("StringKey", comment: "")` each time.
 *
 * 2. The function we wrote allow us to inject arbitrary arguments in ur localized strings
 *   through code, such as names, numbers, and so on.
 */

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}

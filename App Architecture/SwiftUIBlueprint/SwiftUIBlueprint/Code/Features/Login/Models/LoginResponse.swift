//
//  LoginResponse.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/6/24.
//

import Foundation

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}

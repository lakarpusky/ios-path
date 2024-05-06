//
//  LoginAction.swift
//  SwiftUIBlueprint
//
//  Created by ☕️ Gabo.montero on 5/6/24.
//

import Foundation

struct LoginAction {
    var parameters: LoginRequest
    
    func call(completion: @escaping (LoginResponse) -> Void) {
        let scheme = "https"
        let host = "base_url"
        let path = "/login"
        
        var components = URLComponents()
        
        // .. creating our URL by combining three variables
        components.scheme = scheme
        components.host = host
        components.path = path
        
        guard let url = components.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "post"
        
        // .. standard headers, to the app knows that it is working with JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            // .. we encode our request into JSON
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            // Error: Unable to encode request parameters
        }
        
        // .. and send it to the server
        let task = URLSession.shared.dataTask(with: request) { data, _, err in
            if let data = data {
                // .. will try to decode it into our (LoginResponse) structure
                let response = try? JSONDecoder().decode(LoginResponse.self, from: data)
                
                if let response = response {
                    // .. will pass this decoed response in the handler back to our (LoginViewModel)
                    completion(response)
                } else {
                    // Error: Unable to decode response JSON
                }
            } else {
                // Error: API request failed
                
                if let err =  err {
                    print("Error: \(err.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
}

//
//  UnderstandingResultType.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/15/24.
//

import SwiftUI

/**
 * Result Type
 * ----------
 * Allows us to encapsulate either a successful value or some kind of error type,
 * all in a single piece of data.
 */

struct UnderstandingResultType: View {
    @State private var outpout = ""
    
    var body: some View {
        Text(outpout)
            .task {
                await fetchReadings()
            }
    }
    
    // to download an array of data readings from the server
    func fetchReadings() async {
        /**
         * What if we want to stash the work away somewhere and do someting else while it's running?
         * -----
         * 1. what if we want to read its result aat some point in the fufure?
         * 2. Perhaps handling any errors somewhere else entirely?
         * 3. what if we just want to cancel the work because it's no longer needed?
         * ------
         * We can get all that by using ( Result ), and it's actually available through the API: Task
         *
         * The value gets stored in our ( Task ) instance so that we can read it in the future wheren we're ready
         */
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return outpout = "Found \(readings.count) reading"
        }
        
        // to read the result from a (Task), read its result property:
        let result = await fetchTask.result
        
        // can red the successful value directly from the (Result) if you want,
        // but you'll need to make sure and handle errors appropriately:
        
//        do {
//            outpout = try result.get()
//        } catch {
//            outpout = "Error: \(error.localizedDescription)"
//        }
        
        // alternatively, you can switch on the (Result), and to check for both
        // the success and failure cases.
        
//        switch result {
//        case .success(let str):
//            outpout = str
//        case .failure(let error):
//            outpout = "Error: \(error.localizedDescription)"
//        }
    }
}

#Preview {
    UnderstandingResultType()
}

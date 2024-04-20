//
//  ProspectsView.swift
//  HotProspects
//
//  Created by ☕️ Gabo.montero on 4/18/24.
//

import SwiftUI
import SwiftData
import CodeScanner

enum FilterType {
    case none, contacted, uncontacted
}

struct ProspectsView: View {
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.modelContext) var modelContext
    
    @State private var isShowingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = filter == .contacted
            
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    var body: some View {
        NavigationStack {                
            List(prospects, selection: $selectedProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    Text(prospect.emailAddress)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    if prospect.isContacted {
                        Button("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                    }
                }
                .tag(prospect) // help Swift UI understand each row corresponds to a single prospect
            }
            .navigationTitle(title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(selectedProspects.isEmpty)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        isShowingScanner = true
                    }
                }
                
                if !selectedProspects.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Button("Delete Selected", action: delete)
                    }
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                // .. simulator doesn't support using the camera to scan codes,
                // .. automatically represents a replacement UI so we can still test that things work
                // .. this replacement UI will automatically send back whatever we pass in as simulated data
                CodeScannerView(
                    codeTypes: [.qr], // .. an array of the types of codes we want to scan
                    simulatedData: "Gabo Montero\nlakarpusky@gmail.com", // .. a string to use as simulated data
                    completion: handleScan // a completion function to use
                )
            }
        }
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
            selectedProspects.remove(prospect)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        /**
         * 1. Go to your target's configuration options under its `Info` tab
         * 2. Add row, select `Privacy - Camera Usage Description` for the key
         * 3. For the value enter `We need to scan QR codes.`
         */
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect(
                name: details[0],
                emailAddress: details[1],
                isContacted: false
            )
            
            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ProspectsView(filter: FilterType.none)
        .modelContainer(for: Prospect.self, inMemory: true)
}

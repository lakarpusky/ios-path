//
//  DetailView.swift
//  Bookworm
//
//  Created by ☕️ Gabo.montero on 3/19/24.
//

// .. Using an alert to pop a navigation link programmatically:

import SwiftUI
import SwiftData

struct DetailView: View {
    // .. 1. to hold our model context (so we can delete)
    @Environment(\.modelContext) private var modelContext
    
    // .. 2. to hold our dismiss action (we can pop the view off the navigation stack)
    @Environment(\.dismiss) private var dismiss
    
    // .. 3. to control whether we're showing the delete conformation alert or not
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    Text(book.formattedDate)
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.4))
                    
                    Spacer()
                    
                    Text(book.genre.uppercased())
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.black.opacity(0.75))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 4)
                        )
                        .offset(x: -5, y: -5)
                }
            }
            .padding(.top)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button("Delete this book", systemImage: "trash") {
                showingDeleteAlert = true
            }
        }
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        // .. in order to create a sample "Book" object, we must first create a model context
        
        // .. we don't want it to actually store anything, so using "ModelConfiguration"
        // .. let us request temporary in-memory storage
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        
        // .. that model context comes from creating a model container
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(
            title: "Text Book",
            author: "Test Author",
            genre: "Fantasy",
            review: "This was a great book; I really enjoyed it.",
            rating: 4
        )
        
        return NavigationStack {
            DetailView(book: example)
                .modelContainer(container)
        }
    } catch {
        return Text("Failed to create a preview: \(error.localizedDescription)")
    }
}

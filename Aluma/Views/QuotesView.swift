//
//  QuotesView.swift
//  Aluma
//
//  Created by Ali Hodroj on 23/05/2024.
//

import SwiftUI

struct QuotesView: View {
    
    // MARK: view properties
    @State private var randomQuote: Quote = motivationalQuotes.shuffled().randomElement()!
    @State private var quoteViewRefresher: Int = 0
    
    var body: some View {
        // MARK: main container
        VStack(alignment: .leading, spacing: 0) {
            // MARK: view title
            Text("Quotes")
                .font(.largeTitle.bold())
                .foregroundStyle(.accent)
                .padding([.top, .leading])
            // MARK: quote card view
            VStack {
                // internal container
                VStack(alignment: .center, spacing: 20) {
                    // MARK: quote description
                    Text("\"" + randomQuote.description + "\"")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundStyle(.accent)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    // MARK: quote author
                    Text("-" + randomQuote.author)
                        .font(.subheadline)
                        .fontWeight(.ultraLight)
                        .italic()
                        .foregroundStyle(.black)
                }
                .id(quoteViewRefresher)
                .transition(.push(from: .top).combined(with: .opacity))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, 30)
            .padding(.vertical, 40)
            .contentShape(.rect)
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    print(value.translation)
                    switch(value.translation.width, value.translation.height) {
                        //case (...0, -30...30):  print("left swipe")
                        //case (0..., -30...30):  print("right swipe")
                        case (-100...100, ...0):  getRandomQuote()
                        //case (-100...100, 0...):  print("down swipe")
                        default:  print("no swipe detected")
                    }
                }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    // MARK: helper methods
    func getRandomQuote() -> Void {
        withAnimation() {
            randomQuote = motivationalQuotes.shuffled().randomElement() ?? .init(description: "", author: "")
            quoteViewRefresher += 1
        }
    }
}

#Preview {
    MainView()
}

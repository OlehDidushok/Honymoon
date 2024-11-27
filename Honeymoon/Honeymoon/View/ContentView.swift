//
//  ContentView.swift
//  Honeymoon
//
//  Created by Oleh on 24.11.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    
    // MARK: - CARDS VIEWS
    var cardViews: [CardView] = {
        var views = [CardView]()
        
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    // MARK: TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id
        }) else { return false }
        return index == 0
    }
    
    var body: some View {
        VStack {
            // HEADER
            HeaderView(showGuide: $showGuide, showInfoView: $showInfo)
            Spacer()
            
            // CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // FOOTER
            FooterView(showBookingAlert: $showAlert)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Your booking has been confirmed!"), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

#Preview {
    ContentView()
}

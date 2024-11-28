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
    @State private var lastCardIndex: Int = 1
    @GestureState private var dragState: DragState = .inactive
    private let dragAreaThreshold: CGFloat = 65
    
    // MARK: - CARDS VIEWS
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    private func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    // MARK: TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id
        }) else { return false }
        return index == 0
    }
    
    // MARK: DRAG GESTURE
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive: return .zero
            case .pressing: return .zero
            case .dragging(let translation): return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing: return false
            case .dragging: return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inactive: return false
            case .pressing, .dragging: return true
            }
        }
    }
    
    var body: some View {
        VStack {
            // HEADER
            HeaderView(showGuide: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
            Spacer()
            
            // CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width <  -dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0 )
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                            }
                        )
                        .offset(x: isTopCard(cardView: cardView) ? dragState.translation.width : 0, y: isTopCard(cardView: cardView) ? dragState.translation.height : 0)
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1)
                        .rotationEffect(Angle(degrees: isTopCard(cardView: cardView) ? dragState.translation.width / 12 : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.translation )
                        .gesture(LongPressGesture(minimumDuration: 0.01).sequenced(before: DragGesture()).updating(self.$dragState, body: { value, state, transaction in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                            .onEnded({ value in
                                guard case .second(true, let drag?) = value else { return }
                                if drag.translation.width < -dragAreaThreshold  ||  drag.translation.width > dragAreaThreshold {
                                    moveCards()
                                }
                            }) )
                    
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"), message: Text("Your booking has been confirmed!"), dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

#Preview {
    ContentView()
}

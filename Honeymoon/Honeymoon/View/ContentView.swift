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
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            CardView(honeymoon: honeymoonData[1])
                .padding()
            Spacer()
            
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

//
//  FooterView.swift
//  Honeymoon
//
//  Created by Oleh on 26.11.2024.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Book Destination.".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule().stroke(.pink, lineWidth: 2)
                    )
            }

            Spacer()
            
            Image(systemName: "heart.circle")
        }
        .padding()
    }
}

#Preview {
    FooterView()
}

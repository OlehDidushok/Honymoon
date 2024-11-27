//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Oleh on 24.11.2024.
//

import SwiftUI

struct HeaderView: View {
    // MARK: PROPERTIES
    @Binding var showGuide: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button {
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                showGuide.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            .sheet(isPresented: $showGuide) {
                GuideView()
            }
            
        }
        .padding()
    }
}

#Preview {
    HeaderView(showGuide: .constant(false),
               showInfoView: .constant(false))
}

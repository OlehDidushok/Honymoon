//
//  GuideView.swift
//  Honeymoon
//
//  Created by Oleh on 26.11.2024.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick your perfect honeymoon destination")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .center, spacing: 25) {
                    GuideComponent(title: "Like",
                                   subtitle: "Swipe Right",
                                   description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites",
                                   icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss",
                                   subtitle: "Swipe left",
                                   description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it",
                                   icon: "xmark.circle")
                    
                    GuideComponent(title: "Book",
                                   subtitle: "Tap the button",
                                   description: "Our selection of honeymoon sesorts is perfect setting for you embark your new life together",
                                   icon: "checkmark.square")
                }
                Spacer(minLength: 10)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
            .frame(minWidth: 0, maxHeight: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
        
    }
}

#Preview {
    GuideView()
}

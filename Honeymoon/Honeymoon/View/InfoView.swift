//
//  InfoView.swift
//  Honeymoon
//
//  Created by Oleh on 27.11.2024.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                Spacer(minLength: 10)
                
                Button {
                    
                } label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10)  {
            RowAppInfoView(itemOne: "Application",
                           itemTwo: "Honeymoon")
            
            RowAppInfoView(itemOne: "Compatibility",
                           itemTwo: "iPhone and iPad")
            
            RowAppInfoView(itemOne: "Developer",
                           itemTwo: "Oleh Didushok")
            
            RowAppInfoView(itemOne: "Designer",
                           itemTwo: "Oleh Didushok")
            
            RowAppInfoView(itemOne: "Website",
                           itemTwo: "https://github.com/OlehDidushok?tab=repositories")
            
            RowAppInfoView(itemOne: "Version",
                           itemTwo: "1.0.0")
            
        }
    }
}

struct RowAppInfoView: View {
    //MARK: PROPERTIES
    var itemOne: String
    var itemTwo: String
    var body: some View {
        VStack {
            HStack {
                Text(itemOne)
                    .foregroundStyle(Color.gray)
                
                Spacer()
                
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack {
                Text("Photos")
                    .foregroundStyle(Color.gray)
                
                Spacer()
                
                Text("Unsplash")
            }
            Divider()
            
            Text("Photographers")
                .foregroundStyle(Color.gray )
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        })
    }
}

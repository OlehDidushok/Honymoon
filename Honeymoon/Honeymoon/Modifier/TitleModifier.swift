//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Oleh on 27.11.2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
      content
            .font(.largeTitle)
            .foregroundStyle(Color.pink)
    }
}

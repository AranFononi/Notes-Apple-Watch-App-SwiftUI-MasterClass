//
//  CreditsView.swift
//  Notes SwiftUI MasterClass Watch App
//
//  Created by Aran Fononi on 18/4/25.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    var body: some View {
        VStack(spacing: 3) {
            Image("developer-no\(randomNumber)")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            HeaderView(title: "Credits")
            Text("Aran Fononi")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        } //: VStack
    }
}

#Preview {
    CreditsView()
}

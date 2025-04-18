//
//  HeaderView.swift
//  Notes SwiftUI MasterClass Watch App
//
//  Created by Aran Fononi on 18/4/25.
//

import SwiftUI

struct HeaderView: View {
    var title : String = ""
    var body: some View {
        VStack {
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HStack
            .foregroundStyle(.accent)
        } //: VStack
    }
}

#Preview {
    Group {
        HeaderView(title: "Hello")
        
        HeaderView()
    }
}

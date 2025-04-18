//
//  ContentView.swift
//  Notes SwiftUI MasterClass Watch App
//
//  Created by Aran Fononi on 18/4/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - Function
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                        
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundStyle(.accent)
            } //: HStack
            Spacer()
        } //: VStack
        .navigationTitle(Text("Notes"))
        
    }
}

#Preview {
    ContentView()
}

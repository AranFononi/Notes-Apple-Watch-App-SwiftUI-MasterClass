//
//  DetailView.swift
//  Notes SwiftUI MasterClass Watch App
//
//  Created by Aran Fononi on 18/4/25.
//

import SwiftUI

struct DetailView: View {
    // MARK: - Proeprty
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            // Header
           HeaderView(title: "")
            
            // Content
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                Spacer()
                
                Text("\(index + 1)/\(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditPresented) {
                        CreditsView()
                    }
                    
            } //: HStack
            .foregroundStyle(.secondary)
            
        } //: VStack
        .padding(3)
    }
}


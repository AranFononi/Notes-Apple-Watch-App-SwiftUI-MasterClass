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
    func save() {
        dump(notes)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
                        // TextFiled not empty
                        guard text.isEmpty == false else { return }
                        // Create new note
                        let note = Note(id: UUID(), text: text)
                        // append new note
                        notes.append(note)
                        // make textfield empty
                        text = ""
                        // save note
                        save()
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                        
                    }
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)
                } //: HStack
                Spacer()
                Text("\(notes.count) notes")
            } //: VStack
            .navigationTitle("Notes")
        } //: Navigation
        
        
    }
}

#Preview {
    ContentView()
}

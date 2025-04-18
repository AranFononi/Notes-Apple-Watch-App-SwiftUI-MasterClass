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
    func getDocumentsDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        //dump(notes)
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentsDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentsDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Loading data failed")
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
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
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i )) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                } //: HStack
                            } //: Navigation Link
                        } //: Loop
                        .onDelete(perform: delete)
                        
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                } //: List
                
            } //: VStack
            .navigationTitle("\(notes.count) Notes")
            .onAppear {
                load()
            }
        } //: Navigation
        
        
    }
}

#Preview {
    ContentView()
}

//
//  SettingsView.swift
//  Notes SwiftUI MasterClass Watch App
//
//  Created by Aran Fononi on 18/4/25.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Property
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    var body: some View {
        VStack(spacing: 8) {
            // Header
            HeaderView(title: "Settings")
            
            // Actual Line Count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // Slider
            Slider(value: $value, in: 1...4 , step: 1)
                .tint(.accent)
                
        } //: VStack
    }
}

#Preview {
    SettingsView()
}

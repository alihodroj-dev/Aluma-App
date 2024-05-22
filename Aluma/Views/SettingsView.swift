//
//  SettingsView.swift
//  Aluma
//
//  Created by Ali Hodroj on 23/05/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        // MARK: main container
        VStack(spacing: 0) {
            Text("Settings")
                .font(.largeTitle.bold())
                .foregroundStyle(.accent)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

#Preview {
    MainView()
}

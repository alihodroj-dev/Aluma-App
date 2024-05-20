//
//  MainView.swift
//  Aluma
//
//  Created by Ali Hodroj on 19/05/2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: view properties
    @State private var tabBarSelection: TabBarModel = .brain
    
    var body: some View {
        // MARK: main container
        ZStack {
            // MARK: background color
            Color.main
                .ignoresSafeArea()
            // MARK: current view and tab bar
            VStack(spacing: 0) {
                Spacer()
                // MARK: tab bar
                tabBar
            }
        }
    }
    
    // MARK: subviews
    private var tabBar: some View {
        HStack(spacing: 0) {
            // loop over tab bar items
            ForEach(TabBarModel.allCases, id: \.rawValue) { tab in
                // image container
                HStack(spacing: 0) {
                    // icon image
                    Image(tab.rawValue + (tab == tabBarSelection ? "_selected" : "_unselected"))
                        .resizable()
                        .frame(width: tab == tabBarSelection ? 36 : 30)
                        .frame(height: tab == tabBarSelection ? 36 : 30)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture { withAnimation { tabBarSelection = tab } }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    // MARK: helper methods
    
    
}

#Preview {
    MainView()
}

//
//  LoadingView.swift
//  Aluma
//
//  Created by Ali Hodroj on 19/05/2024.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: view properties
    private var screenWidth: CGFloat = UIScreen.main.bounds.width
    @State private var loadingProgressValue: CGFloat = 0
    @State private var finishedLoading: Bool = false
    
    var body: some View {
        // MARK: main container
        ZStack {
            // MARK: main view
            MainView()
            // MARK: background color
            Color.main
                .ignoresSafeArea()
                .offset(x: finishedLoading ? -screenWidth : 0)
            // MARK: logo and progress bar
            VStack(spacing: 0) {
                // MARK: logo image
                Image("app_logo")
                    .resizable()
                    .frame(width: screenWidth - 150, height: screenWidth - 150)
                // MARK: progress bar
                self.loadingProgressSubView
            }
            .offset(x: finishedLoading ? -screenWidth : 0)
        }
        .onAppear { performAnimations() }
    }
    
    // MARK: subviews
    private var loadingProgressSubView: some View {
        ZStack(alignment: .leading) {
            // progress bar
            Color.accentColor.opacity(0.25)
            // progress completed
            Color.accentColor
                .frame(width: loadingProgressValue)
                .clipShape(.rect(cornerRadius: 12))
        }
        .frame(width: screenWidth - 200 ,height: 8)
        .clipShape(.rect(cornerRadius: 12))
    }
    
    // MARK: helper methods
    private func performAnimations() -> Void {
        performLoadingAnimation()
        performSlideInMainViewAnimation()
    }
    
    private func performLoadingAnimation() -> Void {
        // first incrementation of the progress bar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.bouncy(duration: 1.25)) {
                loadingProgressValue = (screenWidth - 200) - 140
            }
            // second incrementation of the progress bar
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation(.bouncy(duration: 1.75).delay(1.25)) {
                    loadingProgressValue = (screenWidth - 200)
                }
            }
        }
    }
    
    private func performSlideInMainViewAnimation() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.snappy(duration: 0.75)) {
                finishedLoading = true
            }
        }
    }
}

#Preview {
    LoadingView()
}

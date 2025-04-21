//
//  SplashView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/21/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @EnvironmentObject var viewModel: ApplicationViewModel

    var body: some View {
        if isActive {
            MainTabView()
        } else {
            ZStack {
                Color(red: 0.0, green: 0.31, blue: 0.88)
                    .ignoresSafeArea()

                VStack {
                    Image("AppLogo") // Make sure your logo asset is named "AppLogo"
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                }
            }
            .onAppear {
                // Simulate loading time (e.g. 2 seconds)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

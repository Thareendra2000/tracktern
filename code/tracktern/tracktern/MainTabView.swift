//
//  MainTabView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct MainTabView: View {
    let accentBlue = Color(red: 0.0, green: 0.31, blue: 0.88)
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            AddApplicationView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 30))
                    Text("Add Application")
                }

            StatsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }
        }.background(Color(accentBlue))
    }
}

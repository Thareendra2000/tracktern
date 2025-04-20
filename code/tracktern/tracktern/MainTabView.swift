//
//  MainTabView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct MainTabView: View {
    let accentBlue = Color(red: 0/255, green: 122/255, blue: 255/255)
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            AddApplicationView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add")
                }

            StatsView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Stats")
                }
        }.background(Color.blue)
    }
}

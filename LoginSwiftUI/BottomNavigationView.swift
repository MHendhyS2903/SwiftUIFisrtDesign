//
//  PulsaDataView.swift
//  LoginSwiftUI
//
//  Created by macbook on 17/02/23.
//

import SwiftUI

struct BottomNavigationView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                        .foregroundColor(Color("baseColor"))
                }
            SettingView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                        .foregroundColor(Color("baseColor"))
                }
        }
        .onAppear() {
            let standardAppearance = UITabBarAppearance()
                        
            let itemAppearance = UITabBarItemAppearance()
            itemAppearance.selected.iconColor = UIColor(Color("baseColor"))
            itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color("baseColor"))]

            standardAppearance.inlineLayoutAppearance = itemAppearance
            standardAppearance.stackedLayoutAppearance = itemAppearance
            standardAppearance.compactInlineLayoutAppearance = itemAppearance
            UITabBar.appearance().standardAppearance = standardAppearance
        }
    }
}

struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationView()
    }
}

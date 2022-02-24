//
//  ContentView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    
    //just to use the bool
    @StateObject var settings = UserInterfaceSettings(hScrollViewPostWidth: 200.0, hScrollViewPostHeight: 200.0, hScrollViewPostTitleFont: 14.0, hScrollViewPostBodyFont: 10.0)

    
    var body: some View {
        TabView{
            HomePage()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsPage()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            LoginHome()
                .tabItem{
                    Image(systemName: "book")
                    Text("Login")
                }
        }
        .onAppear {
            if #available(iOS 15.0, *){
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

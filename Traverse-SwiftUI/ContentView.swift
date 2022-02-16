//
//  ContentView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            SettingsPage()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
            HomePage()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
        }
        .onAppear(){
            UITabBar.appearance().barTintColor = .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

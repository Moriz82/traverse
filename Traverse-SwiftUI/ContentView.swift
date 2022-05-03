//
//  ContentView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    @State var tabSelected = "Home"
    @State var showTabBar: Bool = true
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            ZStack{
                switch tabSelected{
                case "Home":
                    HomePage(showTabBar: $showTabBar)
                case "Bookmark":
                    AddProductView(showTabBar: $showTabBar)
                case "Star":
                    MapPage()
                case "Account":
                    UserAccountPage(account: exampleAccounts[0], showTabBar: $showTabBar)
                default:
                    HomePage(showTabBar: $showTabBar)
                }
                if showTabBar{
                    CustomTabView(tab: $tabSelected)
                        .offset(x: 0, y: UIScreen.main.bounds.height * 0.4)
                        .shadow(color: .gray, radius: 20, x: 0, y: 0)

                }
            }
        }
        
        /*
        TabView{
            MapPage()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag("Home")
            AddProductView()
                .tabItem{
                    Image(systemName: "plus.circle")
                    Text("Add Product")
                }
                .tag("Bookmark")
            UserAccountPage(account: exampleAccounts[0])
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
                .environmentObject(viewModel)
                .tag("Account")
        }
        .onAppear {
            if #available(iOS 15.0, *){
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        TabView{
            HomePage()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            AddProductView()
                .tabItem{
                    Image(systemName: "plus.circle")
                    Text("Add Product")
                }
            UserAccountPage(account: exampleAccounts[0])
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Account")
                }
                .environmentObject(viewModel)

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

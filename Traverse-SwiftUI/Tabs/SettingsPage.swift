//
//  SettingsPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct SettingsPage: View {
    @StateObject var checkLoginStatus = checkIfLoggedIn()
    @State var goToAddCard = false
    
    var body: some View {
        NavigationView{
            ZStack{
                if !checkLoginStatus.isLoggedIn{
                    LoginHome()
                }else if goToAddCard{
                    AddCardPage()
                }else {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Settings")
                            .font(.custom("Poppins-SemiBold", size: 50.0))
                        ScrollView(.vertical){
                            VStack(alignment: .leading, spacing: 20, content: {
                                Text("Account")
                                    .font(.custom("Poppins-SemiBold", size: 30.0))
                                Text("We need your card in order to pay for products.")
                                FilledInButton(title: "Log Out", size: 1.0, action: {
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        checkLoginStatus.isLoggedIn = false
                                    }
                                })
                            })
                        }.frame(width: UIScreen.main.bounds.width * 0.95, alignment: .leading)
                    })
                }
            }.environmentObject(checkLoginStatus)
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

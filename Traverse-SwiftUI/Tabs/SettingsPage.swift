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
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 20, content: {
                Divider()
                Text("Account")
                    .font(.custom("Poppins-SemiBold", size: 30.0))
                if checkLoginStatus.isLoggedIn{
                    NavigationLink(destination: AddCardPage(), label: {
                        Text("Add Card")
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 40)
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .background(Color("traverse-blue"))
                            .cornerRadius(10)
                    })
                }else{
                    NavigationLink(destination: LoginHome(), label: {
                        Text("Log in")
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 40)
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(.white)
                            .background(Color("traverse-blue"))
                            .cornerRadius(10)
                    })
                }
            })
                .frame(width: UIScreen.main.bounds.width * 0.90)
                .navigationTitle("Settings")
        }
        .environmentObject(checkLoginStatus)
        .navigationViewStyle(.stack) //produces constraint error without this
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

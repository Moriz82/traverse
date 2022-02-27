//
//  SettingsPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct SettingsPage: View {
    
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        if !isLoggedIn{
            LoginHome()
        }
        
        else if isLoggedIn{
            VStack(alignment: .leading, spacing: 30, content: {
                HStack(alignment: .center, spacing: 10, content:{
                    Text("Settings")
                        .font(.custom("Poppins-SemiBold", size: 50.0))
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                })
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Sign in options")
                        .font(.custom("Poppins-Regular", size: 30.0))
                    Button(action:{
                        //MARK: add action
                    }, label: {
                        Text("Login")
                            .frame(width: 250, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)

                    })
                    Button(action:{
                        //MARK: add action 2
                    }, label: {
                        Text("Create an Account")
                            .frame(width: 250, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                    })
                })
                Spacer()
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("© Traverse Marketplace, LLC")
                        .font(.custom("Poppins-SemiBold", size: 20.0))
                    Text("Contact us")
                        .font(.custom("Poppins-SemiBold", size: 15.0))
                        .foregroundColor(.blue)
                })
            })
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

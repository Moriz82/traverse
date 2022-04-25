//
//  CustomTabView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/19/22.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tab: String
    
    var body: some View {
        HStack(alignment: .top, spacing: UIScreen.main.bounds.width * 0.11){
            Button(action: {
                tab = "Home"
            }, label: {
                if tab == "Home"{
                    Image("HomeTabBlue")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .shadow(color: Color("tab-selected-color"), radius: 5, x: 0, y: 0)
                }else{
                    Image("HomeTab")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                }
            })
            Button(action: {
                tab = "Bookmark"
            }, label: {
                if tab == "Bookmark"{
                    Image("BookmarkTabBlue")
                        .resizable()
                        .frame(width: 24, height: 29, alignment: .center)
                        .shadow(color: Color("tab-selected-color"), radius: 5, x: 0, y: 0)
                }else{
                    Image("BookmarkTab")
                        .resizable()
                        .frame(width: 24, height: 29, alignment: .center)
                }
            })
            Button(action: {
                tab = "Star"
            }, label: {
                if tab == "Star"{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 32, height: 29, alignment: .center)
                        .foregroundColor(Color("tab-selected-color2"))
                        .shadow(color: Color("tab-selected-color"), radius: 5, x: 0, y: 0)
                }else{
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 32, height: 29, alignment: .center)
                        .foregroundColor(Color(red: 0.839, green: 0.859, blue: 0.871))
                }
            })
            Button(action: {
                tab = "Account"
            }, label: {
                if tab == "Account"{
                    Image("AccountTabBlue")
                        .resizable()
                        .frame(width: 30, height: 41, alignment: .center)
                        .shadow(color: Color("tab-selected-color"), radius: 5, x: 0, y: 0)
                }else{
                    Image("AccountTab")
                        .resizable()
                        .frame(width: 30, height: 41, alignment: .center)
                }
            })
        }
        .frame(width: UIScreen.main.bounds.width * 0.85)
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
        .background(.white)
        .cornerRadius(37)
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tab: .constant("Home"))
            .previewLayout(.sizeThatFits)
    }
}

//
//  AddCardPage.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/26/21.
//

import SwiftUI

struct AddCardPage: View {
    
    var body: some View {
            VStack {
                HStack {
                    TopRightLogoImage()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                }
                Spacer()
                VStack {
                    Image("CardImage")
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                    Text("Add Your Card")
                        .font(.system(.title, design: .default).bold())
                    Text("Add a card to use for future payments")
                        .font(.system(.callout, design: .default))
                        .foregroundColor(Color.gray)
                }
                Spacer()
                
                NavigationLink(destination: CardPaymentPage(), label: {
                    FilledInButton(title: "Verify", size: 1, action: {})
                })
                
                NavigationLink(destination: MapPage(), label: {
                    Text("Skip for now")
                        .font(.system(.callout, design: .default).bold())
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                })
                
            }.navigationBarHidden(true)
    }
}

struct AddCardPage_Previews: PreviewProvider {
    static var previews: some View {
        AddCardPage()
    }
}

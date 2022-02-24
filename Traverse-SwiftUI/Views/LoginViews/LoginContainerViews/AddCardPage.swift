//
//  AddCardPage.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/26/21.
//

import SwiftUI

struct AddCardPage: View {
    @State private var willMoveToHomePage = false
    @State private var willMoveToCardPaymentPage = false
    
    var body: some View {
        VStack {
            HStack {
                TopRightLogoImage()
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
            FilledInButton(title: "Verify", size: 1, action: {willMoveToCardPaymentPage = true})
            Button(action: {willMoveToHomePage = true}){
                Text("Skip for now")
                    .font(.system(.callout, design: .default).bold())
                    .foregroundColor(Color.black)
            }.padding(EdgeInsets(top: 5, leading: 0, bottom: 10, trailing: 0))
        
            
        }.navigate(to: HomePage(), when: $willMoveToHomePage)
            .navigate(to: CardPaymentPage(), when: $willMoveToCardPaymentPage)
    }
}

struct AddCardPage_Previews: PreviewProvider {
    static var previews: some View {
        AddCardPage()
    }
}

//
//  CardPaymentPage.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/26/21.
//

import SwiftUI

struct CardPaymentPage: View {
    private var cardNumber: String = ""
    private var cardHolderName: String = ""
    private var date: String = ""
    private var cvv: String = ""
    
    var body: some View {
        ScrollView{
        VStack {
            HStack {
                Text("Payment")
                    .font(.system(.largeTitle, design: .default).bold())
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                Spacer()
            }
            HStack {
                Text("Enter your payment information")
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                    .foregroundColor(Color.gray)
                    .font(.system(.callout, design: .default).bold())
                Spacer()
            }
            HStack {
                Image("CardSymbol")
                    .resizable()
                    .frame(width: 100, height: 70, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .padding()
                Spacer()
            }
            TextInputView(title: "Card Number", size: 1, text: cardNumber)
                .keyboardType(.numberPad)
            TextInputView(title: "Card Holder Name", size: 1, text: cardHolderName)
            TextInputView(title: "MM/YY", size: 1, text: date)
            TextInputView(title: "CVV", size: 1, text: cvv)
                .keyboardType(.numberPad)
            
            Image("orImage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.040)
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Button(action: {}){
                  HStack {
                      Image("ScanCardButtonIcon")
                          .resizable()
                          .frame(width: 20, height: 20, alignment: .leading)
                      Text("Scan Card")
                  }
                      .foregroundColor(Color.black)
                      .font(.system(size: 16, weight: .semibold, design: .rounded))
                      .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.06)
                      .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1.5))
                }
                
                NavigationLink(destination: MapPage(), label: {
                    FilledInButton(title: "Submit", size: 1, action: {})
                }).padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.1, leading: 0, bottom: 0, trailing: 0))

                NavigationLink(destination: MapPage(), label: {
                    Text("Skip for now")
                        .font(.system(.callout, design: .default).bold())
                        .foregroundColor(Color.black)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                })
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}
}
    

struct CardPaymentPage_Previews: PreviewProvider {
    static var previews: some View {
        CardPaymentPage()
    }
}

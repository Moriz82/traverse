//
//  SendMessageButtonView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 3/11/22.
//

import SwiftUI

struct SendMessageButtonView: View {
    @State var account: account
    
    var body: some View {
            Button(action: {
                if let phoneNumber = account.phoneNumber{
                    let sms: String = "sms:+1\(account.phoneNumber)&body="
                    let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
                }else{
                    print("alert: no phone number found")
                }
            }, label: {
                Text("Send Message")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 40, alignment: .center)
                    .background(Color("traverse-blue"))
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
    }
}

struct SendMessageButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageButtonView(account: exampleAccounts[0])
    }
}

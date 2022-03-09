//
//  OwnerInformationSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI

struct OwnerInformationSubView: View {
    var nameFontSize = 15.0
    var bodyFontSize = 12.0
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0, content: {
                HStack(alignment: .center, spacing: 7, content: {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .cornerRadius(16.0)
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("Profile Name")
                            .font(.custom("Poppins-SemiBold", size: nameFontSize))
                        Text("Date of review")
                            .font(.custom("Poppins-Regular", size: bodyFontSize - 2))
                            .foregroundColor(.gray)
                    })
                })
                Spacer()
                HStack(alignment: .center, spacing: 3, content: {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("traverse-blue"))
                    Text("-.--")
                        .font(.custom("Poppins-SemiBold", size: nameFontSize))
                    Text("(--)")
                        .font(.custom("Poppins-SemiBold", size: nameFontSize))
                        .foregroundColor(.gray)
                })
            }).frame(width: UIScreen.main.bounds.width * 0.8, alignment: .center)

            Button(action: {
                //MARK: SEND MESSAGE ACTION
            }, label: {
                Text("Send Message")
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 40, alignment: .center)
                    .background(Color("traverse-blue"))
                    .font(.custom("Poppins-SemiBold", size: nameFontSize + 3))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            
            Button(action: {
                //MARK: VIEW PROFILE ACTION
            }, label: {
                Text("View Profile")
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 30, alignment: .center)
                    .font(.custom("Poppins-Regular", size: bodyFontSize + 3))
                    .foregroundColor(.blue)
            })
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: 170, alignment: .center)
    
    }
}

struct OwnerInformationSubView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerInformationSubView()
            .previewLayout(.sizeThatFits)
    }
}

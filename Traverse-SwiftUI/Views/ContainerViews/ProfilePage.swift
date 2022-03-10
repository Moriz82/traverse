//
//  OwnerPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/10/22.
//

import SwiftUI

struct ProfilePage: View {
    
    @State var account: account
    
    var nameFontSize = 28.0
    var bodyFontSize = 22.0
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 18, content: {
                HStack(alignment: .center, spacing: 7, content: {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 96, height: 96, alignment: .center)
                        .cornerRadius(64)
                    VStack(alignment: .leading, spacing: 0, content: {
                        Text("\(account.firstName) \(account.lastName)")
                            .font(.custom("Poppins-SemiBold", size: nameFontSize))
                        Text("Joined \(account.dateJoined.addingTimeInterval(600), style: .date)")
                            .font(.custom("Poppins-Regular", size: bodyFontSize - 2))
                            .foregroundColor(.gray)
                    })
                    Spacer()
                })
            }).navigationTitle("\(account.firstName) \(account.lastName)")
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(account: exampleAccounts[3])
            .previewLayout(.sizeThatFits)
    }
}

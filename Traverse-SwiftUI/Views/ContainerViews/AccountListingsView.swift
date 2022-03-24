//
//  AccountListingsView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/24/22.
//

import SwiftUI

struct AccountListingsView: View {
    var body: some View {
        ScrollView{
            if(exampleListings.count > 0){
                ForEach(exampleListings, content: { listing in
                    NavigationLink(destination: ProductInformationScrollView(listing: listing), label: {
                        CategoryListingView(categoryListing: listing )
                    })
                    Divider()
                })
            }
            else {
                VStack{
                    Spacer()
                    Text("No listings from this account")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.gray)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .center)
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                Button(action: {
                    
                }, label: {
                    Text("Edit")
                })
            })
        }
    }
}

struct AccountListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListingsView()
    }
}

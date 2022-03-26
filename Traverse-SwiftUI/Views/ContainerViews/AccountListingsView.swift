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
                    HStack(alignment: .center){
                        NavigationLink(destination: ListingEditView(listing: listing, listingPrice: String(listing.price)), label: {
                            CategoryListingView(categoryListing: listing )
                        })
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 10, height: 15, alignment: .center)
                            .offset(x: -50, y: 0)
                    }
                    Divider()
                })
            }
            else {
                VStack{
                    Spacer()
                    Text("You haven't listed any products yet")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .foregroundColor(.gray)
                    Spacer()
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .center)
            }
        }
        .navigationTitle("Your Listings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListingsView()
    }
}

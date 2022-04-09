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
            VStack(alignment: .leading){
                Text("Your listings")
                    .font(.custom("Poppins-SemiBold", size: 28))
                    .padding()
                if(exampleListings.count > 0){
                    ForEach(exampleListings, content: { listing in
                        NavigationLink(destination: ListingEditView(listing: listing, listingPrice: String(listing.price)), label: {
                            CategoryListingSubView(categoryListing: listing )
                        })
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

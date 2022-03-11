//
//  ListingsInCategoryView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 3/10/22.
//

import SwiftUI

struct ListingsInCategoryView: View {
    var category: String
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0, content: {
                Text("")
                    .navigationTitle(category)
                    .padding(.leading, 10)
                Divider()
                
                let categoryListings = Util.getCategoryListings(category: category)
                
                if(categoryListings.count > 0){
                    ForEach(categoryListings, content: { listing in
                        NavigationLink(destination: ProductInformationScrollView(listing: listing), label: {
                            CategoryListingView(categoryListing: listing )
                        })
                        Divider()
                    })
                }
                else {
                    VStack{
                        Spacer()
                        Text("No listings in this category")
                            .font(.custom("Poppins-SemiBold", size: 20))
                            .foregroundColor(.gray)
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .center)
                }
            })
        }
    }
    
}

struct ListingsInCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsInCategoryView(category: "Lighting")
    }
}

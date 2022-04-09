//
//  ListingsInCategoryView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 3/10/22.
//

import SwiftUI

struct ListingsInCategoryView: View {
    var category: String
    @EnvironmentObject var settings: showBarResults

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                Text("")
                    .navigationTitle(category)
                    .padding(.leading, 10)
                Divider()
                
                let categoryListings = Util.getCategoryListings(category: category)
                
                Button(action: {
                    settings.showAnnotationsOnMap = true
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Search map for \"\(category)\"")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .padding(20)
                })
                
                if(categoryListings.count > 0){
                    ForEach(categoryListings, content: { listing in
                        NavigationLink(destination: ProductInformationScrollView(listing: listing), label: {
                            CategoryListingSubView(categoryListing: listing )
                        })
                        Divider()
                    })
                }
                else {
                    VStack{
                        Spacer()
                        Text("No listings in this category nearby.")
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

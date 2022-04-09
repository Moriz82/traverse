//
//  AddListingReviewPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/8/22.
//

import SwiftUI

struct AddListingReviewPage: View {
    @State var productName: String
    @State var productPrice: Double
    
    @State var productDescription: String
    @State var selectedCategory: String
    @State var inclusions: [String]
    
    @State var listingImage: UIImage
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical){
                HStack{
                    Text("Review Listing")
                        .font(.custom("Poppins-SemiBold", size: 28))
                        .padding()
                    Spacer()
                }
                
                //MARK: IMAGE
                Image(uiImage: listingImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    .clipped()

                VStack(alignment: .leading, spacing: 20){
                    
                    //MARK: NAME AND PRICE
                    HStack(alignment: .bottom){
                        Text(productName.isEmpty ? "No listing name" : productName)
                            .font(.custom("Poppins-SemiBold", size: 30))
                        Spacer()
                        Text("$")
                            .font(.custom("Poppins-SemiBold", size: 20))
                            .padding(.bottom, 4)
                        Text("\(String(format: "%.2f", productPrice))")
                            .font(.custom("Poppins-SemiBold", size: 30))

                    }
                    
                    //MARK: DESCRIPTION
                    VStack(alignment: .leading){
                        Text(productDescription.isEmpty ? "No description provided" : "\(productDescription)")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.gray)

                    }
                    
                    //MARK: INCLUSIONS
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Inclusions")
                            .font(.custom("Poppins-SemiBold", size: 28))
                        ForEach(inclusions, content: { inclusion in
                            Text(String(inclusion))
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                        })
                        if inclusions.isEmpty{
                            Text("No inclusions added")
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)

                        }
                    })
                }
                .padding()
            }

            
            //MARK: LIST NOW
            HStack(alignment: .center, spacing: 0, content: {
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("List your product")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            })
                .padding()
                .border(.gray, width: 1)
        }
    }
}

struct AddListingReviewPage_Previews: PreviewProvider {
    static var previews: some View {
        AddListingReviewPage(productName: "Power Washer", productPrice: 2.00, productDescription: "piuehfpqewuihfqoewiufhqew we0fyhqowueifhgoqiuwehfoiqweu ueqwgfhoqwuiegfoiquwegf", selectedCategory: "Drone", inclusions: ["welfb", "welfb", "welfb"], listingImage: UIImage())
    }
}

//
//  CategoryListingView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 3/10/22.
//

import SwiftUI

struct CategoryListingSubView: View {
    var categoryListing: listing
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            Image(categoryListing.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.width * 0.2, alignment: .center)
                .cornerRadius(15)

            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(Util.formatStringLength(title: Util.formatStringLength(title: categoryListing.name, length: 15), length: 20))
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .bold()
                    .foregroundColor(.black)
                Text("from $\(String(format: "%.2f", categoryListing.price))")
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.gray)
                Text(categoryListing.address)
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.gray)
                HStack(spacing: 10){
                    Text(categoryListing.verified ? "Verified" : "Not Verified")
                        .font(.custom("Poppins-SemiBold", size: 12))
                        .padding(2)
                        .background(categoryListing.verified ? .green : .red)
                        .foregroundColor(.white)
                        .cornerRadius(3)
                    
                    //MARK: STAR
                    HStack{
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                            .foregroundColor(.blue)
                            .padding(.leading, 7)
                            .padding(.bottom, 2) //small correction to vertical center
                        
                        
                        //MARK: RATING
                        Text("\(String(format: "%.2f", categoryListing.rating))")
                            .font(.custom("Poppins-SemiBold", size: 15))
                            .foregroundColor(.black)
                    }
                }
            })
        })
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.white)
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.18, alignment: .leading)
    }
}

struct CategoryListingView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListingSubView(categoryListing: listing(price: 27.00, rating: 4.76, name: "Power Washer", description: "I bought this two years ago new from Home Depot. It's sitting in my garage so I thought I'd post it. Only $27, barely used", address: "123 Easy St.", imageName: "01", verified: true, owner: exampleAccounts[0], inclusions: ["Soap compartment", "Extension cords", "PSI Comp", "Nozzle w trigger"], reviews: [exampleReviews[1], exampleReviews[2]], category: "Power Tools", isAvailable: true))
    }
}

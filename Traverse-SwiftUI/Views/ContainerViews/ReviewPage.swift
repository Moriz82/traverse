//
//  ReviewPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/10/22.
//

import SwiftUI

struct ReviewPage: View {
    
    @State var listing: listing
    
    var bodyFontSize = 16.0
    var nameFontSize = 20.0
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20, content: {
                Text("Reviews")
                    .font(.custom("Poppins-SemiBold", size: 36))
                    .navigationTitle("Reviews")
                    .padding(.leading, 10)
                Divider()
                
                ForEach(listing.reviews!, content    { eachReview in
                    VStack(alignment: .leading, spacing: 18, content: {
                        HStack(alignment: .center, spacing: 7, content: {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .frame(width: 48, height: 48, alignment: .center)
                                .cornerRadius(16.0)
                            VStack(alignment: .leading, spacing: 0, content: {
                                Text("\(eachReview.reviewAccount.firstName) \(eachReview.reviewAccount.lastName)")
                                    .font(.custom("Poppins-SemiBold", size: nameFontSize))
                                Text("\(eachReview.dateReviewed.formatted())")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 2))
                                    .foregroundColor(.gray)
                            })
                        })
                        
                        //MARK: STARS
                        HStack(alignment: .center, spacing: 3, content: {
                            ForEach((1...eachReview.numberOfStars), id: \.self){_ in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 18, height: 18, alignment: .center)
                                    .foregroundColor(Color("traverse-blue"))
                            }
                        })
                        
                        //MARK: DESCRIPTION
                        HStack(alignment: .center, spacing: 0, content: {
                            Text("\(eachReview.description)")
                                .font(.custom("Poppins-Regular", size: bodyFontSize))
                                .foregroundColor(.gray)
                            Spacer()
                        })
                        
                    })
                        .padding()
                        .cornerRadius(20)
                    Divider()
                })
                
            })
        }
    }
}

struct ReviewPage_Previews: PreviewProvider {
    static var previews: some View {
        ReviewPage(listing: exampleListings[3])
            .previewLayout(.sizeThatFits)
    }
}

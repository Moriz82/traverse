//
//  ProductInformationReviewSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI

struct ProductReviewSubView: View {
    
    let formatter1 = DateFormatter()
    
    @State var reviewInfo: review
        
    var nameFontSize = 14.0
    var bodyFontSize = 10.0

    
    var body: some View {
        
        //MARK: HEADER
        VStack(alignment: .leading, spacing: 6, content: {
            HStack(alignment: .center, spacing: 7, content: {
                Image(systemName: "circle.fill")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 32, height: 32, alignment: .center)
                    .cornerRadius(16.0)
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("\(reviewInfo.reviewAccount.firstName) \(reviewInfo.reviewAccount.lastName)")
                        .font(.custom("Poppins-SemiBold", size: nameFontSize))
                    Text("\(reviewInfo.dateReviewed.formatted())")
                        .font(.custom("Poppins-Regular", size: bodyFontSize - 2))
                        .foregroundColor(.gray)
                })
            })
            
            //MARK: STARS
            HStack(alignment: .center, spacing: 3, content: {
                ForEach((1...reviewInfo.numberOfStars), id: \.self){_ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 13, height: 13, alignment: .center)
                        .foregroundColor(Color("traverse-blue"))
                }
            })
            
            //MARK: DESCRIPTION
            HStack(alignment: .center, spacing: 0, content: {
                Text("\(reviewInfo.description)")
                    .font(.custom("Poppins-Regular", size: bodyFontSize))
                    .foregroundColor(.gray)
                Spacer()
            })
            
        })
            .padding()
            .frame(width: 240, height: 170, alignment: .top)
            .cornerRadius(20)
    }
}

struct ProductInformationReviewSubView_Previews: PreviewProvider {
    static var previews: some View {
        ProductReviewSubView(reviewInfo: exampleReviews[0])
            .previewLayout(.sizeThatFits)
    }
}

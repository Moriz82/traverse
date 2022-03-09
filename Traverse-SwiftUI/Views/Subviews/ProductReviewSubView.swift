//
//  ProductInformationReviewSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI

struct ProductReviewSubView: View {
    var nameFontSize = 14.0
    var bodyFontSize = 10.0
    
    var numberOfStars: Int = 4
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            HStack(alignment: .center, spacing: 7, content: {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 32, height: 32, alignment: .center)
                    .cornerRadius(16.0)
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Profile Name")
                        .font(.custom("Poppins-SemiBold", size: nameFontSize))
                    Text("Date of review")
                        .font(.custom("Poppins-Regular", size: bodyFontSize - 2))
                        .foregroundColor(.gray)
                })
            })
            HStack(alignment: .center, spacing: 3, content: {
                ForEach((1...numberOfStars), id: \.self){_ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 13, height: 13, alignment: .center)
                        .foregroundColor(Color("traverse-blue"))
                }
            })
            HStack(alignment: .center, spacing: 0, content: {
                Text("Review body text")
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
        ProductReviewSubView()
            .previewLayout(.sizeThatFits)
    }
}

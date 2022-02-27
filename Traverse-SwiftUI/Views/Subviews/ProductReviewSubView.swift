//
//  ProductInformationReviewSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI

struct ProductReviewSubView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack(alignment: .center, spacing: 10, content: {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Profile Name")
                        .font(.title)
                    Text("Date of review")
                })
            })
            HStack(alignment: .center, spacing: 0, content: {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")

            })
            HStack(alignment: .center, spacing: 0, content: {
                Text("Review body text")
                Spacer()
            })
            
        })
            .padding()
            .frame(width: 300, height: 150, alignment: .top)
            .cornerRadius(20)
    }
}

struct ProductInformationReviewSubView_Previews: PreviewProvider {
    static var previews: some View {
        ProductReviewSubView()
            .previewLayout(.sizeThatFits)
    }
}

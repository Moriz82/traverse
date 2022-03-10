//
//  HorizontalProductScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct HorizontalProductScrollView: View {
    @EnvironmentObject var settings: showBarResults
    var postHeight: Double = 120.0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .center, spacing: 0, content: {
                ForEach(exampleListings, id: \.self){ newpost in
                    NavigationLink(destination: ProductInformationScrollView(listing: newpost), label: {
                        ProductPostView(UISettings: UserInterfaceSettings(hScrollViewPostWidth: 150.0, hScrollViewPostHeight: postHeight, hScrollViewPostTitleFont: 15.0, hScrollViewPostBodyFont: 12.0), post: newpost)
                            .shadow(color: .gray, radius: 10, x: 0, y: 0)
                            .padding(.leading, 15)
                    })
                }
            })
                .frame(height: postHeight + 140)
        }
    }
}

struct HorizontalProductScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProductScrollView()
            .previewLayout(.sizeThatFits)
    }
}

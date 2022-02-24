//
//  HorizontalProductScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct HorizontalProductScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .center, spacing: 0, content: {
                ForEach(exampleData, id: \.self){ newpost in
                    ProductPostView(UISettings: UserInterfaceSettings(hScrollViewPostWidth: 150.0, hScrollViewPostHeight: 120.0, hScrollViewPostTitleFont: 15.0, hScrollViewPostBodyFont: 12.0), post: newpost)
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                        .padding(.leading, 15)
                }
            })
                .frame(height: UIScreen.main.bounds.height * 0.30)
        }
    }
}

struct HorizontalProductScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProductScrollView()
            .previewLayout(.sizeThatFits)
    }
}

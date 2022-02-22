//
//  HorizontalProductScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct HorizontalProductScrollView: View {
    var body: some View {
        ScrollView(.horizontal){
            
            //lazy property ensures that listings only load as they come into screen
            LazyHStack(alignment: .center, spacing: 10, content: {
                
                //for each post in the array called "data", creates a new post view
                ForEach(exampleData, id: \.self){ newpost in
                    ProductPostView(UISettings: UserInterfaceSettings(hScrollViewPostWidth: 200.0, hScrollViewPostHeight: 150.0, hScrollViewPostTitleFont: 22.0, hScrollViewPostBodyFont: 16.0), post: newpost)
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                }
            })
                .frame(height: UIScreen.main.bounds.height * 0.4)
        }
    }
}

struct HorizontalProductScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProductScrollView()
            .previewLayout(.sizeThatFits)
    }
}

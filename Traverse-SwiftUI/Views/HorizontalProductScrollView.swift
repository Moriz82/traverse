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
                    ProductPostView(post: newpost)
                }
            })
        }
    }
}

struct HorizontalProductScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProductScrollView()
    }
}

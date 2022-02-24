//
//  MiniProductTypeLabelScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/23/22.
//

import SwiftUI

struct MiniProductTypeLabelScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .center, spacing: 0, content: {
                ForEach(exampleProductTypes, id: \.self){ newpost in
                    MiniProductTypeLabel(productTypeString: newpost)
                        .padding(.leading, 15)
                }
            })
                .frame(height: UIScreen.main.bounds.height * 0.05)

        }
    }
}

struct MiniProductTypeLabelScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MiniProductTypeLabelScrollView()
            .previewLayout(.sizeThatFits)
    }
}

//
//  MiniProductTypeLabelScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/23/22.
//

import SwiftUI

//MARK: SCROLL VIEW
struct CategoryLabelScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            LazyHStack(alignment: .center, spacing: 0, content: {
                ForEach(exampleCategories, id: \.self){ newpost in
                    MiniProductTypeLabel(productTypeString: newpost)
                        .padding(.leading, 15)
                    
                }
            })
                .frame(height: 50)

        }
    }
}

//MARK: INDIVIDUAL LABEL
struct MiniProductTypeLabel: View {
    var productTypeString: String
    var body: some View {
        NavigationLink(destination: ListingsInCategoryView(category: productTypeString), label: {
            Text(productTypeString)
                .font(.custom("Poppins-Regular", size: 10))
                .padding(7)
                .background(.white)
                .cornerRadius(40.0)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
                .foregroundColor(.black)
        })
    }
}

struct MiniProductTypeLabelScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLabelScrollView()
            .previewLayout(.sizeThatFits)
    }
}



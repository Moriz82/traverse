//
//  MiniProductTypeLabel.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/23/22.
//

import SwiftUI

struct MiniProductTypeLabel: View {
    var productTypeString: String
    
    var body: some View {
        ZStack{
            /*
            Text(productTypeString)
                .font(.custom("Poppins-Regular", size: 10))
                .padding(9)
                .background(.black)
                .cornerRadius(40.0)
            */
            Text(productTypeString)
                .font(.custom("Poppins-Regular", size: 10))
                .padding(7)
                .background(.white)
                .cornerRadius(40.0)
                .shadow(color: .gray, radius: 5, x: 0, y: 0)
        }
    }
}

struct MiniProductTypeLabel_Previews: PreviewProvider {
    static var previews: some View {
        MiniProductTypeLabel(productTypeString: "Outdoors")
            .previewLayout(.sizeThatFits)
    }
}

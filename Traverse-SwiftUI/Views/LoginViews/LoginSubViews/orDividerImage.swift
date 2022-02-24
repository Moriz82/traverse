//
//  orDividerImage.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/25/21.
//

import SwiftUI

struct orDividerImage: View {
    var body: some View {
                  Image("orImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.040)                        .aspectRatio(contentMode: .fit)
    }
}

struct orDividerImage_Previews: PreviewProvider {
    static var previews: some View {
        orDividerImage()
    }
}

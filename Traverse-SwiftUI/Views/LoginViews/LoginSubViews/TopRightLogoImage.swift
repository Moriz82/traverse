//
//  TopRightLogoImage.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/23/21.
//

import SwiftUI

struct TopRightLogoImage: View {
    var body: some View {
        Image("TopLeftLogo")
            .frame(width: UIScreen.main.bounds.width * 0.428, height: UIScreen.main.bounds.height * 0.044)
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            .aspectRatio(contentMode: .fit)

    }
}

struct TopRightLogoImage_Previews: PreviewProvider {
    static var previews: some View {
        TopRightLogoImage()
    }
}

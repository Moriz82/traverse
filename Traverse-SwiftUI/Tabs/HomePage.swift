//
//  HomePage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        VStack{
            SearchBarView()
            HorizontalProductScrollView()
        }
        .background(.black)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

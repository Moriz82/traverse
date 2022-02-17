//
//  HomePage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct HomePage: View {
    @StateObject var settings = UserInterfaceSettings()
    
    var body: some View {
        VStack{
            SearchBarView()
            if !settings.showSearchBarResults{
                HorizontalProductScrollView()
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
        .environmentObject(settings)
        .background(settings.showSearchBarResults ? .blue : .black)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

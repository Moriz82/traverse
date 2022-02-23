//
//  File.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/17/22.
//

import Foundation

//allows for UI customization of ProductPostView
class UserInterfaceSettings: ObservableObject{
    var hScrollViewPostWidth: Double
    var hScrollViewPostHeight: Double
    var hScrollViewPostTitleFont: Double
    var hScrollViewPostBodyFont: Double
    
    init(hScrollViewPostWidth: Double, hScrollViewPostHeight: Double, hScrollViewPostTitleFont: Double, hScrollViewPostBodyFont: Double){
        self.hScrollViewPostWidth = hScrollViewPostWidth
        self.hScrollViewPostHeight = hScrollViewPostHeight
        self.hScrollViewPostTitleFont = hScrollViewPostTitleFont
        self.hScrollViewPostBodyFont = hScrollViewPostBodyFont
    }
}

//allows access to whether search bar is toggled for ContentView/HomePage state changes
class showBarResults: ObservableObject{
    @Published var showSearchBarResults: Bool = false
}

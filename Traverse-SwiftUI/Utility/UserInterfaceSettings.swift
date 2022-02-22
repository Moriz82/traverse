//
//  File.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/17/22.
//

import Foundation

class UserInterfaceSettings: ObservableObject{
    @Published var showSearchBarResults: Bool = false
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

//
//  Util.swift
//  Mobile Makers Test
//
//  Created by Aiden Seibel on 12/7/21.
//

import Foundation
import SwiftUI

class Util {
    public static func formatStringLength(title: String, length: Int) -> String {  // Forces an ellipses if string is too long
        if(title.count > length) {
            let index = title.index(title.startIndex, offsetBy: length + 1)
            let mySubstring = title.prefix(upTo: index)
            return mySubstring + "..."
        }
        
        return title
    }
    
    public static func getCategoryListings(category: String) -> [listing] {
        var listingsInCategory: [listing] = []
        
        for listing in exampleListings {
            if(listing.category == category){
                listingsInCategory.append(listing)
            }
        }
        
        return listingsInCategory
    }
}

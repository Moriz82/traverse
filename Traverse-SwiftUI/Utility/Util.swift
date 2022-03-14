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
    
    public static func getOtherItems(listingToBeRemoved: listing) -> [listing] {
        let listings = getCategoryListings(category: listingToBeRemoved.category!)
        var newListings: [listing] = []
        
        for listing in listings {
            if(!(listing.id == listingToBeRemoved.id)){
                newListings.append(listing)
            }
        }
        
        return newListings
    }
    
    public static func getOwnerListings(owner: account) -> [listing] {
        var ownerListings: [listing] = []
        
        for listing in exampleListings {
            if(listing.owner.id == owner.id){
                ownerListings.append(listing)
            }
        }
        
        return ownerListings
    }
}

//
//  Util.swift
//  Mobile Makers Test
//
//  Created by Aiden Seibel on 12/7/21.
//

import Foundation
import SwiftUI

//MARK: UTIL
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

//MARK: SEARCH
class Search{
    public static func getSearchResults(search: String) -> [listing] {
        // Returns an array of results based on search; sees if name, address, and description contains search word, case insensitive
        // Searches from example data in Database.swift
        
        var searchResults: [listing] = []
        var count = 0
        let maximumSearchResultCount = 10
        
        for listing in exampleListings {
            if((listing.name.range(of: search, options: .caseInsensitive)) != nil){
                searchResults.append(listing)
                count += 1
            }
            else if ((listing.description.range(of: search, options: .caseInsensitive)) != nil) {
                searchResults.append(listing)
                count += 1
            }
            else if ((listing.address.range(of: search, options: .caseInsensitive)) != nil) {
                searchResults.append(listing)
                count += 1
            }
            
            if(count == maximumSearchResultCount){
                return searchResults
            }
        }
        
        return searchResults
    }
}

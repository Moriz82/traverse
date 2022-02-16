
//  Search.swift
//  SearchBarAnimation
//
//  Created by Yash Shah on 1/11/22.
//

import Foundation

class Search{
    public static var showResults: Bool = false

    public static func getSearchResults(search: String) -> [listing] {
        // Returns an array of results based on search; sees if name, address, and description contains search word, case insensitive
        // Searches from example data in Database.swift
        
        var searchResults: [listing] = []
        var count = 0
        let maximumSearchResultCount = 10
        
        for listing in exampleData {
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

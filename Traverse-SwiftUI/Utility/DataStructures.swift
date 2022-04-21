//
//  Database.swift
//  Mobile Makers Test
//
//  Created by Cesar Andres on 12/3/21.
//

import Foundation
import MapKit

struct listing: Identifiable, Hashable {
    var id = UUID()
    
    var price, rating: Double
    var name, description, address, imageName: String
    var verified: Bool
    
    var owner: account
    
    var cancelationTimeInHours: Int?
    
    var inclusions: [String]?
    var reviews: [review]?
    var category: String?
    
    var isAvailable: Bool
    
    //necessary for ForEach function in HorizontalProductScrollView.swift
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct account: Identifiable, Hashable{
    var id = UUID()
    var firstName, lastName: String
    var name: String?
    var verification: Bool
    var email: String
    var dateJoined: Date
    
    var phoneNumber: String?
    var profilePicture: String?
    
    var responseRate: Double?
    var responseTimeInMinutes: Int?
    var numberOfItemsRented: Int?
    var numberOfItemsListed: Int?
    
    //necessary for ForEach function in HorizontalProductScrollView.swift
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct review: Identifiable, Hashable{
    var id = UUID()
    var reviewAccount: account
    var dateReviewed: Date
    var numberOfStars: Int
    var description: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct address: Identifiable, Hashable{
    var id = UUID()
    var streetAddress, city, country, zipCode: String
    var usState: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct mapAnnotation: Identifiable{
    let id = UUID()
    var listing: listing
    var coordinate: CLLocationCoordinate2D
}

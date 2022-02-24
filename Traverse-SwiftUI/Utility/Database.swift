//
//  Database.swift
//  Mobile Makers Test
//
//  Created by Cesar Andres on 12/3/21.
//

import Foundation

struct listing: Identifiable, Hashable {
        var id = UUID()
    
    var price, rating: Double
    var name, description, address, imageName: String
    var verified: Bool
    
    //necessary for ForEach function in HorizontalProductScrollView.swift
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

var exampleData: [listing] = [
    listing(price: 27.00, rating: 4.76, name: "Power Washer from my grandmother", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "01", verified: true),
    listing(price: 12.00, rating: 4.21, name: "Electric Skateboard", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "02", verified: false),
    listing(price: 31.00, rating: 5.0, name: "Generator", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "03", verified: true),
    listing(price: 34.00, rating: 3.57, name: "Microphone", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "04", verified: true),
    listing(price: 18.00, rating: 4.12, name: "Canon Camera", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "05", verified: false),
    listing(price: 22.00, rating: 5.0, name: "Keyboard", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "06", verified: true),
    listing(price: 12.00, rating: 2.23, name: "Guitar", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", address: "123 Easy St.", imageName: "07", verified: false)
]


var exampleProductTypes: [String] = ["Drones", "Power Tools", "Pool Equipment", "Outdoors", "Lighting", "Kitchen", "Basketball", "Drugs"]
    
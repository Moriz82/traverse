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
    
    //necessary for ForEach function in HorizontalProductScrollView.swift
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct account: Identifiable, Hashable{
    var id = UUID()
    var firstName, lastName: String
    var verification: Bool
    var email: String
    var dateJoined: Date
    
    var phoneNumber: String?
    var profilePicture: String?
    
    var responseRate: Double?
    var responseTimeInMinutes: Int?
    
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


var exampleProductTypes: [String] = ["Drones", "Power Tools", "Pool Equipment", "Outdoors", "Lighting", "Kitchen", "Basketball", "Drugs"]
var randomProductNames: [String] = ["Power Washer", "Keyboard", "Guitar", "Electric Skateboard", "Microphone", "Shaver", "Air Conditioning", "Lawn Mower", "Scooter", "Tools", "Drill Gun", "Wirless Earbuds", "Drone", "Court of Appeals", "Basketball", "Calculator", "Filing Cabinet", "Laptop", "School Desk lol", "Projector"]
var randomProductDescriptions: [String] = [
    "I bought this two years ago new from Home Depot. It's sitting in my garage so I thought I'd post it. Only $27, barely used",
    "Has stickers on bottom. Rechargable battery, it's about four years old but still in great condition",
    "In electricity generation, a generator is a device that converts motive power into electrical power for use in an external circuit. Sources of mechanical energy include steam turbines, gas turbines, water turbines, internal combustion engines, wind turbines and even hand cranks. - Wikipedia",
    "My pride and joy. I've used this for gaming for years. Good luck with destroying noobs with this bad boy, nothing feels better",
    "EOS Rebel T8i EF-S 18-55mm IS STM Lens Kit Equipped with a 24.1 Megapixel CMOS (APS-C) sensor, DIGIC 8 image processor and an ISO range of 100-25600 (expandable to 51200**). continuous shooting of up to 7 frames per second.",
    "It's like a piano but better. Has all connections. DM me for delivery, I'm out of town these next few weeks.",
    "The FitnessGram PACER Test is a multistage aerobic capacity test that progressively gets more difficult as it continues. The test is used to measure a student's aerobic capacity as part of the FitnessGram assessment. Students run back and forth as many times as they can, each lap signaled by a beep sound.",
    "Red sus. Red suuuus. I said red, sus, hahahahaha. Why arent you laughing? I just made a reference to the popular video game Among Us! How can you not laugh at it? Emergeny meeting! Guys, this here guy doesnt laugh at my funny Among Us memes! Lets beat him to death! Dead body reported! Skip! Skip! Vote blue! Blue was not an impostor. Among us in a nutshell hahahaha. What?! Youre still not laughing your ass off? I made SEVERAL funny references to Among Us and YOU STILL ARENT LAUGHING??!!! Bruh. Ya hear that? Wooooooosh. Whats woooosh? Oh, nothing. Just the sound of a joke flying over your head. Whats that? You think im annoying? Kinda sus, bro. Hahahaha! Anyway, yea, gotta go do tasks. Hahahaha!",
    "This does not change the fact that in Antarctica there are 21 million penguins and in Malta there are 502,653 inhabitants. So if the penguins decide to invade Malta, each Maltese will have to fight 42 penguins.",
    "I can't fucking take it any more. Among Us has singlehandedly ruined my life. The other day my teacher was teaching us Greek Mythology and he mentioned a pegasus and I immediately thought 'Pegasus? more like Mega Sus!!!!' and I've never wanted to kms more. I can't look at a vent without breaking down and fucking crying. I can't eat pasta without thinking 'IMPASTA??? THATS PRETTY SUS!!!!' Skit 4 by Kanye West. The lyrics ruined me. A Mongoose, or the 25th island of greece. The scientific name for pig. I can't fucking take it anymore.",
    "Do british people actually exist? I mean, they must be a meme, there is a not a single thing about them. And I mean it. Let's go through the evidence: Where are they from? Not a single country in the world is named Britain. Some people say they come from England, and England is inside Britain, but if that was the case they would be British they would be Englanders. Also, heard some silly theories about them coming from whales. Guys, no, whale people do not exist. Whales live in the sea.",
    "There is a consensus on British people coming from Europe, but then we are left with a whole continent of possible locations. That's as good as nothing. What do they eat? Every country has at least one main dish. Even the US has their burgers. But these British people, what do they eat? Heard some people associating them with tea, but everyone knows that's an Asian thing. Shouldn't they come from Europe? One of these two points must be wrong them. To me, it looks too sketchy.",
    "Please DO NOT buy the BTS meal if you don't stan them. You're preventing the actual BTS fans who have waited for months from having the BTS meal experience. Eating the sauces without understanding their significance is literally cultural appropriation and it's not okay"
]
var imageNames: [String] = ["01","02","03","04","05","06","07"]
var randomProductInclusions: [String] = ["Charger", "Screwdriver", "Gun", "Case", "Soap Compartment", "Legs", "Tripod", "Stool", "Lighting", "Extension Cord", "Sweatpants", "Gasoline", "Writing Utensil", "Gloves and shoes", "Bagel", "Wax", "Manual", "Racket", "Paper", "Marker", "Free wiring"]
var randomReviews: [[review]] = [
    [exampleReviews[0], exampleReviews[1]],
    [exampleReviews[1], exampleReviews[2]],
    [exampleReviews[3], exampleReviews[4]],
    [exampleReviews[5], exampleReviews[6]],
    [exampleReviews[0], exampleReviews[2]],
    [exampleReviews[1], exampleReviews[3]],
    [exampleReviews[2], exampleReviews[4]],
    [exampleReviews[3], exampleReviews[5]],
    [exampleReviews[4], exampleReviews[6]],
    [exampleReviews[0], exampleReviews[1], exampleReviews[2]],
    [exampleReviews[3], exampleReviews[4], exampleReviews[5]],
    [exampleReviews[6], exampleReviews[2], exampleReviews[3]],
    [exampleReviews[4], exampleReviews[1], exampleReviews[0]],
    [exampleReviews[5], exampleReviews[3], exampleReviews[0]]
]



var exampleAccounts: [account] = [
    account(firstName: "Yash", lastName: "Shah", verification: true, email: "yash.shah@ys.com", dateJoined: Date(), phoneNumber: "5129276152"),
    account(firstName: "Jay", lastName: "Kannam", verification: true, email: "jay.kannam@jk.com", dateJoined: Date()),
    account(firstName: "Alan", lastName: "Reyes", verification: true, email: "alan.reyes@ar.com", dateJoined: Date()),
    account(firstName: "Miles", lastName: "Belknap", verification: true, email: "miles.belknap@mb.com", dateJoined: Date()),
    account(firstName: "Aiden", lastName: "Seibel", verification: true, email: "aiden.seibel@as.com", dateJoined: Date()),
    account(firstName: "Matthew", lastName: "Knox", verification: true, email: "matthew.know@mk.com", dateJoined: Date()),
    account(firstName: "Ganesh", lastName: "Sadasivan", verification: true, email: "ganesh.sadasivan@gs.com", dateJoined: Date()),
    account(firstName: "Nathan", lastName: "Harward", verification: true, email: "nathan.harward@nh.com", dateJoined: Date()),
    account(firstName: "Cesar", lastName: "Gamez", verification: true, email: "cesar.gamez@cg.com", dateJoined: Date())
]

var exampleReviews: [review] = [
    review(reviewAccount: exampleAccounts[1], dateReviewed: Date(), numberOfStars: 4, description: "Solid"),
    review(reviewAccount: exampleAccounts[2], dateReviewed: Date(), numberOfStars: 3, description: "I wouldn't recommend unless you're in a tight stint and really need it."),
    review(reviewAccount: exampleAccounts[3], dateReviewed: Date(), numberOfStars: 5, description: "Fantastic, worked perfect, owner is really nice guy"),
    review(reviewAccount: exampleAccounts[4], dateReviewed: Date(), numberOfStars: 4, description: "Meh it's okay"),
    review(reviewAccount: exampleAccounts[5], dateReviewed: Date(), numberOfStars: 5, description: "Didn't break, 10/10"),
    review(reviewAccount: exampleAccounts[6], dateReviewed: Date(), numberOfStars: 5, description: "Not shitty! Sometimes the experience is not the best, but this definitely was."),
    review(reviewAccount: exampleAccounts[6], dateReviewed: Date(), numberOfStars: 2, description: "Terrible, terrible product.")

]

var exampleListings: [listing] = [
    listing(price: 27.00, rating: 4.76, name: "Power Washer", description: "I bought this two years ago new from Home Depot. It's sitting in my garage so I thought I'd post it. Only $27, barely used", address: "123 Easy St.", imageName: "01", verified: true, owner: exampleAccounts[0], inclusions: ["Soap compartment", "Extension cords", "PSI Comp", "Nozzle w trigger"], reviews: [exampleReviews[1], exampleReviews[2]], category: "Power Tools"),
    
    listing(price: 12.00, rating: 4.21, name: "Electric Skateboard", description: "Has stickers on bottom. Rechargable battery, it's about four years old but still in great condition", address: "123 Easy St.", imageName: "02", verified: false, owner: exampleAccounts[1], inclusions: ["Charging cable", "Extra battery"], reviews: [exampleReviews[3], exampleReviews[4]], category: "Power Tools"),
    
    listing(price: 31.00, rating: 5.0, name: "Generator", description: "In electricity generation, a generator is a device that converts motive power into electrical power for use in an external circuit. Sources of mechanical energy include steam turbines, gas turbines, water turbines, internal combustion engines, wind turbines and even hand cranks. - Wikipedia", address: "123 Easy St.", imageName: "03", verified: true, owner: exampleAccounts[2], inclusions: ["Gasoline", "Extension cords", "all the works"], reviews: [exampleReviews[5], exampleReviews[0]]),
    
    listing(price: 34.00, rating: 3.57, name: "Microphone", description: "My pride and joy. I've used this for gaming for years. Good luck with destroying noobs with this bad boy, nothing feels better", address: "123 Easy St.", imageName: "04", verified: true, owner: exampleAccounts[3], reviews: [exampleReviews[1], exampleReviews[2]]),
    
    listing(price: 18.00, rating: 4.12, name: "Canon Camera", description: "EOS Rebel T8i EF-S 18-55mm IS STM Lens Kit Equipped with a 24.1 Megapixel CMOS (APS-C) sensor, DIGIC 8 image processor and an ISO range of 100-25600 (expandable to 51200**). continuous shooting of up to 7 frames per second.", address: "123 Easy St.", imageName: "05", verified: false, owner: exampleAccounts[4], reviews: [exampleReviews[3], exampleReviews[4]]),
    
    listing(price: 22.00, rating: 5.0, name: "Keyboard", description: "It's like a piano but better. Has all connections. DM me for delivery, I'm out of town these next few weeks.", address: "123 Easy St.", imageName: "06", verified: true, owner: exampleAccounts[5], reviews: [exampleReviews[5], exampleReviews[0]]),
    
    listing(price: 12.00, rating: 2.23, name: "Guitar", description: "k", address: "123 Easy St.", imageName: "07", verified: false, owner: exampleAccounts[6], reviews: [exampleReviews[1], exampleReviews[2]]),
    
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]]),
    listing(price: Double.random(in: 10.0..<100.0), rating: Double.random(in: 0.0..<5.0), name: randomProductNames[Int.random(in: 0..<randomProductNames.count)], description: randomProductDescriptions[Int.random(in: 0..<randomProductDescriptions.count)], address: "123 Easy St.", imageName: imageNames[Int.random(in: 0..<imageNames.count)], verified: false, owner: exampleAccounts[Int.random(in: 0..<exampleAccounts.count)], reviews: [exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)], exampleReviews[Int.random(in: 0..<exampleReviews.count)]])
]


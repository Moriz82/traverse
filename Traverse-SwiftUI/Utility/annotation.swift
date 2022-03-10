//
//  MapAnnotation.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/9/22.
//

import Foundation
import SwiftUI
import MapKit

struct annotation: Identifiable{
    let id = UUID()
    var price: Double
    var productType: String
    var coordinate: CLLocationCoordinate2D
}

var exampleAnnotations: [annotation] = [
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7))),
    annotation(price: Double.random(in: 10.0..<100.0), productType: "Drone", coordinate: CLLocationCoordinate2D(latitude: Double.random(in: 30.4..<30.6), longitude: Double.random(in: -97.9 ..< -97.7)))
]

//
//  MapBoxView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/18/22.
//

import Foundation
import SwiftUI
import MapboxMaps

struct MapBoxMapView: UIViewControllerRepresentable{
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return MapViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

class MapViewController: UIViewController{
    internal var mapView: MapView!
    override public func viewDidLoad() {
        super.viewDidLoad()
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoieWFzaHMxOCIsImEiOiJjbDF2MHkzMm0wcnE5M2pudHA5MjBqZ3l4In0.IkIOXbAJhopXC4KvGmslLg")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, styleURI: StyleURI(url: URL(string: "mapbox://styles/yashs18/cl26jf795006616mv0cd67qi6")!))
        
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
}

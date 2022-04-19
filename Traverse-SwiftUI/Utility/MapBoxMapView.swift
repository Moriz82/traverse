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
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiYWlkZW5zZWliZWwiLCJhIjoiY2wyNTNmcjdnMjZteTNpcWQ1NzV6ZnRzdyJ9.TVSXezx6c75IixfOorzLwg")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
}

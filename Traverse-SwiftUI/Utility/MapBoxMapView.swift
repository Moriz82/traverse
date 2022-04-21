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
    
    private func createSampleView(withText text: String) -> UIView {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 69.02, height: 30.79)
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0, green: 0.365, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 50
        view.text = text
        
        return view
    }

    
    private func addViewAnnotation(at coordinate: CLLocationCoordinate2D) {
        let options = ViewAnnotationOptions(
            geometry: Point(coordinate),
            width: 100,
            height: 40,
            allowOverlap: false,
            anchor: .center
        )
        let sampleView = createSampleView(withText: "Hello")
        try? mapView.viewAnnotations.add(sampleView, options: options)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoieWFzaHMxOCIsImEiOiJjbDF2MHkzMm0wcnE5M2pudHA5MjBqZ3l4In0.IkIOXbAJhopXC4KvGmslLg")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, styleURI: StyleURI(url: URL(string: "mapbox://styles/yashs18/cl26jf795006616mv0cd67qi6")!))
        
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
}

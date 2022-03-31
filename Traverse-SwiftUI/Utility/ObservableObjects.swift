//
//  File.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/17/22.
//

import Foundation

import FirebaseAuth

import CoreLocation
import MapKit


//allows for UI customization of ProductPostView
class UserInterfaceSettings: ObservableObject{
    var hScrollViewPostWidth: Double
    var hScrollViewPostHeight: Double
    var hScrollViewPostTitleFont: Double
    var hScrollViewPostBodyFont: Double
    
    init(hScrollViewPostWidth: Double, hScrollViewPostHeight: Double, hScrollViewPostTitleFont: Double, hScrollViewPostBodyFont: Double){
        self.hScrollViewPostWidth = hScrollViewPostWidth
        self.hScrollViewPostHeight = hScrollViewPostHeight
        self.hScrollViewPostTitleFont = hScrollViewPostTitleFont
        self.hScrollViewPostBodyFont = hScrollViewPostBodyFont
    }
}

//allows access to whether search bar is toggled for ContentView/HomePage state changes
class showBarResults: ObservableObject{
    @Published var showSearchBarResults: Bool = false
    @Published var showProductInformationView: Bool = false
}

class checkIfLoggedIn: ObservableObject{
    @Published var isLoggedIn: Bool = false
}


class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func login(email: String, password: String){
        auth.signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            //Success
            DispatchQueue.main.async{
                self?.signedIn = true
            }
            
        })
    }
        
    func signup(name: String, email: String, password: String){
        auth.createUser(withEmail: email, password: password, completion: { [weak self] result, error in
            guard result != nil, error == nil else{
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        })
    }
}



final class MapLocationModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    var locationManager: CLLocationManager?
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0))

    
    func checkIfLocationisEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }else{
            print("Show alert letting them know location services is off and go turn it on")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("likely restricted due to parental controls")
        case .denied:
            print("you have denied this app locatino permission")
        case .authorizedAlways, .authorizedWhenInUse:
            if locationManager.location?.coordinate != nil{
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25))
            }
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

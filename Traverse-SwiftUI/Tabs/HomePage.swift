//
//  HomePage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI
import MapKit

struct HomePage: View {
    @StateObject var settings = showBarResults()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        ZStack{
            if settings.showSearchBarResults{
                Color.blue.ignoresSafeArea()
            }
            if !settings.showSearchBarResults{
                Map(coordinateRegion: $region)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            }
            VStack{
                SearchBarView()
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
                Spacer()
                if !settings.showSearchBarResults{
                    HorizontalProductScrollView()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            .environmentObject(settings)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

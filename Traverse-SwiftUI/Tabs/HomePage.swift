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
    @StateObject private var mapViewModel = MapLocationModel()
        
    var body: some View {
        NavigationView{
            ZStack{
                if settings.showSearchBarResults{
                    Color.blue.ignoresSafeArea()
                }
                if !settings.showSearchBarResults{
                    Map(coordinateRegion: $mapViewModel.region, annotationItems: exampleAnnotations){ place in
                        MapAnnotation(coordinate: place.coordinate, content: {
                            Button(action: {
                                
                            }, label: {
                                Text("$"+String(format: "%.0f", place.price))
                                    .font(.custom("Poppins-SemiBold", size: 16.0))
                                    .frame(width: 65, height: 30, alignment: .center)
                                    .background(Color("traverse-blue"))
                                    .accentColor(.white)
                                    .cornerRadius(15.0)
                                    .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.white, lineWidth: 1))
                            })
                        })
                    }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .onAppear{
                            mapViewModel.checkIfLocationisEnabled()
                        }
                }
                VStack{
                    SearchBarView()
                        .environmentObject(settings)
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                    if !settings.showSearchBarResults{
                        MiniProductTypeLabelScrollView()
                    }
                    Spacer()
                    if !settings.showSearchBarResults{
                        HorizontalProductScrollView()
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.9)
            }
            .navigationBarHidden(true)
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

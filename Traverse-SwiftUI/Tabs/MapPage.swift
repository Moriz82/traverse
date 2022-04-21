//
//  HomePage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI
import MapKit

struct MapPage: View {
    @StateObject var settings = showBarResults()
    //offsets
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.3
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0

    var emptyArray: [mapAnnotation] = []
        
    var body: some View {
        NavigationView{
            ZStack{
                if settings.showSearchBarResults{
                    Color.blue.ignoresSafeArea()
                }
                if !settings.showSearchBarResults{
                    MapBoxMapView()
                        .ignoresSafeArea()
//                    Map(coordinateRegion: $mapViewModel.region, annotationItems: settings.showAnnotationsOnMap ?  exampleMapAnnotations : emptyArray){ place in
//                        MapAnnotation(coordinate: place.coordinate, content: {
//                            NavigationLink(destination: ProductInformationScrollView(listing: exampleListings[0]), label: {
//                                Text("$"+String(format: "%.0f", place.listing.price))
//                                    .font(.custom("Poppins-SemiBold", size: 16.0))
//                                    .frame(width: 65, height: 30, alignment: .center)
//                                    .background(Color("traverse-blue"))
//                                    .accentColor(.white)
//                                    .cornerRadius(15.0)
//                                    .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.white, lineWidth: 1))
//
//                            })
//                        })
//                    }
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                        .onAppear{
//                            mapViewModel.checkIfLocationisEnabled()
//                        }
                }
                VStack{
                    SearchBarView()
                        .environmentObject(settings)
                        .shadow(color: .gray, radius: 10, x: 0, y: 0)
                    if !settings.showSearchBarResults{
                        CategoryLabelScrollView()
                            .environmentObject(settings)
                    }
                    Spacer()
                    if !settings.showSearchBarResults{
                        VStack(alignment: .center, spacing: 0){
                            RoundedRectangle(cornerRadius: 2)
                                .frame(width: UIScreen.main.bounds.width * 0.10, height: 4)
                                .foregroundColor(Color("light-gray"))
                                .padding(.top, 10)
                            VStack(alignment: .leading, spacing: 5){
                                Text("Listings Nearby")
                                    .font(.custom("Poppins-SemiBold", size: 24))
                                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
                                ScrollView(.horizontal, showsIndicators: false){
                                    LazyHStack(alignment: .center, spacing: 0, content: {
                                        ForEach(exampleListings, id: \.self){ newpost in
                                            NavigationLink(destination: ProductInformationScrollView(listing: newpost), label: {
                                                MiniProductView(post: newpost)
                                                    .overlay(RoundedRectangle(cornerRadius: 36).stroke(Color.gray, lineWidth: 1))
                                                    .padding(.leading, 15)

                                            })
                                        }
                                    })
                                }.frame(height: 200)
                            }
                        }
                        .padding(.bottom, 50)
                        .background(.white)
                        .cornerRadius(18)
                        .offset(y: startingOffsetY)
                        .offset(y: currentDragOffsetY)
                        .offset(y: endingOffsetY)
                        .gesture(
                            DragGesture()
                                .onChanged{ value in
                                    withAnimation(.easeInOut(duration: 0.3)){
                                        var limitOffset = value.translation.height
                                        //if positive
                                        if endingOffsetY == (-startingOffsetY - 20){
                                            //only allow positive
                                            if limitOffset < 0{
                                                limitOffset = 0;
                                            }
                                        }
                                        
                                        //if negative
                                        if limitOffset < (-startingOffsetY - 20){
                                            limitOffset = -startingOffsetY - 20
                                        }
                                        currentDragOffsetY = limitOffset
                                        
                                    }
                                }
                                .onEnded{ value in
                                    withAnimation(.easeInOut(duration: 0.3)){
                                        if currentDragOffsetY < -100 {
                                            endingOffsetY = -startingOffsetY - 20
                                        } else if endingOffsetY != 0 && currentDragOffsetY > 100 {
                                            endingOffsetY = 0
                                        }
                                        currentDragOffsetY = 0
                                    }
                                })
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.9)
                .ignoresSafeArea(edges: .bottom)

            }
            .navigationBarHidden(true)
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}

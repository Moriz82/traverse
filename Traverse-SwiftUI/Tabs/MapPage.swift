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
    var emptyArray: [mapAnnotation] = []
    
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
        
    var body: some View {
        NavigationView{
            ZStack{
                if settings.showSearchBarResults{
                    Color.blue.ignoresSafeArea()
                }
                if !settings.showSearchBarResults{
                    MapBoxMapView()
                        .ignoresSafeArea()
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
                    
                    if(!settings.showSearchBarResults){
                        GeometryReader{ proxy in
                            HStack(spacing: 0){
                                ForEach(exampleListings, id: \.self){ newpost in
                                    NavigationLink(destination: ProductInformationScrollView(listing: newpost), label: {
                                        WideMiniProductView(post: newpost)
                                            .shadow(radius: 15)
                                    })
                                }
                            }
                            .offset(x: offset, y: UIScreen.main.bounds.height*0.47)
                            .offset(x: CGFloat(currentIndex) * UIScreen.main.bounds.width * -1.0)
                            .gesture(
                                DragGesture()
                                    .updating($offset, body: { value, out, _ in
                                        out = value.translation.width
                                    })
                                    .onEnded({ value in
                                        let endingOffset = value.translation.width
                                        if endingOffset < UIScreen.main.bounds.width * -0.3{
                                            currentIndex += 1
                                        }else if endingOffset > UIScreen.main.bounds.width * 0.3 && currentIndex > 0{
                                            currentIndex -= 1
                                        }
                                    })
                            )
                        }
                        .animation(.easeInOut, value: offset == 0)
                    }
                }
                .frame(height: UIScreen.main.bounds.height * 0.9)
                .ignoresSafeArea(edges: .bottom)

            }
            .navigationBarHidden(true)
            
        }
    }
}

struct MapPage_Previews: PreviewProvider {
    static var previews: some View {
        MapPage()
    }
}

//
//  ProductInformationScrollView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI
import MapKit

struct ProductInformationScrollView: View {
    var exampleInclusions = ["Inclusion 1", "Inclusion 2", "Inclusion 3", "Inclusion 4", "Inclusion 5"]
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    
    var body: some View {
        VStack {
            ScrollView(.vertical){
                VStack(spacing: 20, content: {
                    Image("01")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                        .clipped()
                    HStack{
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("LOCATION")
                                .font(.body)
                                .foregroundColor(.gray)
                            Text("Product Name")
                                .font(.title)
                            HStack{
                                Image(systemName: "star.fill")
                                Text("Rating")
                                Text("(Reviews #)")
                            }
                        })
                        Spacer()
                    }
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack{
                                Text("Percent")
                                    .font(.title2)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .background(.green)
                                    .foregroundColor(.white)
                                Text("Owner's response rate")
                            }.frame(width: 200, height: 100, alignment: .center)
                            VStack {
                                Text("Time")
                                    .font(.title2)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .background(.green)
                                    .foregroundColor(.white)
                                Text("Cancelation Time")
                            }.frame(width: 200, height: 100, alignment: .center)

                        })
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack{
                                Text("Minutes")
                                    .font(.title2)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .background(.green)
                                    .foregroundColor(.white)
                                Text("Owner's response time")
                            }.frame(width: 200, height: 100, alignment: .center)
                            VStack {
                                Text("Level")
                                    .font(.title2)
                                    .frame(width: 100, height: 40, alignment: .center)
                                    .background(.green)
                                    .foregroundColor(.white)
                                Text("Verified Owner")
                            }.frame(width: 200, height: 100, alignment: .center)

                        })
                    })
                        .border(.black, width: 2)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Description")
                                .font(.title)
                            Text("Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description")
                                .foregroundColor(.gray)
                        })
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Inclusions")
                                .font(.title)
                            ForEach(exampleInclusions, content: { inclusion in
                                Text(String(inclusion))
                                    .foregroundColor(.gray)
                            })
                        })
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Delivery")
                                .font(.title)
                            Map(coordinateRegion: $region)
                                .frame(height: 200, alignment: .center)
                        })
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        HStack{
                            Text("Reviews")
                                .font(.title)
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack{
                                ProductReviewSubView()
                                    .border(.black, width: 2)
                                ProductReviewSubView()
                                    .border(.black, width: 2)

                            }
                        }
                        Text("see all")
                            .font(.body)
                            .foregroundColor(.blue)
                    })
                    
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack {
                            Text("Owner")
                                .font(.title)
                            Spacer()
                        }
                        OwnerInformationSubView()
                    })

                })
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            HStack(alignment: .center, spacing: 10, content: {
                HStack(alignment: .bottom, spacing: 5, content: {
                    Text("$Price")
                        .font(.title)
                    Text("per day")
                        .font(.body)
                        .padding(.bottom, 2)
                })
                Spacer()
                Button(action: {
                    //MARK: RENT PRODUCT ACTION
                }, label: {
                    Text("Rent Now")
                        .font(.title)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                })
            })
                .padding()
        }
        .navigationTitle("Product Information")
    }
}

struct ProductInformationScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ProductInformationScrollView()
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 1700))
    }
}


//MARK: STRING EXTENSION FOR FOREACH IN INCLUSIONS

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

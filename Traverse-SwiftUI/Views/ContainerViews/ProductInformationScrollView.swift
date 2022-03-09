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
    
    var locationFontSize = 15.0
    var titleFontSize = 30.0
    var headingFontSize = 25.0
    var bodyFontSize = 12.0
    
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
                            Text("CITY, STATE")
                                .font(.custom("Poppins-SemiBold", size: locationFontSize))
                                .foregroundColor(.gray)
                            Text("Product Name")
                                .font(.custom("Poppins-SemiBold", size: titleFontSize))
                            HStack(alignment: .center, spacing: 2, content:{
                                Image(systemName: "star.fill")
                                    .tint(.blue)
                                    .padding(.trailing, 2)
                                Text("-.--")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize+5))
                                Text("(--)")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize+5))
                                    .foregroundColor(.gray)
                            })
                        })
                        Spacer()
                    }
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack(alignment: .center, spacing: 0, content: {
                                Text("Percent")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .background(Color("product-info-green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5.0)
                                Text("Owner's response rate")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                            VStack(alignment: .center, spacing: 0, content: {
                                Text("Time")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .background(Color("product-info-green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5.0)
                                Text("Cancelation time")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                        })
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack(alignment: .center, spacing: 0, content: {
                                Text("Minutes")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .background(Color("product-info-green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5.0)
                                Text("Owner's response time")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                            VStack(alignment: .center, spacing: 0, content: {
                                Text("Level")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .background(Color("product-info-green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5.0)
                                Text("Verified Owner")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                        })
                    })
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    HStack{
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Description")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Text("Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description Multiline description")
                                .font(.custom("Poppins-Regular", size: bodyFontSize))
                                .foregroundColor(.gray)
                        })
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Inclusions")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            ForEach(exampleInclusions, content: { inclusion in
                                Text(String(inclusion))
                                    .font(.custom("Poppins-Regular", size: bodyFontSize))
                                    .foregroundColor(.gray)
                            })
                        })
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Delivery")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Map(coordinateRegion: $region)
                                .frame(height: 200, alignment: .center)
                                .cornerRadius(20.0)
                        })
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        HStack{
                            Text("Reviews")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack{
                                ProductReviewSubView()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                ProductReviewSubView()
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                            }
                        }
                        Text("see all")
                            .font(.custom("Poppins-Regular", size: bodyFontSize))
                            .foregroundColor(.blue)
                    })
                    
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack {
                            Text("Owner")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Spacer()
                        }
                        OwnerInformationSubView()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    })

                })
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            HStack(alignment: .center, spacing: 10, content: {
                HStack(alignment: .bottom, spacing: 5, content: {
                    Text("$--")
                        .font(.custom("Poppins-SemiBold", size: headingFontSize))
                    Text("per day")
                        .font(.custom("Poppins-SemiBold", size: bodyFontSize-2))
                        .padding(.bottom, 2)
                })
                Spacer()
                Button(action: {
                    //MARK: RENT PRODUCT ACTION
                }, label: {
                    Text("Rent Now")
                        .font(.custom("Poppins-SemiBold", size: headingFontSize - 7))
                        .frame(width: 100, height: 50, alignment: .center)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
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

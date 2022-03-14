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
    @State var listing: listing
    
    var locationFontSize = 15.0
    var titleFontSize = 30.0
    var headingFontSize = 25.0
    var bodyFontSize = 12.0
    
    var body: some View {
        VStack {
            ScrollView(.vertical){
                Image(listing.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    .clipped()
                VStack(spacing: 20, content: {
                    HStack{
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text(listing.address)
                                .font(.custom("Poppins-SemiBold", size: locationFontSize))
                                .foregroundColor(.gray)
                            Text("\(listing.name)")
                                .font(.custom("Poppins-SemiBold", size: titleFontSize))
                            HStack(alignment: .center, spacing: 2, content:{
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 14, height: 14, alignment: .center)
                                    .padding(.trailing, 2)
                                Text("\(String(format: "%.2f", listing.rating))")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize+5))
                                Text("("+String(listing.reviews?.count ?? 0)+")")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize+5))
                                    .foregroundColor(.gray)
                            })
                        })
                        Spacer()
                    }
                    
                    //MARK: OWNER QUICK INFO
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack(alignment: .center, spacing: 0, content: {
                                Text(String(format: "%.0f",(listing.owner.responseRate ?? 0.0)*100)+"%")
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
                                Text(String(listing.cancelationTimeInHours ?? 0)+" hours")
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
                        }).padding(.top, 5)
                        HStack(alignment: .center, spacing: 0, content: {
                            VStack(alignment: .center, spacing: 0, content: {
                                Text(String(listing.owner.responseTimeInMinutes ?? 0)+" minutes")
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
                                Text(listing.owner.verification ? "Verified" : "Not Verified")
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .background(Color("product-info-green"))
                                    .foregroundColor(.white)
                                    .cornerRadius(5.0)
                                Text("Owner Verification")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                        })
                    })
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    
                    //MARK: DESCRIPTION
                    HStack{
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("Description")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Text("\(listing.description)")
                                .font(.custom("Poppins-Regular", size: bodyFontSize))
                                .foregroundColor(.gray)
                        })
                        Spacer()
                    }
                    //MARK: INCLUSIONS
                    HStack {
                        VStack(alignment: .leading, spacing: 5, content: {
                            Text("Inclusions")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            ForEach(listing.inclusions ?? ["None provided"], content: { inclusion in
                                Text(String(inclusion))
                                    .font(.custom("Poppins-Regular", size: bodyFontSize))
                                    .foregroundColor(.gray)
                            })
                        })
                        Spacer()
                    }
                    //MARK: DELIVERY
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
                    //MARK: REVIEWS
                    VStack(alignment: .leading, spacing: 10, content: {
                        HStack{
                            Text("Reviews")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Spacer()
                        }
                        ScrollView(.horizontal){
                            HStack{
                                if listing.reviews != nil{
                                    ForEach(listing.reviews!, content: { eachReview in
                                        ProductReviewSubView(reviewInfo: eachReview)
                                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                                    })
                                } else{
                                    Text("No reviews yet on this product.")
                                        .font(.custom("Poppins-Regular", size: bodyFontSize))
                                }
                            }
                        }
                        NavigationLink(destination: ReviewPage(listing: listing), label: {
                            Text("see all")
                                .font(.custom("Poppins-Regular", size: bodyFontSize))
                                .foregroundColor(.blue)

                        })
                    })
                    //MARK: OWNER GRAPHIC
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack {
                            Text("Owner")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Spacer()
                        }
                        OwnerInformationSubView(ownerAccountInfo: listing.owner)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    })
                    let categoryListings = Util.getOtherItems(listingToBeRemoved: listing)
                    if(categoryListings.count > 0){
                        HStack{
                            Text("Other items like this")
                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(alignment: .center, spacing: 15, content: {
                                ForEach(categoryListings, id: \.self){ categoryListing in
                                    NavigationLink(destination: ProductInformationScrollView(listing: categoryListing), label: {
                                        ProductPostView(UISettings: UserInterfaceSettings(hScrollViewPostWidth: 150.0, hScrollViewPostHeight: 120, hScrollViewPostTitleFont: 15.0, hScrollViewPostBodyFont: 12.0), post: categoryListing)
                                            .shadow(color: .gray, radius: 10, x: 0, y: 0)
                                    })
                                }
                                
                                NavigationLink(destination: ListingsInCategoryView(category: listing.category!), label: {
                                    Text("See All")
                                        .font(.custom("Poppins-Regular", size: bodyFontSize + 5))
                                        .foregroundColor(.blue)

                                })
                            })
                        }
                    }
                    

                })
                    .frame(width: UIScreen.main.bounds.width * 0.9)
            }
            
            //MARK: RENT NOW
            HStack(alignment: .center, spacing: 0, content: {
                HStack(alignment: .bottom, spacing: 5, content: {
                    Text("$\(String(format: "%.0f", listing.price))")
                        .font(.custom("Poppins-SemiBold", size: headingFontSize + 5))
                    Text("per day")
                        .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                        .padding(.bottom, 6)
                })
                Spacer()
                Button(action: {
                    //MARK: RENT PRODUCT ACTION
                }, label: {
                    Text("Rent Now")
                        .font(.custom("Poppins-SemiBold", size: headingFontSize - 7))
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            })
                .padding()
                .border(.gray, width: 1)
        }
        .navigationTitle("Product Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct ProductInformationScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ProductInformationScrollView(listing: listing(id: UUID(), price: 35.00, rating: 4.78, name: "Power Washer", description: "Lorem ipsum lorem ipsum", address: "1600 Pennsylvania Avenue", imageName: "01", verified: true, owner: account(firstName: "", lastName: "", verification: false, email: "", dateJoined: Date()), reviews: [exampleReviews[1], exampleReviews[2], exampleReviews[3]]))
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

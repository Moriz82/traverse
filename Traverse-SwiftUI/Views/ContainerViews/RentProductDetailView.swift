//
//  RentProductDetailView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/27/22.
//

import SwiftUI

struct RentProductDetailView: View {
    var headingFontSize = 36.0
    var bodyFontSize = 24.0
    @State var listing: listing
    @State var showVerificationDetail: Bool = true
    @State var verificationCheck: Bool = false

    @State var isProductCurrentlyBeingRented = true //TODO: update to database
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Rent Product")
                        .font(.custom("Poppins-SemiBold", size: headingFontSize))
                    //MARK: DETAILS
                    Divider()
                    VStack(alignment: .leading){
                        HStack{
                            Image(listing.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100, alignment: .center)
                                .clipped()
                                .cornerRadius(20)
                            VStack(alignment: .leading){
                                Text(listing.name)
                                    .font(.custom("Poppins-SemiBold", size: headingFontSize - 15))
                                Text("listed by \(listing.owner.firstName) \(listing.owner.lastName)")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 8))
                                    .foregroundColor(.gray)
                                if listing.reviews?.count != 0{
                                    Text("\(String(format: "%.2f", listing.rating)) stars, \(listing.reviews!.count) reviews")
                                        .font(.custom("Poppins-Regular", size: bodyFontSize - 8))
                                        .foregroundColor(.gray)
                                }else{
                                    Text("No reviews")
                                        .font(.custom("Poppins-Regular", size: bodyFontSize - 8))
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        Divider()
                        //MARK: PRICING AND AVAILABILITY
                        Text("Pricing and Availability")
                            .font(.custom("Poppins-SemiBold", size: headingFontSize - 10))
                        VStack(alignment: .center){
                            HStack{
                                Spacer()
                                Text("$\(String(format: "%.2f", listing.price))")
                                    .font(.custom("Poppins-SemiBold", size: headingFontSize))
                                    .padding(5)
                                    .background(isProductCurrentlyBeingRented ? .gray : Color("traverse-blue"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                Text("per day")
                                    .font(.custom("Poppins-SemiBold", size: headingFontSize - 8))
                                Spacer()
                            }
                            if isProductCurrentlyBeingRented{
                                Text("This product is currently being rented out. Check back later or message the owner for next availability.")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
                                    .multilineTextAlignment(.center)
                                    .padding(7)
                                    .background(.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)

                            }

                        }

                        
                        Divider()

                        //MARK: VERIFICATION
                        Text("Product Verification")
                            .font(.custom("Poppins-SemiBold", size: headingFontSize - 10))
                        VStack(alignment: .leading, spacing: 15){
                            HStack{
                                Text("This product is")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
                                Text(listing.verified ? "Verified" : "Not Verified")
                                    .padding(5)
                                    .background(isProductCurrentlyBeingRented ? .gray : (listing.verified ? .green : .red))
                                    .foregroundColor(.white)
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 8))
                                    .cornerRadius(2)

                            }
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.5)){
                                    showVerificationDetail.toggle()
                                }
                            }, label: {
                                Text("What does this mean?")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
                            })
                            if showVerificationDetail{
                                Text("If a product is not verified, Traverse cannot verify that it's all that it appears to be. Without a verification status, it is impossible for us to even know if this product exists. We highly recommend messaging the owner of this product before using our system to rent it.")
                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 10))
                                    .padding()
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    }
                            }
                            if !listing.verified{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        withAnimation(.easeInOut(duration: 0.25)){
                                            verificationCheck.toggle()
                                        }
                                    }, label: {
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 30, height: 30, alignment: .center)
                                                .foregroundColor(.black)
                                            Rectangle()
                                                .frame(width: 24, height: 24, alignment: .center)
                                                .foregroundColor(verificationCheck ? .black : .white)
                                        }
                                    })
                                    
                                    Text("I understand the risks of renting an unverified product.")
                                        .font(.custom("Poppins-Regular", size: bodyFontSize - 12))
                                    Spacer()
                                }
                            }
                            
                            Divider()
                            
                            
                        }
                    }
                }
                .padding()
                
            }
            
            
            HStack{
                Spacer()
                NavigationLink(destination: ConfirmRentView(), label: {
                    Text(isProductCurrentlyBeingRented ? "Product unavailable" : "Continue")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        .frame(height: 40, alignment: .center)
                        .background(isProductCurrentlyBeingRented ? .gray : Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
    }
}

struct RentProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RentProductDetailView(listing: exampleListings[1])
            .previewLayout(.sizeThatFits)
    }
}

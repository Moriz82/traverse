//
//  RentProductDetailView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/27/22.
//

import SwiftUI

struct RentProductDetailView: View {
    var headingFontSize = 26.0
    var bodyFontSize = 24.0
    @State var listing: listing
    @State var showVerificationDetail: Bool = true
    @State var verificationCheck: Bool = false
    @State private var pickupDate = Date()

    @State var isProductCurrentlyBeingRented = true //TODO: update to database
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    HStack{
                        DatePicker(
                            "Start Date",
                            selection: $pickupDate,
                            displayedComponents: [.date]
                        )
                            .datePickerStyle(.graphical)
                            .frame(width: 300, height: 300, alignment: .center)
                        Spacer()
                        
                    }

                }
            }
                    
//                    //MARK: PRICING AND AVAILABILITY
//                    Text("Pricing and Availability")
//                        .font(.custom("Poppins-SemiBold", size: headingFontSize - 10))
//                    VStack(alignment: .center){
//                        HStack{
//                            Spacer()
//                            Text("$\(String(format: "%.2f", listing.price))")
//                                .font(.custom("Poppins-SemiBold", size: headingFontSize))
//                                .padding(5)
//                                .cornerRadius(10)
//                            Text("per day")
//                                .font(.custom("Poppins-SemiBold", size: headingFontSize - 8))
//                            Spacer()
//                        }
//                        if isProductCurrentlyBeingRented{
//                            Text("This product is currently being rented out. Check back later or message the owner for next availability.")
//                                .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
//                                .multilineTextAlignment(.center)
//                                .padding(7)
//                                .cornerRadius(10)
//                        }
//                    }
//
//                    Divider()
//
//                    //MARK: VERIFICATION
//                    Text("Product Verification")
//                        .font(.custom("Poppins-SemiBold", size: headingFontSize - 10))
//                    VStack(alignment: .leading, spacing: 15){
//                        HStack{
//                            Text("This product is")
//                                .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
//                            Text(listing.verified ? "Verified" : "Not Verified")
//                                .padding(5)
//                                .background(listing.verified ? .green : .red)
//                                .foregroundColor(.white)
//                                .font(.custom("Poppins-Regular", size: bodyFontSize - 8))
//                                .cornerRadius(2)
//
//                        }
//                        Button(action: {
//                            withAnimation(.easeInOut(duration: 0.5)){
//                                showVerificationDetail.toggle()
//                            }
//                        }, label: {
//                            Text("What does this mean?")
//                                .font(.custom("Poppins-Regular", size: bodyFontSize - 5))
//                        })
//                        if showVerificationDetail{
//                            Text("If a product is not verified, Traverse cannot verify that it's all that it appears to be. Without a verification status, it is impossible for us to even know if this product exists. We highly recommend messaging the owner of this product before using our system to rent it.")
//                                .font(.custom("Poppins-Regular", size: bodyFontSize - 10))
//                                .padding()
//                                .overlay{
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.gray, lineWidth: 1)
//                                }
//                        }
//                        if !listing.verified{
//                            HStack{
//                                Spacer()
//                                Button(action: {
//                                    withAnimation(.easeInOut(duration: 0.25)){
//                                        verificationCheck.toggle()
//                                    }
//                                }, label: {
//                                    ZStack{
//                                        Rectangle()
//                                            .frame(width: 30, height: 30, alignment: .center)
//                                            .foregroundColor(.black)
//                                        Rectangle()
//                                            .frame(width: 24, height: 24, alignment: .center)
//                                            .foregroundColor(verificationCheck ? .black : .white)
//                                    }
//                                })
//
//                                Text("I understand the risks of renting an unverified product.")
//                                    .font(.custom("Poppins-Regular", size: bodyFontSize - 12))
//                                Spacer()
//                            }
//                        }
//
//                        Divider()
//
//
//                    }
//                }
//                .padding()
//
            
            
            

            HStack(alignment: .center, spacing: 0, content: {
                HStack(alignment: .bottom, spacing: 5, content: {
                    Text("$\(String(format: "%.0f", listing.price))")
                        .font(.custom("Poppins-SemiBold", size: 25.0))
                    Text("per day")
                        .font(.custom("Poppins-SemiBold", size: 12.0))
                        .padding(.bottom, 6)
                })
                Spacer()
                
                //MARK: RENT PRODUCT ACTION
                NavigationLink(destination: ConfirmRentView(), label: {
                    Text("Continue")
                        .font(.custom("Poppins-SemiBold", size: 18.0))
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }).disabled(listing.isAvailable)
            })
                .padding()
                .border(.gray, width: 1)
        }
    }
}

struct RentProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RentProductDetailView(listing: exampleListings[1])
            .previewLayout(.sizeThatFits)
    }
}


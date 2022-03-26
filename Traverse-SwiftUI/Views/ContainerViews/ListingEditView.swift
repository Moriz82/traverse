//
//  ListingEditView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/25/22.
//

import SwiftUI

struct ListingEditView: View {
    @State var listing: listing
    @State var listingPrice = "0.00"
    
    var body: some View {
        VStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Text("Edit Product")
                        .font(.title)
                        .bold()
                        .padding()
                    Button(action: {
                        //open image library
                    }, label: {
                        ZStack{
                            Image(listing.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 140, height: 115, alignment: .center)
                                .foregroundColor(.black)
                                .opacity(0.50)
                            Image(systemName: "camera")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 100, height: 75, alignment: .center)
                        }
                    })
                    ScrollView(.horizontal){
                        HStack(spacing: 10){
                            ForEach(0..<5){ i in
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 75, height: 75)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.leading, 10)
                    
                    //MARK:
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Product Name")
                                TextField("Product Name", text: $listing.name)
                                    .padding()
                                    .foregroundColor(.gray)
                            }
                            VStack(alignment: .center){
                                Text("Price")
                                TextField("Price", text: $listingPrice)
                                    .padding()
                                    .multilineTextAlignment(.center)
                            }
                            .frame(width: 100)

                        }
                        VStack(alignment: .leading){
                            Text("Description")
                            TextField("Description", text: $listing.description)
                                .frame(height: 100)
                                .padding()
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Product Address")
                                .font(.title)
                                .bold()
                            NavigationLink(destination: AddressEditView(), label: {
                                Text("Enter an Address")
                                    .foregroundColor(.blue)
                                    .font(.title2)
                            })
                            AddressMiniSubView(address: exampleAddresses[0])
                        }
                    }
                    .padding()
                }
            }
            Button(action: {
                
            }, label: {
                Text("Save")
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .frame(width: 150, height: 40, alignment: .center)
                    .background(Color("traverse-blue"))
                    .foregroundColor(.white)
                    .cornerRadius(10)

            })
        }
        .navigationTitle("Listing Edit")
        .toolbar{
            ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                Button(action: {
                    
                }, label: {
                    Text("Save")
                })
                
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                })
            })
        }
    }
}

struct ListingEditView_Previews: PreviewProvider {
    static var previews: some View {
        ListingEditView(listing: listing(price: 42.00, rating: 4.0, name: "Power Washer", description: "yeo", address: "hi", imageName: "01", verified: true, owner: exampleAccounts[0]))
            .previewLayout(.sizeThatFits)
    }
}

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
    
    @State var addTrueEditFalse: Bool = true //TODO: remove default
    
    var body: some View {
        VStack {
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Text("Edit Product")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    //MARK: IMAGES
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
                    
                    //MARK: INFO
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Product Name")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                TextField("Product Name", text: $listing.name)
                                    .padding()
                                    .foregroundColor(.gray)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1)
                                    }
                            }
                            VStack(alignment: .leading){
                                Text("Price")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                TextField("Price", text: $listingPrice)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                    .overlay{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1)
                                    }

                            }
                            .frame(width: 100)

                        }
                        Divider()
                            .padding()
                        VStack(alignment: .leading){
                            Text("Description")
                                .font(.custom("Poppins-SemiBold", size: 18))
                            TextField("Description", text: $listing.description)
                                .frame(height: 100)
                                .padding()
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.gray, lineWidth: 1)
                                }

                        }
                        Divider()
                            .padding()
                        
                        //MARK: ADDRESS
                        VStack(alignment: .leading, spacing: 10){
                            HStack{
                                Text("Product Address")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                Spacer()
                                NavigationLink(destination: AddressEditView(), label: {
                                    Text("Change Address")
                                        .foregroundColor(.blue)
                                        .font(.custom("Poppins-SemiBold", size: 18))
                                })
                            }
                            AddressMiniSubView(address: exampleAddresses[0])
                        }
                        
                    }
                    .padding()
                    
                    //MARK: DELETE BUTTON
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Delete this product")
                                .font(.custom("Poppins-SemiBold", size: 20))
                                .frame(height: 50, alignment: .center)
                                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                                .background(.red)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Spacer()
                        }
                    })
                }
            }
        //MARK: CANCEL / SAVE
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("Save")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)

                })
                Button(action: {
                    
                }, label: {
                    Text("Cancel")
                        .font(.custom("Poppins-SemiBold", size: 20))
                        .frame(width: 150, height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)

                })
            }
        }
        .navigationTitle("Edit Product")
        //MARK: CANCEL / SAVE ON TOP
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
            .frame(height: 1200)
    }
}

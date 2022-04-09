//
//  AddListingImagesView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/8/22.
//

import SwiftUI

struct AddListingImagesView: View {
    @State var productName: String
    @State var productPrice: Double
    
    @State var productDescription: String
    @State var selectedCategory: String
    @State var inclusions: [String]
    
    
    //created here
    @State var listingImage: UIImage = UIImage()
    @State var isShowPhotoLibrary = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                Text("Add an image")
                    .font(.custom("Poppins-SemiBold", size: 28))
                Text("make your listing stand out!")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.gray)

                Button(action: {
                    //open image library
                    self.isShowPhotoLibrary = true
                }, label: {
                    ZStack{
                        Image(uiImage: listingImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 250)
                            .clipped()
                            .edgesIgnoringSafeArea(.all)
                            .cornerRadius(36)
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
                
                NavigationLink(destination: AddListingReviewPage(productName: productName, productPrice: productPrice, productDescription: productDescription, selectedCategory: selectedCategory, inclusions: inclusions, listingImage: listingImage), label: {
                    Text("Next")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .frame(height: 40, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)

                })
            }
            .padding()
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$listingImage)
        }
    }
}

struct AddListingImagesView_Previews: PreviewProvider {
    static var previews: some View {
        AddListingImagesView(productName: "", productPrice: 1.0, productDescription: "", selectedCategory: "", inclusions: [""])
    }
}

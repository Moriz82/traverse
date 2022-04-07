//
//  SecondAddProductView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/6/22.
//

import SwiftUI

struct SecondAddProductView: View {
    //from first view
    @State var productName: String
    @State var productPrice: Double
    
    //created here
    @State var productDescription: String = ""
    @State var category: String = ""
    
    @State var productDescriptionIsValid: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TopRightLogoImage()
                Text("Add a description")
                    .font(.custom("Poppins-SemiBold", size: 32))
                
                if !productDescriptionIsValid{
                    Text("Description not valid!")
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(.red)
                }

                TextField("Describe your listing..." , text: $productDescription, onEditingChanged: {_ in
                    productDescriptionIsValid = Util.checkString(string: productDescription)
                })
                    .padding()
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .frame(width: UIScreen.main.bounds.width * 0.90)
                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                
                Text("Add product category")
                    .font(.custom("Poppins-SemiBold", size: 32))
                Text("people can easily search for and find your product")
                    .font(.custom("Poppins-Regular", size: 14))
                    .foregroundColor(.gray)
                
                
            }
        }
    }
}

struct SecondAddProductView_Previews: PreviewProvider {
    static var previews: some View {
        SecondAddProductView(productName: "Cat", productPrice: 4.00)
    }
}

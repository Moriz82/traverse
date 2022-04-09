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
    @State var selectedCategory: String = ""
    
    @State var productDescriptionIsValid: Bool = false
    @State var inclusions: [String] = []
    @State var inclusionTextFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                VStack(alignment: .leading){
                    Text("Add a description")
                        .font(.custom("Poppins-SemiBold", size: 32))
                    /*
                    if !productDescriptionIsValid{
                        Text("Description not valid!")
                            .font(.custom("Poppins-SemiBold", size: 16))
                            .foregroundColor(.red)
                    }
                     */
                    
                    Text("what makes your listing special?")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.gray)

                    
                    TextField("Describe your listing..." , text: $productDescription, onEditingChanged: {_ in
                        productDescriptionIsValid = Util.checkString(string: productDescription)
                    })
                        .padding()
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                }

                VStack(alignment: .leading){
                    Text("Add product category")
                        .font(.custom("Poppins-SemiBold", size: 28))
                    Text("people can easily search for and find your listing")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.gray)
                    Menu(content: {
                        ForEach(exampleCategories){ category in
                            Button(action: {
                                selectedCategory = category
                            }, label: {
                                Text("\(category)")
                                    .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                            })
                        }
                    }, label: {
                        Text(selectedCategory == "" ? "Add a category" : selectedCategory)
                            .padding()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .frame(width: UIScreen.main.bounds.width * 0.90)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                            .multilineTextAlignment(.leading)
                    })
                }
                
                VStack(alignment: .leading){
                    Text("Add inclusions")
                        .font(.custom("Poppins-SemiBold", size: 28))
                    Text("what is included with your listing?")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.gray)
                    HStack{
                        TextField("Inclusion..." , text: $inclusionTextFieldText)
                            .padding()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                        Button(action: {
                            if inclusionTextFieldText != "" && inclusionTextFieldText != " "{
                                inclusions.append(inclusionTextFieldText)
                                inclusionTextFieldText = ""
                            }
                        }, label: {
                            Text("Add")
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .frame(height: 40, alignment: .center)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .background(Color("traverse-blue"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })

                    }
                    VStack(alignment: .leading){
                        ForEach(inclusions){ inclusion in
                            Text(inclusion)
                                .padding()
                                .font(.system(size: 16, weight: .semibold, design: .rounded))
                                .frame(width: UIScreen.main.bounds.width * 0.90)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                NavigationLink(destination: AddListingImagesView(productName: productName, productPrice: productPrice, productDescription: productDescription, selectedCategory: selectedCategory, inclusions: inclusions), label: {
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
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct SecondAddProductView_Previews: PreviewProvider {
    static var previews: some View {
        SecondAddProductView(productName: "Cat", productPrice: 4.00)
    }
}

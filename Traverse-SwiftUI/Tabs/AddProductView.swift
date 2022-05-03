//
//  AddProductView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/24/22.
//

import SwiftUI

struct AddProductView: View {
    @FocusState private var shouldShowLogo: Bool
    @State var productName: String = ""
    
    @ObservedObject var dollars = NumbersOnly()
    @ObservedObject var cents = NumbersOnly()
    
    @State var priceDollars: String = ""
    @State var priceCents: String = ""
    
    @State var productNameIsValid: Bool = false
    @State var priceFieldDollarsIsValid: Bool = false
    @State var priceFieldCentsIsValid: Bool = false

    @EnvironmentObject var settings: showBarResults
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    TopRightLogoImage()
                    
                    Text("Add a Product")
                        .font(.custom("Poppins-SemiBold", size: 32))
                    
                    TextField("Product Name..." , text: $productName, onEditingChanged: {_ in
                        productNameIsValid = Util.checkString(string: productName)
                    })
                        .padding()
                        .font(.custom("Poppins-Regular", size: 20))
                        .frame(width: UIScreen.main.bounds.width * 0.90)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                    
                    HStack{
                        Text("$")
                            .font(.custom("Poppins-SemiBold", size: 28))

                        TextField("0" , text: $dollars.value, onEditingChanged: {_ in
                            priceFieldDollarsIsValid = Util.checkDollarPrice(price: priceDollars)
                        })
                            .padding()
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 20))
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))
                        
                        Text(".")
                            .font(.custom("Poppins-SemiBold", size: 28))

                        TextField("00" , text: $cents.value, onEditingChanged: {_ in
                            priceFieldCentsIsValid = Util.checkCentsPrice(price: priceDollars)
                        })
                            .padding()
                            .keyboardType(.numberPad)
                            .font(.custom("Poppins-Regular", size: 20))
                            .frame(width: UIScreen.main.bounds.width * 0.2)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray, lineWidth: 2))

                        Text("per day")
                            .font(.custom("Poppins-SemiBold", size: 18))

                    }
                    .padding(.bottom, 40)
                    NavigationLink(destination: SecondAddProductView(productName: productName, productPrice: makePrice(dollars: dollars.value, cents: cents.value)), label: {
                        Text("Next")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .frame(height: 40, alignment: .center)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            .background(Color("traverse-blue"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                        .simultaneousGesture(TapGesture().onEnded({settings.showTabBar = false}))
                }
            }
            .onAppear(perform: {settings.showTabBar = true})
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    private func makePrice(dollars: String, cents: String) -> Double{
        if let doubleDollars = Double(dollars), let doubleCents = Double(cents){
            let p = doubleDollars + doubleCents * 0.01
            print(p)
            return p
        }
        return 0.00
    }
}


//price only numbers
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}

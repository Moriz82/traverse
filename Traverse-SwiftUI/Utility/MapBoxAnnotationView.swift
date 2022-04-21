//
//  MapBoxAnnotationView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 4/19/22.
//

import SwiftUI

struct MapBoxAnnotationView: View {
    @State var price: Double = 0.0
    
    var body: some View {
        NavigationLink(destination: ProductInformationScrollView(listing: exampleListings[0]), label: {
            Text("$"+String(format: "%.0f", price))
                .font(.custom("Poppins-SemiBold", size: 16.0))
                .frame(width: 65, height: 30, alignment: .center)
                .background(Color("traverse-blue"))
                .accentColor(.white)
                .cornerRadius(15.0)
                .overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color.white, lineWidth: 1))
        })
    }
}

struct MapBoxAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapBoxAnnotationView(price: 5.99)
    }
}

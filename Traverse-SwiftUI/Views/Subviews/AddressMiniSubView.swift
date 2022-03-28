//
//  AddressMiniSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/25/22.
//

import SwiftUI

struct AddressMiniSubView: View {
    @State var address: address
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("1600 Street Address")
            HStack{
                Text("City Name")
                Text("State Name")
            }
            HStack{
                Text("Country Name")
                Text("Postal Code")
            }

        }
    }
}

struct AddressMiniSubView_Previews: PreviewProvider {
    static var previews: some View {
        AddressMiniSubView(address: exampleAddresses[0])
            .previewLayout(.sizeThatFits)
    }
}

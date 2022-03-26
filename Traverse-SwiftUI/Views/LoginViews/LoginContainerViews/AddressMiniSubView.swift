//
//  AddressMiniSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/25/22.
//

import SwiftUI

struct AddressMiniSubView: View {
    @State var address: address
    
    //TODO: actually make
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddressMiniSubView_Previews: PreviewProvider {
    static var previews: some View {
        AddressMiniSubView(address: exampleAddresses[0])
    }
}

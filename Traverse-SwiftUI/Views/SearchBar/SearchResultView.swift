//
//  SearchResultView.swift
//  SearchBarAnimation
//
//  Created by Aiden Seibel on 1/8/22.
//

import SwiftUI

struct SearchResultView: View {

    @State var searchResult: listing
    
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
            Image(searchResult.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width * 0.157, height: UIScreen.main.bounds.width * 0.157, alignment: .center)
                .cornerRadius(15)

            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(Util.formatStringLength(title: searchResult.name, length: 20))
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .bold()
                    .foregroundColor(.black)
                Text("from $\(String(format: "%.2f", searchResult.price))")
                    .font(.custom("Poppins-Regular", size: 12))
                    .foregroundColor(.gray)
            })
            
            Spacer()
            
        })
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.white)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.10, alignment: .leading)

    }
}

struct SearchResultView_Previews: PreviewProvider {
    
    static var exampleResult: listing = listing(price: 17.00, rating: 4.75, name: "Power Washer", description: "Small but loud", address: "1600 Pennsylvania", imageName: "01", verified: false, owner: account(firstName: "", lastName: "", verification: false, email: "", dateJoined: Date()), isAvailable: true)

    static var previews: some View {
        SearchResultView(searchResult: exampleResult)
            .previewLayout(.sizeThatFits)
    }
}

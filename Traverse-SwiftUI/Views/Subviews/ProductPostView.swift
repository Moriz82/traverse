//
//  ProductPostView.swift
//  Mobile Makers Test
//
//  Created by Aiden Seibel on 12/5/21.
//

import SwiftUI

struct ProductPostView: View {
    
    @State var UISettings: UserInterfaceSettings
    @State var post: listing
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            //MARK: IMAGE
            ZStack(alignment: .trailing) {
                Image(post.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UISettings.hScrollViewPostWidth, height: UISettings.hScrollViewPostHeight, alignment: .center)
                    .cornerRadius(28)
                //.shadow(color: .gray, radius: 10, x: 0, y: 0)
                
                //MARK: PRICE
                
                Text("$\(String(format: "%.0f", post.price))")
                    .frame(width: UISettings.hScrollViewPostWidth * 0.4, height: UISettings.hScrollViewPostHeight * 0.25, alignment: .center)
                    .background(.gray)
                    .opacity(0.9)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.bottom, UISettings.hScrollViewPostHeight * 0.65)
                    .padding(.trailing, 8)
                    .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostTitleFont).bold())
            }
            
            
            //MARK: DATA
            VStack(alignment: .leading, spacing: 0, content: {
                
                //MARK: PRODUCT TITLE
                Text(Util.formatStringLength(title: post.name, length: 14))
                    .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostTitleFont))
                    .foregroundColor(.black)

            
                HStack(spacing: 4, content: {
                    
                    //MARK: VERIFICATION
                    Text(post.verified ? "  Verified  " : "  Not Verified  ")
                        .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostBodyFont - 2))
                        .background(post.verified ? .green : .red)
                        .foregroundColor(.white)
                        .cornerRadius(3)
                    
                    //MARK: STAR
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.blue)
                        .padding(.leading, 7)
                        .padding(.bottom, 2) //small correction to vertical center
                    
                    
                    //MARK: RATING
                    Text("\(String(format: "%.2f", post.rating))")
                        .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostBodyFont))
                        .foregroundColor(.black)

                })
                    .padding(.trailing, 6)
            })
                .padding(.leading, 10)
        })
            .padding(.all, 7)
            .padding(.bottom, UISettings.hScrollViewPostHeight * 0.1)
            .background(.white)
            .cornerRadius(36)


    }
}

struct ProductPostView_Previews: PreviewProvider {
    
    static var post1: listing = listing(price: 17.00, rating: 4.75, name: "Power Washer", description: "Small but loud", address: "1600 Pennsylvania", imageName: "01", verified: false, owner: account(firstName: "", lastName: "", verification: false, email: "", dateJoined: Date()))
    
    static var previews: some View {
        ProductPostView(UISettings: UserInterfaceSettings(hScrollViewPostWidth: 200.0, hScrollViewPostHeight: 200.0, hScrollViewPostTitleFont: 18.0, hScrollViewPostBodyFont: 12.0), post: post1)
            .previewLayout(.sizeThatFits)
            
    }
}

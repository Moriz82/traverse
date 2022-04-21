//
//  WideMiniProductView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 4/21/22.
//

import SwiftUI

struct WideMiniProductView: View {

    @State var post: listing
    
    var UISettings = UserInterfaceSettings(hScrollViewPostWidth: UIScreen.main.bounds.width * 0.87, hScrollViewPostHeight: UIScreen.main.bounds.height * 0.14, hScrollViewPostTitleFont: 15.0, hScrollViewPostBodyFont: 12.0)

    
    var body: some View {
        HStack(spacing: 10, content: {
            
            //MARK: IMAGE
            ZStack(alignment: .trailing) {
                Image(post.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipped()
                    .cornerRadius(15)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
            
            
            //MARK: DATA
            VStack(alignment: .leading, spacing: 0, content: {
                
                //MARK: PRODUCT TITLE
                Text(Util.formatStringLength(title: post.name, length: 14))
                    .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostTitleFont))
                    .foregroundColor(.black)

            
                HStack(spacing: 4, content: {
                    
                    //MARK: VERIFICATION
                    Text("\(post.owner.firstName)")
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(.gray)
                        .cornerRadius(3)
                    
                    if(post.verified){
                        Text("  Verified  ")
                            .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostBodyFont - 2))
                            .background(post.verified ? .green : .red)
                            .foregroundColor(.white)
                            .cornerRadius(3)
                        
                    }
                    
//                    //MARK: STAR
//                    Image(systemName: "star.fill")
//                        .resizable()
//                        .frame(width: 11, height: 10, alignment: .center)
//                        .foregroundColor(.blue)
//                        .padding(.leading, 7)
//                        .padding(.bottom, 2) //small correction to vertical center
//
//
//                    //MARK: RATING
//                    Text("\(String(format: "%.2f", post.rating))")
//                        .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostBodyFont))
//                        .foregroundColor(.black)

                })
                    .padding(.trailing, 6)
                HStack(spacing: 3){
                    Text("$\(Int(post.price))")
                        .font(.custom("Poppins-SemiBold", size: 25))
                        .foregroundColor(Color.black)
                    
                    Text("per day")
                        .font(.custom("Poppins-SemiBold", size: 11))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        .foregroundColor(Color.black)
                    VStack(){
                        HStack(spacing: 0){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 11, height: 10, alignment: .center)
                                .foregroundColor(.blue)
                                .padding(.leading, 7)
                                .padding(.bottom, 2) //small correction to vertical center
                            
                            
                            //MARK: RATING
                            Text("\(String(format: "%.2f", post.rating))")
                                .font(.custom("Poppins-SemiBold", size: UISettings.hScrollViewPostBodyFont))
                                .foregroundColor(.black)
                                .frame(width: 55, height: 10, alignment: .leading)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    }.padding(EdgeInsets(top: 0, leading: UIScreen.main.bounds.width * 0.05, bottom: 0, trailing: 0))
                    
                }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
            })
//                .padding(.trailing, 30)
        })
            .padding(.all, 7)
            .background(.white)
            .cornerRadius(15)


    }
}

struct WideMiniProductView_Previews: PreviewProvider {
    
    static var post1: listing = listing(price: 18.99, rating: 4.75, name: "Power Washer", description: "Small but loud", address: "1600 Pennsylvania", imageName: "01", verified: true, owner: account(firstName: "John", lastName: "Andrianov", verification: true, email: "", dateJoined: Date()), isAvailable: true)
    
    static var previews: some View {
        WideMiniProductView(post: post1)
            .previewLayout(.sizeThatFits)
            
    }
}

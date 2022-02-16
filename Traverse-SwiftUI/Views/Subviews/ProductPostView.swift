//
//  ProductPostView.swift
//  Mobile Makers Test
//
//  Created by Aiden Seibel on 12/5/21.
//



//constructs a post in swiftUI with 2 : 1 pixel ratio to Figma design guidelines
import SwiftUI

struct ProductPostView: View {
    @State var post: listing
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
            
            //MARK: IMAGE
            ZStack(alignment: .trailing) {
                Image(post.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 230, alignment: .center) //image pixel sizes
                    .cornerRadius(28) //rounded corners on picture
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
                
                Text("$\(String(format: "%.0f", post.price))") //Price tag
                    .frame(width: 80, height: 40, alignment: .center)   //frame
                    .background(.gray)
                    .opacity(0.9)
                    .foregroundColor(.white)
                    .cornerRadius(30)                   //rounded corners
                    .padding(.bottom, 175)              //overlay padding to get in top right
                    .padding(.trailing, 8)              //overlay padding
                    .font(.custom("Poppins-SemiBold", size: 20).bold())
            }
            
            
            //MARK: DATA
            VStack(alignment: .leading, spacing: 0, content: {
                
                //MARK: PRODUCT TITLE
                Text(Util.formatStringLength(title: post.name))
                    .font(.custom("Poppins-SemiBold", size: 22)) //from imported font, changed info.plist to use
                    .foregroundColor(.primary)

            
                HStack(spacing: 4, content: {
                    
                    //MARK: VERIFICATION
                    Text(post.verified ? "  Verified  " : "  Not Verified  ")
                        .font(.custom("Poppins-SemiBold", size: 14))
                        .background(post.verified ? .green : .red) //from assets folder, imported custom color
                        .foregroundColor(.white)
                        .cornerRadius(3) //rounded corners
                    
                    //MARK: STAR
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                        .foregroundColor(.blue)
                        .padding(.leading, 7) //that small gap between verification
                        .padding(.bottom, 2) //small correction to vertical center
                    
                    
                    //MARK: RATING
                    Text("\(String(format: "%.2f", post.rating))") //cuts double to two decimal places
                        .font(.custom("Poppins-SemiBold", size: 16))
                        .foregroundColor(.primary)

                })
                    .padding(.trailing, 6) //spacing between verification/star/rating
            })
                .padding(.leading, 10) //the small offset between the image and the data
        })
            .padding(.all, 10)      //general spacing
            .padding(.bottom, 20)   //small space at bottom
            .background(.white)     //ensures BG not transparent
            .cornerRadius(36)       //should theoretically round corners

    }
}

struct ProductPostView_Previews: PreviewProvider {
    
    //example post
    static var post1: listing = listing(price: 17.00, rating: 4.75, name: "Power Washer", description: "Small but loud", address: "1600 Pennsylvania", imageName: "01", verified: false)
    
    static var previews: some View {
        ProductPostView(post: post1)
            .previewLayout(.sizeThatFits)
            
    }
}

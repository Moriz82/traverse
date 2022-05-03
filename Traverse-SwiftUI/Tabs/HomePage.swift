//
//  HomePage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 4/19/22.
//

import SwiftUI

struct HomePage: View {
    @StateObject var settings = showBarResults()
    @Binding var showTabBar: Bool

    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            ZStack {
                                Circle()
                                    .frame(width: 60, height: 60, alignment: .center)
                                    .foregroundColor(.white)
                                Image("01")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(25)
                            }
                            
                            Text("Home")
                                .font(.custom("Poppins-SemiBold", size: 36))
                                .foregroundColor(.white)
                                .padding(2)
                            
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                    .background(.blue)
                    VStack(alignment: .leading, spacing: 5){
                        VStack(alignment: .leading, spacing: 0){
                            Text("Near you")
                                .font(.custom("Poppins-SemiBold", size: 28))
                                .foregroundColor(.black)
                            ScrollView{
                                VStack(alignment: .leading, spacing: 5){
                                    ForEach(exampleListings[0..<5]){ listing in
                                        NavigationLink(destination: ProductInformationScrollView(listing: listing), label: {
                                            SearchResultView(searchResult: listing)
                                        })
                                            .simultaneousGesture(TapGesture().onEnded({showTabBar = false}))
                                    }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 50, leading: 30, bottom: 0, trailing: 30))
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.7, alignment: .center)
                }
                SearchBarView(isOnHomeScreen: true)
                    .environmentObject(settings)
                    .shadow(color: .gray, radius: 10, x: 0, y: 0)
                    .offset(x: 0, y: UIScreen.main.bounds.height * -0.22)
            }
            .onAppear(perform: {showTabBar = true})
        }
        .navigationBarHidden(true)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(showTabBar: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}

//
//  UserAccountPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/24/22.
//

import SwiftUI

struct UserAccountPage: View {
    var account: account
    var nameFontSize = 28.0
    var bodyFontSize = 12.0
    
    @Binding var showTabBar: Bool

    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 20){
                    Divider()
                    
                    //MARK: IMAGE/NAME
                    HStack(alignment: .center, spacing: 20, content: {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 96, height: 96, alignment: .center)
                            .cornerRadius(64)
                        VStack(alignment: .leading, spacing: 0, content: {
                            Text("\(account.firstName) \(account.lastName)")
                                .font(.custom("Poppins-SemiBold", size: nameFontSize))
                            Text("Joined \(account.dateJoined.addingTimeInterval(600), style: .date)")
                                .font(.custom("Poppins-Regular", size: bodyFontSize))
                                .foregroundColor(.gray)
                        })
                        Spacer()
                    })
                        .padding(.leading)
                        
                    Divider()
                    
                    //MARK: MY STATS
                    Text("Stats")
                        .font(.custom("Poppins-SemiBold", size: nameFontSize - 2))
                        .padding(.leading)
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 2), alignment: .center, spacing: 5, content: {
                        VStack(alignment: .center, spacing: 0, content: {
                            Text(String(format: "%.0f",(account.responseRate ?? 0.0)*100)+"%")
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                .frame(width: 75, height: 25, alignment: .center)
                                .background(Color("product-info-green"))
                                .foregroundColor(.white)
                                .cornerRadius(5.0)
                            Text("Response rate")
                                .frame(width: 120, height: 50)
                                .multilineTextAlignment(.center)
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                        }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                        VStack(alignment: .center, spacing: 0, content: {
                            Text(String(account.responseTimeInMinutes ?? 0)+" minutes")
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                .frame(width: 90, height: 25, alignment: .center)
                                .background(Color("product-info-green"))
                                .foregroundColor(.white)
                                .cornerRadius(5.0)
                            Text("Response time")
                                .frame(width: 120, height: 50)
                                .multilineTextAlignment(.center)
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                        }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)
                        VStack(alignment: .center, spacing: 0, content: {
                            Text(account.verification ? "Verified" : "Not Verified")
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                                .frame(width: 75, height: 25, alignment: .center)
                                .background(Color("product-info-green"))
                                .foregroundColor(.white)
                                .cornerRadius(5.0)
                            Text("Verification")
                                .frame(width: 120, height: 40)
                                .multilineTextAlignment(.center)
                                .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                        }).frame(width: UIScreen.main.bounds.width * 0.44, height: 100, alignment: .center)

                        //MARK: LISTED / RENTED
                        HStack{
                            VStack(alignment: .center, spacing: 0, content: {
                                Text(String(account.numberOfItemsListed!))
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize + 23))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .foregroundColor(Color("product-info-green"))
                                    .cornerRadius(5.0)
                                Text("Listed")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.15, height: 100, alignment: .center)
                            Divider()
                            VStack(alignment: .center, spacing: 0, content: {
                                Text(String(account.numberOfItemsRented!))
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize + 23))
                                    .frame(width: 75, height: 30, alignment: .center)
                                    .foregroundColor(Color("product-info-green"))
                                    .cornerRadius(5.0)
                                Text("Rented")
                                    .frame(width: 120, height: 50)
                                    .multilineTextAlignment(.center)
                                    .font(.custom("Poppins-SemiBold", size: bodyFontSize))
                            }).frame(width: UIScreen.main.bounds.width * 0.15, height: 100, alignment: .center)
                        }
                    })
                        .padding(.top, 5)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1)
                                .frame(width: UIScreen.main.bounds.width * 0.90)
                        }

                    
                    Divider()
                    
                    //MARK: MY PRODUCTS
                    HStack{
                        Text("Listings")
                            .font(.custom("Poppins-SemiBold", size: nameFontSize - 2))
                        Spacer()
                        NavigationLink(destination: AccountListingsView(), label: {
                            Text("see all")
                                .font(.custom("Poppins-Regular", size: bodyFontSize + 5))
                                .foregroundColor(.blue)
                                .padding(.trailing, 20)
                        })
                            .simultaneousGesture(TapGesture().onEnded({showTabBar = false}))

                    }
                    .padding(.leading)
                    VStack(alignment: .center, spacing: 10, content: {
                        ForEach(exampleListings[0..<3], id: \.self, content: { newpost in
                            NavigationLink(destination: ListingEditView(listing: newpost, listingPrice: String(newpost.price)), label: {
                                SearchResultView(searchResult: newpost)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            })
                                .simultaneousGesture(TapGesture().onEnded({showTabBar = false}))
                        })
                    })
                }
                .navigationTitle("Your Account")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear(perform: {showTabBar = true})
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    NavigationLink(destination: SettingsPage(), label: {
                        Image(systemName: "gear")
                    })
                        .simultaneousGesture(TapGesture().onEnded({showTabBar = false}))
                })
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct UserAccountPage_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountPage(account: exampleAccounts[0], showTabBar: .constant(true))
    }
}

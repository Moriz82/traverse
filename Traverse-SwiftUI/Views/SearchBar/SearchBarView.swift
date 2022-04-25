//
//  SearchBarView.swift
//  SearchBarAnimation
//
//  Created by Aiden Seibel on 1/8/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var productSearchString: String = ""
    @State var beginSearch: Bool = false
    @EnvironmentObject var settings: showBarResults
    @FocusState private var isFocused: Bool
    @State var isOnHomeScreen: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack(){
                //MARK: TOP LEFT ICON
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.50)){
                        settings.showSearchBarResults.toggle()
                        if(settings.showSearchBarResults == false){
                            hideKeyboard()
                        }
                    }
                }, label:{
                    HStack(){
                        if settings.showSearchBarResults == true{
                            Image(systemName: "chevron.left")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.gray)
                        }else{
                            Image(systemName: "magnifyingglass")
                            .frame(width: 25, height: 25, alignment: .center)
                        }
                    }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                })
                
                //MARK: SEARCH FIELD
                if(settings.showSearchBarResults == true){
                   TextField("Search for products...", text: $productSearchString, onEditingChanged: {_ in
                            beginSearch = true
                    })
                        .disabled(false)
                        .font(.custom("Poppins-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                        .focused($isFocused)
                }
                else{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.50)){
                            settings.showSearchBarResults.toggle()
                            settings.showAnnotationsOnMap = false
                            productSearchString = ""
                            isFocused = true
                        }
                    }, label: {
                       TextField("Search for products...", text: $productSearchString, onEditingChanged: {_ in
                                beginSearch = true
                        })
                            .font(.custom("Poppins-Regular", size: 20))
                            .multilineTextAlignment(.leading)
                            .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                            .disabled(true)
                    })
                }
            }
            
            //MARK: RESULTS
            if settings.showSearchBarResults{ //showResults is toggled every time the search icon is tapped
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 0, content: {
                        let searchResults = Search.getSearchResults(search: productSearchString)
                        if productSearchString != ""{
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.50)){
                                    settings.showSearchBarResults = false
                                    settings.showAnnotationsOnMap = true
                                }
                            }, label: {
                                Text(searchResults.isEmpty ? " No results. Search map for \"\(productSearchString)\"" : "Search map for \"\(productSearchString)\"")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .padding(20)
                            })
                        }
                        //MARK: MATCHES TO STRING
                        if productSearchString != "" && !searchResults.isEmpty{
                            Text("Products Nearby")
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .padding(20)
                        }
                        ForEach(searchResults, id: \.self){ newTerm in
                            NavigationLink(destination: ProductInformationScrollView(listing: newTerm), label: {
                                SearchResultView(searchResult: newTerm)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            })
                        }
                        //MARK: RECOMMENDED
                        Text("Recommended Nearby")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .padding(20)

                        ForEach(exampleListings, id: \.self){ recommendedResult in
                            NavigationLink(destination: ProductInformationScrollView(listing: recommendedResult), label: {
                                SearchResultView(searchResult: recommendedResult)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                            })
                        }
                    })
                }
            }
        })
            .background(.white)
            .cornerRadius(30)
            .padding(.top, 30)
            .padding(.top, settings.showSearchBarResults && isFocused ? UIScreen.main.bounds.height * 0.15 : 0)
            .padding(EdgeInsets(top: isOnHomeScreen && isFocused ? UIScreen.main.bounds.height * 0.21 : 0, leading: 0, bottom: 0, trailing: 0))
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(isOnHomeScreen: true)
            .previewLayout(.sizeThatFits)
    }
}

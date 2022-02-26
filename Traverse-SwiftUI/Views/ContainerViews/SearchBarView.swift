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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30, content: {
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
                        .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                        .font(.custom("Poppins-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                        .focused($isFocused)
                }
                else{
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.50)){
                            settings.showSearchBarResults.toggle()
                            isFocused = true
                        }
                    }, label: {
                       TextField("Search for products...", text: $productSearchString, onEditingChanged: {_ in
                                beginSearch = true
                        })
                            .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
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
                        ForEach(searchResults, id: \.self){ newTerm in
                            SearchResultView(searchResult: newTerm)
                        }
                        Text("Recommended")
                            .font(.custom("Poppins-Regular", size: 18))
                            .bold()
                            .padding(.leading, 20)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                        ForEach(exampleData, id: \.self){ recommendedResult in
                            SearchResultView(searchResult: recommendedResult)
                        }
                    })
                }
            }
        })
            .background(.white)
            .cornerRadius(30)
            .padding(.top, 30)
            .padding(.top, settings.showSearchBarResults && isFocused ? UIScreen.main.bounds.height * 0.15 : 0)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .previewLayout(.sizeThatFits)
    }
}

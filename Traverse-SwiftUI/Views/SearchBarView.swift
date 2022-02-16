//
//  SearchBarView.swift
//  SearchBarAnimation
//
//  Created by Aiden Seibel on 1/8/22.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var productSearchString: String = ""
    @State var isAnimationEnabled: Bool = false
    @State var beginSearch: Bool = false
    @State var showResults: Bool = false

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30, content: {
            if !showResults{
                //MARK: TOP LEFT ICON
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.50)){
                        showResults.toggle()
                    }
                }, label:{
                    
                    HStack(){
                        if showResults == true{
                            Image(systemName: "chevron.left")
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.gray)
                        }else{
                            Image(systemName: "magnifyingglass")
                            .frame(width: 25, height: 25, alignment: .center)
                        }
                        
                        
                        //MARK: SEARCH FIELD
                        
                        TextField("Search for products...", text: $productSearchString)
                            .font(.custom("Poppins-Regular", size: 20))
                            .multilineTextAlignment(.leading)
                            .accentColor(.gray)
                            .frame(width: UIScreen.main.bounds.width * 0.7)

                    }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                })
            }
            
            
            //MARK: RESULTS
            if showResults{ //showResults is toggled every time the search icon is tapped
                
                HStack(){
                    //MARK: TOP LEFT ICON
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.50)){   //MARK: The Magic Line of Code
                            showResults.toggle()
                        }
                    }, label:{
                        HStack(){
                            if showResults == true{
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
                    
                    TextField("Search for products...", text: $productSearchString, onEditingChanged: {_ in
                            beginSearch = true
                        
                    })
                        .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                        .font(.custom("Poppins-Regular", size: 20))
                        .multilineTextAlignment(.leading)
                        .frame(width: UIScreen.main.bounds.width * 0.829, height: UIScreen.main.bounds.height * 0.068, alignment: .leading)
                        .padding(EdgeInsets(top: isAnimationEnabled ? 350 : 0, leading: 0, bottom: 0, trailing: 0))
                    
                }
                
                
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
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
            .previewLayout(.sizeThatFits)
    }
}

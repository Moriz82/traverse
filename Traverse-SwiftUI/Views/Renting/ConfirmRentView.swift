//
//  ConfirmRentView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 3/27/22.
//

import SwiftUI

struct ConfirmRentView: View {
    var body: some View{
        VStack{
            ScrollView{
                Text("Placeholder")
            }
            
            HStack{
                Spacer()
                Button(action: {
                    //MARK: RENT REQUEST
                }, label: {
                    Text("Confirm Rental")
                        .font(.custom("Poppins-SemiBold", size: 18))
                        .frame(width: 170, height: 40, alignment: .center)
                        .background(Color("traverse-blue"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
    }
}

struct ConfirmRentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmRentView()
    }
}

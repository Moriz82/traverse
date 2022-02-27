//
//  OwnerInformationSubView.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/26/22.
//

import SwiftUI

struct OwnerInformationSubView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10, content: {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("Profile Name")
                        .font(.title2)
                    Text("Date joined")
                })
                Spacer()
                HStack(alignment: .center, spacing: 5, content: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                    Text("# Stars")
                    Text("# Reviews")
                })
            })
            Button(action: {
                //MARK: SEND MESSAGE ACTION
            }, label: {
                Text("Send Message")
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 75, alignment: .center)
                    .background(.blue)
                    .font(.title)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            })
            
            Button(action: {
                //MARK: VIEW PROFILE ACTION
            }, label: {
                Text("View Profile")
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50, alignment: .center)
                    .font(.title2)
                    .foregroundColor(.blue)
            })
        }
        .padding()
    }
}

struct OwnerInformationSubView_Previews: PreviewProvider {
    static var previews: some View {
        OwnerInformationSubView()
            .previewLayout(.sizeThatFits)
    }
}

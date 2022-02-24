//
//  SignInWithGoogleButton.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/25/21.
//

import SwiftUI

struct SignInWithGoogleButton: View {
    private var size: CGFloat
    
    public init(size: CGFloat){
        self.size = size
    }
    
    var body: some View {
                        Button(action: {}){
                          HStack {
                              Image("GoogleLogo")
                              Text("Continue With Google")
                          }
                              .foregroundColor(Color.black)
                              .font(.system(size: 15 + size, weight: .semibold, design: .rounded))
                              .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.06)
                              .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1.5))
                        }
    }
}

struct SignInWithGoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithGoogleButton(size: 1)
    }
}

//
//  FilledInButton.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/25/21.
//

import SwiftUI

struct FilledInButton: View {
    var title: String
    var action: () -> Void
    var size: CGFloat
    
    public init(title: String, size: CGFloat, action: @escaping () -> Void){
        self.title = title
        self.size = size
        self.action = action
    }
    
    var body: some View {
                  Button(action: action){
                          Text(title)
                                .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.06)
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))                                .foregroundColor(Color.white)
                                .background(Color(UIColor(red: 0, green: 0.365, blue: 1, alpha: 1).cgColor  ))
                                .cornerRadius(10)
                            .aspectRatio(contentMode: .fit)
                  }
    }
}

struct FilledInButton_Previews: PreviewProvider {
    static var previews: some View {
        FilledInButton(title: "", size: 1, action: {})
    }
}

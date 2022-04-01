//
//  SecureTextInputView.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/25/21.
//

import SwiftUI

struct SecureTextInputView: View {
    private var title = ""
    private var size: CGFloat
    @State var password: String
    @FocusState private var passwordFieldIsFocused: Bool
    @State private var isSecured: Bool = true
    
    public init(title: String, size: CGFloat, password: String){
        self.title = title
        self.size = size
        self.password = password
    }
    
    var body: some View {
        HStack {
            if isSecured {
                SecureField(title, text: $password)
                    .focused($passwordFieldIsFocused)
                    .padding()
                    .font(.system(size: 15 + size, weight: .semibold, design: .rounded))
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.primary)
                    .autocapitalization(.none)
              }
            else {
                TextField(title, text: $password)
                    .focused($passwordFieldIsFocused)
                    .padding()
                    .font(.system(size: 15 + size, weight: .semibold, design: .rounded))
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.primary)
                    .autocapitalization(.none)
            }
            Button(action: {
                isSecured.toggle()
            }){
                Image(systemName: self.isSecured ? "eye.slash" : "eye")
                    .accentColor(self.passwordFieldIsFocused ? Color.accentColor : Color.gray)
            }.padding()
        }
        .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.06)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(passwordFieldIsFocused ? Color.accentColor : Color.gray, lineWidth: passwordFieldIsFocused ? 2 : 1.1))
    }
}

struct SecureTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        SecureTextInputView(title: "", size: 1, password: "")
    }
}

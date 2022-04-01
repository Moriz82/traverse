//
//  TextInputView.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/25/21.
//

import SwiftUI

struct TextInputView: View {
    private var title = ""
    private var size: CGFloat
    @State var text: String
    @FocusState public var fieldIsFocused: Bool
    
    public init(title: String, size: CGFloat, text: String){
        self.title = title
        self.size = size
        self.text = text
    }
    
    var body: some View {
        TextField(self.title , text: $text)
            .focused($fieldIsFocused)
            .padding()
            .font(.system(size: 15 + size, weight: .semibold, design: .rounded))
            .textFieldStyle(PlainTextFieldStyle())
            .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.06)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(fieldIsFocused ? Color.accentColor : Color.gray, lineWidth: fieldIsFocused ? 2 : 1.1))
            .foregroundColor(.primary)
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
       TextInputView(title: "", size: 1, text: "")
    }
}

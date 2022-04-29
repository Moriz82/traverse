//
//  AddPhoneNumberView.swift
//  Traverse-SwiftUI
//
//  Created by Yash Shah on 4/5/22.
//

import SwiftUI

struct AddPhoneNumberView: View {
    @FocusState private var shouldShowLogo: Bool
    private var name: String = ""
    private var email: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""
    @ScaledMetric var size: CGFloat = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack(alignment: .leading) {
                // Top Logo
                if !shouldShowLogo {
                    HStack{
                        TopRightLogoImage()
                        Spacer()
                    }
                } else {
                    Spacer(minLength: UIScreen.main.bounds.height * 0.0912)
                }
                
                // Sign Up Label
                VStack(spacing: 0){
                    Spacer()
                    Text("Add your phone number")
                        .font(.custom("Poppins-SemiBold", size: 40.0))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 50))
                    TextInputView(title: "+1 (000) - 000 - 0000", size: 5, text: "")
                        .padding()
                        .keyboardType(UIKeyboardType.phonePad)
                    NavigationLink(destination: AddCardPage(), label: {
                        FilledInButton(title: "Next", size: 5, action: {})
                    })
                    Spacer()
                }
                Spacer()
            }
        

    }
}

struct AddPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
        AddPhoneNumberView()
            
        }
    }
}

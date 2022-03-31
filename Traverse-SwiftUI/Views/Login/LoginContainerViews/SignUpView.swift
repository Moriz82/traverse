//
//  SignUpView.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/26/21.
//

import SwiftUI

struct SignUpView: View {
    @FocusState private var shouldShowLogo: Bool
    private var name: String = ""
    private var email: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""
    @ScaledMetric var size: CGFloat = 1
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                // Top Logo
                if !shouldShowLogo {
                    TopRightLogoImage()
                }
                else {
                    Spacer(minLength: UIScreen.main.bounds.height * 0.0912)
                }
                
                
                // Sign Up Label
                Spacer()
                Label("Sign Up", systemImage: "book.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))

                
                let nameTextField = TextInputView(title: "Name...", size: self.size, text: name)
                nameTextField.focused($shouldShowLogo)
                
                let emailTextField = TextInputView(title: "Email...", size: self.size, text: email)
                emailTextField.focused($shouldShowLogo)
                
                let passwordTextField = SecureTextInputView(title: "Password...", size: self.size, password: self.password)
                passwordTextField.focused($shouldShowLogo)
                
                // Confirm Password Text Field
                let confirmPasswordTextField = SecureTextInputView(title: "Confirm Password...", size: self.size, password: self.confirmPassword)
                confirmPasswordTextField.focused($shouldShowLogo)
                
                
                // Sign Up Button
                FilledInButton(title: "Sign Up", size: size, action: {
                    withAnimation(.easeIn(duration: 0.5)){
                        //checkLoginStatus.isLoggedIn = true
                    }
                    //MARK: CREATE ACCOUNT REQUEST
                    guard !name.isEmpty, !email.isEmpty, !password.isEmpty, confirmPassword == password else{
                        print("check is passwords match and fields aren't empty")
                        return
                    }
                    
                    viewModel.signup(name: name, email: email, password: password)
                    
                    
                    self.presentationMode.wrappedValue.dismiss()
                })
            
                VStack(spacing: UIScreen.main.bounds.width * 0.031) {
                    
                    // Or divider
                    orDividerImage()
                    
                    VStack(spacing: UIScreen.main.bounds.height * 0.07) {
                        
                        // Sign in with Google Button
                        SignInWithGoogleButton(size: size)
                    }
                }
            }.padding()
            .background(ignoresSafeAreaEdges: Edge.Set.top)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

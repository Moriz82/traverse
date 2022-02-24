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
    @State private var willMoveToCardPage = false
    @State private var willMoveToLogInPage = false
    
    var body: some View {
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
            
                VStack(spacing: UIScreen.main.bounds.width * 0.031) {
                    
                    // Confirm Password Text Field
                    let confirmPasswordTextField = SecureTextInputView(title: "Confirm Password...", size: self.size, password: self.confirmPassword)
                    confirmPasswordTextField.focused($shouldShowLogo)
                    
                    // Sign Up Button
                    FilledInButton(title: "Next", size: size, action: {willMoveToCardPage = true})
                    
                    // Or divider
                    orDividerImage()
                    
                    
                    VStack(spacing: UIScreen.main.bounds.height * 0.07) {
                        
                        // Sign in with Google Button
                        SignInWithGoogleButton(size: size)
                        
                        
                        // Already have an account? Log In
                        HStack{
                            Text("Already have an account?")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))
                            Button(action: {willMoveToLogInPage = true}){
                                Text("Log In")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))
                            }
                        }
                    }
                }
                Spacer()
            }.padding()
            .background(ignoresSafeAreaEdges: Edge.Set.top)
            .navigate(to: LoginHome(), when: $willMoveToLogInPage)
            .navigate(to: AddCardPage(), when: $willMoveToCardPage)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

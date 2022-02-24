//
//  ContentView.swift
//  TraverseLoginSwiftUI
//
//  Created by Yash Shah on 11/21/21.
//

import SwiftUI

struct LoginHome: View {
    @FocusState private var shouldShowLogo: Bool
    private var email: String = ""
    private var password: String = ""
    @ScaledMetric var size: CGFloat = 1
    @State private var willMoveToSignUp = false
    @State private var willMoveToHomePage = false
    
    var body: some View {
            VStack(alignment: .leading) {
                
                // Top Logo
                if !shouldShowLogo {
                    TopRightLogoImage()
                }
                else {
                    Spacer(minLength: UIScreen.main.bounds.height * 0.0912)
                }
                
                
                // Log In Label
                Spacer()
                Label("Log in", systemImage: "book.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                
                let emailTextField = TextInputView(title: "Email...", size: self.size, text: email)
                emailTextField.focused($shouldShowLogo)
                
                
                // Forgot Password Button
                HStack {
                    Spacer()
                    Button(action: {}){
                        Text("Forgot Password?")
                            .font(.system(.footnote, design: .rounded).bold())
                    }
                }
                
            
                VStack(spacing: UIScreen.main.bounds.width * 0.031) {
                    // Password Text field
                    let passwordTextField = SecureTextInputView(title: "Password...", size: self.size, password: self.password)
                    passwordTextField.focused($shouldShowLogo)

                    
                    // Log In Button
                    FilledInButton(title: "Log In", size: size, action: {willMoveToHomePage = true})
                    
                    // Or divider
                    orDividerImage()
                    
                    
                    VStack(spacing: UIScreen.main.bounds.height * 0.07) {
                        
                        // Sign in with Google Button
                        SignInWithGoogleButton(size: size)
                        
                        
                        // Dont have an account? Sign Up
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))
                            .font(.system(.footnote, design: .rounded).bold())
                            Button(action: {willMoveToSignUp = true}){
                                Text("Sign Up")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))                        }
                        }
                    }
                }
                Spacer()
            }.padding()
            .navigate(to: SignUpView(), when: $willMoveToSignUp)
            .navigate(to: HomePage(), when: $willMoveToHomePage)
            
    }
}

extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct LoginHome_Previews: PreviewProvider {
    static var previews: some View {
        LoginHome()
    }
}

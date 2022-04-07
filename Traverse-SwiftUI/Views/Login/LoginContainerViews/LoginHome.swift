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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                TopRightLogoImage()
                // Top Logo
//                if !shouldShowLogo { TopRightLogoImage() } else {
//                    Spacer(minLength: UIScreen.main.bounds.height * 0.0912)
//                }
                
                // Log In Label
                Label("Log in", systemImage: "book.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.016, leading: 0, bottom: 0, trailing: 0))
                
                //MARK: EMAIL TEXT FIELD
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
                    NavigationLink(destination: HomePage(), label: {
                        FilledInButton(title: "Log In", size: size, action: {
                            withAnimation(.easeIn(duration: 0.5)){
                                //viewModel.isSignedIn = true
                            }
                            //MARK: LOG IN REQUEST
                            guard !email.isEmpty, !password.isEmpty else{
                                return
                            }
                        viewModel.login(email: email, password: password)
                        
                        self.presentationMode.wrappedValue.dismiss()
                    })
                        
                    })
                    
                    // Or divider
                    Image("orImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.040)
                        .aspectRatio(contentMode: .fit)
                    
                    
                    //MARK: FOOTER
                    VStack(spacing: UIScreen.main.bounds.height * 0.07) {
                        
                        // Sign in with Google Button
                        SignInWithGoogleButton(size: size)
                        
                        
                        // Dont have an account? Sign Up
                        HStack{
                            Text("Don't have an account?")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))
                            .font(.system(.footnote, design: .rounded).bold())
                            NavigationLink(destination: SignUpView(), label: {
                                Text("Sign Up")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))

                            })
                        }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}


struct LoginHome_Previews: PreviewProvider {
    static var previews: some View {
        LoginHome()
    }
}

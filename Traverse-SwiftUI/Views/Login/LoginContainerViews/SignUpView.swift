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
                TopRightLogoImage()
                // Top Logo
//                if !shouldShowLogo {
//                    TopRightLogoImage()
//                }
                // Sign Up Label
                Label("Sign Up", systemImage: "book.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .padding(EdgeInsets(top: UIScreen.main.bounds.height * 0.016, leading: 0, bottom: 0, trailing: 0))

                
                //MARK: TEXT FIELDS
                VStack(alignment: .center, spacing: UIScreen.main.bounds.width * 0.031){
                    let nameTextField = TextInputView(title: "Name...", size: self.size, text: name)
                    nameTextField.focused($shouldShowLogo)
                    
                    let emailTextField = TextInputView(title: "Email...", size: self.size, text: email)
                    emailTextField.focused($shouldShowLogo)
                    
                    let passwordTextField = SecureTextInputView(title: "Password...", size: self.size, password: self.password)
                    passwordTextField.focused($shouldShowLogo)
                    
                    // Confirm Password Text Field
                    let confirmPasswordTextField = SecureTextInputView(title: "Confirm Password...", size: self.size, password: self.confirmPassword)
                    confirmPasswordTextField.focused($shouldShowLogo)
                }
                
                
                
                
                //MARK: Sign Up Button
                NavigationLink(destination: AddCardPage(), label: {
                    FilledInButton(title: "Sign Up", size: size, action: {
                        //passwords match and fields aren't empty
                        guard !name.isEmpty, !email.isEmpty, !password.isEmpty, confirmPassword == password else{
                            print("check is passwords match and fields aren't empty")
                            return
                        }
                        
                        //MARK: CREATE ACCOUNT REQUEST
                        viewModel.signup(name: name, email: email, password: password)
                        
                    })
                    
                })
            
            //MARK: FOOTER
                VStack(spacing: UIScreen.main.bounds.width * 0.031) {
                    Image("orImage") // Or divider
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.923, height: UIScreen.main.bounds.height * 0.040)
                        .aspectRatio(contentMode: .fit)
                    
                    SignInWithGoogleButton(size: size)
                    VStack {
                        Spacer()
                        HStack{
                            Text("Already have an account?")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))
                            .font(.system(.footnote, design: .rounded).bold())
                            NavigationLink(destination: LoginHome(), label: {
                                Text("Log In")
                                .font(.system(size: 17 + size, weight: .semibold, design: .rounded))

                            })
                        }
                        Spacer()
                    }
                }
            }.padding()
//            .background(ignoresSafeAreaEdges: Edge.Set.top)
//            if(shouldShowLogo){
//                    Spacer(minLength: UIScreen.main.bounds.height * 0.095)
//            }

        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

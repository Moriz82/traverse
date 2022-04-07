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
                if !shouldShowLogo { TopRightLogoImage() } else {
                    Spacer(minLength: UIScreen.main.bounds.height * 0.0912)
                }
                
                // Sign Up Label
                Spacer()
                Label("Add your phone number", systemImage: "book.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(.largeTitle, design: .rounded).bold())
                    .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            }

    }
}

struct AddPhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        AddPhoneNumberView()
    }
}

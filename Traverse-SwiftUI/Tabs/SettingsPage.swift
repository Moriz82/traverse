//
//  SettingsPage.swift
//  Traverse-SwiftUI
//
//  Created by Aiden Seibel on 2/16/22.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            Text("Settings")
                .font(.custom("Poppins-SemiBold", size: 40.0))
            Spacer()
        })
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

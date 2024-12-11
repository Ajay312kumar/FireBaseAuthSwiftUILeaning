//
//  InputView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 10/12/24.
//

import SwiftUI

struct InputView: View {
    
    let placeholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    
    var body: some View {
        VStack(spacing: 12){
            
            if isSecureField {
                SecureField(placeholder, text: $text)
            }else{
                TextField(placeholder, text: $text)
            }
            
            Divider()
        }
    }
}

#Preview {
    InputView(placeholder: "enter email or phone", text: .constant(""))
}

//
//  LoginView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 10/12/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 16){
                //image
                
                Image("doggy")
                    .resizable()
                    .scaledToFit()
                
                Text("Lets' us connect with us")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer().frame(height: 12)
                
                
                InputView(placeholder: "Enter email or Phone", text: $email)
                
                
                InputView(placeholder: "Enter Password", isSecureField: true, text: $password)
                
                
                HStack {
                    Spacer()
                    
                    Button{
                        
                    }label: {
                        Text("Forgot Password?")
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                            .font(.subheadline)
                    }
                }
                
                Button{
                    
                } label: {
                    Text("Login")
                }
                .buttonStyle(CapsuleButtonStyle())
                
                
                LabelledDivider(label: "OR")
                
                Button{
                    
                } label: {
                    Label("Sign up with Apple", systemImage: "apple.logo")
                }
                .buttonStyle(CapsuleButtonStyle(bgColor: .black))
                
                
                Button{
                    
                }label: {
                    HStack{
                        Image("doggy")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Sign up with Google")
                    }
                }
                .buttonStyle(CapsuleButtonStyle(bgColor: .clear, textColor: .black, hasBorder: true))
                
                
                //text
                
                //email and password field
                
                //forgate password
                
                //login btn
                
                
                //or line
                
                //sign up with Apple
                
                
                // sign up with Google
                
                
                //footer
                
            }
            .ignoresSafeArea()
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    LoginView()
}

struct CapsuleButtonStyle: ButtonStyle{
    
    var bgColor: Color = .teal
    var textColor: Color = .white
    var hasBorder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .fontWeight(.semibold)
        .foregroundStyle(textColor)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Capsule().fill(bgColor))
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
        .overlay{
            hasBorder ?
            Capsule()
                .stroke(.gray, lineWidth: 1)
            : nil
        }
    }
}
struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 0, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

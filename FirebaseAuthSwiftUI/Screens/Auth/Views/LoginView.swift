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
        
        NavigationStack {
            ScrollView{
                
                VStack(spacing: 16){
                    
                    Image("doggy")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Lets' us connect with us")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer().frame(height: 12)
                    
                    
                    InputView(placeholder: "Enter email or Phone", text: $email)
                    
                    
                    InputView(placeholder: "Enter Password", isSecureField: true, text: $password)
                    
                    
                    forgotPassword
                    
                    loginButton
                    
                    Spacer()
                    
                    LabelledDivider(label: "OR")
                    
                    appleButton
                    googleButton
                    dontHaveAccount
                    
                }
                .ignoresSafeArea()
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
            
        }
        
        
    }
    
    private var forgotPassword: some View {
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
    }
    
    
    
    private var loginButton: some View {
        Button{
            
        } label: {
            Text("Login")
        }
        .buttonStyle(CapsuleButtonStyle())
        
    }
    
    private var appleButton: some View{
        Button{
            
        } label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }
        .buttonStyle(CapsuleButtonStyle(bgColor: .black))
    }
    
    
    private var googleButton: some View{
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
    }
    
    private var dontHaveAccount: some View{
        NavigationLink{
            
        } label: {
            HStack{
                Text("Don't have an account")
                    .foregroundStyle(.black)
                Text("Sign up")
                    .foregroundStyle(.teal)
            }
            .fontWeight(.medium)
        }
    }
    
}

#Preview {
    LoginView()
}

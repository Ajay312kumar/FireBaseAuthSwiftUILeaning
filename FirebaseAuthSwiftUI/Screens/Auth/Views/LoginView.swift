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
    @State private var showPassword: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var vm: UserAuthModel
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                
                VStack(spacing: 16){
                    
                    Image("loginImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Text("Lets' us connect with us")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer().frame(height: 12)
                    
                    
                    InputView(placeholder: "Enter email or Phone", text: $email)
                    
                    ZStack(alignment: .trailing){
                        InputView(placeholder: "Enter Password", isSecureField: !showPass, text: $password)
                        Spacer()
                        
                        if !password.isEmpty{
                            Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    showPassword.toggle()
                                }
                        }
                    }
                    
                    forgotPassword
                    
                    loginButton
                    
                    Spacer()
                    
                    LabelledDivider(label: "OR")
                   
                    //just checking git push
                    
                    appleButton
                    googleButton
                    dontHaveAccount
                    
                }
                .ignoresSafeArea()
                .padding(.horizontal)
                .padding(.vertical, 12)
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
            Task{
                await authViewModel.login(email: email, password: password)
            }
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
    
    
    private var googleButton: some View {
        Button {
            vm.signIn() // Calls the signIn method from UserAuthModel
        } label: {
            HStack {
                Image("google")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Sign up with Google")
            }
        }
        .buttonStyle(CapsuleButtonStyle(bgColor: .clear, textColor: .black, hasBorder: true))
    }
    
    private var dontHaveAccount: some View{
        NavigationLink{
            AccountDetailView()
                .environmentObject(authViewModel)
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
    
    private var showPass: Bool {
        return showPassword
    }
    
}

#Preview {
    LoginView()
}

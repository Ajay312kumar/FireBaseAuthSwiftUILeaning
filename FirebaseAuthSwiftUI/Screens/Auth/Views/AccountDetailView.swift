import SwiftUI

struct AccountDetailView: View {
    
    //MARK: Variables
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = false
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @MainActor
    var body: some View {
        VStack {
            Text("Please complete all information to create an account")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .font(.headline)
                .padding(.horizontal)
            
            Spacer()
                .frame(height: 20)
            
            VStack(spacing: 15) {
                InputView(placeholder: "Email or Phone Number", text: $email)
                InputView(placeholder: "Full Name", text: $fullName)
                
                ZStack(alignment: .trailing) {
                    InputView(placeholder: "Password", isSecureField: !showPassword, text: $password)
                    
                    if !password.isEmpty {
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
                
                ZStack(alignment: .trailing) {
                    InputView(placeholder: "Confirm your password", isSecureField: true, text: $confirmPassword)
                    
                    Spacer()
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        Image(systemName: "\(isValidConfirmPassword ? "checkmark" : "xmark").circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .padding(.trailing, 10)
                            .foregroundColor(isValidConfirmPassword ? Color(.systemGreen) : Color(.systemRed))
                    }
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                Task{
                    await authViewModel.createUser(email: email, fullName: fullName, password: password)
                }
            }) {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    //.background(.teal)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Capsule().fill(.teal))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Set up your account")
        .toolbarRole(.editor)
    }
    
    private var isValidConfirmPassword: Bool {
        password == confirmPassword
    }
 
    private var showPass: Bool {
        return showPassword
    }

    
}

#Preview {
    AccountDetailView()
}

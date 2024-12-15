//
//  ContentView.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var vm: UserAuthModel
    
    fileprivate func SignInButton() -> Button<Text> {
            Button(action: {
                vm.signIn()
            }) {
                Text("Sign In")
            }
        }
        
        fileprivate func SignOutButton() -> Button<Text> {
            Button(action: {
                vm.signOut()
            }) {
                Text("Sign Out")
            }
        }
        
        fileprivate func ProfilePic() -> some View {
            AsyncImage(url: URL(string: vm.profilePicUrl))
                .frame(width: 100, height: 100)
        }
        
        fileprivate func UserInfo() -> Text {
            return Text(vm.givenName)
        }
    
    
    var body: some View {
        VStack {
            LoginView()
                .environmentObject(AuthViewModel())
                .environmentObject(UserAuthModel())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

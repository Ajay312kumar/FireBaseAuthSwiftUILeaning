//
//  AuthViewModel.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 13/12/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?   //firebase ka user
    @Published var isError: Bool = false
    @Published var currentUser: User?     //an user
    @Published var isLoading: Bool = false
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init() {
        
    }
    
    func login(email: String, password: String) async {
        do{
            let authResult = try await auth.signIn(withEmail: email, password: password)
            await fetchUser(by: authResult.user.uid)
            print("currentUser", currentUser)
        }catch{
            isError = true
        }
    }
    
    
    func createUser(email: String, fullName: String, password: String) async {
        
        do{
            
            // user entry in
            let authResult = try await auth.createUser(withEmail: email, password: password)
            
            //Extra entry in firebase database of an user
            await storeUserInFireStore(uid: authResult.user.uid, email: email, fullName: fullName)
            
        }catch{
            isError = true
        }
        
    }
    
    func storeUserInFireStore(uid: String, email: String, fullName: String) async{
        let user = User(uid: uid, name: email, fullName: fullName)
        
        do{
            try firestore.collection("users").document(uid).setData(from: user)
        }catch{
            isError = true
        }
    }
    
    
    func fetchUser(by uid: String) async{
        do{
            let document = try await firestore.collection("users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        }catch{
            isError = true
        }
    }
    
    func signOut(){
        do{
            userSession = nil
            currentUser = nil
            try auth.signOut()
        }catch{
            isError = true
        }
    }
}

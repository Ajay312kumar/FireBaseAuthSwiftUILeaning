//
//  FirebaseAuthSwiftUIApp.swift
//  FirebaseAuthSwiftUI
//
//  Created by Ajay Kumar on 10/12/24.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


struct FirebaseAuthSwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var userAuthModel = UserAuthModel()
    
    init() {
        FirebaseApp.configure() // Ensure Firebase is initialized here
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(authViewModel)
                .environmentObject(userAuthModel)
        }
    }
}


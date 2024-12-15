import SwiftUI
import FirebaseCore

@main
struct GoogleAuthApp: App {
    @StateObject var userAuth: UserAuthModel = UserAuthModel()

    init() {
        FirebaseApp.configure() // Initialize Firebase here
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(userAuth)
            .navigationViewStyle(.stack)
        }
    }
}

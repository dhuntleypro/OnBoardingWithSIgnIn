//
//  OnBoardingWithSIgnInApp.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI
import Firebase

@main
struct OnBoardingWithSIgnInApp: App {
    
    // Calling Delegate...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            AppNavigation()
                .environmentObject(AuthViewModel.shared)
        
        }
    }
}

// Intializing Firebase...
class AppDelegate: NSObject, UIApplicationDelegate {
    // type appdidfin - then the second one
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}

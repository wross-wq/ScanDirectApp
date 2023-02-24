//
//  ScanDirectApp.swift
//  ScanDirect
//
//  Created by Wayne Anthony Ross Jr. on 2/23/23.
//

import SwiftUI
import Amplify
import Firebase
import FBAuthentication
import AWSCognitoAuthPlugin
import AuthenticationServices

class LoginViewController: UIViewController, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return ASPresentationAnchor()
    }
}


@main
struct ScanDirectApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
    
    //@StateObject var  userInfo = UserInfo(presentationContextProvider: LoginViewController())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserInfo());
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

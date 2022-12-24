//
//  YoutubeMusicCloneSwiftUIApp.swift
//  YoutubeMusicCloneSwiftUI
//
//  Created by Baris OZGEN on 20.12.2022.
//

import SwiftUI
import Firebase

@main
struct YoutubeMusicCloneSwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(FirebaseAppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

#if os(iOS)
class FirebaseAppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       print("\(#function)")
       Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
     }
     
     func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
       print("\(#function)")
       if Auth.auth().canHandleNotification(notification) {
         completionHandler(.noData)
         return
       }
     }
     
     func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
       print("\(#function)")
       if Auth.auth().canHandle(url) {
         return true
       }
       return false
     }
}
#endif

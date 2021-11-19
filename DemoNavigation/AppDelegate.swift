//
//  AppDelegate.swift
//  DemoNavigation
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 9/19/21.
//

import UIKit
import SocketIO

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var manager: SocketManager?
    // swiftlint:disable force_unwrapping
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        // ĐKTQ
//        let navigationController = UINavigationController(rootViewController: LoginViewController())
        
        let domainAPI = AppConfiguration.infoForKey(.domainAPI)
        print(domainAPI)

        let path = Bundle.main.path(forResource: "vi", ofType: "lproj")
        let langBundle = Bundle(path: path!)
        
        let hello = NSLocalizedString("hello", bundle: langBundle!, comment: "")
        print(hello)
        
        let tabbarController = UITabBarController()
        
        let homeVC = HomeViewController()
        let naviVC = UINavigationController(rootViewController: homeVC)
        naviVC.tabBarItem = UITabBarItem(title: "Tab1",
                                         image: UIImage(systemName: "house"),
                                         tag: 0)
        naviVC.tabBarItem.badgeValue = "15"
        naviVC.tabBarItem.badgeColor = .red
        
        let loginVC = LoginViewController()
        loginVC.tabBarItem = UITabBarItem(title: "Tab2",
                                          image: UIImage(systemName: "arrow.clockwise.icloud"),
                                          tag: 1)
        
        tabbarController.viewControllers = [naviVC, loginVC]
        tabbarController.tabBar.barTintColor = .yellow
        tabbarController.tabBar.tintColor = .red
        tabbarController.tabBar.backgroundColor = .yellow
        
        
        
        window.rootViewController = AlbumViewController()

        self.window = window
        window.makeKeyAndVisible()
        
        
        if let url = URL(string: "http://localhost:5000") {
            manager = SocketManager(socketURL: url, config: [.log(true), .compress])
            
            let socket = manager?.defaultSocket

            socket?.on(clientEvent: .connect) {data, ack in
                print("socket connected")
            }

    //        socket.on("currentAmount") {data, ack in
    //            guard let cur = data[0] as? Double else { return }
    //
    //            socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
    //                if data.first as? String ?? "passed" == SocketAckValue.noAck {
    //                    // Handle ack timeout
    //                }
    //
    //                socket.emit("update", ["amount": cur + 2.50])
    //            }
    //
    //            ack.with("Got your currentAmount", "dude")
    //        }

            socket?.connect()
        }
        
        
        return true
    }
}



final class AppConfiguration {
    
    /// Get the value according to the given key in your bundle
    ///
    /// - Parameter key: The keys that you defined in .xcconfig file
    /// - Returns: The accordingly value
    static func infoForKey(_ key: String) -> String? {
        guard let configs = Bundle.main.infoDictionary?["App Configurations"] as? [String: String],
            let value = configs[key] else { return nil }
        return value.replacingOccurrences(of: "\\", with: "")
    }
    
    /// Get the value according to the given key in your bundle
    ///
    /// - Parameter key: The keys that you defined `AppConfigurationKeys`
    /// - Returns: The accordingly value
    static func infoForKey(_ key: AppConfigurationKeys) -> String? {
        guard let configs = Bundle.main.infoDictionary?["App Configurations"] as? [String: String],
            let value = configs[key.rawValue] else { return nil }
        return value.replacingOccurrences(of: "\\", with: "")
    }
}

enum AppConfigurationKeys: String {
    case bundleIndentifier = "BUNDLE_INDENTIFIER"
    case domainAPI = "DOMAIN_API"
}

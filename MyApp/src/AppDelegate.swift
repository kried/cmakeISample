import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create the main window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Instantiate the ViewController
        let viewController = ViewController()
        
        // Set the root view controller
        window?.rootViewController = viewController
        
        // Make the window visible
        window?.makeKeyAndVisible()
        
        return true
    }
}
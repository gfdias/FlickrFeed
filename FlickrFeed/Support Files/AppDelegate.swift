import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        setupAppearance()
        setupWindow()
        return true
        
    }
    
    private func setupWindow() {
        
        let startingViewController = NavigationCoordinator.shared.startingViewController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = startingViewController
        self.window?.makeKeyAndVisible()
        
    }
    
    private func setupAppearance() {
        
        UINavigationBar.appearance().barTintColor = .black
        UIBarButtonItem.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        UIApplication.shared.statusBarStyle = .lightContent
        
    }

}

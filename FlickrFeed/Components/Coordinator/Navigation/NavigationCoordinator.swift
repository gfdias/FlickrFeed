import Foundation
import UIKit

final class NavigationCoordinator: NSObject {
    
    // MARK: - Properties
    
    private var mainNavigationController: UINavigationController!
    
    
    // MARK: - Singleton
    
    static let shared = NavigationCoordinator()
    
    
    // MARK: - Public
    
    public func startingViewController() -> UINavigationController {
        
        mainNavigationController = UINavigationController(rootViewController: FlickrDependencyCoordinator.shared.resolve(viewController: .feed))
        return mainNavigationController
        
    }
    
    public func push(viewController: ViewControllerType) {
        
        self.mainNavigationController
            .pushViewController(FlickrDependencyCoordinator
            .shared.resolve(viewController: viewController), animated: true)
        
    }
    
}

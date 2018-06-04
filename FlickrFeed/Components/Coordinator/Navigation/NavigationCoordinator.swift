import Foundation
import UIKit

final class NavigationCoordinator: NSObject {
    
    // MARK: - Properties
    
    private var mainNavigationController: UINavigationController!
    
    
    // MARK: - Singleton
    
    static let shared = NavigationCoordinator()
    
    
    // MARK: - Public
    
    public func startingViewController() -> UINavigationController {
        
        mainNavigationController = UINavigationController(rootViewController: FeedViewController(viewModel: FeedViewModel()))
        return mainNavigationController
        
    }
    
}

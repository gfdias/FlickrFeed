import UIKit

final class FlickrDependencyCoordinator {
    
    private let feedRepository: FeedRepository = FeedRepository(APIProvider: FlickrFeedAPIProvider())
    
    static let shared = FlickrDependencyCoordinator()
    
    func resolve(viewController: ViewControllerType) -> UIViewController {
        
        switch viewController {
            
        case .feed:
            return FeedViewController(viewModel: FeedViewModel(repository: self.feedRepository))
            
        case .detail(let photo):
            return PhotoDetailViewController(viewModel: DetailViewModel(photo: photo))
            
        }
        
    }
    
}

enum ViewControllerType {
    
    case feed
    case detail(photo: Photo)
    
}


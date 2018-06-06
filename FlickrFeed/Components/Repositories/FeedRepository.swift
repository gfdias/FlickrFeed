import Foundation

class FeedRepository {
    
    private let APIProvider: FeedProviderProtocol
    private var delegates = NSHashTable<AnyObject>.weakObjects()
    
    var categories: [Category] = [.animals, .city, .people]
    var photos: [FlickrPhoto] = []

    init(APIProvider: FeedProviderProtocol) {
        self.APIProvider = APIProvider
    }
    
    func getFeedPhotos() {
        
        self.startedUpdating()
        
        self.APIProvider.getPhotos { photos, error in
            
            guard let photos = photos else {
                
                self.error(errorTitle: error.debugDescription)
                return
                
            }
            
            self.photos = photos
            self.success()
            
        }
        
    }
    
    func addDelegate(_ delegate: FeedRepositoryDelegate) {
        self.delegates.add(delegate)
    }
    
    func removeDelegate(_ delegate: FeedRepositoryDelegate) {
        self.delegates.remove(delegate)
    }
    
    private func startedUpdating() {
        self.delegates.allObjects.forEach {($0 as? FeedRepositoryDelegate)?.loading()}
    }
    
    private func success() {
        self.delegates.allObjects.forEach {($0 as? FeedRepositoryDelegate)?.success()}
    }
    
    private func error(errorTitle: String) {
        self.delegates.allObjects.forEach {($0 as? FeedRepositoryDelegate)?.error(errorTitle)}
    }
    
    
}

protocol FeedRepositoryDelegate: class {
    
    func loading()
    func error(_ error: String)
    func success()
    
}

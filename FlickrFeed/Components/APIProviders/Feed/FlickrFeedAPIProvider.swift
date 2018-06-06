import Foundation
import Moya

class FlickrFeedAPIProvider: FeedProviderProtocol {
    
    let provider = MoyaProvider<FlickrAPI>()
    
    func getPhotos(completion: (([FlickrPhoto]?, Error?) -> ())?) {
        provider.request(.feed) { result in
            
            switch result {
                
            case let .success(response):
                
                do {
                    
                    let photos = try JSONDecoder().decode(SearchServerObject.self, from: response.data)
                    completion?(photos.photosContainer.photos, nil)
                    
                } catch let error {
                    completion?(nil, error)
                }
                
            case let .failure(error):
                completion?(nil, error)
            }
            
        }
        
    }
    
}

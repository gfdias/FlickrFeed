import Foundation
import Moya

class FlickrFeedAPIProvider: FeedProviderProtocol {
    
    let provider = MoyaProvider<FlickrAPI>()
    
    func getPhotos(completion: (([Photo]?, FlickrError?) -> ())?) {
        provider.request(.feed) { result in
            
            switch result {
                
            case let .success(response):
                
                do {
            
                    let photos = try JSONDecoder().decode(SearchServerObject.self, from: response.data)
                    completion?(photos.photosContainer.photos, nil)
                    
                } catch {
                    completion?(nil, .serverError(code: response.statusCode))
                }
                
            case let .failure(error):
                
                guard let code = error.response?.statusCode else {
                    
                    completion?(nil, .general)
                    return
                    
                }
                
                completion?(nil, .serverError(code: code))
                
            }
            
        }
        
    }
    
}

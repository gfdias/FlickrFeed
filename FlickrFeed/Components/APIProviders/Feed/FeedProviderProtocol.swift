import Foundation

protocol FeedProviderProtocol {
    func getPhotos(completion: (([Photo]?, FlickrError?) -> ())?)
}

import Foundation

protocol FeedProviderProtocol {
    func getPhotos(completion: (([FlickrPhoto]?, Error?) -> ())?)
}

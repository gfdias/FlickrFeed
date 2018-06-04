import Foundation

struct FlickrPhoto: Photo {
            
    var title: String
    var location: String
    var date: Date
    var photoId : String
    var farm: String
    var server: String
    var secret: String
    
    var url: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoId)_\(secret)_m.jpg")!
    }
    
}

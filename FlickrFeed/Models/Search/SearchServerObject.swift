import Foundation

struct SearchServerObject {
    var photosContainer: PhotosContainer
}

extension SearchServerObject: Decodable {
    
    enum structKeys: String, CodingKey {
        case photosContainer = "photos"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: structKeys.self)
        let photosContainer = try container.decode(PhotosContainer.self, forKey: .photosContainer)
        self.init(photosContainer: photosContainer)
        
    }
    
}

struct PhotosContainer {
    var photos: [FlickrPhoto]
}

extension PhotosContainer: Decodable {
    
    enum structKeys: String, CodingKey {
        case photos = "photo"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: structKeys.self)
        let photos = try container.decode([FlickrPhoto].self, forKey: .photos)
        self.init(photos: photos)
        
    }
    
}

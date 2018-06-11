import Foundation

struct DetailViewModel {
    
    private let photo: Photo
    
    var owner: String {
        return photo.owner
    }
    
    var date: String {
        return photo.date
    }
    
    var tags: [String] {
        return photo.tags
    }
    
    var tagsURL: URL {
        return photo.tagsURL
    }
    
    var imageURL: URL {
        return photo.imageURL
    }
    
    var title: String {
        return photo.title
    }
    
    init(photo: Photo) {
        self.photo = photo
    }
    
}

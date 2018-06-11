import Foundation

struct PhotoViewModel {
    
    private let photo: Photo
    
    var url: URL {
        return photo.imageURL
    }
    
    init(photo: Photo) {
        self.photo = photo
    }

}

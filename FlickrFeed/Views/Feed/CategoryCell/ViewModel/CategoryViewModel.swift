import Foundation

struct CategoryViewModel {
    
    private let photos: [Photo]
    
    var numberOfItems: Int {
        return self.photos.count
    }
    
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    func getPhotoViewModel(at index: Int) -> PhotoViewModel {
        return PhotoViewModel(photo: self.photos[index])
    }
    
}

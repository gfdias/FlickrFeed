import Foundation

struct CategoryViewModel {
    
    private let photoViewModels: [PhotoViewModel]
    
    var numberOfItems: Int {
        return self.photoViewModels.count
    }
    
    init(photoViewModels: [PhotoViewModel]) {
        self.photoViewModels = photoViewModels
    }
    
}

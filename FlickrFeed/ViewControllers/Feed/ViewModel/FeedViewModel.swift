import Foundation

class FeedViewModel {
    
    var successSignal: (() -> Void)?
    var failureSignal: ((String) -> Void)?
    var loadingSignal: (() -> Void)?
    
    let repository: FeedRepository
    
    init(repository: FeedRepository) {
        
        self.repository = repository
        self.repository.addDelegate(self)
        
    }
    
    func fetchDataSource() {
        self.repository.getFeedPhotos()
    }
    
    func categoryViewModel(at index: Int) -> CategoryViewModel {
        
        let category = self.repository.categories[index].rawValue
        
        let categoryViewModel = CategoryViewModel(photos: self.repository.photos.filter {
            $0.tags.first(where: {$0 == category }) == category })
    
        return categoryViewModel
        
    }
    
    func numberOfCategories() -> Int {
        return self.repository.categories.count
    }
    
    func categoryTitle(at index: Int) -> String {
        return self.repository.categories[index].rawValue.uppercased()
    }
    
}

extension FeedViewModel: FeedRepositoryDelegate {
    
    func success() {
        self.successSignal?()
    }
    
    func error(_ error: String) {
        self.failureSignal?(error)
    }
    
    func loading() {
        self.loadingSignal?()
    }
    
}

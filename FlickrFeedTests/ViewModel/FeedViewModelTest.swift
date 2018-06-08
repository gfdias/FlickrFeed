import XCTest
@testable import FlickrFeed

class FeedViewModelTest: XCTestCase {
    
    func testCategories() {
        
        let viewModel = FeedViewModel(repository: mockRepository(APIProvider: mockAPIProvider()))
        let categoriesViewModel = viewModel.categoryViewModel(at: 1) // 1 == City
        
        XCTAssertEqual(categoriesViewModel.getPhoto(0).tags, ["city"])
        
    }
    
}

class mockRepository: FeedRepository {
    
    override init(APIProvider: FeedProviderProtocol) {
        
        super.init(APIProvider: APIProvider)
        self.categories = [.nature, .city]
        self.photos = [mockPhoto(tags: ["city"]), mockPhoto(tags: ["nature"])]
        
    }
    
    func mockPhoto(tags: [String]) -> FlickrPhoto {
        
        return FlickrPhoto(title: "Test",
                           date: "2018-03-06 16:12:32",
                           owner: "Me",
                           photoID: "1",
                           farm: 2,
                           server: "3",
                           secret: "4",
                           tags: tags)
        
    }
    
}

class mockAPIProvider: FlickrFeedAPIProvider { }

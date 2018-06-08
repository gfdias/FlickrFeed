import XCTest
@testable import FlickrFeed

class FlickrPhotoTest: XCTestCase {
    
    func testFlickrPhotoDecoder() {
        
        let json = """
            {
            "id": "28751904728",
            "owner": "126487281@N07",
            "secret": "915fb739c1",
            "server": "1735",
            "farm": 2,
            "title": "Blauwvleugelsprinkhaan - Blue winged grasshopper",
            "ispublic": 1,
            "isfriend": 0,
            "isfamily": 0,
            "datetakengranularity": 0,
            "datetakenunknown": 0,
            "datetaken": "2018-03-06 16:12:32",
            "ownername": "KarsKW",
            "tags": "birds wren fledgling spring wildlife animals nature"
            }
            """.data(using: .utf8)
        
        do {
            
            let photo: FlickrPhoto = try JSONDecoder().decode(FlickrPhoto.self, from: json!)
            XCTAssertEqual(photo.photoID, "28751904728")
            
        } catch let error{
            XCTFail(error.localizedDescription)
        }

    }
    
    func testFlickrPhotoURLConstruct() {
        
        let photo = FlickrPhoto(title: "Test",
                                date: "2018-03-06 16:12:32",
                                owner: "Me",
                                photoID: "1",
                                farm: 2,
                                server: "3",
                                secret: "4",
                                tags: ["animals"])
        
        XCTAssertEqual(photo.url.absoluteString, "https://farm2.staticflickr.com/3/1_4_c.jpg")
        
    }
    
}

private extension String {
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}


//
//  FlickrFeedTests.swift
//  FlickrFeedTests
//
//  Created by Gonçalo Dias on 01/06/2018.
//  Copyright © 2018 Gonçalo Dias. All rights reserved.
//

import XCTest
@testable import FlickrFeed


class FlickrPhotoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFlickrPhoto() {
        
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
    
}

private extension String {
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}


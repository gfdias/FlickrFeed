import Foundation

struct FlickrPhoto: Photo {
            
    var title: String
    var date: String
    var photoID : String
    var farm: Int
    var server: String
    var secret: String
    
    var url: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret)_m.jpg")!
    }
    
}

extension FlickrPhoto: Decodable {
    
    enum structKeys: String, CodingKey {
        
        case title = "title"
        case photoID = "id"
        case secret = "secret"
        case server = "server"
        case farm = "farm"
        case date = "datetaken"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: structKeys.self)
        
        let title: String = try container.decode(String.self, forKey: .title)
        let id: String = try container.decode(String.self, forKey: .photoID)
        let secret: String = try container.decode(String.self, forKey: .secret)
        let server: String = try container.decode(String.self, forKey: .server)
        let farm: Int = try container.decode(Int.self, forKey: .farm)
        let date: String = try container.decode(String.self, forKey: .date)

        self.init(title: title, date: date, photoID: id, farm: farm, server: server, secret: secret)
    
    }
}


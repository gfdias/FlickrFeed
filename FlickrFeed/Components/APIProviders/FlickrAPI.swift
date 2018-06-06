import Moya

enum FlickrAPI {
    case feed
}

extension FlickrAPI: TargetType {

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var baseURL: URL {
        return URL(string: "https://api.flickr.com/services/rest")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
       return .get
    }
    
    var parameters: [String: Any]? {
        
        var parameters: [String: Any] = [:]
        
        parameters["method"] = "flickr.photos.search"
        parameters["api_key"] = "c89258d49a948a0c2091406756da99f9"
        parameters["tags"] = "animals, people, city"
        parameters["extras"] = "date_taken, owner_name, tags"
        parameters["per_page"] = "100"
        parameters["page"] = "1"
        parameters["format"] = "json"
        parameters["nojsoncallback"] = "1"
        
        return parameters
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
    }
    
}

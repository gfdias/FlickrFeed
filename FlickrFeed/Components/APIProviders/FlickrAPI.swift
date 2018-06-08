import Moya

enum FlickrAPI {
    case feed
}

enum FlickrError {
    
    case serverError(code: Int)
    case general
    
    var message: String {
        
        switch self {
            
        case let .serverError(code):
            
            switch code {
                
            case 1009:
                return "No Internet connection available"
            case 404:
                return "Service not found"
                
            default:
                return "Something went wrong"
                
            }
            
        case .general:
            return "Something went wrong"

        }
        
    }
    
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
        parameters["content_mode"] = 1
        parameters["media"] = "photos"
        parameters["safe_search"] = 1
        parameters["tags"] = "nature, people, city"
        parameters["extras"] = "date_taken, owner_name, tags"
        parameters["per_page"] = 200
        parameters["page"] = 1
        parameters["format"] = "json"
        parameters["nojsoncallback"] = 1
        
        return parameters
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
    }
    
}

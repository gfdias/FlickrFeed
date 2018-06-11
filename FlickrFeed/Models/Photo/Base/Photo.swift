
import Foundation

protocol Photo {
    
    var title: String { get set }
    var date: String { get set }
    var owner: String { get set }
    var tags: [String] { get set }
    var tagsURL: URL { get }
    var imageURL: URL { get }
    
}

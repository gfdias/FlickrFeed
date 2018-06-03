
import Foundation

protocol Photo {
    
    var title: String { get set }
    var location: String { get set }
    var date: Date { get set }
    var url: URL { get }
    
}

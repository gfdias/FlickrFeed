import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    var viewModel: CategoryViewModel? {
        
        didSet {
            
        }
        
    }
    
}

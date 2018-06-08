import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var viewModel: PhotoViewModel? {
        
        didSet {
            setup()
        }
        
    }
    
    private func setup() {
        
        self.photoImageView.sd_setImage(with: self.viewModel?.url, placeholderImage: #imageLiteral(resourceName: "Placeholder"), completed: nil)
        self.photoImageView.layer.cornerRadius = 10
        self.photoImageView.clipsToBounds = true
        
    }
    
}

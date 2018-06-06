import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var viewModel: DetailViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: DetailViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavigationBar()
        setupContent()
        
    }
    
    private func setupNavigationBar() {
        
        self.title = self.viewModel.photo.title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: nil)
        
    }
    
    private func setupContent() {
        
        self.imageView.sd_setImage(with: self.viewModel.photo.url, placeholderImage: #imageLiteral(resourceName: "Placeholder"), completed: nil)
        self.ownerLabel.text = self.viewModel.photo.owner
        self.dateLabel.text = self.viewModel.photo.date
        
    }

}

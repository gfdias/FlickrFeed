import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareImage))
        
    }
    
    private func setupContent() {
        
        self.imageView.sd_setImage(with: self.viewModel.photo.url, placeholderImage: #imageLiteral(resourceName: "Placeholder"), completed: nil)
        self.ownerLabel.text = self.viewModel.photo.owner
        self.dateLabel.text = self.viewModel.photo.date
        self.imageView.layer.cornerRadius = 12
        self.saveButton.layer.borderWidth = 1
        self.saveButton.layer.cornerRadius = self.saveButton.frame.height/2
        self.saveButton.layer.borderColor = UIColor(displayP3Red: 167/255, green: 72/255, blue: 150/222, alpha: 1.0).cgColor
        
        
    }
    
    @objc
    private func shareImage() {
        
        guard let image = self.imageView.image else { return }
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }

}

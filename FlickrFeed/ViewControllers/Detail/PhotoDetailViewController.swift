import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tagsButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tagsLabel: UILabel!
    
    
    // MARK: - Properties
    
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
        setupImage()
        setupTagsButton()

    }
    
    
    // MARK: - Private
    
    private func setupNavigationBar() {
        
        self.title = self.viewModel.title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareImage))
        
    }
    
    private func setupContent() {
        
        self.imageView.sd_setImage(with: self.viewModel.imageURL, placeholderImage: #imageLiteral(resourceName: "Placeholder"), completed: nil)
        self.ownerLabel.text = self.viewModel.owner
        self.dateLabel.text = self.viewModel.date
        self.tagsLabel.text = self.viewModel.tags.joined(separator: ", ")
        self.tagsLabel.textColor = .cyan
        
    }
    
    private func setupImage() {
        self.imageView.layer.cornerRadius = 12
    }
    
    private func setupTagsButton() {
        
        self.tagsButton.layer.borderWidth = 1
        self.tagsButton.layer.cornerRadius = self.tagsButton.frame.height/2
        self.tagsButton.layer.borderColor = UIColor(displayP3Red: 167/255, green: 72/255, blue: 150/222, alpha: 1.0).cgColor
        
    }
    
    @objc
    private func shareImage() {
        
        guard let image = self.imageView.image else { return }
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func moreTagsButtonPressed(_ sender: Any) {
        UIApplication.shared.open(self.viewModel.tagsURL, options: [:])
    }
    
}

import UIKit

class FeedbackView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    // MARK: - Public
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.initView()
        
    }
    
    private func initView() {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        self.view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        self.view.frame = bounds
        self.view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.addSubview(self.view)
        self.sendSubview(toBack: self.view)
        
    }
    
    func showLoading() {
        
        self.errorView.alpha = 0
        self.loadingIndicator.startAnimating()
        
    }
    
    func hideLoading() {
        self.loadingIndicator.stopAnimating()
    }
    
    func showError(title: String) {
        
        self.errorLabel.text = title
        self.hideLoading()
        self.errorView.alpha = 1
        
    }
    
    
}

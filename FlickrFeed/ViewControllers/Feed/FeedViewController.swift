import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var feedbackView: FeedbackView!
    
    
    // MARK: - Properties
    
    var viewModel: FeedViewModel
    
    
    // MARK: - Lifecycle

    init(viewModel: FeedViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        setupBindings()
        self.viewModel.fetchDataSource()
        
    }
    
    
    // MARK: - Private
    
    private func setupNavigationBar() {
        self.title = "Feed"
    }
    
    private func setupTableView() {
        
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
        self.feedTableView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        self.feedTableView.tableFooterView = UIView()
        
    }
    
    private func setupBindings() {
        
        self.viewModel.loadingSignal = {
            self.feedbackView.showLoading()
        }
        
        self.viewModel.failureSignal = { error in
            self.feedbackView.showError(title: error, retryHandler: self.viewModel.fetchDataSource)
        }
        
        self.viewModel.successSignal = { [weak self] in
            
            self?.feedbackView.hideLoading()
            self?.feedbackView.alpha = 0
            self?.showContent()
            
        }
        
    }
    
    private func showContent() {
        
        self.feedTableView.transform = CGAffineTransform(translationX: 0, y: 300)
        self.feedTableView.reloadData()
        self.animateContentIn()
        
    }
    
    private func animateContentIn() {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.feedTableView.alpha = 1
            self.feedTableView.transform = .identity
            
        }, completion: nil)
        
    }
    
}

extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfCategories()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.viewModel.categoryTitle(at: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection: Int) {
        
        if let headerTitle = view as? UITableViewHeaderFooterView {
            headerTitle.textLabel?.textColor = .white
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        
        cell.viewModel = self.viewModel.categoryViewModel(at: indexPath.section)
        return cell

    }
    
}

extension FeedViewController: UITableViewDelegate { }

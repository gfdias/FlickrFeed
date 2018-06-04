import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var feedbackView: FeedbackView!
    
    
    // MARK: - Properties
    
    var viewModel: FeedViewModel
    
    
    // MARK: - Init
    
    init(viewModel: FeedViewModel) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        
    }
    
    
    // MARK: - Private
    
    private func setupNavigationBar() {
        self.title = "Feed"
    }
    
    private func setupTableView() {
        
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
        self.feedTableView.register(CategoryCell.self, forCellReuseIdentifier: "CategoryCell")
        self.feedTableView.tableFooterView = UIView()
        
    }
    
}

extension FeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
            
        case 0:
            return "Animals"
            
        case 1:
            return "People"
            
        case 2:
            return "Nature"
            
        default:
            return nil
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else {
            return UITableViewCell()
        }
        
        return cell

    }
    
}

extension FeedViewController: UITableViewDelegate { }

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var feedTableView: UITableView!
    
    
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
        
    }
    
    
    // MARK: - Private
    
    private func setupTableView() {
        
        self.feedTableView.dataSource = self
        self.feedTableView.delegate = self
        
    }

}

extension FeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        return cell

    }
    
}

extension FeedViewController: UITableViewDelegate { }

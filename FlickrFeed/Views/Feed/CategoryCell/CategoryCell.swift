import UIKit

class CategoryCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    
    var viewModel: CategoryViewModel? {
        
        didSet {
            setup()
        }
        
    }
    
    
    // MARK: - Private
    
    private func setup() {
        
        self.photoCollectionView.dataSource = self
        self.photoCollectionView.delegate = self
        self.photoCollectionView.register(UINib.init(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        self.photoCollectionView.reloadData()
        
    }
    
}

extension CategoryCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Present Detail
    }
    
}

extension CategoryCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel!.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        return cell
    }
    
}

extension CategoryCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow: CGFloat = 4
        let padding: CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - padding
        let itemHeight = collectionView.bounds.height - (2 * padding)
        
        return CGSize(width: itemWidth, height: itemHeight)
        
    }
    
}


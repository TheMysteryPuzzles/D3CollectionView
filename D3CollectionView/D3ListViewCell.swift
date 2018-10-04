//  Copyright © 2018 TheMysteryPuzzles.


import UIKit

@objc open class D3ListViewCell: UICollectionViewCell {
    
    open var subdataSource: SubCollectionViewDataSource?
    open var subDeleate: SubCollectionViewDelegate!
    
    
    lazy var subCollectionViewFlowLayout: SubCollectionViewFlowLayout = {
        let flowLayout = SubCollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemAlpha = 1
        flowLayout.sideItemScale = 0.9
        flowLayout.spacingMode = SpacingMode.overlap(visibleOffset: 60)
        let cellSize = CGSize(width: 300 , height: 450)
        flowLayout.itemSize = cellSize
        return flowLayout
    }()
    
    lazy private var subCollectionView : UICollectionView = {
      
      let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: subCollectionViewFlowLayout)
     
       return collectionView
    }()
    
    public func addSubCollectionView(index: Int){
        subCollectionView.backgroundColor = UIColor.clear
        subCollectionView.dataSource = self
       
        subCollectionView.decelerationRate = UIScrollViewDecelerationRateFast
         subCollectionView.delegate = self
        subCollectionView.tag = index
       
        self.addSubview(subCollectionView)
    }
  
     public func registerSubCollectionView(_ cellClass: AnyClass? , forCellWithReuseIdentifier identifier: String){
        self.subCollectionView.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(nib: UINib?, forCellWithReuseIdentifier identifier: String){
        self.subCollectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
 
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
}

extension D3ListViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (subdataSource?.collectionView(collectionView, numberOfItemsInSection: section))!
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (subdataSource?.collectionView(collectionView, cellForItemAt: indexPath))!
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      self.subDeleate.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}


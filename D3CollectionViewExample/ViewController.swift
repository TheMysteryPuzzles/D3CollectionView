//
//  ViewController.swift
//  D3CollectionViewExample
//
//  Created by Work on 10/5/18.
//  Copyright © 2018 TheMysteryPuzzles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let reuseSubCollectionViewIdentifier = "SubCollectionViewIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let view = D3List(frame: .zero)
        view.register(ExampleCardCell.self, forCellWithReuseIdentifier: "ExampleCell")
        view.delegate = self
       view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.dataSource = self
        view.delegate = self
        self.view.addSubview(view)
       // let topOffset = self.navigationController?.navigationBar.frame.height
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: self.view.safeTopAnchor),
            view.leadingAnchor.constraint(equalTo: self.view.safeLeadingAnchor),
           view.trailingAnchor.constraint(equalTo: self.view.safeTrailingAnchor),
           view.bottomAnchor.constraint(equalTo: self.view.safeBottomAnchor)
            ])
    }
}

extension ViewController: D3ListDelegate, D3ListDatasource {
    
    func sizeForItem(d3CollectionView: D3ListView, index: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.85)
    }
    
    func d3ListView(_ d3CollectionView: UICollectionView, willDisplay cell: D3ListViewCell, forItemAt indexPath: IndexPath) {
        cell.registerSubCollectionView(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseSubCollectionViewIdentifier)
        cell.subCollectionViewdataSource = self
        cell.subCollectionViewDelegate = self
        cell.addSubCollectionView(index: indexPath.row)
    }
    
    func numberOfItems(inD3List d3List: D3ListView) -> Int {
        return 10
    }
    
    func d3ListView(_ d3CollectionView: D3ListView, cellForItemAt indexPath: IndexPath) -> D3ListViewCell {
        
        let cardCell = d3CollectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ExampleCardCell
        cardCell.backgroundColor = UIColor.black
        cardCell.subCollectionViewFrame = cardCell.bounds
        cardCell.subCollectionViewItemSize = CGSize(width: 250, height: 350)
        return cardCell
    }
}

extension ViewController: SubCollectionViewDataSource, SubCollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print("CollectionView #\(collectionView.tag), Item# \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseSubCollectionViewIdentifier, for: indexPath)
        cell.layer.cornerRadius = 6
        cell.setRandomBackgroundColor()
        cell.layer.masksToBounds = false
        
        return cell
    }
}
    

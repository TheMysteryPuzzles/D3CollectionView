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
        
        let view = D3List(frame: self.view.bounds)
        
        view.register(ExampleCardCell.self, forCellWithReuseIdentifier: "ExampleCell")
        view.delegate = self
        
        
        view.backgroundColor = UIColor.white
        view.dataSource = self
        self.view.addSubview(view)
    }
}

extension ViewController: D3ListDelegate, D3ListDatasource {
    func d3ListView(_ d3CollectionView: UICollectionView, willDisplay cell: D3ListViewCell, forItemAt indexPath: IndexPath) {
        cell.registerSubCollectionView(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseSubCollectionViewIdentifier)
        cell.subdataSource = self
        cell.subDeleate = self
        cell.addSubCollectionView(index: indexPath.row)
    }
    
    func numberOfItems(inD3List d3List: D3ListView) -> Int {
        return 10
    }
    
    func d3ListView(_ d3CollectionView: D3ListView, cellForItemAt indexPath: IndexPath) -> D3ListViewCell {
        
        let cardCell = d3CollectionView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: indexPath) as! ExampleCardCell
        cardCell.setRandomBackgroundColor()
        return cardCell
    }
}

extension ViewController: SubCollectionViewDataSource, SubCollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print("CollectionView #\(collectionView.tag), Item# \(indexPath.item)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseSubCollectionViewIdentifier, for: indexPath)
        cell.layer.cornerRadius = 6
        cell.setRandomBackgroundColor()
        cell.layer.masksToBounds = false
        
        return cell
    }
}
    

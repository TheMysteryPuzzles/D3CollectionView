//
//  D3ListCell.swift
//  D3CollectionViewDebugging
//
//  Created by Work on 9/27/18.
//  Copyright © 2018 Next Level. All rights reserved.
//

import UIKit
import D3CollectionView

class ExampleCardCell: D3ListViewCell {
    

    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
   
    override func layoutSubviews() {
        
        self.layer.cornerRadius = 12
        
        super.layoutSubviews()
    }
}

//
//  ProductCollectionViewCell.swift
//  NaturalHome
//
//  Created by BRI on 12/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import BaseFramework
class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var baseViewProduct: MaterialCard!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func awakeFromNib() {
        setView()
    }
    
    func setView()  {
        self.imageProduct.image = UIImage(named: "product", in: BundleFramework.bundle, compatibleWith: nil)
        self.imageProduct.contentMode = .scaleAspectFill
    }
}

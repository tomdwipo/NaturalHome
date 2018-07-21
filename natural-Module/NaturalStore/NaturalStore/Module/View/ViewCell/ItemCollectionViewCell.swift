//
//  ItemCollectionViewCell.swift
//  NaturalStore
//
//  Created by BRI on 18/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import BaseFramework
class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var nameItem: UILabel!
    @IBOutlet weak var descItem: UILabel!
    @IBOutlet weak var numberOfLike: UILabel!
    @IBOutlet weak var materialCard: MaterialCard!
    
}

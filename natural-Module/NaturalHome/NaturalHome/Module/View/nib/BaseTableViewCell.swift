//
//  BaseTableViewCell.swift
//  NaturalHome
//
//  Created by BRI on 12/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import BaseFramework
class BaseTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionview: UICollectionView!
    var indexProduct = 0
    var totalCell = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func registerCollectionView(){
        self.collectionview.dataSource = self
        self.collectionview.delegate = self
        self.collectionview.reloadData()
    }
    
    func registerCollectionFromNib() {
        self.collectionview.register(UINib(nibName: InitialView.productCell.rawValue, bundle: HomeRouter.bundle), forCellWithReuseIdentifier: InitialView.productCell.rawValue)
    }
    
    func setLayout(index: Int, totalCell: Int){
        self.indexProduct = index
        self.totalCell = totalCell
    }

}

extension BaseTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch self.indexProduct {
        case 0:
            return  2
        default:
            return  self.totalCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.indexProduct {
        case 0:
            self.title.text = "New Products"
            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: InitialView.productCell.rawValue, for: indexPath) as! ProductCollectionViewCell
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            cell.descProduct.text = ""
            cell.productButton.isHidden = true
            return cell
        default:
            self.title.text = "The Recommended"
            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: InitialView.productCell.rawValue, for: indexPath) as! ProductCollectionViewCell
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
              cell.descProduct.text = "All Cotton wool fabric, protein fiber filled, delicate and delicate detail ..."
            cell.productButton.isHidden = false
            return cell
        }
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch self.indexProduct {
        case 0:
            let height : CGFloat
            let width = collectionView.frame.width / 2
            height = self.collectionview.frame.height - 8
            return CGSize(width: width, height: height)
        default:
            let height : CGFloat
            let width = collectionView.frame.width
            height = (self.collectionview.frame.height - 8) / CGFloat(self.totalCell)
            return CGSize(width: width, height: height)
        }
       
        
    }
    
}

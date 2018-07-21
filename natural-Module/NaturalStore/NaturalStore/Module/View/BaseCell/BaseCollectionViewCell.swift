//
//  BaseCollectionViewCell.swift
//  NaturalStore
//
//  Created by BRI on 21/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var collectionview: UICollectionView!
    var cell: Int = 0
    func registerCollectionView(){
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
    }
    
    func registerCollectionCell(bundle: Bundle){
        self.collectionview.register(UINib(nibName: InitialView.designerCell, bundle: bundle), forCellWithReuseIdentifier: InitialView.designerCell)
        self.collectionview.register(UINib(nibName: InitialView.itemCell, bundle: bundle), forCellWithReuseIdentifier: InitialView.itemCell)

    }
    
}
extension BaseCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.cell {
        case 0:
            return 10
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch  self.cell {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InitialView.designerCell, for: indexPath) as! DesignerCollectionViewCell
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InitialView.itemCell, for: indexPath) as! ItemCollectionViewCell
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.cell {
        case 0:
            let height: CGFloat = 200
            let width: CGFloat = self.view.frame.width / 2.9
            return CGSize(width: width, height: height)
        default:
            let height: CGFloat = 200
            let width: CGFloat = self.view.frame.width
            return CGSize(width: width, height: height)
        }
    }
    
}

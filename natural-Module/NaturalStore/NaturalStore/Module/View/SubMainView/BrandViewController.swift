//
//  BrandViewController.swift
//  NaturalStore
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit

class BrandViewController: UIViewController {

    
    @IBOutlet weak var collectionview: UICollectionView!
    class func instantiateFromStoryboard() -> BrandViewController {
        let storyboard = UIStoryboard(name: Storyboard.brand, bundle: StoreRouter.bundle )
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! BrandViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionCell()
        registerCollection()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerCollectionCell()  {
        self.collectionview.register(UINib(nibName: InitialView.baseCell, bundle: self.nibBundle!), forCellWithReuseIdentifier: InitialView.baseCell)
    }
    
    func registerCollection(){
        self.collectionview.delegate = self
        self.collectionview.dataSource = self
        self.collectionview.reloadData()
    }

}

extension BrandViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension BrandViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InitialView.baseCell, for: indexPath) as! BaseCollectionViewCell
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        cell.cell = indexPath.section
        cell.registerCollectionView()
        cell.registerCollectionCell(bundle: self.nibBundle!)
        return cell
    }
}


extension BrandViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let height: CGFloat = 200 
            let width: CGFloat = self.view.frame.width
            return CGSize(width: width, height: height)
        default:
            let height: CGFloat = 220 * 4
            let width: CGFloat = self.view.frame.width
            return CGSize(width: width, height: height)
        }
       
    }
}

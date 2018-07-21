//
//  HomeViewController.swift
//  NaturalHome
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import ParallaxHeader
import BaseFramework
class HomeViewController: UIViewController {
    var presenter: ViewToPresenterProtocol?
    var totalCellRecommended = 10
    let NAVBAR_CHANGE_POINT = -50
    let SEARCHBAR_CHANGE_POINT = -25

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.updateView()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.lt_reset()
    }
   

}

extension HomeViewController {
    func registerTableView(){
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.rowHeight = UITableViewAutomaticDimension
        self.tableview.estimatedRowHeight = 500
        self.tableview.reloadData()
    }
    
    func registerTableViewFromNib() {
        self.tableview.register(UINib(nibName: InitialView.baseCell.rawValue, bundle: self.nibBundle), forCellReuseIdentifier: InitialView.baseCell.rawValue)
    }
    
    func setParalaxHeader() {
        self.tableview.parallaxHeader.view = ParralaxHeaderView.instantiateFromNib(bundle: self.nibBundle!)
        self.tableview.parallaxHeader.height = self.view.frame.height/4
        self.tableview.parallaxHeader.minimumHeight = 0
        self.tableview.parallaxHeader.mode = .topFill
    }
    
    func setNavigation() {
        self.navigationController!.navigationBar.lt_setBackgroundColor(backgroundColor: UIColor.red)
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true

    }
    
    func setSearchBar(transparent: Bool){
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 70, height: 20))
        searchBar.placeholder = "Search The Product"
        if transparent {
            searchBar.setTextColor(color: UIColor.white)
            searchBar.changeSearchBarColor(color: UIColor(red: 155/256, green: 162/256, blue: 174/256, alpha: 0.37))
            searchBar.setPlaceholderTextColor(color: UIColor.white)
            searchBar.setMagnifyingGlassColorTo(color: UIColor.white)
            searchBar.setclearImageColor(color: UIColor.white)
            self.navigationController!.view.backgroundColor = .clear
        }else{
            searchBar.setTextColor(color: UIColor.darkGray)
             searchBar.changeSearchBarColor(color: UIColor(red: 246/256, green: 246/256, blue: 253/256, alpha: 1.0))
            searchBar.setPlaceholderTextColor(color: UIColor.darkGray)
            searchBar.setMagnifyingGlassColorTo(color: UIColor.darkGray)
            searchBar.setclearImageColor(color: UIColor.darkGray)
            self.navigationController!.view.backgroundColor = .gray

        }
       
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationController!.navigationBar.topItem?.leftBarButtonItem = leftNavBarButton
    }
    
    func setChatImage(transparent: Bool){
        let button = UIButton(type: .custom)
        if transparent {
            button.setImage(UIImage(named: "chat-white", in: self.nibBundle, compatibleWith: nil),for: UIControlState.normal)
        }else{
            button.setImage(UIImage(named: "chat-gray", in: self.nibBundle, compatibleWith: nil),for: UIControlState.normal)

        }
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30) 
        let barButton = UIBarButtonItem(customView: button)
        self.navigationController!.navigationBar.topItem?.rightBarButtonItem = barButton
    }
}

extension HomeViewController: PresenterToViewProtocol {
    func viewUpdate() {
        setNavigation()
        registerTableView()
        registerTableViewFromNib()
        setParalaxHeader()
        setSearchBar(transparent: true)
        setChatImage(transparent: true)
    }
    
    
    func showError(message: String) {
        
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: InitialView.baseCell.rawValue, for: indexPath) as! BaseTableViewCell
        cell.registerCollectionView()
        cell.registerCollectionFromNib()
        cell.setLayout(index: indexPath.row,totalCell: self.totalCellRecommended)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let color = UIColor.white
        let offsetY: CGFloat = scrollView.contentOffset.y
        if offsetY > CGFloat(NAVBAR_CHANGE_POINT) {
            let alpha = min(1, 1 - ((CGFloat(NAVBAR_CHANGE_POINT + 64) - offsetY) / 64))
            self.navigationController!.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(alpha))
            if offsetY > CGFloat(SEARCHBAR_CHANGE_POINT) {
                setSearchBar(transparent: false)
                setChatImage(transparent: false)
            }
        } else {
            setSearchBar(transparent: true)
            setChatImage(transparent: true)
            self.navigationController!.navigationBar.lt_setBackgroundColor(backgroundColor: color.withAlphaComponent(0))
        }
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
//        let offsetY: CGFloat = scrollView.contentOffset.y
//        if offsetY > 0 {
//            if offsetY >= 44 {
//                setNavigationBarTransformProgress(1)
//            } else {
//                setNavigationBarTransformProgress(offsetY / 44)
//            }
//        } else {
//            setNavigationBarTransformProgress(0)
//            self.navigationController!.navigationBar.backIndicatorImage = UIImage()
//        }
//
//
//    }

    
    func setNavigationBarTransformProgress(_ progress: CGFloat) {
        
        self.navigationController!.navigationBar.lt_setTranslationY(translationY: (-44 * progress))
        self.navigationController!.navigationBar.lt_setElementsAlpha(alpha: (1 - progress))
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            let height : CGFloat
            height =  self.view.frame.height / 5.5
            return CGFloat(height)
        default:
            let totalCell: CGFloat = CGFloat(self.totalCellRecommended)
            let height : CGFloat
            height =  (self.view.frame.height / 5.8) * totalCell
            return CGFloat(height)
        }
       
        
    }
    
}

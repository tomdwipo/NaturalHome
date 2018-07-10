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
        self.tableview.register(UINib(nibName: InitialView.headerCell.rawValue, bundle: self.nibBundle), forCellReuseIdentifier: InitialView.headerCell.rawValue)
    }
    
    func setParalaxHeader() {
        self.tableview.parallaxHeader.view = ParralaxHeaderView.instantiateFromNib(bundle: self.nibBundle!)
        self.tableview.parallaxHeader.height = self.view.frame.height/4
        self.tableview.parallaxHeader.minimumHeight = 0
        self.tableview.parallaxHeader.mode = .topFill
    }
    
    func setNavigation(transparent: Bool) {
        if transparent {
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController!.navigationBar.shadowImage = UIImage()
            self.navigationController!.navigationBar.isTranslucent = true
        }else{
            self.navigationController!.navigationBar.setBackgroundImage(nil, for: .default)
            self.navigationController!.navigationBar.shadowImage = nil
            self.navigationController!.navigationBar.isTranslucent = false
        }
       
    }
    
    func setSearchBar(){
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        searchBar.placeholder = "Search The Product"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationController!.navigationBar.topItem?.leftBarButtonItem = leftNavBarButton
    }
}

extension HomeViewController: PresenterToViewProtocol {
    func viewUpdate() {
        setNavigation(transparent: true)
        registerTableView()
        registerTableViewFromNib()
        setParalaxHeader()
        setSearchBar()
    }
    
    
    func showError(message: String) {
        
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: InitialView.headerCell.rawValue, for: indexPath) as! HeaderTableViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 0 {
            setNavigation(transparent: false)
        }else{
            setNavigation(transparent: true)
        }
    }
    
    
}

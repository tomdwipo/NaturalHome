//
//  ViewController.swift
//  NaturalHomeApps
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import NaturalHome
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     //   setSearchBar()
        HomeRouter.createModule(self)
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    func setSearchBar(){
        let searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        searchBar.placeholder = "Search The Product"
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


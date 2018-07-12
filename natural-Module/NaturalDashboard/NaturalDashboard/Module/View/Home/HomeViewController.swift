//
//  HomeViewController.swift
//  NaturalDashboard
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import BaseFramework
import NaturalHome
class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       HomeRouter.createModule(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

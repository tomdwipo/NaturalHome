//
//  ViewController.swift
//  NaturalHome
//
//  Created by BRI on 09/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import UIKit
import NaturalDashboard
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardRoute.createModule(self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


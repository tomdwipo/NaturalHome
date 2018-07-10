//
//  DashboardRoute.swift
//  NaturalDashboard
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation
public class DashboardRoute {
    public static func createModule(_ caller: UIViewController)  {
        let vc = mainstoryboard.instantiateInitialViewController()!
        caller.addChildViewController(vc)
        caller.view.addSubview(vc.view)
        vc.didMove(toParentViewController: caller)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "Dashboard", bundle: bundle)
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: HomeViewController.self)
        let bundleURL = podBundle.url(forResource:"NaturalDashboard", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}

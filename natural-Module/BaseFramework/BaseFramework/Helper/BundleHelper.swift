//
//  BundleHelper.swift
//  BaseFramework
//
//  Created by BRI on 09/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation
public struct BundleFramework {
    static var bundle:Bundle {
        let podBundle = Bundle(for: BaseViewController.self)
        let bundleURL = podBundle.url(forResource:"BaseFramework", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}

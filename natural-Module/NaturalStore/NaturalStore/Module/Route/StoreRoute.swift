//
//  StoreRoute.swift
//  NaturalStore
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation
public class StoreRouter: PresenterToRouterProtocol {
    public static func createModule(_ caller: UIViewController)  {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "StoreViewController") as! StoreViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = StorePresenter()
        let interactor: PresenterToInteractorProtocol = StoreInteractor()
        let router: PresenterToRouterProtocol = StoreRouter()
        view.presenter = presenter
        presenter.view = view;
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        caller.addChildViewController(view)
        caller.view.addSubview(view.view)
        view.didMove(toParentViewController: caller)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "Store", bundle: bundle)
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: StoreViewController.self)
        let bundleURL = podBundle.url(forResource:"NaturalStore", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}

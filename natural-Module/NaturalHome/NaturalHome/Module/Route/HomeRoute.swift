//
//  HomeRoute.swift
//  NaturalHome
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation
public class HomeRouter: PresenterToRouterProtocol {
    public static func createModule(_ caller: UIViewController)  {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router: PresenterToRouterProtocol = HomeRouter()
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
        return UIStoryboard(name: "Home", bundle: bundle)
    }
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: HomeViewController.self)
        let bundleURL = podBundle.url(forResource:"NaturalHome", withExtension: "bundle")
        if bundleURL == nil {
            return podBundle
        }else{
            return Bundle(url: bundleURL!)!
        }
    }
}

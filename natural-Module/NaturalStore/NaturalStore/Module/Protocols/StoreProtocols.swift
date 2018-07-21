//
//  StoreProtocols.swift
//  NaturalStore
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation
import UIKit
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToViewProtocol: class {
    func viewUpdate()
    func showError(message: String)
}

protocol PresenterToRouterProtocol: class {
    static func createModule(_ caller: UIViewController)
    
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchView()
}

protocol InteractorToPresenterProtocol: class {
    func dataFetched(message:String)
    func viewFetched()
    func dataFetchedFailed(message: String)
}

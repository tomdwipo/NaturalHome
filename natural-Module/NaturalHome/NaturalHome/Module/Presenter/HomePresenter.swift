//
//  HomePresenter.swift
//  NaturalHome
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation

class HomePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        self.interactor?.fetchView()
        
    }
    
}

extension HomePresenter: InteractorToPresenterProtocol {
    func viewFetched() {
        self.view?.viewUpdate()
    }
    
    func dataFetched(message: String) {
    }
    
    func dataFetchedFailed(message: String) {
        self.view?.showError(message: message)
    }
}

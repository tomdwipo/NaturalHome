//
//  StoreInteractor.swift
//  NaturalStore
//
//  Created by BRI on 13/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation

class StoreInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchView() {
        self.presenter?.viewFetched()
    }
    
    
}

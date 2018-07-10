//
//  HomeInteractor.swift
//  NaturalHome
//
//  Created by BRI on 10/07/18.
//  Copyright © 2018 Tommy. All rights reserved.
//

import Foundation

class HomeInteractor: PresenterToInteractorProtocol {
  
    var presenter: InteractorToPresenterProtocol?
    
    func fetchView() {
        self.presenter?.viewFetched()
    }
    
    
    
    
    
    
}

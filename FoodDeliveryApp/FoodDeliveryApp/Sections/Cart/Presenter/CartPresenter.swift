//
//  CartPresenter.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//  
//

import Foundation

class CartPresenter {

    // MARK: Properties

    weak var view: CartView?
    var router: CartWireframe?
    var interactor: CartUseCase?
}

extension CartPresenter: CartPresentation {
    // TODO: implement presentation methods
}

extension CartPresenter: CartUseCaseOutput {
    // TODO: implement interactor output methods
}

//
//  CartContract.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//  
//

import Foundation

protocol CartView: ViperView {
    // TODO: Declare view methods
    func onSetTableRowModels(rowModels : [BaseRowModel])
}

protocol CartPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func getTableRowModels(fromData products: [Product])
}

protocol CartUseCase: ViperInteractor {
    // TODO: Declare use case methods
}

protocol CartUseCaseOutput: class {
    // TODO: Declare interactor output methods
}

protocol CartWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}

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

    func getTableRowModels(fromData products: [Product]) {
        var rowModels = [BaseRowModel]()
        var totalPrice = 0
        for product in products {
            rowModels.append(CartProductTableViewCell.rowModel(model: product))
            totalPrice += product.price ?? 0
        }
        rowModels.append(CartTotalTableViewCell.rowModel(totalPrice: totalPrice, currency: "usd"))
        view?.onSetTableRowModels(rowModels: rowModels)
    }
}

extension CartPresenter: CartUseCaseOutput {
    // TODO: implement interactor output methods
}

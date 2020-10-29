//
//  CartRouter.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//  
//

import Foundation
import UIKit

class CartRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> CartViewController {
        let viewController = CartViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = CartPresenter()
        let router = CartRouter()
        let interactor = CartInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension CartRouter: CartWireframe {
    // TODO: Implement wireframe methods
}

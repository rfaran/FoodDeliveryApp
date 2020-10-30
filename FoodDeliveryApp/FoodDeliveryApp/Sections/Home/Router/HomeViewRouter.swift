//
//  HomeViewRouter.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import UIKit

class HomeViewRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> HomeViewController {
        let viewController = HomeViewController.instantiate(fromAppStoryboard: .Main)
        let presenter = HomeViewPresenter()
        let router = HomeViewRouter()
        let interactor = HomeViewInteractor()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter

        return viewController
    }
}

extension HomeViewRouter: HomeViewWireframe {
    // TODO: Implement wireframe methods
    func navigateToCartVC(cartItems: [Product]) {
        let cartViewController = CartRouter.setupModule(withCartItems: cartItems) 
        view?.navigationController?.present(cartViewController, animated: true, completion: nil)
    }
}

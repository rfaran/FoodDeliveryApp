//
//  HomeViewContract.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import UIKit

protocol HomeViewView: ViperView {
    // TODO: Declare view methods
    func fetchedProducts(products: Products)
}

protocol HomeViewPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func setupOnboardingSlides(on sliderScrollview: UIScrollView)
    func addCartButton(on cartView: UIView)
    func loadProducts()
}

protocol HomeViewUseCase: ViperInteractor {
    // TODO: Declare use case methods
    func loadProducts()
}

protocol HomeViewUseCaseOutput: class {
    // TODO: Declare interactor output methods
    func fetchedProducts(products: Products)
}

protocol HomeViewWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}

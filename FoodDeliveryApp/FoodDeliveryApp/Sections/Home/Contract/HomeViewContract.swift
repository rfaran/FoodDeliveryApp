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
}

protocol HomeViewPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func setupOnboardingSlides(on sliderScrollview: UIScrollView)
}

protocol HomeViewUseCase: ViperInteractor {
    // TODO: Declare use case methods
}

protocol HomeViewUseCaseOutput: class {
    // TODO: Declare interactor output methods
}

protocol HomeViewWireframe: ViperRouter {
    // TODO: Declare wireframe methods
}

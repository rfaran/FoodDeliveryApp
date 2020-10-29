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
    func fetchedBanners(bannerResponseObj: Banners)
    func fetchedProducts(productsResponseObj: Products)
    func onSetTableRowModels(rowModels : [BaseRowModel])
}

protocol HomeViewPresentation: ViperPresenter {
    // TODO: Declare presentation methods
    func loadData()
    func setupCartView(cartView: UIView)
    func setupOnboardingSlides(on sliderScrollview: UIScrollView, withBannerResponseObj bannerResponseObj: Banners)
    func getTableRowModels(fromData: [Product])
    func cartButtonTapped()
}

protocol HomeViewUseCase: ViperInteractor {
    // TODO: Declare use case methods
    func loadProducts()
    func loadBanner()
}

protocol HomeViewUseCaseOutput: class {
    // TODO: Declare interactor output methods
    func fetchedProducts(productsResponseObj: Products)
    func fetchedBanner(bannerResponseObj: Banners)
}

protocol HomeViewWireframe: ViperRouter {
    // TODO: Declare wireframe methods
    func navigateToCartVC(cartItems: [Product])
}

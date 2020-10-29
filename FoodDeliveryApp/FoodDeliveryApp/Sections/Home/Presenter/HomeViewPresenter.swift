//
//  HomeViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import UIKit
import BadgeControl
import Kingfisher

class HomeViewPresenter {

    // MARK: Properties

    weak var view: HomeViewView?
    var router: HomeViewWireframe?
    var interactor: HomeViewUseCase?
    var badge: BadgeController?
    var cartItems = [Product]()
}

extension HomeViewPresenter: HomeViewPresentation {
    
    func loadData() {
        loadBanner()
        loadProducts()
    }
    
    private func loadBanner() {
        // Load banner data from network.
        interactor?.loadBanner()
    }
    
    private func loadProducts() {
        // Load data from network
        interactor?.loadProducts()
    }
    
    func setupCartView(cartView: UIView) {
        badge = BadgeController(for: cartView)
        badge?.centerPosition = .custom(x: Double(cartView.frame.width), y: 16)
        badge?.addOrReplaceCurrent(animated: true)
        badge?.badgeTextFont = UIFont.systemFont(ofSize: 24)
        badge?.badgeBackgroundColor = UIColor.lightGray
        badge?.badgeHeight = 40
        updateCart()
    }
    
    func setupOnboardingSlides(on sliderScrollview: UIScrollView, withBannerResponseObj bannerResponseObj: Banners) {

        if let bannersArray = bannerResponseObj.banners, bannersArray.count > 0 {
            var slides:[Slide] = [];
            for bannerUrlStr in bannersArray {
                let slide: Slide = UIView.fromNib()
                slide.sliderImageView.kf.setImage(with: URL(string: bannerUrlStr))
                slides.append(slide)
            }
            
            sliderScrollview.contentSize = CGSize(width: sliderScrollview.frame.width * CGFloat(slides.count), height: sliderScrollview.frame.height)
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: sliderScrollview.frame.width * CGFloat(i), y: 0, width: sliderScrollview.frame.width, height: sliderScrollview.frame.height)
                sliderScrollview.addSubview(slides[i])
            }
        }
    }

    
    func getTableRowModels(fromData products: [Product]) {
        var rowModels = [BaseRowModel]()
        
        for product in products {
            rowModels.append(ProductTableViewCell.rowModel(model: product, delegate: self))
        }
        view?.onSetTableRowModels(rowModels: rowModels)
    }
    
    private func updateCart() {
        if cartItems.count > 0 {
            badge?.addOrReplaceCurrent(with: "\(cartItems.count)", animated: true)
        } else {
            badge?.remove(animated: true)
        }
    }
    
    func cartButtonTapped() {
        router?.navigateToCartVC(cartItems: cartItems)
    }
}

extension HomeViewPresenter: HomeViewUseCaseOutput {
    func fetchedProducts(productsResponseObj: Products) {
        view?.fetchedProducts(productsResponseObj: productsResponseObj)
    }
    
    func fetchedBanner(bannerResponseObj: Banners) {
        view?.fetchedBanners(bannerResponseObj: bannerResponseObj)
    }
}

extension HomeViewPresenter: ProductTableViewCellDelegate {
    func addToCart(product: Product) {
        
        // For now we are storing cart items locally on this presenter, actual implementation would ofcourse vary.
        cartItems.append(product)
        updateCart()
    }
}

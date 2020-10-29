//
//  HomeViewInteractor.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import Moya

class HomeViewInteractor {
    // MARK: Properties
    weak var output: HomeViewUseCaseOutput?
    let mockAPIProvider = MoyaProvider<APIServices>(stubClosure: MoyaProvider.immediatelyStub)
}

extension HomeViewInteractor: HomeViewUseCase {
    // TODO: Implement use case methods
    
    func loadProducts() {
        mockAPIProvider.request(.fetchProducts) { result in
            switch result {
                case let .success(moyaResponse):
                    let products = try? (JSONDecoder().decode(Products.self, from: moyaResponse.data))
                    self.output?.fetchedProducts(productsResponseObj: products!)
                case let .failure(error):
                    print(error)
            }
        }
    }
    
    func loadBanner() {
        mockAPIProvider.request(.fetchBanners) { result in
            switch result {
                case let .success(moyaResponse):
                    let banners = try? (JSONDecoder().decode(Banners.self, from: moyaResponse.data))
                    self.output?.fetchedBanner(bannerResponseObj: banners!)
                case let .failure(error):
                    print(error)
            }
        }
    }
}

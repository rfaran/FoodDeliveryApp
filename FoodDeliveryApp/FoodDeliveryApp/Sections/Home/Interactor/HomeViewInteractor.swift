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
                    self.output?.fetchedProducts(products: products!)
                case let .failure(error):
                    print(error)
            }
        }

    }
}

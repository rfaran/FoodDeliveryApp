//
//  APIServices.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//

import Foundation
import Moya

enum APIServices {
    case fetchProducts
}

extension APIServices: TargetType {
    
    var baseURL: URL { return URL(string: "https://api.myservice.com")! }
    
    var path: String {
        switch self {
        case .fetchProducts:
            return "/products/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchProducts:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .fetchProducts:
            return .requestPlain
        }
    }

    var sampleData: Data {
        switch self {
        case .fetchProducts:
            return "{\"data\":[{\"productCategory\":\"Pizza\",\"products\":[{\"id\":1,\"productName\":\"Deluxe\",\"productDetail\":\"Product pizza detail will go here\",\"productWeight\":\"150 grams, 35 cm\",\"price\":46,\"productCurrency\":\"USD\"},{\"id\":2,\"productName\":\"Deluxe 2\",\"productDetail\":\"Product pizza detail will go here\",\"productWeight\":\"150 grams, 35 cm\",\"price\":56,\"productCurrency\":\"USD\"},{\"id\":3,\"productName\":\"Deluxe 3\",\"productDetail\":\"Product pizza detail will go here\",\"productWeight\":\"150 grams, 35 cm\",\"price\":66,\"productCurrency\":\"USD\"}]},{\"productCategory\":\"Sushi\",\"products\":[{\"id\":1,\"productName\":\"California\",\"productDetail\":\"Product sushi detail will go here\",\"productWeight\":\"100 grams, 35 cm\",\"price\":36,\"productCurrency\":\"USD\"},{\"id\":2,\"productName\":\"California 2\",\"productDetail\":\"Product sushi detail will go here\",\"productWeight\":\"90 grams, 35 cm\",\"price\":26,\"productCurrency\":\"USD\"},{\"id\":3,\"productName\":\"California 3\",\"productDetail\":\"Product sushi detail will go here\",\"productWeight\":\"80 grams, 35 cm\",\"price\":79,\"productCurrency\":\"USD\"}]}]}".utf8Encoded
        }
    }
        
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}




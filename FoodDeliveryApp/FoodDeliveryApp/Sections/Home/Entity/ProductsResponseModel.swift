//
//  Products.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//

import Foundation

struct Products : Codable{
    var data : [ProductsData]?
}

struct ProductsData : Codable {
    var productCategory : String?
    var products : [Product]?
    
}

struct Product : Codable{
    var id : Int?
    var price : Int?
    var productCurrency : String?
    var productDetail : String?
    var productName : String?
    var productWeight : String?
    var productImage : String?
}

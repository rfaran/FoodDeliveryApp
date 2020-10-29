//
//  CartViewController.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//  
//

import Foundation
import UIKit

class CartViewController: BaseViewController {

    // MARK: Properties

    var presenter: CartPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CartViewController: CartView {
    // TODO: implement view output methods
}

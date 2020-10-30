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
    @IBOutlet weak var cartTableView: UITableView!
    var cartItems: [Product]?
    var presenter: CartPresentation?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getTableRowModels(fromData: cartItems!)
    }
}

extension CartViewController: CartView {
    func onSetTableRowModels(rowModels: [BaseRowModel]) {
        tableViewItems = rowModels
        cartTableView.reloadData()
    }
}

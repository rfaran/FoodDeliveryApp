//
//  CartTotalTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//

import UIKit

class CartTotalTableViewCell: BaseTableViewCell {

    @IBOutlet weak var totalPriceLbl : UILabel!
            
    override func updateCell(rowModel: BaseRowModel) {
        if let productPrice = rowModel.rowValue as? String  {
            self.totalPriceLbl.text = productPrice
        }
    }
    
    class func rowModel(totalPrice: Int, currency: String) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = String(describing: CartTotalTableViewCell.self)
        rowModel.rowValue = "\(totalPrice) \(currency)"
        return rowModel
    }
}

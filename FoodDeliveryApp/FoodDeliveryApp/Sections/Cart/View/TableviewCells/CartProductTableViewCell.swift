//
//  CartProductTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 30/10/2020.
//

import UIKit

class CartProductTableViewCell: BaseTableViewCell {

    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var productTitleLbl : UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
            
    override func updateCell(rowModel: BaseRowModel) {
        if let productModel = rowModel.rowValue as? Product  {
            self.productTitleLbl.text = productModel.productName
            self.productPriceLbl.text = "\(productModel.price!) \(productModel.productCurrency!)"
            let url = URL(string: productModel.productImage ?? "")
            productImageView.kf.setImage(with: url)
            delegate = rowModel.delegate
        }
    }
    
    class func rowModel(model: Product) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = String(describing: CartProductTableViewCell.self)
        rowModel.rowValue = model
        return rowModel
    }
}

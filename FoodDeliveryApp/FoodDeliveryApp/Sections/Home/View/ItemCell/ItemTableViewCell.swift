//
//  ItemTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 29/10/2020.
//

import UIKit
import Kingfisher

protocol ItemTableViewCellDelegate {
    func addToCart(product: Product)
}

class ProductTableViewCell: BaseTableViewCell {

    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var productTitleLbl : UILabel!
    @IBOutlet weak var productDetailLbl : UILabel!
    @IBOutlet weak var productWeightLbl : UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var priceBtn: UIButton!
        
    var product: Product?
    
    override func updateCell(rowModel: BaseRowModel) {
        if let productModel = rowModel.rowValue as? Product  {
            product = productModel
            self.productTitleLbl.text = product!.productName
            self.productDetailLbl.text = product!.productDetail
            self.productWeightLbl.text = product!.productWeight
            let priceText = "\(product!.price!) \(product!.productCurrency!)"
            self.priceBtn.setTitle(priceText, for: .normal)
            let url = URL(string: product!.productImage ?? "")
            productImageView.kf.setImage(with: url)
            delegate = rowModel.delegate
        }
    }
    
    class func rowModel(model: Product, delegate: ItemTableViewCellDelegate) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "ItemTableViewCell"
        rowModel.rowValue = model
        rowModel.delegate = delegate as AnyObject
        return rowModel
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        (delegate as? ItemTableViewCellDelegate)?.addToCart(product: product!)
    }
}

//
//  ItemTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 29/10/2020.
//

import UIKit
import Kingfisher

class ItemTableViewCell: BaseTableViewCell {

    @IBOutlet weak var productImageView : UIImageView!
    @IBOutlet weak var productTitleLbl : UILabel!
    @IBOutlet weak var productDetailLbl : UILabel!
    @IBOutlet weak var productWeightLbl : UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var priceBtn: UIButton!
    
    override func updateCell(rowModel: BaseRowModel) {
        if let rowModel = rowModel.rowValue as? Product  {
            self.productTitleLbl.text = rowModel.productName
            self.productDetailLbl.text = rowModel.productDetail
            self.productWeightLbl.text = rowModel.productWeight
            let priceText = "\(rowModel.price!) \(rowModel.productCurrency!)"
            self.priceBtn.setTitle(priceText, for: .normal)
            
            
            let url = URL(string: rowModel.productImage ?? "")
            productImageView.kf.setImage(with: url)
            
        }
    }
    
    class func rowModel(model: Product) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "ItemTableViewCell"
        rowModel.rowValue = model
        return rowModel
    }
    
    @IBAction func addToCartButtonTapped(_ sender: Any) {
        
    }
}

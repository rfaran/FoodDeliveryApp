//
//  BaseTableViewCell.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    weak var delegate: AnyObject?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func updateCell(rowModel: BaseRowModel) {
        preconditionFailure("You have to override updateCell")
    }
}

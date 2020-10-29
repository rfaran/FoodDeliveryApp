//
//  DynamicHeightTableView.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 29/10/2020.
//

import UIKit

class DynamicHeightTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}

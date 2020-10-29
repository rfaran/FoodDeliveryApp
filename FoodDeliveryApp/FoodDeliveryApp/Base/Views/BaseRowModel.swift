//
//  BaseRowModel.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//

import UIKit

class BaseRowModel: NSObject {
    var rowCellIdentifier = ""
    var rowValue: Any?
    var delegate: AnyObject?
    var rowHeight: CGFloat = UITableView.automaticDimension
}

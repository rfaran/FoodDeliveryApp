//
//  BaseViewController.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//

import UIKit

class BaseViewController: UIViewController {

    var tableViewItems = [BaseRowModel]()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    func setupAppearance() {}
}

extension BaseViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = tableViewItems[indexPath.row]
        return item.rowHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableViewItems[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: item.rowCellIdentifier) as? BaseTableViewCell {
            cell.updateCell(rowModel: item)
            cell.delegate = item.delegate
            return cell
        }
        return UITableViewCell()
    }
}

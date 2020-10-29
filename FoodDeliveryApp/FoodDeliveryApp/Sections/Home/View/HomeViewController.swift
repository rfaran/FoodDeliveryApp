//
//  HomeViewViewController.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var sliderScrollview: UIScrollView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    @IBOutlet weak var cartView: UIView!
    
    // MARK: Properties

    var presenter: HomeViewPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsTableView.register(UINib(nibName: String(describing: ItemTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ItemTableViewCell.self))
        
        presenter?.loadProducts()
        presenter?.addCartButton(on: cartView)
        presenter?.setupOnboardingSlides(on: sliderScrollview)
        sliderScrollview.delegate = self        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension HomeViewController: HomeViewView {
    func fetchedProducts(products: Products) {
        if let data = products.data, data.count > 0 {
            let selectedIndex = 0
            if let products = data[selectedIndex].products {
                // we do have data, now asks for presented to generate table view items for selected index.
                presenter?.getTableRowModels(fromData: products)
            }
        }
    }
    
    func onSetTableRowModels(rowModels: [BaseRowModel]) {
        tableViewItems = rowModels
        productsTableView.reloadData()
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/sliderScrollview.frame.width)
        sliderPageControl.currentPage = Int(pageIndex)
    }
}


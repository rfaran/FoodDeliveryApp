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

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var sliderScrollview: UIScrollView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    @IBOutlet weak var cartView: UIView!
    
    // MARK: Properties

    var presenter: HomeViewPresentation?
    var productsResponseObj: Products?
    var selectedCategoryIndex = 0
    var animationStyle: UITableView.RowAnimation = .automatic
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registering product table view cell
        productsTableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        
        // Setting up view and loading data
        presenter?.loadData()        
        presenter?.setupCartView(cartView: cartView)
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
    
    func reloadProducts() {
        // Reloading the view based on user selection.
        categoryCollectionView.reloadData()
        if let data = productsResponseObj?.data, data.count > 0 {
            if let products = data[selectedCategoryIndex].products {
                presenter?.getTableRowModels(fromData: products)
            }
        }
    }
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        presenter?.cartButtonTapped()
    }
}

extension HomeViewController: HomeViewView {
    
    func fetchedBanners(bannerResponseObj: Banners) {
        presenter?.setupOnboardingSlides(on: sliderScrollview, withBannerResponseObj: bannerResponseObj)
    }
    
    func fetchedProducts(productsResponseObj: Products) {
        self.productsResponseObj = productsResponseObj
        reloadProducts()
    }
        
    func onSetTableRowModels(rowModels: [BaseRowModel]) {
        tableViewItems = rowModels
        productsTableView.reloadSections(IndexSet(integer: 0), with: animationStyle)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/sliderScrollview.frame.width)
        sliderPageControl.currentPage = Int(pageIndex)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // This collection view is for navigation style "Outdated Windows phone navigation tiles"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsResponseObj?.data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath as IndexPath) as! CategoryCollectionViewCell
        cell.titleLbl.text = productsResponseObj?.data?[indexPath.item].productCategory
        
        cell.titleLbl.textColor = indexPath.item == selectedCategoryIndex ? .darkGray : .lightGray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedCategoryIndex != indexPath.item {
            animationStyle = selectedCategoryIndex < indexPath.item ? UITableView.RowAnimation.left: UITableView.RowAnimation.right
            selectedCategoryIndex = indexPath.item
            reloadProducts()
        }
    }
}


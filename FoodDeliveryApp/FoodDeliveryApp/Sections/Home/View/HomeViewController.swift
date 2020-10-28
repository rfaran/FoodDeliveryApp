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

    @IBOutlet weak var sliderScrollview: UIScrollView!
    @IBOutlet weak var sliderPageControl: UIPageControl!

    // MARK: Properties

    var presenter: HomeViewPresentation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
    // TODO: implement view output methods
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/sliderScrollview.frame.width)
        sliderPageControl.currentPage = Int(pageIndex)
    }
}


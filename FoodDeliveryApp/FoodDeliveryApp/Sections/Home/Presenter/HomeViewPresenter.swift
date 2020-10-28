//
//  HomeViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Faran Rasheed on 28/10/2020.
//  
//

import Foundation
import UIKit

class HomeViewPresenter {

    // MARK: Properties

    weak var view: HomeViewView?
    var router: HomeViewWireframe?
    var interactor: HomeViewUseCase?
}

extension HomeViewPresenter: HomeViewPresentation {
    func setupOnboardingSlides(on sliderScrollview: UIScrollView){
        
        // hardcoded sldier for three images for now        
        var slides:[Slide] = [];
        for i in 1...3 {
            let slide: Slide = UIView.fromNib()
            slide.sliderImageView.image = UIImage(named: "ic_onboarding_\(i)")
            slides.append(slide)
        }
        
        sliderScrollview.contentSize = CGSize(width: sliderScrollview.frame.width * CGFloat(slides.count), height: sliderScrollview.frame.height)
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: sliderScrollview.frame.width * CGFloat(i), y: 0, width: sliderScrollview.frame.width, height: sliderScrollview.frame.height)
            sliderScrollview.addSubview(slides[i])
        }
    }
}

extension HomeViewPresenter: HomeViewUseCaseOutput {
    // TODO: implement interactor output methods
}

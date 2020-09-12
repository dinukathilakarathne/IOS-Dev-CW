//
//  AdviceViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 9/11/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class AdviceViewController: UIViewController {
    
    var timer : Timer?
    
    var slides : [UIImage] = []
    var slideNumber = 0

    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.notifications.isHidden = true
            navigationBar.title.text = L10n.healthAdvice
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageNumberLabel: UILabel!{
        didSet{
            imageNumberLabel.font = FontFamily.Abel.regular.font(size: 30)
            imageNumberLabel.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet weak var nextButton: ImageButton!{
        didSet{
            nextButton.button.addTarget(self, action: #selector(nextSlide), for: .touchUpInside)
            nextButton.button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            nextButton.button.tintColor = Asset.backgroundColor.color
        }
    }
    
    @IBOutlet weak var previousButton: ImageButton!{
        didSet{
            previousButton.button.addTarget(self, action: #selector(prevSlide), for: .touchUpInside)
            previousButton.button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
            previousButton.button.tintColor = Asset.backgroundColor.color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSlides()
        setImageNumber()
        //timer to increment slide count
        timer = Timer.scheduledTimer(withTimeInterval: 8, repeats: true, block: { (timer) in
            self.slideNumber += 1
            self.setNewSlide()
            })
    }
    
    //invalidating the timer
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    @objc func nextSlide(){
        slideNumber += 1
        setNewSlide()
    }
    
    @objc func prevSlide(){
        slideNumber -= 1
        setNewSlide()
    }
    
    func setNewSlide(){
        if slideNumber > slides.count - 1{
            slideNumber = 0
        }else if slideNumber < 0{
            slideNumber = slides.count - 1
        }
        imageView.image = slides[slideNumber]
        setImageNumber()
    }
    
    func setImageNumber(){
        imageNumberLabel.text = "\(slideNumber + 1)/\(slides.count)"
    }
    
    func setSlides(){
        self.slides = [
            Asset.advice1.image,
            Asset.advice2.image,
            Asset.advice3.image,
            Asset.advice4.image,
            Asset.advice5.image
        ]
    }

}

extension AdviceViewController : NavigationBarDelegate{
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showNotifications() {
        //unused
    }
    
    
}

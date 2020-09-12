//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let controller = HomeController()
    
    let moreFeatures : [[String]] = [
        ["Map", "Map View"],
        ["Advice", "Health Advice"],
        ["ContactUs", "Contact us"],
        ["Help", "Help"],
    ]
    
    @IBOutlet weak var navigationBar: NavigationBar!{
        didSet{
            navigationBar.delegate = self
            navigationBar.backButton.isHidden = true
            navigationBar.title.text = L10n.home
        }
    }
    @IBOutlet weak var healthStatus: UserHealthStatus!
    @IBOutlet weak var newsButton: NewsButton!
    @IBOutlet weak var currentStatsTitle: UILabel!{
        didSet{
            currentStatsTitle.font = FontFamily.Abel.regular.font(size: 20)
            currentStatsTitle.text = L10n.currentStatsHeading
            currentStatsTitle.textColor = Asset.defautTextColor.color
        }
    }
    
    @IBOutlet var currentStatView : [LocalStat]!
    
    @IBOutlet weak var moreFeaturesTitle: UILabel!{
        didSet{
            moreFeaturesTitle.font = FontFamily.Abel.regular.font(size: 20)
            moreFeaturesTitle.text = L10n.moreFeaturesHeading
            moreFeaturesTitle.textColor = Asset.defautTextColor.color
        }
    }
    @IBOutlet weak var moreFeaturesCollectionView: UICollectionView!{
        didSet{
            moreFeaturesCollectionView.delegate = self
            moreFeaturesCollectionView.dataSource = self
            self.moreFeaturesCollectionView.register(UINib(nibName: "MoreFeatureCell", bundle: nil), forCellWithReuseIdentifier: "MoreFeaturesCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.controller.delegate = self
        setCurrentStats()
    }

    func setCurrentStats(){
        let statNames = [
            L10n.infected,
            L10n.suspects,
            L10n.deaths
        ]
        
        let statValues = [
            "110",
            "12",
            "17"
        ]
        for i in 0..<currentStatView.count{
            currentStatView[i].statName.text = statNames[i]
            currentStatView[i].statValue.text = statValues[i]
        }
    }
}

extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreFeatures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreFeaturesCell", for: indexPath) as! MoreFeatureCollectionViewCell
        cell.contentHolder.backgroundColor = Asset.accentColor.color
        let title = moreFeatures[indexPath.row][1]
        cell.cellTitle.text = title
        return cell
    }
    
    func centerItemsInCollectionView(cellWidth: Double, numberOfItems: Double, spaceBetweenCell: Double, collectionView: UICollectionView) -> UIEdgeInsets {
        let totalWidth = cellWidth * numberOfItems
        let totalSpacingWidth = spaceBetweenCell * (numberOfItems - 1)
        let leftInset = (collectionView.frame.width - CGFloat(totalWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let screen = moreFeatures[indexPath.row][0]
        let storyboard = UIStoryboard(name: "\(screen)", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(screen)ViewController")
        vc.modalPresentationStyle = .formSheet
        self.present(vc, animated: true)
    }
}

extension HomeViewController : HomeDelegate{
    
    func showNews() {
        //
    }
}

extension HomeViewController : NavigationBarDelegate {
    func goBack() {
        //unused
    }

    func showNotifications() {
        let storyboard = UIStoryboard(name: "Notification", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "NotificationViewController")
               vc.modalPresentationStyle = .fullScreen
               self.present(vc, animated: true)
    }
    
    
}

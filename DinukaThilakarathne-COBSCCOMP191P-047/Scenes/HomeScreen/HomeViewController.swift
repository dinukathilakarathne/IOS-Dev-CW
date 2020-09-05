//
//  HomeViewController.swift
//  DinukaThilakarathne-COBSCCOMP191P-047
//
//  Created by Dinuka Thilakarathne on 8/31/20.
//  Copyright © 2020 Dinuka Thilakarathne. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreFeaturesCell", for: indexPath) as! MoreFeatureCollectionViewCell
        cell.contentHolder.backgroundColor = Asset.accentColor.color

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Compute the dimension of a cell for an NxN layout with space S between
        // cells.  Take the collection view's width, subtract (N-1)*S points for
        // the spaces between the cells, and then divide by N to find the final
        // dimension for the cell's width and height

        return CGSize(width: 100, height: 50)
    }
}

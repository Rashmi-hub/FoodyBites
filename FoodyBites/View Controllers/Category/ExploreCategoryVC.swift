//
//  ExploreCategoryVC.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class ExploreCategoryVC: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var ExploreCollectionView: UICollectionView!
    @IBOutlet weak var imgCategory: UIImageView!
    var total: CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        ExploreCollectionView.delegate = self
        ExploreCollectionView.dataSource = self
        ExploreCollectionView.register(UINib(nibName: "HomeFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
        ExploreCollectionView.register(UINib(nibName: "HomeSecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeSecondCollectionViewCell")
        pageController.preferredIndicatorImage = UIImage(named: "fillController")
         let startPage = 0
        pageController.setIndicatorImage(UIImage(named: "fillController"), forPage: startPage)
        pageController.pageIndicatorTintColor = .lightGray
        pageController.currentPageIndicatorTintColor = .white
        pageController.numberOfPages = 6
    }
    
    static func instance() -> ExploreCategoryVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ExploreCategoryVC") as! ExploreCategoryVC
    }
}

extension ExploreCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
            cell.layer.backgroundColor = UIColor.black.cgColor
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowRadius = 12
            cell.layer.shadowOpacity = 6.0
            cell.layer.cornerRadius = 10
            return cell

        }
        else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCollectionViewCell", for: indexPath) as! HomeSecondCollectionViewCell
            return cell

        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330 , height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        self.pageController.currentPage = page
    }
}


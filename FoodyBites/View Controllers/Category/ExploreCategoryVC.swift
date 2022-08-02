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
        self.navigationController?.isNavigationBarHidden = false
        
//        self.navigationItem.titleView?.tintColor = .black
//        UINavigationBar.appearance().barStyle = .black
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.white
        title = "Italian"
        
        ExploreCollectionView.delegate = self
        ExploreCollectionView.dataSource = self
        ExploreCollectionView.register(UINib(nibName: "ExploreCategoryCVC", bundle: nil), forCellWithReuseIdentifier: "ExploreCategoryCVC")
        //        ExploreCollectionView.register(UINib(nibName: "ExploreCategoryCVC", bundle: nil), forCellWithReuseIdentifier: "ExploreCategoryCVC")
        pageController.preferredIndicatorImage = UIImage(named: "fillController")
        let startPage = 0
        pageController.setIndicatorImage(UIImage(named: "fillController"), forPage: startPage)
        pageController.pageIndicatorTintColor = .lightGray
        pageController.currentPageIndicatorTintColor = .white
        pageController.numberOfPages = 6
        pageController.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)
    }
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageController.currentPage) * ExploreCollectionView.frame.size.width
        ExploreCollectionView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    static func instance() -> ExploreCategoryVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ExploreCategoryVC") as! ExploreCategoryVC
    }
}

extension ExploreCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // if indexPath.section == 0{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCategoryCVC", for: indexPath) as! ExploreCategoryCVC
        cell.layer.cornerRadius = 10.0
        // cell.addShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageController.currentPage = Int(pageNumber)
        print(pageNumber)
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}



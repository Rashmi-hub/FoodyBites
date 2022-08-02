//
//  ProfileVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var btnFollower: UIButton!
    @IBOutlet weak var btnFollowing: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var viewCollection: UICollectionView!
    @IBOutlet weak var CollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollection.delegate = self
        viewCollection.dataSource = self
        viewCollection.register(UINib(nibName: "HomeFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
      }
        
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
//        navigationItem.backBarButtonItem?.tintColor = UIColor.black
            let height = viewCollection.collectionViewLayout.collectionViewContentSize.height
                CollectionViewHeight.constant = height
                self.view.setNeedsLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    @IBAction func btnFollowerClicked(_ sender: UIButton) {
        let vc = FollowVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnFollowingClicked(_ sender: UIButton) {
        let vc = FollowVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnReviewClicked(_ sender: UIButton) {
        let vc = ReviewVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func EditProfileClicked(_ sender: UIButton) {
        let vc = EditProfileViewController.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SettingsProfileClicked(_ sender: UIButton) {
        let vc = SettingsVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance() -> ProfileVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
        cell.viewRate.layer.cornerRadius = 10.0
        cell.viewRate.layer.shadowColor = UIColor.black.cgColor
        cell.viewRate.layer.shadowOpacity = 0.6
        cell.addShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 10 , height: 310)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = HomeDetailsVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


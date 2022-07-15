//
//  ProfileVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var viewCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCollection.delegate = self
        viewCollection.dataSource = self
        viewCollection.register(UINib(nibName: "HomeFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
    }
    
    @IBAction func EditProfileClicked(_ sender: UIButton) {
        let vc = EditProfileViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func SettingsProfileClicked(_ sender: UIButton) {
        let vc = CategoryVC.instance() 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance() -> ProfileVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
    }
}
extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
        cell.layer.backgroundColor = UIColor.black.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 12
        cell.layer.shadowOpacity = 6.0
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330 , height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: -20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

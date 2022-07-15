//
//  HomeSecondTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class HomeSecondTableViewCell: UITableViewCell {
    @IBOutlet weak var SecondCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        SecondCollectionView.delegate = self
        SecondCollectionView.dataSource = self
        SecondCollectionView.register(UINib.init(nibName: "HomeSecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeSecondCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
extension HomeSecondTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSecondCollectionViewCell", for: indexPath) as! HomeSecondCollectionViewCell
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 8
        cell.layer.shadowOpacity = 2.0
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.size.width-80)/3
        return CGSize(width: size , height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

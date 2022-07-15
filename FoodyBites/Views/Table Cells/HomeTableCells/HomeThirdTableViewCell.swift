//
//  HomeThirdTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class HomeThirdTableViewCell: UITableViewCell {
    @IBOutlet weak var ThirdCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ThirdCollectionView.delegate = self
        ThirdCollectionView.dataSource = self
        ThirdCollectionView.register(UINib.init(nibName: "HomeThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeThirdCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension HomeThirdTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeThirdCollectionViewCell", for: indexPath) as! HomeThirdCollectionViewCell
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 8
        cell.layer.shadowOpacity = 2.0
        cell.layer.cornerRadius = 8
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height/2.7
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.size.width-110)/5
        return CGSize(width: size , height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}


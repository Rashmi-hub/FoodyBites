//
//  FavouritesTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 29/06/22.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {
    @IBOutlet weak var CollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.register(UINib.init(nibName: "HomeFirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeFirstCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension FavouritesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeFirstCollectionViewCell", for: indexPath) as! HomeFirstCollectionViewCell
        cell.layer.backgroundColor = UIColor.white.cgColor
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 12
        cell.layer.shadowOpacity = 6.0
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 500 , height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}


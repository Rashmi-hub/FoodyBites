//
//  MenuVC.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class MenuVC: UIViewController {
    @IBOutlet weak var collectionMenu: UICollectionView!
    let ImgArray = ["a","b","c","d","a","b","c","d","a","e","a","b","c","d","a","b","c","d","a","e"]
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionMenu.delegate = self
        collectionMenu.dataSource = self
        collectionMenu.collectionViewLayout = InstagramLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.black
        title = "Menu & Photos"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem?.tintColor = .white
    }
    
    static func instance() -> MenuVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
    }
    @IBAction func btnBackClicked(_ sender: UIButton) {
            self.navigationController?.popViewController(animated: true)
    }
    
   
    
}

extension MenuVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
       let images = ImgArray[indexPath.row]
        cell.imgPhotos.image = UIImage(named: images)
        cell.layer.cornerRadius = 8.0
        //cell.backgroundColor = random()
        return cell
    }
    
   // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   //     let size = (CollectionData.bounds.size.width-50)/3
   //     return CGSize(width: size , height: size)
  //  }
    
   // func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
   //     return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
 //   }
//     func random() -> UIColor {
//            return UIColor(
//                red: .random(in: 0...1),
//                green: .random(in: 0...1),
//                blue: .random(in: 0...1),
//                alpha: 1.0
//            )
//        }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath.row)
         let vc = PreviewVC.instance()
         self.navigationController?.pushViewController(vc, animated: true)
     }
   
    func InstagramLayout()-> UICollectionViewCompositionalLayout{
        
           let item = NSCollectionLayoutItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
            
            let MainGroup1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/6)), subitems: [item])
            
            let group2Item1 = NSCollectionLayoutItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
               heightDimension: .fractionalHeight(1/2)))
            
            group2Item1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
            
            
            let group2Item2 = NSCollectionLayoutItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
               heightDimension: .fractionalHeight(1)))
            
            group2Item2.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom:4, trailing: 4)
            
            let groupV1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)), subitems: [group2Item1])
            
            let groupV2 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)), subitems: [group2Item2])
            
            let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/6)), subitems: [groupV1,groupV2])
            
            let group3Item1 = NSCollectionLayoutItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3),
               heightDimension: .fractionalHeight(1)))
            
            group3Item1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
            
            let group4Item1 = NSCollectionLayoutItem.init(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
               heightDimension: .fractionalHeight(1)))
            
            group4Item1.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0)
            
            let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/6)), subitems: [group3Item1])
            
            let group4 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(2/6)), subitems: [group4Item1])
            
        //container Group
            let ContainerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(760)), subitems:[MainGroup1, group2, group3, group4])
            
            let section = NSCollectionLayoutSection(group:ContainerGroup)
            
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return layout
        }
   
}

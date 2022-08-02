//
//  ExploreCategoryCVC.swift
//  FoodyBites
//
//  Created by Zobi on 19/07/22.
//

import UIKit

class ExploreCategoryCVC: UICollectionViewCell {
    @IBOutlet weak var tblExploreCat1: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tblExploreCat1.delegate = self
        tblExploreCat1.dataSource = self
        tblExploreCat1.register(UINib.init(nibName: "ExploreTableViewCell", bundle: nil), forCellReuseIdentifier: "ExploreTableViewCell")
    }

}
extension ExploreCategoryCVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell", for: indexPath) as! ExploreTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

}

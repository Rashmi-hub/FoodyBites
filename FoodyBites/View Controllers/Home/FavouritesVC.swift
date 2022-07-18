//
//  FavouritesViewController.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var tblFavourites: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFavourites.delegate = self
        tblFavourites.dataSource = self
        tblFavourites.register(UINib.init(nibName: "FavouritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouritesTableViewCell")
    }
    
    static func instance() -> FavouritesViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as! FavouritesViewController
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouritesTableViewCell", for: indexPath) as! FavouritesTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeDetailsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

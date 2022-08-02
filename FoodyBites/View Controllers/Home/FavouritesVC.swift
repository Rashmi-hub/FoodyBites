//
//  FavouritesViewController.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class FavouritesViewController: UIViewController{

    @IBOutlet weak var btnback: UIBarButtonItem!
//    func passTheCurrent(tableViewIndex: Int, collectionViewIndex: Int) {
//        let vc = HomeDetailsVC.instance()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    @IBOutlet weak var tblFavourites: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFavourites.delegate = self
        tblFavourites.dataSource = self
        tblFavourites.register(UINib.init(nibName: "tblFavouriteCell", bundle: nil), forCellReuseIdentifier: "tblFavouriteCell")
        //let attributes: AnyObject = [ NSAttributedString.Key.foregroundColor: UIColor.black] as AnyObject
//        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        //Set Font Size
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    static func instance() -> FavouritesViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as! FavouritesViewController
    }
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblFavouriteCell", for: indexPath) as! tblFavouriteCell
        cell.viewMain.layer.cornerRadius = 10.0
        cell.viewMain.clipsToBounds = true
        cell.lbladdress.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tblFavourites.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeDetailsVC.instance()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

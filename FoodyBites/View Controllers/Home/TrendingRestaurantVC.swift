//
//  TrendingRestaurantVC.swift
//  FoodyBites
//
//  Created by Zobi on 13/07/22.
//

import UIKit

class TrendingRestaurantVC: UIViewController {

    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var tblTrending: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        title = "Trending Restaurant"
        tblTrending.delegate = self
        tblTrending.dataSource = self
        viewSearch.backgroundColor = .white
        viewSearch.layer.cornerRadius = 10.0
        tblTrending.register(UINib.init(nibName: "tblFavouriteCell", bundle: nil), forCellReuseIdentifier: "tblFavouriteCell")
        viewSearch.layer.cornerRadius = 6.0
        viewSearch.layer.borderColor = UIColor.lightGray.cgColor
        viewSearch.layer.borderWidth = 0.3
        viewSearch.layer.shadowColor = .init(gray: 0.5, alpha: 0.3)

    }
    static func instance() -> TrendingRestaurantVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TrendingRestaurantVC") as! TrendingRestaurantVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes; navigationController?.navigationBar.tintColor = UIColor.black
        let attributes: AnyObject = [ NSAttributedString.Key.foregroundColor: UIColor.black] as AnyObject
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        //Set Font Size
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!];
    }
 
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func filterClicked(_ sender: UIButton) {
        let vc = FilterVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TrendingRestaurantVC: UITableViewDelegate, UITableViewDataSource {
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
        return tblTrending.estimatedRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = HomeDetailsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

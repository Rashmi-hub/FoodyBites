//
//  HomeViewController.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit
class HomeViewController: UIViewController, passDelegate, category {
    func passTheCurrent(collectionViewIndex: Int) {
        let vc = ExploreCategoryVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func passTheCurrent(tableViewIndex: Int, collectionViewIndex: Int) {
        let vc = HomeDetailsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    func passTheCurrent(collectionViewCell: Int) {
//        let vc = FindFriendsVC.instance()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var tblContainer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBarController?.tabBar.shadowImage = nil
        tblContainer.delegate = self
        tblContainer.dataSource = self
        tblContainer.register(UINib.init(nibName: "HomeOneTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeOneTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeSecondTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeThirdTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeHeadingTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeadingTableViewCell")
        viewSearch.layer.cornerRadius = 6.0
        viewSearch.layer.borderColor = UIColor.lightGray.cgColor
        viewSearch.layer.borderWidth = 0.3
        viewSearch.layer.shadowColor = .init(gray: 0.5, alpha: 0.3)
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem?.tintColor = .black
    }
   
    @IBAction func filterClicked(_ sender: UIButton) {
        let vc  = FilterVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance() -> HomeViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                cell.lblHeading.text = "Trending Restaurants"
            cell.btnSeeAll.addTarget(self, action: #selector(TrendingSeeAll), for: .touchUpInside)
                    return cell
            }
            else if indexPath.row == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeOneTableViewCell", for: indexPath) as! HomeOneTableViewCell
                cell.delegate = self
                            return cell
                }
        
       else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                cell.lblHeading.text = "Category"
           cell.btnSeeAll.addTarget(self, action: #selector(CategorySeeAll), for: .touchUpInside)
                    return cell
           
                }
                else if indexPath.row == 3 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableViewCell", for: indexPath) as! HomeSecondTableViewCell
                    cell.delegate = self
                            return cell
                }
        else if indexPath.row == 4 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                 cell.lblHeading.text = "Friends"
            cell.btnSeeAll.addTarget(self, action: #selector(FriendsSeeAll), for: .touchUpInside)
                     return cell
                 }
        else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeThirdTableViewCell", for: indexPath) as! HomeThirdTableViewCell
                    //cell.delegate = self
                        return cell
                }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 {
          return 50
        }
        else if indexPath.row == 3 {
            return 110
        }
        else if indexPath.row == 5 {
            return 60
        }
        else {
            return 310
        }
    }
    
    @objc func TrendingSeeAll(){
        let vc = TrendingRestaurantVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func CategorySeeAll(){
        let vc = CategoryVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func FriendsSeeAll(){
        let vc = FindFriendsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

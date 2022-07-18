//
//  HomeDetailsVC.swift
//  FoodyBites
//
//  Created by Zobi on 07/07/22.
//

import UIKit

class HomeDetailsVC: UIViewController, menuConnect {
    func menuConnect(collectionItem: Int) {
        let vc = MenuVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tblDetails: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDetails.delegate = self
        tblDetails.dataSource = self
        
        tblDetails.register(UINib(nibName: "ImgTableViewCell", bundle: nil), forCellReuseIdentifier: "ImgTableViewCell")
        tblDetails.register(UINib(nibName: "tblHomeDetailsCell", bundle: nil), forCellReuseIdentifier: "tblHomeDetailsCell")
        tblDetails.register(UINib(nibName: "tblMenuCell", bundle: nil), forCellReuseIdentifier: "tblMenuCell")
        tblDetails.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        tblDetails.register(UINib(nibName: "HomeHeadingTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeadingTableViewCell")
    }
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func settingsClicked(_ sender: UIButton) {
        let vc = SettingsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favouritesClicked(_ sender: UIButton) {
        let vc = FavouritesViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance()-> HomeDetailsVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailsVC") as! HomeDetailsVC
    }
    
    @IBAction func btnRateExperience(_ sender: UIButton) {
        let vc = AddReviewVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5{
            return 4
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImgTableViewCell") as! ImgTableViewCell
        return cell
        }
    
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblHomeDetailsCell") as! tblHomeDetailsCell
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblMenuCell") as!
            
            tblMenuCell
            cell.delegate = self
            return cell
        }
        else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as!
            NotificationTableViewCell
            return cell
        }
       
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell") as! HomeHeadingTableViewCell
            cell.btnSeeAll.addTarget(self, action: #selector(btnSeeAllClicked), for: .touchUpInside)
            if indexPath.section == 2 {
                cell.lblHeading.text = "Menu & Photos"
            }
            else {
                cell.lblHeading.text = "Review & Rating"
            }
            return cell
        }
    }
    
   @objc func btnSeeAllClicked(){
        let vc = ReviewVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
          return 250
        }
        else if indexPath.section == 1 {
            return 120
        }
        else if indexPath.section == 3 {
            return 150
        }
        else if indexPath.section == 5 {
            return 100
        }
        else {
            return 60
        }
    }
}

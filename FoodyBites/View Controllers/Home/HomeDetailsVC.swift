//
//  HomeDetailsVC.swift
//  FoodyBites
//
//  Created by Zobi on 07/07/22.
//

import UIKit

class HomeDetailsVC: UIViewController {
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
        let vc = HomeViewController.instance()
        self.navigationController?.popToViewController(vc, animated: true)
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
}

extension HomeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4{
            return 4
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblHomeDetailsCell") as! tblHomeDetailsCell
        return cell
        }
    
        else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblMenuCell") as! tblMenuCell
            return cell
        }
        else if indexPath.section == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as!
            NotificationTableViewCell
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell") as! HomeHeadingTableViewCell
            if indexPath.section == 1 {
                cell.lblHeading.text = "Menu & Photos"
            }
            else {
                cell.lblHeading.text = "Review & Rating"
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
          return 140
        }
        else if indexPath.section == 2 {
            return 180
        }
        else if indexPath.section == 4 {
            return 90
        }
        else {
            return 60
        }
    }
}

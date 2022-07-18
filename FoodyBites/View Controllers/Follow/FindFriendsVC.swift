//
//  FindFriendsVC.swift
//  FoodyBites
//
//  Created by Zobi on 14/07/22.
//

import UIKit

class FindFriendsVC: UIViewController {
    
    @IBOutlet weak var tblFollow: UITableView!
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        tblFollow.delegate = self
        tblFollow.dataSource = self
        tblFollow.register(UINib.init(nibName: "tblFollowCell", bundle: nil), forCellReuseIdentifier: "tblFollowCell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    static func instance() -> FindFriendsVC {
        return UIStoryboard.init(name: "Follow", bundle: nil).instantiateViewController(withIdentifier: "FindFriendsVC") as! FindFriendsVC
    }
    
}
extension FindFriendsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblFollowCell", for: indexPath) as! tblFollowCell
        cell.btnFollow.addTarget(self, action: #selector(editGroupAction(sender:)), for: .touchUpInside)
        cell.btnFollow.tag = indexPath.row
        cell.btnFollow.backgroundColor = .white

        if indexPath.row == selectedIndex {
            cell.btnFollow.backgroundColor = UIColor(named: "ClickEventColor")
            cell.btnFollow.setTitle("Unfollow", for: UIControl.State.normal)
        }
        else {
            cell.btnFollow.backgroundColor = .clear
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
        return "Contacts"
        }
        else {
            return "Suggestions"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(named: "SectionHeaderColor")
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.lightGray
        header.textLabel?.font = UIFont(name: "JosefinSans-SemiBold", size: 16.0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
//        let cell = tblFollow.cellForRow(at: indexPath) as! tblFollowCell
//        cell.btnFollow.backgroundColor = UIColor(named: "ClickEventColor")
//        cell.btnFollow.setTitle("Follow", for: UIControl.State.normal)
//        cell.btnFollow.clipsToBounds = true
//        tblFollow.reloadData()
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tblFollow.cellForRow(at: indexPath) as! tblFollowCell
//        cell.btnFollow.setTitle("Unfollow", for: UIControl.State.normal)
//        cell.btnFollow.backgroundColor = .clear
//    }
    
    @objc func editGroupAction(sender: UIButton) {
        selectedIndex = sender.tag
        tblFollow.reloadData()
    }
}

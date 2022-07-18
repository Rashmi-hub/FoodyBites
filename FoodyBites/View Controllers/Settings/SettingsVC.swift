//
//  SettingsVC.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var tblSettings: UITableView!
    var arrayAccount = ["Change Password","Change Language"]
    var arrayOther = ["Privacy Policy","Terms & Conditions","Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSettings.delegate = self
        tblSettings.dataSource = self
        tblSettings.register(UINib.init(nibName: "SettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingsTableViewCell")
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    static func instance() -> SettingsVC {
        return UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
    }
    
}

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayAccount.count
        }
        else if section == 1 {
            return arrayOther.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        if indexPath.section == 0 {
            cell.lblTitle.text = arrayAccount[indexPath.row]
        }
        else if indexPath.section == 1{
            if indexPath.row == 2{
                cell.lblTitle.textColor = UIColor.blue
            }
            cell.lblTitle.text = arrayOther[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: tableView.frame.size.width, height: 50))
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "JosefinSans-SemiBold", size: 18.0)
        label.textAlignment = .left
        if section == 0{
            label.text = "Account"
        }
        if section == 1{
            label.text = "Others"
        }
        label.backgroundColor  = .clear
        let frame = tableView.frame
        let height:CGFloat = 250
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: height))
        headerView.backgroundColor = UIColor(named: "SectionHeaderColor")
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 0 {
                let vc = ChangePasswordVC.instance()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if indexPath.row == 1 {
                let vc = LanguageVC.instance()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else if indexPath.section == 1{
            if indexPath.row == 2 {
                showAlert("Are you sure you want to logout?")
            }
        }
        
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 20.0)!]
        let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont)
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        let No = UIAlertAction(title: "No", style: .default) { UIAlertAction in
            print("No button pressed")
        }
        
        alert.addAction(No)
        let Yes = UIAlertAction(title: "Yes", style: .default) { UIAlertAction in
            print("Yes button pressed")
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(Yes)
        self.present(alert, animated: true, completion: nil)
    }
    
}

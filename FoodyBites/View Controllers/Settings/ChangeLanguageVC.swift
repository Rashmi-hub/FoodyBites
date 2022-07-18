//
//  LanguageVC.swift
//  FoodyBites
//
//  Created by Zobi on 30/06/22.
//

import UIKit

class LanguageVC: UIViewController {
    @IBOutlet weak var tblLanguage: UITableView!
    var arrayLanguage = ["Spanish","Chinese","Hindi","Arabic","Russina","Japanise","Purtagies","German"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblLanguage.delegate = self
        tblLanguage.dataSource = self
        tblLanguage.register(UINib.init(nibName: "LanguageTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewCell")
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    static func instance() -> LanguageVC {
        return UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "LanguageVC") as! LanguageVC
    }
    
}
extension LanguageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: tableView.frame.size.width, height: 50))
        label.textColor = UIColor.lightGray
        label.font = UIFont(name: "JosefinSans-SemiBold", size: 18.0)
        label.textAlignment = .left
        label.text = "Select Language"
        label.backgroundColor  = .clear
        let frame = tableView.frame
        let height:CGFloat = 250
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: height))
        headerView.backgroundColor = UIColor(named: "SectionHeaderColor")
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewCell", for: indexPath) as! LanguageTableViewCell
        cell.lblLanguageName.text = arrayLanguage[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      let cell = tblLanguage.cellForRow(at: indexPath) as! LanguageTableViewCell
            cell.imgCheck.image = UIImage(named: "select")
        cell.lblLanguageName.textColor = UIColor(named: "ClickEventColor")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LanguageTableViewCell
        cell.imgCheck.image = UIImage(named: "deselect")
        cell.lblLanguageName.textColor = UIColor(named: "HeadingDark")
    }
}

//
//  NotificationViewController.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var tblNotification: UITableView!
    var arrayImg = ["Man","Women","Man","Women","Man","Women","Man","Women"]
    var arrName = ["Branson Hawkins","Foodybite","Juliet Hooper","Branson Hawkins","Anabel Leach","Ashlee Rollins","Abbigail Carter","Deven Berry"]
    var arrStatus = ["Start following you","We found 10 new restaurant near you","Checked in at Happy Bones","Start following you","Checked in at Uncle Boons","Start following you","Checked in at Miller's Cafe","Start following you"]
    var arrTime = ["11:30AM","4:00PM","7:30PM","Yesterday","Yesterday","26/05/2019","26/05/2019","26/05/2019"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tblNotification.delegate = self
        tblNotification.dataSource = self
        tblNotification.register(UINib.init(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
    }
    static func instance() -> NotificationViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
    }
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.layer.frame.size.height/2
        cell.lblName.text = arrName[indexPath.row]
        cell.btnSellAll.setTitle(arrTime[indexPath.row], for: .normal)
        cell.lblStatus.text = arrStatus[indexPath.row]
        let image = arrayImg[indexPath.row]
        cell.imgProfile.image = UIImage(named: image)
        return cell
    }

}

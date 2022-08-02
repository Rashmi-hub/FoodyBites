//
//  FollowVC.swift
//  FoodyBites
//
//  Created by Zobi on 01/07/22.
//

import UIKit

class FollowVC: UIViewController {
    @IBOutlet weak var tblFollower: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Follower"
        tblFollower.delegate = self
        tblFollower.dataSource = self
        tblFollower.register(UINib.init(nibName: "FollowerTableViewCell", bundle: nil), forCellReuseIdentifier: "FollowerTableViewCell")
    }
    static func instance() -> FollowVC {
        return UIStoryboard.init(name: "Follow", bundle: nil).instantiateViewController(withIdentifier: "FollowVC") as! FollowVC
    }
}

extension FollowVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerTableViewCell", for: indexPath) as! FollowerTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

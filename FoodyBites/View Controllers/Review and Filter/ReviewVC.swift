//
//  ReviewVC.swift
//  FoodyBites
//
//  Created by Zobi on 01/07/22.
//

import UIKit

class ReviewVC: UIViewController {
    @IBOutlet weak var tblReview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblReview.delegate = self
        tblReview.dataSource = self
        tblReview.register(UINib.init(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
    }
    static func instance() -> ReviewVC {
        return UIStoryboard.init(name: "Review_Filter", bundle: nil).instantiateViewController(withIdentifier: "ReviewVC") as! ReviewVC
    }
}
extension ReviewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

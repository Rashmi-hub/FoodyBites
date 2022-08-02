//
//  AddReviewVC.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit
import Cosmos

class RatingVC: UIViewController {

    @IBOutlet weak var tblAddReview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAddReview.delegate = self
        tblAddReview.dataSource = self
        tblAddReview.register(UINib.init(nibName: "AddReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReviewTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.black
        title = "Review & Rating"
    }
    
    @IBAction func DoneClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    static func instance() -> RatingVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "RatingVC") as! RatingVC
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        let vc  = TabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: false)    }
    
}
extension RatingVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddReviewTableViewCell", for: indexPath) as! AddReviewTableViewCell
        cell.viewWriteExperience.layer.borderWidth = 1
        cell.viewWriteExperience.layer.borderColor = UIColor(named: "searchicon")?.cgColor
        cell.viewWriteExperience.layer.cornerRadius = 8.0
        cell.viewReview.settings.updateOnTouch = true
        cell.viewReview.layer.cornerRadius = 8.0
        cell.viewReview.settings.fillMode = .full
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 363
    }
}

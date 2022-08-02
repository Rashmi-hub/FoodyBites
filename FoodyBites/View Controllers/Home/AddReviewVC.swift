//
//  AddReviewVC.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit
import Cosmos

class AddReviewVC: UIViewController {

    @IBOutlet weak var searchBar: UINavigationBar!
    @IBOutlet weak var tblAddReview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblAddReview.delegate = self
        tblAddReview.dataSource = self
        tblAddReview.register(UINib.init(nibName: "AddReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReviewTableViewCell")
        searchBar.layer.cornerRadius = 6.0
        searchBar.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.layer.borderWidth = 0.3
        searchBar.layer.shadowColor = .init(gray: 0.5, alpha: 0.3)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.gray
    }
    static func instance() -> AddReviewVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "AddReviewVC") as! AddReviewVC
    }
    
    @IBAction func btnFilterClicked(_ sender: Any) {
        let vc = FilterVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func addTapped(){
        print("hi")
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        let vc  = TabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: false)    }
    
}
extension AddReviewVC: UITableViewDelegate, UITableViewDataSource {
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

//
//  HomeViewController.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tblContainer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContainer.delegate = self
        tblContainer.dataSource = self
        tblContainer.register(UINib.init(nibName: "HomeOneTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeOneTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeSecondTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeSecondTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeThirdTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeThirdTableViewCell")
        tblContainer.register(UINib.init(nibName: "HomeHeadingTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeadingTableViewCell")
    }
    @IBAction func filterClicked(_ sender: UIButton) {
        let vc  = FilterVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance() -> HomeViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if indexPath.row == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                cell.lblHeading.text = "Trending Restaurants"
                    return cell
                }
            else if indexPath.row == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeOneTableViewCell", for: indexPath) as! HomeOneTableViewCell
                            return cell
                }
       else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                cell.lblHeading.text = "Category"
                    return cell
                }
                else if indexPath.row == 3 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSecondTableViewCell", for: indexPath) as! HomeSecondTableViewCell
                            return cell
                }
        else if indexPath.row == 4 {
             let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell", for: indexPath) as! HomeHeadingTableViewCell
                 cell.lblHeading.text = "Friends"
                     return cell
                 }
        else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeThirdTableViewCell", for: indexPath) as! HomeThirdTableViewCell
                        return cell
                }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 {
          return 50
        }
        else if indexPath.row == 3 {
            return 150
        }
        else if indexPath.row == 5 {
            return 60
        }
        else {
            return 380
        }
    }
    
}

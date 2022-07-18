//
//  CategoryVC.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class CategoryVC: UIViewController {
@IBOutlet weak var tblCategory: UITableView!
    var arrayLowerImg = ["Category1","M2","Category1","M2","Category1","M2","Category1","M2","Category1","M2"]
    var arrayName = ["Indian","Maxican","Indian","Maxican","Indian","Maxican","Indian","Maxican","Indian","Maxican"]
    var arrayUpperImg = ["Category2","M1","Category2","M1","Category2","M1","Category2","M1","Category2","M1"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tblCategory.delegate = self
        tblCategory.dataSource = self
        tblCategory.register(UINib.init(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblCategory.separatorStyle = .none
    }
    
    static func instance() -> CategoryVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "CategoryVC") as! CategoryVC
    }
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        let img = arrayUpperImg[indexPath.row]
        cell.imgbg.image = UIImage(named: img)
        let img1 = arrayLowerImg[indexPath.row]
        cell.imgfg.image = UIImage(named: img1)
        let imgName = arrayName[indexPath.row]
        cell.imgName.image = UIImage(named: imgName)
        //cell.layer.cornerRadius = 20
        cell.imgfg.layer.cornerRadius = 12
        cell.imgbg.layer.cornerRadius = 12
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ExploreCategoryVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

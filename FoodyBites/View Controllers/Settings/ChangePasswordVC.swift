//
//  ChangePasswordVC.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var btnUpdatePswd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    static func instance()-> ChangePasswordVC {
        return UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
    }
    @IBAction func updatePasswordClicked(_ sender: UIButton) {
        let vc = MenuVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

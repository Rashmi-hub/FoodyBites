//
//  ChangePasswordVC.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var CurrentPswd: UIView!
    @IBOutlet weak var Pswd: UIView!
    @IBOutlet weak var ConfirmPswd: UIView!
    @IBOutlet weak var btnUpdatePswd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Change Password"
        CurrentPswd.layer.cornerRadius = 10.0
        ConfirmPswd.layer.cornerRadius = 10.0
        Pswd.layer.cornerRadius = 10.0
        CurrentPswd.layer.borderColor = UIColor.lightGray.cgColor
        ConfirmPswd.layer.borderColor = UIColor.lightGray.cgColor
        Pswd.layer.borderColor = UIColor.lightGray.cgColor
        self.CurrentPswd.layer.borderWidth = 1.0
        self.ConfirmPswd.layer.borderWidth = 1.0
        self.Pswd.layer.borderWidth = 1.0
        hideKeyboardWhenTappedAround()

    }
        
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    static func instance()-> ChangePasswordVC {
        return UIStoryboard.init(name: "Settings", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
    }
    @IBAction func updatePasswordClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

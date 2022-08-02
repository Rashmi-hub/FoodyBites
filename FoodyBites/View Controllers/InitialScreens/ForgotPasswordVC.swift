//
//  ForgotPasswordVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit
import IQKeyboardManager

class ForgotPasswordVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = false
//        navigationItem.hidesBackButton = false
        btnSend.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.white
        //title = "Review"
    }
    
    static func instance() -> ForgotPasswordVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
    }
    
    @IBAction func sendClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

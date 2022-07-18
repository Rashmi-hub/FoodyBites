//
//  LoginViewController.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 10
    }
    
    static func instance() -> LoginViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        let vc = WelcomeVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        let vc = RegisterVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        let vc = ForgotPasswordVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

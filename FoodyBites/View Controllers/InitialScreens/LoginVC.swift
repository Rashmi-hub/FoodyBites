//
//  LoginViewController.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnCreateAc: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.layer.cornerRadius = 10
        //btnCreateAc.titleLabel?.font = UIFont(name: "JosefinSans-SemiBold", size: 18)
        let attributedString = NSAttributedString(string: NSLocalizedString("Create New Account", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "JosefinSans-SemiBold", size: 18)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        btnCreateAc.setAttributedTitle(attributedString, for: .normal)
        hideKeyboardWhenTappedAround()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem?.tintColor = .white
//        let userDefault = UserDefaults.standard
//        let savedData = userDefault.bool(forKey: "IsLogin")
//        if(savedData){
//            let vc = LoginViewController.instance()
//            self.present(vc, animated: true)
//        }else{
//            let vc = HomeViewController.instance()
//            vc.tabBarController?.tabBar.isHidden = false
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    static func instance() -> LoginViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return }
        window.rootViewController = UINavigationController(rootViewController: storyboard.instantiateInitialViewController()!)
                    window.makeKeyAndVisible()
        UserDefaults.standard.set(true, forKey: constant.isLoggedIn)
    }
    
    @IBAction func createNewAccount(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
               self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Click(_ sender: UIButton) {
        let vc = HomeDetailsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
//    @IBAction func forgotPasswordClicked(_ sender: Any) {
//        let vc = ForgotPasswordVC.instance()
//        self.navigationController?.pushViewController(vc, animated: true)
//    }

}

//
//  WelcomeVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var btnTurnOnGPS: UIButton!
    @IBOutlet weak var btnGPS: UIButton!
    @IBOutlet weak var viewSkipBG: UIView!
    @IBOutlet weak var btnSkip: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGPS.layer.cornerRadius = 10
        viewSkipBG.layer.cornerRadius = 10.0
        hideKeyboardWhenTappedAround()
    }
    
    static func instance() -> WelcomeVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
    }

    @IBAction func SkipClicked(_ sender: UIButton) {
        let vc = TabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func btnGPSClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)    }
    
}



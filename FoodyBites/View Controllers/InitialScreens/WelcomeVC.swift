//
//  WelcomeVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnGPS: UIButton!
    @IBOutlet weak var viewSkip: UIView!
    @IBOutlet weak var btnSkip: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        btnGPS.layer.cornerRadius = 10
        btnSkip.layer.cornerRadius = 12.0
        viewSkip.layer.cornerRadius = 12.0
    }
    
    static func instance() -> WelcomeVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as! WelcomeVC
    }

    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func SkipClicked(_ sender: UIButton) {
        let vc = TabBarViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
  
}


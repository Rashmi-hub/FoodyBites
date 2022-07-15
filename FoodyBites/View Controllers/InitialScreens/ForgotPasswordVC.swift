//
//  ForgotPasswordVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    @IBOutlet weak var btnSend: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        btnSend.layer.cornerRadius = 10

    }
    static func instance() -> ForgotPasswordVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
    }
    
    @IBAction func sendClicked(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}

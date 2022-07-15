//
//  RegisterVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var btnRegister: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        btnRegister.layer.cornerRadius = 10
        imgProfilePicture.addBlurEffect()
        imgProfilePicture.layer.shadowOpacity = 5.0
        imgProfilePicture.layer.shadowColor = UIColor.white.cgColor
        imgProfilePicture.layer.cornerRadius = imgProfilePicture.frame.size.width/2
    }
    
    static func instance() -> RegisterVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension UIImageView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}


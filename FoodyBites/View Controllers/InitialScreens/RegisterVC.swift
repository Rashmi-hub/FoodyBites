//
//  RegisterVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class RegisterVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var btnAlreadyAc: UIButton!

    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
      //  navigationItem.hidesBackButton = true
     
        btnRegister.layer.cornerRadius = 10
        imgProfilePicture.layer.shadowOpacity = 5.0
        imgProfilePicture.layer.shadowColor = UIColor.white.cgColor
        btnUpload.layer.cornerRadius = btnUpload.frame.size.height/2
        imgProfilePicture.contentMode = .scaleAspectFill
        imgBg.layer.cornerRadius = imgBg.frame.size.height/2
        imgProfilePicture.layer.cornerRadius = imgProfilePicture.frame.size.height/2
        let text = "Already have an Account? Login"
        let attributedString = NSAttributedString(string: NSLocalizedString(text, comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont(name: "JosefinSans-SemiBold", size: 18)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        btnAlreadyAc.setAttributedTitle(attributedString, for: .normal)

        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, NSAttributedString.Key.font : UIFont(name: "JosefinSans-SemiBold", size: 18)!]
        let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ClickEventColor")?.cgColor ?? UIColor.white, NSAttributedString.Key.font : UIFont(name: "JosefinSans-SemiBold", size: 18)!] as [NSAttributedString.Key : Any]

        let firstString = NSMutableAttributedString(string: "Already have an Account? ", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "Login ", attributes: secondAttributes)

        firstString.append(secondString)
        btnAlreadyAc.setAttributedTitle(firstString, for: .normal)
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.backBarButtonItem?.customView?.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    static func instance() -> RegisterVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        let vc = WelcomeVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnAlreadyAc(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnClicked() {

           if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
               print("Button capture")

               imagePicker.delegate = self
               imagePicker.sourceType = .savedPhotosAlbum
               imagePicker.allowsEditing = false

               present(imagePicker, animated: true, completion: nil)
           }
       }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgProfilePicture.image = image
            }

        }
}


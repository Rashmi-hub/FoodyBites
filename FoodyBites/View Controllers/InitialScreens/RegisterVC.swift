//
//  RegisterVC.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class RegisterVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var btnPerson: UIButton!
    @IBOutlet weak var imgProfilePicture: UIImageView!
    @IBOutlet weak var btnRegister: UIButton!
    var imgPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        btnRegister.layer.cornerRadius = 10
//        imgProfilePicture.addBlurEffect()
//        imgProfilePicture.layer.shadowOpacity = 5.0
        imgProfilePicture.layer.shadowColor = UIColor.white.cgColor
        imgProfilePicture.layer.cornerRadius = imgProfilePicture.frame.size.width/2
        btnPerson.layer.cornerRadius = btnPerson.frame.size.width/2
    }
    
    static func instance() -> RegisterVC {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func ClickToAnimate(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imgPicker.delegate = self
            imgPicker.sourceType = .photoLibrary
            present(imgPicker, animated: true, completion: nil)
        }
    }
        
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgProfilePicture.image = image
                imgProfilePicture.contentMode = .scaleAspectFill
            }
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
    

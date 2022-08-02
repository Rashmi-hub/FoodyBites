//
//  EditProfileViewController.swift
//  FoodyBites
//
//  Created by Zobi on 30/06/22.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var viewName: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        viewName.layer.borderWidth = 1
        viewName.layer.borderColor = UIColor.lightGray.cgColor
        viewName.layer.cornerRadius = 10
        viewEmail.layer.borderWidth = 1
        viewEmail.layer.borderColor = UIColor.lightGray.cgColor
        viewEmail.layer.cornerRadius = 10
        hideKeyboardWhenTappedAround()
        
       // btnUpdate.DynamicFontSize = true
        //txtName.setLeftImage(imageName: "NameIcon")
        //txtEmail.setLeftImage(imageName: "EmailIcon")
    }
    @IBAction func updateClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    static func instance() -> EditProfileViewController {
        return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
    }
}

/*extension UITextField{
    func setLeftImage(imageName:String) {
       // let view = UIView(frame: CGRect(x: 13, y: 10, width: 50, height: 20))
        let imageView = UIImageView(frame: CGRect(x: 13, y: 0, width: 50, height: 20))
        
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.leftViewMode = .always
    }
}
 
*/
@IBDesignable
extension UITextField {
    
    @IBInspectable var paddingLeftCustom: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            if  leftView == nil {
                leftView = paddingView
                leftViewMode = .always
            }
            
        }
    }
}

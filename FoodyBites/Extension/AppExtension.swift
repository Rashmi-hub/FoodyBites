//
//  AppExtension.swift
//  FoodyBites
//
//  Created by Zobi on 15/07/22.
//

import UIKit

typealias ButtonCallBackClosure = (_ sender : UIButton) -> Void
let iPAD = UIDevice.current.userInterfaceIdiom == .pad

struct Keys {
    static fileprivate var closure: UInt8 = 0
    static fileprivate var control: UInt8 = 0
    static fileprivate var footer: UInt8 = 0
    static fileprivate var buttonClosure : UInt8 = 0
    static fileprivate var buttonBarClosure : UInt8 = 0
}

extension CGFloat {
    var scaledFontSize : CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / (iPAD ? 600 : 320))
    }
}

extension UIFont {
    func scaleFont() -> UIFont {
        return UIFont.init(name: self.fontName, size: self.pointSize.scaledFontSize)!
    }
    
    var bold: UIFont {
        return with(traits: .traitBold)
    }
    
    var regular: UIFont {
        var fontAtrAry = fontDescriptor.symbolicTraits
        fontAtrAry.remove([.traitBold])
        let fontAtrDetails = fontDescriptor.withSymbolicTraits(fontAtrAry)
        return UIFont(descriptor: fontAtrDetails!, size: pointSize)
    }
    
    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(traits) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
}

extension UIButton{
    
    open override func awakeFromNib() {
        DynamicFontSize = false
        super.awakeFromNib()
    }
    
    var DynamicFontSize : Bool {
        set {
            if newValue{
                if newValue{
                    if let fonts = titleLabel?.font{
                        titleLabel?.font = fonts.scaleFont()
                    }
                }
            }
        }
        get {
            return false
        }
    }
    
    func callBackTarget(closure: @escaping ButtonCallBackClosure) {
        callBackTargetClosure = closure
    }
    
    private var callBackTargetClosure: ButtonCallBackClosure? {
        get{
            return objc_getAssociatedObject(self, &Keys.buttonClosure) as? ButtonCallBackClosure
        }
        set{
            if let newValue = newValue{
                objc_setAssociatedObject(self, &Keys.buttonClosure, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addTarget(self, action: #selector(clickOnClosureButton(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc private func clickOnClosureButton(_ sender: UIButton) {
        if let callBack = callBackTargetClosure{
            callBack(sender)
        }
    }
}
extension UICollectionViewCell {
    func addShadow(){
    let cell = self
    cell.layer.shadowColor = UIColor.black.cgColor
    cell.layer.shadowRadius = 15.0
    cell.layer.cornerRadius = 12
    cell.layer.shadowOffset = CGSize(width: CGFloat(4.0), height: CGFloat(4.0))
    cell.layer.shadowOpacity = 0.8
    }
}

extension UITableViewCell {
    func addShadow(){
    let cell = self
    cell.layer.shadowColor = UIColor.black.cgColor
    cell.layer.shadowRadius = 15.0
    cell.layer.cornerRadius = 12
    cell.layer.shadowOffset = CGSize(width: CGFloat(4.0), height: CGFloat(4.0))
    cell.layer.shadowOpacity = 0.8
    }
}

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
           get {
               return self.placeHolderColor
           }
           set {
               self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
           }
       }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
extension UINavigationController {
    func transparentNavigationBar() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    func setColorAndFont() {
        let attributes: AnyObject = [ NSAttributedString.Key.foregroundColor: UIColor.black] as AnyObject
        self.navigationController?.navigationBar.titleTextAttributes = attributes as? [String : AnyObject] as? [NSAttributedString.Key : Any]
        //Set Font Size
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!];
    }
}

// This will help us to remove text
extension UIViewController {
    open override func awakeAfter(using coder: NSCoder) -> Any? {
        //navigationItem.backButtonDisplayMode = .minimal
        self.navigationItem.backButtonTitle = ""
        self.navigationItem.backBarButtonItem?.tintColor = .black
        return super.awakeAfter(using: coder)
    }
}



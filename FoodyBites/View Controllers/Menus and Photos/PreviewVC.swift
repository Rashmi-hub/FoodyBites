//
//  PreviewVC.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class PreviewVC: UIViewController {
    @IBOutlet weak var imgPreview: UIImageView!
    var newImg = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPreview.image = UIImage(named: newImg)
    }
    static func instance() -> PreviewVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
    }

    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

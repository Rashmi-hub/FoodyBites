//
//  TabBarViewController.swift
//  FoodyBites
//
//  Created by Zobi on 28/06/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    static func instance() -> TabBarViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
    }

}

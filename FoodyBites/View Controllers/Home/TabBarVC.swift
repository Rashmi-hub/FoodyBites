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
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
        tabBar.clipsToBounds = false
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes; navigationController?.navigationBar.tintColor = UIColor.black
        let prominentTabBar = self.tabBar as? ProminentTabBar
        prominentTabBar?.prominentButtonCallback = prominentTabTaped
    }
    static func instance() -> TabBarViewController {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
    }
    func prominentTabTaped() {
        selectedIndex = (tabBar.items?.count ?? 0)
    }
}
class ProminentTabBar: UITabBar {
    var prominentButtonCallback: (()->())?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let items = items, items.count>0 else {
            return super.hitTest(point, with: event)
        }
        
        let middleItem = items[items.count/2]
        let middleExtra = middleItem.imageInsets.top
        let middleWidth = bounds.width/CGFloat(items.count)
        let middleRect = CGRect(x: (bounds.width-middleWidth)/2, y: middleExtra, width: middleWidth, height: abs(middleExtra))
        if middleRect.contains(point) {
            prominentButtonCallback?()
            return nil
        }
        return super.hitTest(point, with: event)
    }
}


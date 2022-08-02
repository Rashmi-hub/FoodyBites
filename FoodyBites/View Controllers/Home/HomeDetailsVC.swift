//
//  HomeDetailsVC.swift
//  FoodyBites
//
//  Created by Zobi on 07/07/22.
//

import UIKit

class HomeDetailsVC: UIViewController, menuConnect {
    func menuConnect(collectionItem: Int) {
        let vc = MenuVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tblDetails: UITableView!
//    override var prefersStatusBarHidden: Bool {
//            return true
//        }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDetails.delegate = self
        tblDetails.dataSource = self
        self.tabBarController?.tabBar.isHidden = true
        

     self.tblDetails.contentInsetAdjustmentBehavior = .never
        tblDetails.register(UINib(nibName: "ImgTableViewCell", bundle: nil), forCellReuseIdentifier: "ImgTableViewCell")
        tblDetails.register(UINib(nibName: "tblHomeDetailsCell", bundle: nil), forCellReuseIdentifier: "tblHomeDetailsCell")
        tblDetails.register(UINib(nibName: "tblMenuCell", bundle: nil), forCellReuseIdentifier: "tblMenuCell")
        tblDetails.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        tblDetails.register(UINib(nibName: "HomeHeadingTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeadingTableViewCell")
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back") , style: .plain, target: self, action: #selector(addTapped))
//
//        let settingsBtn = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(settingsClicked(_:)))
//
//        let favouriteBtn = UIBarButtonItem(image: UIImage(named: "favourites"), style: .plain, target: self, action: #selector(favouritesClicked(_:)))
//        navigationItem.rightBarButtonItems = [settingsBtn, favouriteBtn]
        self.navigationController?.isNavigationBarHidden = false
        let favourites = UIBarButtonItem(image: UIImage(named: "favourites"),
                                          style: .plain,
                                          target: self,
                                         action: #selector(favouritesClicked(_ :)))
        let settings = UIBarButtonItem(image: UIImage(named: "settings"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(settingsClicked(_:)))

        navigationItem.rightBarButtonItems = [favourites, settings]
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes;
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    @objc func addTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func settingsClicked(_ sender: UIButton) {
        let vc = SettingsVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favouritesClicked(_ sender: UIButton) {
        let vc = FavouritesViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func rateYourExperience(_ sender: UIButton) {
        let vc = RatingVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance()-> HomeDetailsVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailsVC") as! HomeDetailsVC
    }
}

extension HomeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5{
            return 4
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImgTableViewCell") as! ImgTableViewCell
            return cell
        }
    
        else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblHomeDetailsCell") as! tblHomeDetailsCell
            return cell
        }
        else if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tblMenuCell") as! tblMenuCell
            cell.delegate = self
            return cell
        }
        else if indexPath.section == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as!
            ReviewTableViewCell
            return cell
        }
       
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeadingTableViewCell") as! HomeHeadingTableViewCell
            cell.contentView.backgroundColor = .white
            cell.lblHeading.backgroundColor = UIColor.white
            cell.btnSeeAll.layer.backgroundColor = UIColor.white.cgColor
            
            if indexPath.section == 2 {
                cell.lblHeading.text = "Menu & Photos"
                cell.btnSeeAll.addTarget(self, action: #selector(btnMenuSellAll), for: .touchUpInside)
            }
            else {
                cell.lblHeading.text = "Review & Rating"
                cell.btnSeeAll.addTarget(self, action: #selector(btnReviewSellAll), for: .touchUpInside)
            }
            return cell
        }
    }
    
   @objc func btnMenuSellAll(){
       let vc  =  MenuVC.instance()
       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btnReviewSellAll(){
         let vc = ReviewVC.instance()
         self.navigationController?.pushViewController(vc, animated: true)
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5 {
            let vc = ReviewVC.instance()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
          return 250
        }
        else if indexPath.section == 1 {
            return 100
        }
        else if indexPath.section == 3 {
            return 160
        }
        else if indexPath.section == 5 {
            return 120
        }
        else {
            return 40
        }
    }
}

@IBDesignable
public class Gradients: UIButton {
    @IBInspectable var startColor:   UIColor = .black { didSet { updateColors() }}
    @IBInspectable var endColor:     UIColor = .white { didSet { updateColors() }}
    @IBInspectable var horizontalMode:  Bool =  false { didSet { updatePoints() }}
    @IBInspectable var diagonalMode:    Bool =  false { didSet { updatePoints() }}
    
    override public class var layerClass: AnyClass { CAGradientLayer.self }
    
    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }
    
    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updatePoints()
        updateColors()
    }
    
}

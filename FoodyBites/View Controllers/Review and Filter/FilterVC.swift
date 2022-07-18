//
//  FilterVC.swift
//  FoodyBites
//
//  Created by Zobi on 06/07/22.
//

import UIKit
import Cosmos

class FilterVC: UIViewController {
    
    @IBOutlet weak var sliderDistance: UISlider!
    @IBOutlet weak var filterCollection: UICollectionView!
    @IBOutlet weak var SliderMinValue: UILabel!
    @IBOutlet weak var sliderMaxValue: UILabel!
    @IBOutlet weak var viewRating: CosmosView!
    var selectedIndex = 0
    var arrayCategory = ["Indian","Italian","Maxican","Chinese","Japanise","Thai","Korean","Europian","Arabian"]
    let thumbImg = UIImage(named: "thumb_slider")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterCollection.delegate = self
        filterCollection.dataSource = self
        filterCollection.isUserInteractionEnabled = true
        filterCollection.allowsSelection = true
        SliderMinValue.text = "\(Int(sliderDistance.minimumValue))"
        sliderMaxValue.text = "\(Int(sliderDistance.maximumValue))"
        sliderDistance.setThumbImage(thumbImg, for: .normal)
        let imgValue = FilterVC.textToImage(drawText: "10", inImage: thumbImg!, atPoint: CGPoint(x: 11.5, y: 10))
        sliderDistance.setThumbImage(imgValue, for: .normal)
        viewRating.settings.updateOnTouch = true
        viewRating.layer.cornerRadius = 8.0
        viewRating.settings.fillMode = .full
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        
        let value = Int(sliderDistance.value)
        if value == 100 {
            let imgValue = FilterVC.textToImage(drawText: "\(value)", inImage: thumbImg!, atPoint: CGPoint(x: 7.5, y: 10))
            sliderDistance.setThumbImage(imgValue, for: .normal)
        }
        else {
            let imgValue = FilterVC.textToImage(drawText: "\(value)", inImage: thumbImg!, atPoint: CGPoint(x: 11.5, y: 10))
            sliderDistance.setThumbImage(imgValue, for: .normal)
        }
    }
    
    @IBAction func ApplyClicked(_ sender: Any) {
        let vc = TrendingRestaurantVC.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func instance() -> FilterVC {
        return UIStoryboard.init(name: "Review_Filter", bundle: nil).instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
    }
    
    static func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "JosefinSans-Bold", size: 14)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
        ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}

extension FilterVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCollectionViewCell", for: indexPath) as! FilterCollectionViewCell
        cell.lblCategoryType.text = arrayCategory[indexPath.row]
        cell.btnCollection.gradientLayer.cornerRadius = 10.0
        cell.btnCollection.isUserInteractionEnabled = true
        cell.btnCollection.tag = indexPath.row
        cell.btnCollection.addTarget(self, action: #selector(editGroupAction(sender:)), for: .touchUpInside)
        if indexPath.row == selectedIndex {
            cell.btnCollection.startColor = UIColor(named: "Right")!
            cell.btnCollection.endColor = UIColor(named: "Left")!
        }
        else {
            cell.btnCollection.backgroundColor = .white
            cell.btnCollection.startColor = .clear
            cell.btnCollection.endColor = .clear
        }
        return cell
    }
    
    @objc func editGroupAction(sender: UIButton) {
        selectedIndex = sender.tag
        filterCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.bounds.size.width-20)/3
        return CGSize(width: size , height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
        cell.btnCollection.startColor = UIColor(named: "Right")!
        cell.btnCollection.endColor = UIColor(named: "Left")!
        cell.btnCollection.horizontalMode = true
        filterCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FilterCollectionViewCell
        cell.btnCollection.backgroundColor = .white
    }
  
}

@IBDesignable
public class Gradient: UIButton {
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

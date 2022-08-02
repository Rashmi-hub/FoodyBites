//
//  PreviewVC.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class PreviewVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var movies: [String] = ["a","b","c","d","e"]
    var frame = CGRect.zero
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = movies.count
        setupScreens()
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font: UIFont(name: "JosefinSans-SemiBold", size: 24.0)!]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.tintColor = UIColor.white
        title = "Preview"
    }
    
    @objc func addTapped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    static func instance() -> PreviewVC {
        return UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "PreviewVC") as! PreviewVC
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupScreens() {
        for index in 0..<movies.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            let imgView = UIImageView(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height))
            imgView.image = UIImage(named: movies[index])
            self.scrollView.addSubview(imgView)
        }
        
        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(movies.count)), height: scrollView.frame.size.height)
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControl.Event.valueChanged)

    }
    @objc func changePage(sender: AnyObject) -> () {
            let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
            scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
            print(pageNumber)
    }
}

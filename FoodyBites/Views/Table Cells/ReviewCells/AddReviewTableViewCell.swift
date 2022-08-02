//
//  AddReviewTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit
import Cosmos

class AddReviewTableViewCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var viewExperience: UITextView!
    @IBOutlet weak var viewReview: CosmosView!
    @IBOutlet weak var viewWriteExperience: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewExperience.delegate = self
        viewExperience.textColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if viewExperience.textColor == UIColor.lightGray {
            viewExperience.text = nil
            viewExperience.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if viewExperience.text.isEmpty {
            viewExperience.text = "Write your experience"
            viewExperience.textColor = UIColor.lightGray
        }
    }
}

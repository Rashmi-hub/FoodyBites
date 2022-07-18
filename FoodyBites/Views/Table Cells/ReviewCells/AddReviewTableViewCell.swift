//
//  AddReviewTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit
import Cosmos

class AddReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var viewReview: CosmosView!
    @IBOutlet weak var viewWriteExperience: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

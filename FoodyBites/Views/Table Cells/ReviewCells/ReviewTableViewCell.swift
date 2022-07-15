//
//  ReviewTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 04/07/22.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var viewReview: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

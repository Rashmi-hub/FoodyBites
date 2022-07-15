//
//  CategoryTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 05/07/22.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var imgbg: UIImageView!
    @IBOutlet weak var imgName: UIImageView!
    @IBOutlet weak var imgfg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

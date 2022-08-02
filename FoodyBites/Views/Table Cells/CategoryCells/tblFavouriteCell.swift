//
//  tblFavouriteCell.swift
//  FoodyBites
//
//  Created by Zobi on 22/07/22.
//

import UIKit

class tblFavouriteCell: UITableViewCell {

    @IBOutlet weak var lbladdress: UILabel!
    @IBOutlet weak var viewMain: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

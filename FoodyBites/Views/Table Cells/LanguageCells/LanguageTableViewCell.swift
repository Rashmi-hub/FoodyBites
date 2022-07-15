//
//  LanguageTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 30/06/22.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {

    @IBOutlet weak var lblLanguageName: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

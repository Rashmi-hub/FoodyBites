//
//  ImgTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 07/07/22.
//

import UIKit

class ImgTableViewCell: UITableViewCell {

    @IBOutlet weak var viewDirection: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnFavourites: UIButton!
    @IBOutlet weak var btnBack: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        viewDirection.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

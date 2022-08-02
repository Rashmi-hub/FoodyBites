//
//  NotificationTableViewCell.swift
//  FoodyBites
//
//  Created by Zobi on 27/06/22.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {

    @IBOutlet weak var btnSellAll: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

//
//  FavouriteTableViewCell.swift
//  SportSync
//
//  Created by Hussien on 13/05/2024.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageLogo.layer.cornerRadius = imageLogo.frame.size.width / 2
        self.frame.inset(by: UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

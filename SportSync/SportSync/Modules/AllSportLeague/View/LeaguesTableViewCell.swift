//
//  LeaguesTableViewCell.swift
//  SportSync
//
//  Created by Hussien on 11/05/2024.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueTitle: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        leagueImage.layer.cornerRadius = leagueImage.frame.size.width / 2
        
        self.frame.inset(by: UIEdgeInsets(top: 10.0, left: 0, bottom: 10.0, right: 0))
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCell.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 14/05/2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerAgeLabel: UILabel!
    @IBOutlet weak var playerTypeLabel: UILabel!
    @IBOutlet weak var playerImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        
       
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    func setPlayerData(_ player: Player) {
        playerNameLabel.text = player.player_name
        playerAgeLabel.text = player.player_age
        playerTypeLabel.text = player.player_type
        playerImageview.kf.setImage(with: URL(string: player.player_image ?? ""), placeholder: UIImage(named: "playerImage"))
    }
}

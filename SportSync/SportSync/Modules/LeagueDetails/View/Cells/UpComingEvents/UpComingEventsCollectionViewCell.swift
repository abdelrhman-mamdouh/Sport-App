//
//  UpComingEventsCollectionViewCell.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import UIKit

class UpComingEventsCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var WeekNumLabel: UILabel!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLebel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayImageView: UIImageView!
    @IBOutlet weak var homeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

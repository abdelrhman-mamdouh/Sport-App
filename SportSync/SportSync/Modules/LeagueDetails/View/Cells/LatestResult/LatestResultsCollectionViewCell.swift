//
//  LatestResultsCollectionViewCell.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import UIKit

class LatestResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateMatch: UILabel!
    @IBOutlet weak var awayLogoImageView: UIImageView!
    @IBOutlet weak var homeLogoImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        awayLogoImageView.addShadow()
        awayLogoImageView.addElevation()
        homeLogoImageView.addShadow()
        homeLogoImageView.addElevation()
        
        homeTeamNameLabel.addShadow()
        homeTeamNameLabel.addElevation()
        awayTeamNameLabel.addShadow()
        awayTeamNameLabel.addElevation()
        
        dateMatch.addShadow()
        scoreLabel.addShadow()
        scoreLabel.addElevation()
        dateMatch.addElevation()
        
        
    }

}

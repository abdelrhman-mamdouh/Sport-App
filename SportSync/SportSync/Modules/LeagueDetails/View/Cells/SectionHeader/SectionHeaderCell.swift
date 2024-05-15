//
//  SectionHeaderCell.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 12/05/2024.
//

import UIKit

class SectionHeaderCell: UICollectionReusableView {
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
                layer.masksToBounds = true
        title.addElevation()
        title.addShadow()
        
    }
}


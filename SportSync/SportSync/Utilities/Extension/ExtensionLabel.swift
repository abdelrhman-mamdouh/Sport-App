//
//  ExtensionLabel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 16/05/2024.
//

import Foundation
import UIKit
extension UILabel {
    
   
    func addShadow(color: UIColor = .black, radius: CGFloat = 4, opacity: Float = 0.5, offset: CGSize = .zero) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.masksToBounds = false
    }
    

    func addElevation(elevation: CGFloat = 8) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: elevation)
        layer.shadowOpacity = 0.24
        layer.shadowRadius = 2.0
    }
    
 
    func addStroke(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
   
}

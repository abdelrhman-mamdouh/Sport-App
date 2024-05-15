//
//  Alert.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 10/05/2024.
//


import Foundation
import UIKit
import Reachability
import Lottie
class Utility {
    
    static var animationView:LottieAnimationView?
    static func startLoader(in view: UIView) {
                view.subviews.forEach { $0.isHidden = true }
                animationView = LottieAnimationView(name: "loader")
                animationView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                animationView?.center = view.center
                animationView?.loopMode = .loop
                animationView?.contentMode = .scaleAspectFit
                
                view.addSubview(animationView!)

                animationView?.play()
            }

            static func stopLoadingAnimation(in view: UIView) {
                animationView?.removeFromSuperview()
                animationView = nil
                view.subviews.forEach { $0.isHidden = false }
            }
  
    
  static func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message:nil, preferredStyle: .alert)
        //rgb(0, 129, 138)
        alert.view.backgroundColor =  UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 0.8)
       
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!, NSAttributedString.Key.foregroundColor:UIColor(red: 0.0/255.0, green: 129.0/255.0, blue: 138.0/255.0, alpha: 1.0)]
        let titleString = NSAttributedString(string: message, attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    static func getDates() -> (CurrentData: String, PastDate: String, NextDate: String, YesterDay: String) {
        let todayDate = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: todayDate)!
        let pastDate = Calendar.current.date(byAdding: .year, value: -1, to: todayDate)!
        let nextDate = Calendar.current.date(byAdding: .year, value: 1, to: todayDate)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let currentDateStr = dateFormatter.string(from: todayDate)
        let yesterdayStr = dateFormatter.string(from: yesterday)
        let pastDateStr = dateFormatter.string(from: pastDate)
        let nextDateStr = dateFormatter.string(from: nextDate)
        
        print(currentDateStr)
        print(yesterdayStr)
        print(pastDateStr)
        print(nextDateStr)
        
        return (currentDateStr, pastDateStr, nextDateStr, yesterdayStr)
    }
    
    static func checkConnection() ->Bool{
        var reachability :Reachability? = try! Reachability()
        
        if reachability?.connection == .wifi || reachability?.connection == .cellular{
            reachability = nil
            return true
        }else if reachability?.connection == .unavailable{
            reachability = nil
            return false
        }
        reachability = nil
        return false

    }
}

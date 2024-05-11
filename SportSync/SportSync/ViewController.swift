//
//  ViewController.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 09/05/2024.
//
import UIKit
import Alamofire
import Foundation
class ViewController: UIViewController {
    
    var leagesDetailsViewModel: LeagesDetailsViewModel!
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           // Create an instance of LeagesDetailsViewModel
           leagesDetailsViewModel = LeagesDetailsViewModel(id: 205, sport: "football", leageName: "Premier League", image: "league_image_url")
           
           // Fetch league events
           fetchLeagueEvents()
           
           // Fetch latest events
           fetchLatestEvents()
       }
       
       func fetchLeagueEvents() {
           // Call fetchLeagesEvents method to fetch league events
           leagesDetailsViewModel.fetchLeagesEvents { events in
               if let events = events {
                   // Handle fetched league events
                   print("Fetched league events: \(events)")
               } else {
                   // Handle error
                   print("Failed to fetch league events")
               }
           }
       }
       
       func fetchLatestEvents() {
           // Call fetchLatestEvents method to fetch latest events
           leagesDetailsViewModel.fetchLatestEvents { events in
               if let events = events {
                   // Handle fetched latest events
                   print("Fetched latest events: \(events)")
               } else {
                   // Handle error
                   print("Failed to fetch latest events")
               }
           }
       }
   }

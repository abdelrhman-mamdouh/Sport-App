//
//  LeagueDetailsViewModel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation

class LeagesDetailsViewModel {
    var leagesEvents: [Event]?
    var latestEvents: [Event]?
    var id: Int?
    var sport: String?
    var leageName: String?
    var image: String?
    
    init(id: Int, sport: String, leageName: String, image: String) {
        self.id = id
        self.sport = sport
        self.leageName = leageName
        self.image = image
        leagesEvents = [Event]()
        latestEvents = [Event]()
    }
    
   
    
    func fetchLeagesEvents(completionHandler: @escaping ([Event]?) -> Void) {
        let date = Utility.getDates()
        var requestParameters: [String: Any] = [
            "met": "Fixtures",
            "leagueId": self.id as Any,
            "from": date.PastDate,
            "to": date.CurrentData
        ]
        NetworkManager.shared.requestData(endpoint: sport ?? "", parameters: requestParameters) { (result: Result<EventResponse, Error>) in
            switch result {
            case .success(let response):
                self.leagesEvents = response.result
                completionHandler(response.result)
            case .failure(let error):
                print("Error fetching league events: \(error)")
                completionHandler(nil)
            }
        }
    }
    
    func fetchLatestEvents(completionHandler: @escaping ([Event]?) -> Void) {
        let date = Utility.getDates()
        let requestParameters: [String: Any] = [
            "met": "Fixtures",
            "leagueId": self.id ?? 4998 ,
            "from": date.CurrentData,
            "to": date.NextDate
        ]
        NetworkManager.shared.requestData(endpoint: sport ?? "", parameters: requestParameters) { (result: Result<EventResponse, Error>) in
            switch result {
            case .success(let response):
                self.latestEvents = response.result
                completionHandler(response.result)
            case .failure(let error):
                print("Error fetching latest events: \(error)")
                completionHandler(nil)
            }
        }
    }
    
    
}

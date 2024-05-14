//
//  LeagueDetailsViewModel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation

class LeagesDetailsViewModel {
   private var leagesEvents: [Event]?
   private var latestEvents: [Event]?
   private var leagueTeams: [Team]?
    private let databaseHelper = DataBaseHelper.getInstance()

     var id: Int?
     var sport: String?
     var leageName: String?
     var leageLogo : String?
    
    
    init(id: Int, sport: String, leageName: String,leageLogo:String) {
        self.id = id
        self.sport = sport
        self.leageName = leageName
        self.leageLogo = leageLogo
        leagesEvents = [Event]()
        latestEvents = [Event]()
    }
    
    func addItem(newItem : LeagueDetails){
        print("pressed")
        databaseHelper?.addItemToDataBase(newItem: newItem)
    }
    
    func searchForAnItem() -> Bool{
        let result = databaseHelper?.searchForALeague(id: "\(self.id ?? 0)").count == 1
        return result
    }
    
    func deleteItemWithId(){
        print("from view model \(self.id)")
        databaseHelper?.deleteItemWith(idObject: self.id ?? 0)
    }
    
    func fetchUpComingEvents(completionHandler: @escaping ([Event]?) -> Void) {
        let date = Utility.getDates()
        let requestParameters: [String: Any] = [
            "met": "Fixtures",
            "leagueId": self.id as Any,
            "from": date.CurrentData,
            "to": date.NextDate
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
            "leagueId": self.id ?? 0 ,
            "from": date.YesterDay,
            "to": date.CurrentData
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
    
    func fetchLeagueTeams(completionHandler: @escaping ([Team]?) -> Void) {
        let requestParameters: [String: Any] = ["met": "Teams","leagueId": self.id ?? 0]
        NetworkManager.shared.requestData(endpoint: sport ?? "", parameters: requestParameters) { (result: Result<TeamResponse, Error>) in
            switch result {
            case .success(let response):
                self.leagueTeams = response.result
                completionHandler(response.result)
            case .failure(let error):
                print("Error fetching leagues: \(error)")
                completionHandler(nil)
            }
        }
    }
    
    func getLeagesEvents() -> [Event]{
        return self.leagesEvents ?? []
    } 
    func getLatestEvents() -> [Event]{
        return self.latestEvents ?? []
    }
    func getLeagueTeams() -> [Team]{
        return self.leagueTeams ?? []
    }
}

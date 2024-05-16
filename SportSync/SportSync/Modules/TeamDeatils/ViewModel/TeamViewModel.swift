//
//  TeamViewModel.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//

import Foundation

class TeamViewModel : TeamViewModelProtocol{
   
    
  
    
    private var id: Int
    private var sport: String
    private var leagueName: String
    private var teamsData: [Team]
    private var teamDetails: Team
    
    init(id: Int, sport: String,leagueName :String) {
        self.id = id
        self.sport = sport
        self.leagueName = leagueName
        teamsData = [Team]()
        teamDetails = Team()
    }
    
    
    func setTeamData(teamData: [Team]) {
        self.teamsData = teamData
    }
    
    func setTeamDetails(teamDetails: Team) {
        self.teamDetails = teamDetails
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func getSport() -> String {
        return self.sport
    }
    
    func getLeagueName() -> String {
        return self.leagueName
    }
    
    func getTeamsData() -> [Team] {
        return teamsData
    }
    
    func getTeamDetails() -> Team {
        return teamDetails
    }
    
    func fetchTeam(completionHandler: @escaping ([Team]?, Error?) -> Void) {
    
        let requestParameters: [String: Any] = ["met": "Teams", "teamId": id]
        NetworkManager.shared.requestData(endpoint: sport, parameters: requestParameters) { (result: Result<TeamResponse, Error>) in
            switch result {
            case .success(let response):
                self.teamsData = response.result
                completionHandler(response.result, nil)
            case .failure(let error):
                print("Error fetching teams: \(error)")
                completionHandler(nil, error)
            }
        }
    }
}
